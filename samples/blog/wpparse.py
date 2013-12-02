from bs4 import BeautifulSoup as bs
from os.path import isfile
from urllib import urlretrieve
import re
getcaption = re.compile(r'\[(/?)caption([^]]*)\]')
mlcomments = re.compile(r'<!--[^-]*-->')

TG = {}
for x in ['title','link','pubDate','guid','description']:
	TG[x] = x
for x in ['id','date','date_gmt','name','parent','type','password']:
	TG['post_'+x] = '{http://wordpress.org/export/1.2/}post_'+x
for x in ['status','comment_status','ping_status','menu_order','is_stycky','attachement_url','postmeta']:
	TG[x] = '{http://wordpress.org/export/1.2/}'+x
TG['content'] = '{http://purl.org/rss/1.0/modules/content/}encoded'
TG['excerpt'] = '{http://wordpress.org/export/1.2/excerpt/}encoded'
TG['creator'] = '{http://purl.org/dc/elements/1.1/}creator'

ATTS = {}

def tg_get(t,k):
	if k in TG.keys():
		k = TG[k]
	st = t.find(k)
	if st is None:
		ATTS = {}
		return None
	ATTS = st.attrib
	return st.text

texescapes = {
	' "': ' ``',
	'"': "''",
	u'\xa0': '~',
}
for x in '%_$#&':
	texescapes[x] = '\\'+x

def texencode(s):
	for k in texescapes.keys():
		s = s.replace(k,texescapes[k])
	return s
	
def output(t,nl=False):
	if t is None:
		print '[None]',
	else:
		print t.encode('UTF-8'),
	if nl:
		print

def title(a):
	t = a.find('title').text
	if t is None:
		return '[None]'
	else:
		return t

def printtree(tag,level=0,maxlevel=3):
	print ("\t"*level)+tag.tag,tag.attrib,
	text = tag.text
	try:
		print text.encode('UTF-8')
	except:
		if text is None:
			print "<<None>>"
		else:
			print ('#',text)
	if level>=maxlevel:
		return
	for c in tag:
		printtree(c,level+1,maxlevel)
		
def subtex(p):
	p = mlcomments.sub('',p)
	p = getcaption.sub(r'<\1figure\2>',p)
	i = p.find('<')
	if i >= 0:
		return htmltolatex(bs(p))
	if len(p)>120:
		i = p.find(u'\xa0')
		if i>0:
			return texencode(p[:i])+'\n'+subtex(p[i+1:])
		i = p.rfind(' ',60,120)
		if i>0:
			return texencode(p[:i])+'\n'+subtex(p[i:])
			return texencode(p[:i])+' %'+unicode(('-',p[:i]))+'\n'+subtex(p[i:])
		i = p.find(' ',50)
		if i>0:
			return texencode(p[:i])+'\n'+subtex(p[i:])
	return texencode(p)

u2fnre = re.compile(r'%[0-9A-Fa-f][0-9A-Fa-f]|\.')
oalpha = re.compile(r'\w+')
def uri2filename(uri):
	uri = uri.replace('%2F','/')
	path = uri.split('/')
	fn = path[-1]
	n = fn.rfind('.')
	if n>0:
		ext = oalpha.match(fn[n+1:]).group(0).lower()
		fn = u2fnre.sub('_',fn[:n])
	else:
		fn = u2fnre.sub('_',fn)
		ext = ''
	return (fn,ext)

htmlenviros = {
	'pre': 'verbatim',
	'ol': 'enumerate',
	'ul': 'itemize',
	'aligncenter': 'center',
	'alignleft': 'flushleft',
	'alignright': 'flushright',
	'table': 'tabular',
	'dl': 'description',
	'caption': 'figure',
}
htmlcommands = {
	'em': 'emph',
	'strong': 'textbf',
	'h2': 'section',
	'h3': 'subsection',
	'h4': 'subsubsection',
	'span': 'relax',
	'hr': 'horrule',
	'ipa': 'ipa',
	'del': 'del',
	'ins': 'ins',
	's': 'st',
	'u': 'ul',
	'i': 'textit',
	'tt': 'texttt',
	'param': 'param',
	'embed': 'embed',
	'acronym': 'abbr',
}
inwrap = False
def htmltolatex(html):
	global inwrap
	try:
		n = html.name
	except:
		u = unicode(html).replace('\r\n','\n')
		return '\n\n'.join([subtex(p) for p in u.split('\n\n')])
	s = u''
	if 'class' in html.attrs.keys():
		for c in html['class']:
			if c in ['ipa']:
				n = c
	if html.attrs:
		atts = "% "+unicode(html.attrs)
	else:
		atts = ''
	if n=='a':
		s+= r'\anchor'
		try:
			s+= '['+(texencode(html['href']))+']'
		except:
			pass
		s+= '{'
		for x in html:
			s+= htmltolatex(x)
		s+= '}'
	elif n=='img':
		align = None
		cl = ''
		if 'class' in html.attrs.keys():
			if 'alignleft'==html['class'] or 'alignleft' in html['class']:
				align = 'left'
			if 'alignright'==html['class'] or 'alignright' in html['class']:
				align = 'right'
		uri = html['src']
		fp = uri2filename(uri)
		fn = 'blog/%s.%s'%fp
		#if not isfile(fn):
		#	urlretrieve(uri,fn)
		if fp[1]=='gif':
			fn = 'blog/%s.png'%(fp[0])
		wi = ('width' in html.attrs.keys()) and html['width'] or '300'
		he = ('height' in html.attrs.keys()) and html['height']
		grattr=r"width=%s\px"%(wi)+(he and r",height=%s\px"%(he) or '')
		if align and not inwrap:
			s+= '\\begin{wrapfigure}{%s}{%s\\px}\\centering%s\n'%(align[0],wi,atts)
			cl = '\n\\end{wrapfigure}\n'
		else:
			cl = '';
		s+= "\\includegraphics[%s]{%s}%s"%(grattr,fn,cl)
	elif n=='figure':
		inwrap = True
		align = html['align'][5]
		s+= "\\begin{wrap%s}{%s}{%s\\px}\\centering%s\n"%(n,align,html['width'],atts)
		for x in html:
			s+= htmltolatex(x)
		if 'caption' in html.attrs.keys():
			s+= "\n\\caption{%s}"%(texencode(html['caption']))
		s+= "\n\\end{wrap%s}\n"%(n)
		inwrap = False
	elif n=='q':
		s+= '<<'
		for x in html:
			s+= htmltolatex(x)
		s+= '>>'
	elif n=='br':
		s+= '\\\\\n'
	elif n=='li':
		s+= r'\item '
		for x in html:
			s+= htmltolatex(x)
	elif n=='dt':
		s+= r'\item['
		for x in html:
			s+= htmltolatex(x)
		s+= r'] '
	elif n=='dd':
		for x in html:
			s+= htmltolatex(x)
	elif n in ['table','prety1']:
		s+= '\\begin{tabular}{lllllllll}% FIX\n'
		for x in html:
			s+= htmltolatex(x)
		s+= '\\end{tabular}\n'
	elif n=='tr':
		for x in html:
			s+= htmltolatex(x)
		s = s.rstrip('& \n')+' \\\\\n'
	elif n in ['td','th']:
		for x in html:
			s+= htmltolatex(x).strip()
		s+= r' & '
	elif n=='sup':
		s+=r"${}^\textrm{"
		for x in html:
			s+= htmltolatex(x).strip()
		s+=r"}$"
	elif n=='sub':
		s+=r"${}_\textrm{"
		for x in html:
			s+= htmltolatex(x).strip()
		s+=r"}$"
	elif n in ['p','div']:
		s+= r'\par% '+n+atts+'\n'
		for x in html:
			s+= htmltolatex(x)
		s+= '\n'
	elif n in htmlenviros.keys():
		s+= "\\begin{%s}%s\n"%(htmlenviros[n],atts)
		for x in html:
			s+= htmltolatex(x)
		s+= "\n\\end{%s}\n"%(htmlenviros[n])
	elif n in htmlcommands.keys():
		s+= "\\%s{"%(htmlcommands[n])
		if atts: s+= atts+'\n'
		for x in html:
			s+= htmltolatex(x)
		s+= "}"
	elif n=='head':
		pass
	elif n in ['[document]','html','body','tbody']:
		for x in html:
			s+= htmltolatex(x)
	else:
		s+= "\\begin{%s}%s\n"%(n,atts)
		for x in html:
			s+= htmltolatex(x)
		s+= "\n\\end{%s}\n"%(n)
	return s
		
		
template = r"""\documentclass{book}
\usepackage{blog}
\author{Carlos Thompson}
\title{%s}
\begin{document}
\frontmatter
\maketitle
\tableofcontents
\mainmatter
%s
\backmatter
%s
\end{document}
"""

posttemp = r"""
\chapter{%s}
\begin{metadata}
	%s
\end{metadata}

%s
"""

def wxrtolatex(wxr):
	c = wxr.find('channel')
	title = c.title.contents[0]
	s = u""

	cc = c.find_all('item')
	for i in cc:
		tp = i.post_type.contents[0]
		st = i.status.contents[0]
		if tp != 'post' or st != 'publish':
			continue
		tt = i.title.contents[0]
		md = u''
		cont = i.find_all('encoded')
		cats = i.find_all('category')
		md += r'Published by \anchor[%s]{%s} on \anchor[http://ewey.co/B%s]{%s}\\'%(
			i.creator.contents[0],
			i.creator.contents[0],
			i.post_id.contents[0],
			i.pubDate.contents[0])
		if len(cats):
			nn = [cat['nicename'] for cat in cats]
			md+= "\n\t\\categories{"+(', '.join(nn))+r"}\\"
		md += '\n\tShorthand: \\anchor[%s]{%s}'%(
			i.link.contents[0],
			i.post_name.contents[0])

		#s += unicode(type(cont[0]))+'\n'
		ht = ''.join([htmltolatex(p) for p in cont[0]])
		s+= posttemp%(texencode(tt),md,ht)

	bm = u""
	return template%(title,s,bm)


fn = '/home/chlewey/Descargas/thechleweyblog.wordpress.2013-11-28.xml'
#wp = et.parse(fn)
wp = bs(open(fn),'xml')
ltex = wxrtolatex(wp)
ltex = re.sub(r'\n{3,}',r'\n\n',ltex)
ltex = re.sub(r'(\\item\[)(\\anchor\[[^]]*\]\{)([^}]*)\}.\]',r'\1\3]\2.}',ltex)
ltex = re.sub(u'emph(\\{[\u03b4\u03ad])',r'GRit\1',ltex)
ltex = re.sub(u'(\u03c0[^,]*),',r'\\GR{\1},',ltex)
output(ltex)
