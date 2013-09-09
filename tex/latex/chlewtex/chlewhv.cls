%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Paquete para la creación e impresión de hojas de vida %%
%% por Carlos Thompson, en LaTeX                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chlewhv}[2003/10/16 Chlewey Curriculum Vitae Class]

\newcommand\newid[3]{%
  \expandafter\newcommand\csname th@#1\endcsname{}
  \expandafter\newcommand\csname th@x@#1\endcsname{}
  \expandafter\newcommand\csname #1\endcsname[1]{%
    \expandafter\renewcommand\csname th@#1\endcsname{##1}
    \expandafter\renewcommand\csname th@x@#1\endcsname{#2{##1}#3}
  }
}
\newcommand\newtid[5]{%
  \expandafter\newcommand\csname th@#1\endcsname{}
  \expandafter\newcommand\csname th@t@#1\endcsname{}
  \expandafter\newcommand\csname th@s@#1\endcsname{}
  \expandafter\newcommand\csname #1\endcsname[1]{%
    \expandafter\renewcommand\csname th@#1\endcsname{##1}
    \expandafter\renewcommand\csname th@t@#1\endcsname{#2{##1}#3}
    \expandafter\renewcommand\csname th@s@#1\endcsname{#4{##1}#5}
  }
}

\newcommand\th@inputenc{latin1}
\newcommand\th@language{english}
\newcommand\th@fontenc{T1}
\newcommand\th@langfile{chlew_en.def}

\DeclareOption{spanish}{\renewcommand\th@language{spanish}\renewcommand\th@langfile{chlew_es.def}}
\DeclareOption{ascii}{\renewcommand\th@inputenc{ascii}}
\DeclareOption{OT1}{\renewcommand\th@fontenc{OT1}}
\ProcessOptions\relax

\setlength\paperwidth{21.59cm}
\setlength\paperheight{27.94cm}
\setlength\textwidth{14.59cm}
\setlength\textheight{20.94cm}
\setlength\hoffset{1.46cm}
\setlength\voffset{1.46cm}

\renewcommand\normalsize{\fontsize{11pt}{13pt}\selectfont}
\renewcommand\rmdefault{pbk}
\renewcommand\sfdefault{phv}
\renewcommand\ttdefault{pcr}
\renewcommand\bfdefault{b}
\renewcommand\encodingdefault{\th@fontenc}
\newcommand\large{\fontsize{12pt}{14pt}\selectfont}

\RequirePackage[\th@language]{babel}
\RequirePackage[\th@inputenc]{inputenc}
\RequirePackage[\th@fontenc]{fontenc}
\input\th@langfile

\normalsize
%\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5ex plus 0.2ex minus 0.1ex}

\newtid{hvde}{}{}{}{}
\newtid{email}{\\ \th@emailcap:&\texttt}{}{\noindent\th@emailcap: \texttt}{\par}
\newtid{phone}{\\ \th@phonecap:&}{}{\noindent\th@phonecap: }{\par}
\newtid{id}{\\ \th@idcap:&}{}{\noindent}{\par}

\newcommand\maketitle{%
  \TitleStyle\th@t@hvde
  \begin{tabular}{l@{\hspace{2em}}l}\th@t@id\th@t@phone\th@t@email\end{tabular}\par
  \AtEndDocument{%
    \SignatureStyle{\th@s@hvde}
    \SubSignatureStyle{\th@s@id\th@s@phone\th@s@email}
  }
}

\newcommand\omitsection[1]{\relax}
\newcommand\omitthis{\relax}

\newenvironment{profile}{\large\vspace{\baselineskip}}{\par}

\newcommand\newhvsection[2]{%
  \newenvironment{#1}{\SectionStyle{#2}%
    \vspace{2\parskip}%
  \begin{list}{}{%
    \setlength{\topsep}{0pt}%
    \setlength{\leftmargin}{2em}%
    \setlength{\rightmargin}{0in}%
    \setlength{\listparindent}{\parindent}%
    \setlength{\itemindent}{\parindent}%
    \setlength{\parsep}{\parskip}%
    \setlength{\itemsep}{1ex plus 0.5ex minus 0.2ex}%
  }}{\end{list}\par}
}
\newcommand\newhvsectionitem[4]{
  \newenvironment{#2}{%
    #3
    \item[]
  }{%
    #4
  }
}


\newhvsection{workexp}{\th@workexp}
\newhvsectionitem{workexp}{job}{%
  \newcommand\th@j@comp{}
  \newcommand\th@j@pos{}
  \newcommand\th@j@loc{\th@dj@loc}
  \newcommand\th@j@begin{}
  \newcommand\th@j@end{}
  \newcommand\th@j@profile{}
}{%
  \noindent
  \th@j@comp
  \th@j@pos
  \th@j@loc 
  \th@j@begin\th@j@end.\par
  \th@j@profile
}
\newenvironment{currentjob}{%
  \begin{job}%
  \renewcommand\th@j@end{\th@j@current}
}{\end{job}}

\newhvsection{studies}{\th@studies}
\newhvsectionitem{studies}{study}{%
  \newcommand\th@s@title{}
  \newcommand\th@s@place{}
  \newcommand\th@s@loc{\th@ds@loc}
  \newcommand\th@s@date{}
  \newcommand\th@s@rem{}
}{%
  \noindent
  \th@s@title
  \th@s@place
  \th@s@loc
  \th@s@date.
  \th@s@rem
}

\newhvsection{languages}{\th@languages}
\newcommand\ilang[1]{\ItemHeadStyle{#1}}
\newcommand\ilanglevel[1]{-- #1}
\newcommand\eilang{}

\newhvsection{specifics}{\th@specifics}
\newhvsectionitem{specifics}{skill}{}{}

\newhvsection{references}{\th@references}
\newhvsectionitem{references}{reference}{%
  \newcommand\th@r@name{}
  \newcommand\th@r@position{}
  \newcommand\th@r@workplace{}
  \newcommand\th@r@phone{}
}{%
  \noindent
  \th@r@name
  \th@r@position
  \th@r@workplace.
  \th@r@phone.
}

\newcommand\th@dj@loc{}
\newcommand\jobdefaultlocation[1]{\renewcommand\th@dj@loc{#1}}
\newcommand\jobcompany[1]{\renewcommand\th@j@comp{%
  {\fontsize{12pt}{12pt}\selectfont\sffamily\bfseries #1} -- }}
\newcommand\jobposition[1]{\renewcommand\th@j@pos{%
  {\bfseries #1} -- }}
\newcommand\joblocation[1]{\renewcommand\th@j@loc{#1}}
\newcommand\jobbegin[1]{\renewcommand\th@j@begin{, #1}}
\newcommand\jobend[1]{\renewcommand\th@j@end{--#1}}
\newcommand\jobprofile[1]{\renewcommand\th@j@profile{%
  {\itshape\th@j@pname:\/} #1}}

\newcommand\th@ds@loc{}
\newcommand\studydefaultlocation[1]{\renewcommand\th@ds@loc{#1}}
\newcommand\studytitle[1]{\renewcommand\th@s@title{%
  {\fontsize{12pt}{12pt}\selectfont\sffamily\bfseries #1} -- }}
\newcommand\studyplace[1]{\renewcommand\th@s@place{%
  {\bfseries #1} -- }}
\newcommand\studylocation[1]{\renewcommand\th@s@loc{#1}}
\newcommand\studydate[1]{\renewcommand\th@s@date{, #1}}
\newcommand\studyremark[1]{\renewcommand\th@s@rem{ #1.}}

\newcommand\refpname[1]{\renewcommand\th@r@name{{\bfseries #1}}}
\newcommand\refposition[1]{\renewcommand\th@r@position{ -- #1}}
\newcommand\refworkplace[1]{\renewcommand\th@r@workplace{, #1}}
\newcommand\refphone[1]{\renewcommand\th@r@phone{ -- \th@phonecap: #1}}

\newcommand\TitleStyle[1]{%
  {\fontsize{18pt}{20pt}\selectfont\sffamily\bfseries
     \makebox[\textwidth]{#1}\par}}
\newcommand\SectionStyle[1]{%
  \vspace{3ex}
  {\fontsize{13pt}{15pt}\selectfont\sffamily\bfseries
     \noindent #1
     \par}\vspace{1ex}}
\newcommand\ItemHeadStyle[1]{\item[]%
  {\fontsize{12pt}{12pt}\selectfont\sffamily\bfseries
     \noindent #1}}
\newcommand\SignatureStyle[1]{%
  \vspace{6ex}
  {\fontsize{12pt}{12pt}\selectfont\rmfamily\itshape
     \noindent #1
     \par}}
\newcommand\SubSignatureStyle[1]{%
  {\fontsize{10pt}{12pt}\selectfont\rmfamily\setlength\parskip{0pt} #1}}

