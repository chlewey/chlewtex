\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{precoom}
%
\newif\if@useucs\@useucsfalse
\newif\if@usebabel\@usebabelfalse
\newif\if@inputenc\@inputencfalse
\newcommand\@passoption{\PassOptionsToPackage{\CurrentOption}}
\newcommand\@setlang[1]{%
  \ifx\th@langs\@undefined
  \def\th@langs{#1}
  \else
  \let\th@old@langs\th@langs
  \def\th@langs{\th@old@langs,#1}
  \fi\@usebabeltrue}
\def\th@lang{en}
\DeclareOption{spanish}{\@setlang{spanish}\def\th@lang{es}}
\DeclareOption{english}{\@setlang{english}\def\th@lang{en}}
\DeclareOption{swedish}{\@setlang{swedish}\def\th@lang{se}}
\DeclareOption{nobabel}{\@usebabelfalse}
\DeclareOption{utf8}{\@passoption{inputenc}\@inputenctrue\@useucstrue}
\DeclareOption{ascii}{\@passoption{inputenc}\@inputenctrue}
\DeclareOption{cp850}{\@passoption{inputenc}\@inputenctrue}
\DeclareOption{latin1}{\@passoption{inputenc}\@inputenctrue}
\DeclareOption{ansinew}{\@passoption{inputenc}\@inputenctrue}
\DeclareOption{applemac}{\@passoption{inputenc}\@inputenctrue}
\ProcessOptions\relax
%
\LoadClassWithOptions{memoir}
%
\if@usebabel
\RequirePackage[\th@langs]{babel}
\RequirePackage[T1]{fontenc}
\fi
\if@useucs
\RequirePackage{ucs}
\fi
\if@inputenc
\RequirePackage{inputenc}
\fi
%
\RequirePackage{chlewesp}
\newcommand\precoom{\@ifstar\PrecoomPCTA\Precoom}
\newcommand\Precoom{\textsc{Precoom}\xspace}
\newcommand\PrecoomPCTA{\textsc{Precoom~p.c.t.a}\acrodot}
\newcommand\no{N$^\textrm{o}$\xspace}
%
\newcommand\estatuto[1]{\raisebox{.5ex}[0pt][0pt]{\tiny [Est:\,Art #1]}}
%
\RequirePackage{graphicx}
\ifx\pdfoutput\undefined
  \DeclareGraphicsRule{*}{eps}{*}{}
  \newcommand\makepicturename[2]{#1.#2}
\else
  \newcommand\makepicturename[2]{#1-#2.pdf}
\fi
\newcommand\includepicture[3][\empty]{%
  \ifx#1\empty
    \includegraphics{\makepicturename{#2}{#3}}
  \else
    \includegraphics[#1]{\makepicturename{#2}{#3}}
  \fi}
%
\makeoddhead{plain}{\precoomL}{\precoomH}{}
\makeoddhead{headings}{\precoomL}{\precoomH}{}
\makeevenhead{plain}{\precoomL}{\precoomH}{}
\makeevenhead{headings}{\precoomL}{\precoomH}{}
\makeoddfoot{plain}{}{\precoomT}{\thepage}
\makeoddfoot{headings}{}{\precoomT}{}
\makeevenfoot{plain}{\thepage}{\precoomT}{}
\makeevenfoot{headings}{}{\precoomT}{}
%
\newcommand{\precoomH}{{\em%
    \small SERVICIOS DE TELECOMUNICACIONES\\
    \tiny NIT. 803.140758-5\\
    INSCRIPCI�N C�MARA DE COMERCIO S-0022614\\
    RESOLUCI�N MINTRABAJO Y SEGURIDAD SOCIAL\\
    \no 000031360 DEl 20 DE AGOSTO DE 2004\\
  }}
\newcommand{\precoomT}{{\em%
    \rule{0pt}{3ex}\rule{.5\textwidth}{0.07pt}\\
    \small Carrera 38 \#\,70\,A-44, 2$^\textrm{o}$ piso.
    Tel�fono: (+57\,1) 250\,1702.
    Fax: (+57\,1) 250\,7231.\\
    Bogot�, Colombia\\
    precoom@yahoo.com
  }}
\ifx\pdfoutput\undefined
  \newcommand{\precoomL}{{\large \precoom\\\tiny Precooperativa de
    Trabajo Asociado\\ }}
\else
  \newcommand{\precoomL}{\includegraphics[scale=.133]{precoom.png}\\ }
\fi
%
%\setlrmarginsandblock{6.5cm}{1.25cm}{*}
%\settoheight{\headheight}{\eriheaderbis}
\setlength{\headheight}{3.6cm}
\setlength{\marginparwidth}{2.25cm}
\setlength{\marginparsep}{2.25cm}
%\setlength{\trimdedge}{2cm}
\setlength{\textwidth}{15.6cm}
\setlength{\uppermargin}{5cm}
\setlength{\headsep}{2ex}
\setlength{\textheight}{20.5cm}
\setlength{\oddsidemargin}{3cm}
\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
%
\renewcommand\maketitle{%
\begin{center}
  \Large\textbf{\thetitle}\\
  \large\rule{0pt}{3ex}\theauthor\\
  \large\thedate\\
  \rule{0pt}{1ex}
\end{center}}
%

\endinput


 8,5    11
 2,54   25,4
 5,08    2,54
10,16   27,94
20,32
 1,27
21,59
