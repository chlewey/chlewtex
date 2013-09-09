\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chlbook}
%
% Provisional:
\newcommand\chl@passoption{%
  \PassOptionsToPackage{\CurrentOption}{chlewey}%
  \typeout{passing \CurrentOption\ to chlewey}}
\DeclareOption{spanish}{\chl@passoption}
\DeclareOption{english}{\chl@passoption}
\DeclareOption{swedish}{\chl@passoption}
\DeclareOption{biva}{\chl@passoption}
\DeclareOption{chleweye}{\chl@passoption}
\DeclareOption{tokcir}{\chl@passoption}
\DeclareOption{nobabel}{\chl@passoption}
\DeclareOption{utf8}{\chl@passoption}
\DeclareOption{ascii}{\chl@passoption}
\DeclareOption{cp850}{\chl@passoption}
\DeclareOption{latin1}{\chl@passoption}
\DeclareOption{ansinew}{\chl@passoption}
\DeclareOption{applemac}{\chl@passoption}
\DeclareOption{math}{\chl@passoption}
\DeclareOption{mathrfsf}{\chl@passoption}
\DeclareOption{mathcal}{\chl@passoption}
\DeclareOption{mathfrak}{\chl@passoption}
\DeclareOption{index}{\chl@passoption}
\DeclareOption{varindex}{\chl@passoption}
\DeclareOption{toolbox}{\chl@passoption}
\ProcessOptions*
%
\LoadClassWithOptions{memoir}
\RequirePackage{chlewey}
%
\let\old@mainmatter\mainmatter
\def\mainmatter{\old@mainmatter\setcounter{secnumdepth}{2}}
%
\makechapterstyle{chlewchp}{%
  \renewcommand\chapnamefont{\normalfont\sffamily\huge}
  \renewcommand\chapnumfont{\chapnamefont}
  \setlength\beforechapskip{0pt}
  \setlength\midchapskip{0pt}
  \renewcommand\chaptitlefont{\normalfont\sffamily\Huge\bfseries}
%  \renewcommand\chapterheadstart{\vspace*\beforechapskip\begin{flushright}}
  \renewcommand\printchaptername{\raggedleft\chapnamefont \@chapapp}
%  \renewcommand\chapternamenum{\space}
%  \renewcommand\printchapternum{\chapnumfont \thechapter}
%  \renewcommand\afterchapternum{\par\nobreak\vskip \midchapskip}
  \renewcommand\printchaptertitle[1]{\raggedleft\chaptitlefont ##1}
%  \renewcommand\afterchaptertitle{\par\end{flushright}\bobreak\vskip \afterchapskip}
}
%
\endinput
