%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Paquete para la creación e impresión de hojas de vida %%
%% por Carlos Thompson, en LaTeX                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chlewhv}[2004/02/16 Chlewey Curriculum Vitae Class]

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

\newtid{name}{}{}{}{}
\newtid{email}{\\ \th@emailcap:&\texttt}{}{\noindent\th@emailcap: \texttt}{\par}
\newtid{phone}{\\ \th@phonecap:&}{}{\noindent\th@phonecap: }{\par}
\newtid{iddoc}{\\ \th@idcap:&}{}{\noindent}{\par}
\newtid{address}{\\ \th@addresscap:&}{}{\noindent}{\par}

\newcommand\maketitle{\th@t@name\par
  \begin{tabular}{lp}
    \th@t@iddoc\th@t@address\th@t@phone\th@t@email
  \end{tabular}
}