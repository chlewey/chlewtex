%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class for Book for Carlos Thompson,                %%
%% Bogot'a, Colombia                                  %%
%% by Carlos Eugenio Thompson Pinz'on,                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chlproj}[2004/05/27 Carlos Thompson Document Class]

\newcommand\thesubtitle{}
\newcommand\subtitle[1]{%
  \renewcommand\thesubtitle{#1}
}
\newcommand\theaddress{}
\newcommand\address[1]{%
  \renewcommand\theaddress{#1}
}
\newcommand\theemail{}
\newcommand\email[1]{%
  \renewcommand\theemail{#1}
}
\newcommand\theauthoremail{}
\newcommand\authoremail[1]{%
  \renewcommand\theauthoremail{#1}
}
\newcommand\theauthorid{}
\newcommand\authorid[1]{%
  \renewcommand\theauthorid{#1}
}
\newcommand\theresponsible{}
\newcommand\responsible[1]{%
  \renewcommand\theresponsible{#1}
}
\newcommand\theresponsibletitle{}
\newcommand\responsibletitle[1]{%
  \renewcommand\theresponsibletitle{#1}
}
\newcommand\theresponsibleid{}
\newcommand\responsibleid[1]{%
  \renewcommand\theresponsibleid{#1}
}
\newcommand\theinstitution{}
\newcommand\institution[1]{%
  \renewcommand\theinstitution{#1}
}
\newcommand\thedepartment{}
\newcommand\department[1]{%
  \renewcommand\thedepartment{#1}
}
\newcommand\thelocation{}
\newcommand\location[1]{%
  \renewcommand\thelocation{#1}
}


\newcommand\th@deffile{chlew_en.def}
\DeclareOption{latin1}{\PassOptionsToPackage{latin1}{inputenc}}
\DeclareOption{spanish}{\PassOptionsToPackage{spanish}{babel}%
   \renewcommand\th@deffile{chlew_es.def}}
\DeclareOption{id}{%
  \author{Carlos Eugenio Thompson Pinzón}%
  \email{chlewey@chlewey.org}
}
\DeclareOption{idunal}{%
  \author{Carlos E. Thompson\\830001}%
  \address{Universidad Nacional de Colombia\\Bogot\'a\\Colombia}%
  \email{cathompsonp@unal.edu.co}
}
\DeclareOption{iduan}{%
  \author{Carlos Eugenio Thompson Pinzón}%
  \address{Universidad Antonio Nari\~o\\Bogot\'a\\Colombia}%
  \email{carlos.thompson@uan.edu.co}
}
%\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{babel}}
\ProcessOptions\relax

\LoadClassWithOptions{memoir}
\RequirePackage{babel}%
\RequirePackage{inputenc}
\RequirePackage[T1]{fontenc}

\newcommand\sigdate[1]{\begin{flushright}\small\bfseries #1\end{flushright}\longline}
\newcommand\longline{\fancybreak{\rule{0.7\textwidth}{0.5pt}}}
\newcommand\shortline{\fancybreak{\rule{0.3\textwidth}{0.4pt}}}
\newcommand\abreak{\fancybreak{\rule{2em}{0.2pt}}}

\settrimmedsize{\stockheight}{\stockwidth}{*}
\settrims{0pt}{0pt}
\setlrmarginsandblock{4cm}{3cm}{*}
\setulmarginsandblock{3cm}{3cm}{*}
\setheaderspaces{*}{*}{1.61803}
\checkandfixthelayout

\chapterstyle{hangnum}

\newcommand\makehalftitle{%
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{adjustwidth}{60pt}{60pt}
  \begin{center}
  \HUGE\sffamily\bfseries\thetitle
  \end{center}
  \end{adjustwidth}
  \vspace*{\fill}
}

\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{adjustwidth}{60pt}{60pt}
  \begin{center}
  \HUGE\sffamily\bfseries\thetitle
  \end{center}
  \end{adjustwidth}
  \begin{adjustwidth}{30pt}{30pt}
  \begin{center}
  \LARGE\sffamily\bfseries\thesubtitle
  \end{center}
  \begin{center}
  \LARGE\sffamily\theauthor\\\theemail
  \end{center}
  \end{adjustwidth}
  \vspace*{\fill}
}

\newenvironment{copyrightpage}{%
  \clearpage
  \thispagestyle{empty}
  \begingroup
  \vspace*{\fill}
  \footnotesize
  \setlength{\parindent}{0pt}
  \setlength{\parskip}{\baselineskip}
}{%
  \vspace*{\fill}
  \endgroup
}

\renewcommand\rmdefault{ptm}
\renewcommand\sfdefault{phv}
\renewcommand\ttdefault{pcr}
\renewcommand\familydefault{\sfdefault}
\renewcommand\bfdefault{b}

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
%  \renewcommand\afterchaptertitle{\par\end{flushright}\nobreak\vskip \afterchapskip}
}

\makechapterstyle{titlepage}{%
%  \renewcommand\chapnamefont{\normalfont\sffamily\huge}
  \renewcommand\chapnumfont{\normalfont\sffamily\bfseries}
  \setlength\beforechapskip{0pt}
%  \setlength\midchapskip{0pt}
  \renewcommand\chaptitlefont{\normalfont\sffamily\bfseries}
  \renewcommand\chapterheadstart{\vspace*\beforechapskip}
  \renewcommand\printchaptername{}
  \renewcommand\chapternamenum{}
  \renewcommand\printchapternum{\chapnumfont \thechapter.}
  \renewcommand\afterchapternum{\space}
  \renewcommand\printchaptertitle[1]{\chaptitlefont ##1}
  \renewcommand\afterchaptertitle{\par\nobreak}
}

\makechapterstyle{chlewproj}{%
  \renewcommand\chapnamefont{\normalfont\sffamily\bfseries\large}
  \renewcommand\chapnumfont{\chapnamefont}
  \setlength\beforechapskip{3cm}
  \setlength\midchapskip{0pt}
  \renewcommand\chaptitlefont{\chapnamefont}
  \renewcommand\chapterheadstart{\vspace*\beforechapskip}
  \renewcommand\printchaptername{}
  \renewcommand\chapternamenum{}
  \renewcommand\printchapternum{\chapnumfont \thechapter.}
  \renewcommand\afterchapternum{\space}
  \renewcommand\printchaptertitle[1]{\centering\chaptitlefont \MakeUppercase{##1}}
  \renewcommand\afterchaptertitle{\par\nobreak\vskip \afterchapskip}
}

\chapterstyle{chlewproj}
\setbeforesecskip{1\baselineskip plus 1ex minus .2ex}
\setsecindent{0pt}
\setsecheadstyle{\normalfont\sffamily\bfseries\large\MakeUppercase}

\setbeforesubsecskip{1\baselineskip plus 1ex minus .2ex}
\setsubsecindent{0pt}
\setsubsecheadstyle{\normalfont\sffamily\bfseries\large}

\setbeforesubsubsecskip{1\baselineskip plus 1ex minus .2ex}
\setsubsubsecindent{0pt}
\setsubsubsecheadstyle{\normalfont\sffamily\bfseries\large}

\newenvironment{seclanguage}[1]{\selectlanguage{#1}}{}
\newenvironment{letter}{%
  \cleardoublepage
  \thispagestyle{empty}
}{}

\newcommand\makecover{%
  \thispagestyle{empty}
  \vspace*\beforechapskip
  \begin{center}
    \large
    \thetitle \par
    \vspace*{\fill}
    \theauthor \\ \theauthorid \par
    \vspace*{\fill}
    \theinstitution \\ \thedepartment \\ \thelocation \\ \thedate
  \end{center}
}
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \vspace*\beforechapskip
  \begin{center}
    \large
    \thetitle \par
    \vspace*{\fill}
    \theauthor \\ \theauthorid \par
    \vspace*{\fill}
    \thesubtitle \par
    \vspace*{\fill}
    \theresponsibletitle \\ \theresponsible \\ \theresponsibleid \par
    \vspace*{\fill}
    \theinstitution \\ \thedepartment \\ \thelocation \\ \thedate
  \end{center}
}


%% TODO
% - try using most basic classes and packages (not to rely on memoir)
