%%
%% LaTeX Template for HKU MPhil and PhD Thesis
%%
%% Developed by Macro Yau
%% https://github.com/MacroYau/HKU-Thesis-LaTeX-Template
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hkuthesis}[2019/02/07 v1.1.0 HKU MPhil and PhD Thesis Class]
\def\HKU{The University of Hong Kong}


%% Global Dependencies

\RequirePackage{etoolbox}
\RequirePackage{calc}


%% Metadata

% Degree types
\def\MPhil{Master of Philosophy}
\def\PhD{Doctor of Philosophy}
\newcommand{\degreename}{\PhD}
\DeclareOption{mphil}{\renewcommand{\degreename}{\MPhil}}
\DeclareOption{phd}{\renewcommand{\degreename}{\PhD}}

% Previous degrees and professional qualifications
\def\qualifications#1{\gdef\@qualifications{#1}}

% Notice of "Temporary Binding for Examination Purposes"
\def\exam{Temporary Binding for Examination Purposes}
\newcommand{\printexamnotice}{}
\DeclareOption{exam}{\renewcommand{\printexamnotice}{\exam\\}}


%% Global Styles

% Customisable parameters
\def\dotfillwidth{0.5em}			% Dot fill width for signature line and the table of contents
\def\parspacing{1em}				% Spacing between two paragraphs
\def\linespacing{1.25}				% Line spacing factor (1.25 equivalent to typical "1.5 line spacing")
\def\appendixnumbering{\Roman}		% Appendix numbering style (\Roman or \arabic)

% Template based on the book class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper,openany]{book}

% Page layout
\RequirePackage[a4paper,top=25mm,bottom=25mm,left=35mm,right=35mm]{geometry}
\pagestyle{plain}					% Page number at the bottom
\RequirePackage{emptypage}			% Disables page number on empty pages

% Text formatting
\RequirePackage{mathptmx}			% Uses Times New Roman font by default
\RequirePackage{setspace}			% Customises line spacing
\setstretch{\linespacing}			% Global line spacing
\setlength{\parskip}{\parspacing}	% Increases spacing between paragraphs
\RequirePackage{titlesec}			% Customises chapter and section headings
\RequirePackage{indentfirst}		% First paragraphs should be indented
\RequirePackage[final]{microtype}	% Enhances text spacing and justification

% Chapter and section headings formatting
\titlespacing*{\chapter}{0pt}{-20pt}{40pt}
\titleformat{\chapter}[display]{\centering\Large\bfseries}{\@chapapp~\thechapter}{0pt}{}{}
\titlespacing*{name=\chapter,numberless}{0pt}{20pt}{40pt}
\titleformat{\section}{\large\bfseries}{\thesection}{\parspacing}{}{}
\titleformat{name=\section,numberless}{\centering\large\bfseries}{}{\parspacing}{}{}
\titleformat{\subsection}{\normalsize\bfseries}{\thesubsection}{\parspacing}{}{}

% Signature box
\def\signaturewidth{0.75}			% Signature box width in percentage of \textwidth
\def\dotfill#1{\cleaders\hbox to #1{.}\hfill}
\newcommand\dotline[2][\dotfillwidth]{\leavevmode\hbox to #2{\dotfill{#1}\hfil}}
\def\signature#1#2{
	\noindent #1 \enspace \dotline{\signaturewidth\textwidth} \\
	\vspace*{-0.25em}
	{\center #2}
}


%% Front Matter

% Macro for adding a front matter page to the table of contents
\newcommand{\addfrontmattertotoc}[1]{
	\addcontentsline{toc}{chapter}{#1}
}

% Abstract
\RequirePackage{xifthen}
\newcommand{\abstract}[1][]{
	\pagestyle{empty}
	\pagenumbering{alph}
	\begin{center}
		\printexamnotice
		\vspace{2em}
		Abstract of thesis entitled \\
		\vspace{2em}
		{\large{\bf ``\@title''}} \\
		\vspace{1em}
		Submitted by \\
		\vspace{1em}
		{\large{\bf \@author}} \\
		\vspace{1em}
		\begin{spacing}{1.0}
			for the degree of \degreename \\
			at \HKU \\
			in \@date \\
		\end{spacing}
	\end{center}
	\vspace{2em}
	\input{contents/frontmatter/abstract} \\
	\newline
	\ifthenelse{\isempty{#1}}{}{\rightline{(#1 words)}}
	\vspace*{\fill}
}

% Title page
\renewcommand{\titlepage}{
	\cleardoublepage
	\thispagestyle{empty}
	\large
	\vspace*{2em}
	\begin{center}
		\begin{spacing}{2.0}
			{\LARGE{\bf \@title}} \\
			\vspace{0.5em}
			by \\
			\vspace{0.5em}
			{\LARGE{\bf \@author}} \\
			\vspace{0.5em}
			\@qualifications \\
		\end{spacing}
		\vspace*{\fill}
		\printexamnotice
		\vspace{2em}
		\begin{spacing}{1.0}
			A thesis submitted in partial fulfilment of the requirements for \\
			the Degree of \degreename \\
			at \HKU. \\
		\end{spacing}
		\vspace{2em}
		\@date
		\vspace{2em}
	\end{center}
	\normalsize
}

% Dedication
\newcommand{\dedication}{
	\cleardoublepage
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
		{\large \input{contents/frontmatter/dedication}}
	\end{center}
	\vspace*{\fill}
}

% Declaration
\newcommand{\declaration}{
	\cleardoublepage
	\pagestyle{plain}
	\setcounter{page}{1}
	\pagenumbering{roman}
	\chapter{Declaration}
	I declare that this thesis represents my own work, except where due acknowledgement is made, and that it has not been previously included in a thesis, dissertation or report submitted to this University or to any other institution for a degree, diploma or other qualifications.
	\vspace{8em}
	\begin{center}
	\signature{Signed}{\@author}
	\vspace{8em}
	\end{center}
}

% Acknowledgements
\newcommand{\acknowledgements}{
	\chapter{Acknowledgements}
	\input{contents/frontmatter/acknowledgements}
}


%% Table of Contents

% Items
\appto\tableofcontents{\addfrontmattertotoc{Table of Contents}}				% Includes itself
\appto\listoffigures{\addfrontmattertotoc{List of Figures}}					% Includes the list of figures
\preto\listoffigures{\protect\setcounter{tocdepth}{1}}						% Forces to appear
\appto\listoftables{\addfrontmattertotoc{List of Tables}}					% Includes the list of tables
\preto\listoftables{\protect\setcounter{tocdepth}{1}}						% Forces to appear
\BeforeBeginEnvironment{chapters}{\protect\setcounter{tocdepth}{2}}			% Shows subsections
\appto\appendix{\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}}		% Hides sections in appendices
\appto\backmatter{\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}}	% Hides sections in back matter pages

% Spacing
\newlength{\tocsep}
\setlength{\tocsep}{\parspacing*2}
\BeforeBeginEnvironment{chapters}{\addtocontents{toc}{\vspace{\tocsep}}}	% Separates the chapters from front matter
\AfterEndEnvironment{chapters}{\addtocontents{toc}{\vspace{\tocsep}}}		% Separates the chapters from back matter

% Formatting
\RequirePackage{titletoc}
\def\tocdottedlineformat{\hspace*{\dotfillwidth}\titlerule*[\dotfillwidth]{.}\contentspage}

% Front matter
\newcommand\frontmattertocformat{
	\titlecontents{chapter}[0em]{\itshape}
		{}{}
		{\tocdottedlineformat}
}
\appto\frontmatter{\frontmattertocformat}

% Chapters
\newcommand\chapterstocformat{
	\titlecontents{chapter}[1.6em]{\bfseries}
		{\contentslabel{1.6em}}{}
		{\normalfont\hspace*{\fill}\bfseries\contentspage}
}
\appto\mainmatter{\chapterstocformat}

% Section
\titlecontents{section}[4em]{}
	{\contentslabel{2.4em}}{\hspace*{-2.4em}}
	{\tocdottedlineformat}

% Subsection
\titlecontents{subsection}[7.2em]{}
	{\contentslabel{3.2em}}{\hspace*{-3.2em}}
	{\tocdottedlineformat}

% Appendices
\newcommand\appendixtocformat{
	\titlecontents{chapter}[6em]{\normalfont}
		{\contentslabel[\appendixname~\thecontentslabel]{6em}}{}
		{\tocdottedlineformat}
}
\appto\appendix{\appendixtocformat}

% Back matter
\newcommand\backmattertocformat{
	\titlecontents{chapter}[0em]{\normalfont}
		{}{}
		{\tocdottedlineformat}
}
\appto\backmatter{\backmattertocformat}

% List of figures
\titlecontents{figure}[2em]{\normalfont}
	{\hspace*{-2em}\contentslabel[{\bf \figurename~\thecontentslabel}]{0em}\\*}{}
	{\tocdottedlineformat}

% List of tables
\titlecontents{table}[2em]{\normalfont}
	{\hspace*{-2em}\contentslabel[{\bf \tablename~\thecontentslabel}]{0em}\\*}{}
	{\tocdottedlineformat}


%% Chapters

\newenvironment{chapters}{
	\mainmatter
	\pagestyle{plain}
}{}


%% Appendices

\newenvironment{appendices}{
	\appendix
	\pagestyle{plain}
	\renewcommand{\thechapter}{\appendixnumbering{chapter}}
}{}


%% Figures and Tables

% Always centres figure and table environments
\appto\@floatboxreset\centering

% Increases separation from text
\AtBeginEnvironment{figure}{\addvspace{\parspacing}}
\AtBeginEnvironment{table}{\addvspace{\parspacing}}

% Table spacing
\renewcommand{\arraystretch}{\linespacing}		% Increases the distance between two table rows
\setlength{\tabcolsep}{\parspacing}				% Spacing between two columns

% Captions
\RequirePackage{caption}
\newlength{\captionskip}
\setlength{\captionskip}{\parspacing*2}
\captionsetup{labelfont=bf,labelsep=quad,format=hang,skip=\captionskip}
\captionsetup{margin={\parindent,0pt},oneside}
\RequirePackage{subcaption}
\captionsetup[sub]{position=below,labelfont=rm,skip=\parspacing}
\newcommand{\subfigurerow}{\par\vspace{\captionskip}}
