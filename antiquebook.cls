\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{antiquebook}
\LoadClass[12pt]{book}

\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage{hyperref}
\hypersetup{pdfstartview=,pdfencoding=auto,}

\RequirePackage[style=philosophy-verbose,backend=biber,sortcites=true,classical=true,scauthors=true, scauthorscite=true,scauthorsbib=true,volnumformat=strings,volumeformat=romansc,]{biblatex}

\RequirePackage{tocloft,xifthen,centernot, iftex}

\renewcommand{\cftsecfont}{\scshape}
\renewcommand{\cftchapfont}{\scshape}

\ifxetex
\RequirePackage[no-math]{fontspec}
\usepackage{unicode-math}
\else
\RequirePackage[LGR,T2A,LY1]{fontenc}
\RequirePackage{OldStandard,pdfrender, xcolor}
\fi


\ifpdftex
\pdfrender{StrokeColor=black,TextRenderingMode=2,LineWidth=0.1pt}
\makeatletter\let\normalrender\PdfRender@NormalColorHook\let\PdfRender@NormalColorHook\@empty\newcommand*{\textnormalrender}[1]{\begingroup\normalrender#1\endgroup}\makeatother
\else
\newcommand{\fakebold}{2}
\setmainfont[FakeBold=\fakebold,ItalicFont=ModernMT-ExtendedItalic.otf,BoldItalicFont=OldStandard-BoldItalic.otf,BoldFont=OldStandard-Bold.otf,BoldFeatures={FakeBold=0},BoldItalicFeatures={FakeBold=0}]{OldStandard-Regular.otf}
\setmathfont[FakeBold=\fakebold,]{NewCMMath-Book.otf}
\setmathfont[range=it,FakeBold=\fakebold]{Old Standard Italic}
\setmathfont[range={\symfrak},FakeBold=\fakebold]{Asana Math}
\setmathfont[range={\int},Scale=2,]{Old Standard}
\setmathfont[range={\sum,\prod},Scale=2]{Old Standard}
\setmathfont[range={\partial},FakeBold=\fakebold]{Old Standard Italic}

\RequirePackage{mathspec}
\setmathsfont(Digits)[Scale=MatchUppercase,FakeBold=\fakebold]{Old Standard}
\setmathsfont(Latin)[Uppercase=Italic,Lowercase=Italic,FakeBold=\fakebold,Scale=MatchUppercase]{ModernMT-ExtendedItalic.otf}
\defaultfontfeatures{Mapping=tex-text,Ligatures=Tex}
\fi

\newtheorem{theorem}{\textsc{Theorem}}

\RequirePackage{fancyhdr,authoraftertitle}

\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{%
	\ifodd\value{page}
	\small\nouppercase{\scshape \MyAuthor}
	\else
	\small\nouppercase{$\S$\thechapter. \ \scshape\leftmark}
	\fi
}
\fancyfoot[C]{\thepage}