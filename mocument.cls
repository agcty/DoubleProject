\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mocument}
\RequirePackage{ifthen}
% \RequirePackage{microtype}

%% --------------------------------------------------
% document class parameters
%% --------------------------------------------------
\newcommand{\@academictitlepages}{}
\newcommand{\@businesstitlepages}{}
\newcommand{\@maketitlepages}{\@academictitlepages}
\newcommand{\@language}{naustrian}

\DeclareOption{english}{\renewcommand{\@language}{british}}
\DeclareOption{german}{\renewcommand{\@language}{naustrian}}
\DeclareOption{academic}{\renewcommand{\@maketitlepages}{\@academictitlepages}}
\DeclareOption{business}{\renewcommand{\@maketitlepages}{\@businesstitlepages}}
\DeclareOption*{\ClassWarning{mocument}{Unknown document option "\CurrentOption"}}
\ProcessOptions


%% --------------------------------------------------
% base document class
%% --------------------------------------------------
\LoadClass[a4paper,11pt,oneside]{book}

%% --------------------------------------------------
% load mocument.sty
%% --------------------------------------------------
\usepackage[margin=1in]{geometry}
\RequirePackage{mocument}
\RequirePackage{mocumentbib}
\RequirePackage[unicode]{hyperref}

%% --------------------------------------------------
% title page arguments
%% --------------------------------------------------
\newcommand{\@module}{\@MissingArg{module??}}
\newcommand{\module}[1]{
	\renewcommand{\@module}{#1}
}

\newcommand{\@university}{\@MissingArg{university??}}
\newcommand{\university}[1]{
	\renewcommand{\@university}{#1}
}

\newcommand{\@supervisor}{\@MissingArg{supervisor??}}
\newcommand{\supervisor}[1]{
	\renewcommand{\@supervisor}{#1}
}

\newcommand{\@course}{\@MissingArg{supervisor??}}
\newcommand{\course}[1]{
	\renewcommand{\@course}{#1}
}

\newcommand{\@project}{\@MissingArg{project??}}
\newcommand{\project}[1]{
	\renewcommand{\@project}{#1}
}

\newcommand{\@company}{\@MissingArg{company??}}
\newcommand{\company}[1]{
	\renewcommand{\@company}{#1}
}

%% --------------------------------------------------
% title page layouts according to the document' purpose
%% --------------------------------------------------
\newcommand{\@academictitle}{
	\begin{titlepage}
			\rule{0mm}{1mm}
			\vspace*{0mm}
			\begin{center}
				\normalfont
				\setlength{\unitlength}{1cm}
				\parbox[c][5cm][c]{12cm}{\centering\LARGE\bf%
					\setlength{\baselineskip}{25pt}%
					\@title}
				\vskip 15mm%
				{\large\bf\@module}%
				\vskip 10mm%
				{\large\sc\@author}%
				\vskip 4mm%
				{\large\sc Supervisor: \@supervisor}%
				\vskip 4mm%
				{\large\sc Course: \@course}%
				\vskip 4mm%
				{\large \@university}%
				\vskip 4mm%
				{\large\@date}%
			\end{center}%
			\vfil%
	\end{titlepage}%
}

\newcommand{\@businesstitle}{
	\begin{titlepage}
		\rule{0mm}{1mm}
		\vspace*{0mm}
		\begin{center}
			\normalfont
			\setlength{\unitlength}{1cm}
			\parbox[c][5cm][c]{12cm}{\centering\LARGE\bf%
				\setlength{\baselineskip}{25pt}%
				\@title}
			\vskip 15mm%
			{\large\sc\@author}%
			\vskip 4mm%
			{\large\@project}%
			\vskip 4mm%
			{\large \@company}%
			\vskip 15mm%
			{\large\@date}%
			\vskip 15mm%
		\end{center}%
		\vfil%
	\end{titlepage}%
}

%% --------------------------------------------------
% title page command routing
%% --------------------------------------------------
\renewcommand{\@academictitlepages}{
	\@academictitle
}
\renewcommand{\@businesstitlepages}{
	\@businesstitle
}
\renewcommand{\maketitle}{
	\@maketitlepages
	\hypersetup{
		pdftitle={\@title},
		pdfauthor={\@author}
	}
}

%% --------------------------------------------------
% font family
%% --------------------------------------------------
\usepackage{libertine}
\usepackage{libertinust1math}
\usepackage[T1]{fontenc}

%% --------------------------------------------------
% additional packages
%% --------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[\@language]{babel}
\RequirePackage{lmodern}
\RequirePackage[parfill]{parskip}
\RequirePackage{graphicx}
\RequirePackage{makeidx}
\usepackage{pgfplotstable}
\usepackage{pgfplots}
\RequirePackage{float}
\RequirePackage{listings}
\RequirePackage{xcolor}

%% --------------------------------------------------
% literature and image sources
%% --------------------------------------------------
\bibliography{literature}
\graphicspath{{images/}}

%% --------------------------------------------------
% color scheme for code listing
%% --------------------------------------------------
\definecolor{Keyword}{RGB}{161,36,107}
\definecolor{String}{RGB}{35,135,28}

\colorlet{keyword}{Keyword}
\colorlet{string}{String}
\colorlet{comment}{gray}
\colorlet{identifier}{black}

\endinput
