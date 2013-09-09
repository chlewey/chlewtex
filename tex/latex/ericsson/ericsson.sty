\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ericsson}
%
\newif\if@useucs\@useucsfalse
\newif\if@usebabel\@usebabelfalse
\newif\if@inputenc\@inputencfalse
\newcommand\@passoption{\PassOptionsToPackage{\CurrentOption}}
\newcommand\@setlang[1]{%
  \ifx\th@langs\@undefined
  \def\th@langs{english,#1}
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
\DeclareOption*{\PassOptionToPackage\CurrentOption{memoir}}
\ProcessOptions\relax
%
\LoadClass{memoir}
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

\RequirePackage{helvet,times,xspace}

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
\ifx\th@lang{es}
\newcommand\recursive{\includepicture{ericons}{1} recursivo}
\newcommand\punctual{\includepicture{ericons}{2} puntual}
\newcommand\okay{\includepicture{ericons}{3} bien}
\newcommand\failed{\includepicture{ericons}{4} falló}
\else
\newcommand\recursive{\includepicture{ericons}{1} recursivo}
\newcommand\punctual{\includepicture{ericons}{2} puntual}
\newcommand\okay{\includepicture{ericons}{3} okay}
\newcommand\failed{\includepicture{ericons}{4} failed}
\fi
\newcommand\progress[1]{\includepicture{ericons}{#1} {\small #1\%}}

\newcommand{\ericsson}{\textsf{Ericsson}\xspace}
\newcommand{\edcolombia}{\textsf{Ericsson de Colombia}\xspace}

