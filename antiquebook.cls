\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{antiquebook}
\LoadClass[12pt]{book}

\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage{hyperref}
\hypersetup{pdfstartview=,pdfencoding=auto,}

\RequirePackage[style=philosophy-verbose,backend=biber,sortcites=true,classical=true,scauthors=true, scauthorscite=true,scauthorsbib=true,volnumformat=strings,volumeformat=romansc,]{biblatex}

\RequirePackage{tocloft,xifthen,centernot, iftex,titlesec,ifthen
}

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
\setmainfont[FakeBold=\fakebold,ItalicFont=ModernMT-ExtendedItalic.otf,BoldItalicFont=OldStandard-BoldItalic.otf,SmallCapsFont={OldStandard-Regular.otf},SmallCapsFeatures={Letters=SmallCaps,FakeBold=\fakebold,RawFeature=+smcp},BoldFont=OldStandard-Bold.otf,BoldFeatures={FakeBold=0,SmallCapsFont=OldStandard-Bold.otf,SmallCapsFeatures={RawFeature=+smcp}},BoldItalicFeatures={FakeBold=0}]{ModernMTStd-Extended.otf}
\setmathfont[FakeBold=\fakebold,]{NewCMMath-Book.otf}
\setmathfont[range=it,FakeBold=\fakebold]{Old Standard Italic}
\setmathfont[range={\symfrak},FakeBold=\fakebold]{Asana Math}
\setmathfont[range={\int},Scale=\fakebold,]{Old Standard Italic}
\setmathfont[range={\partial},Scale=MatchUppercase,FakeBold=\fakebold]{Old Standard Italic}
\setmathfont[range={\sum,\prod},Scale=1.7]{Old Standard Italic}
\newfontfamily{\mtmext}[FakeBold=\fakebold]{Old Standard}
\newcommand*{\customaccent}[1]{\mtmext\selectfont #1}
\newcommand{\fH}[1]{\rmfamily\H{\customaccent{#1}}}
\usepackage{mathspec}
\setmathsfont(Digits)[Scale=MatchUppercase,FakeBold=\fakebold]{ModernMTStd-Extended.otf}
\setmathsfont(Latin)[Uppercase=Italic,Lowercase=Italic,FakeBold=\fakebold,Scale=MatchUppercase]{ModernMTStd-ExtendedItalic.otf}
\defaultfontfeatures{Mapping=tex-text,Ligatures=Tex}
\fi

\newtheorem{theorem}{\textsc{\textbf{Theorem}}}[chapter]
\theoremstyle{definition}
\newenvironment{definition}[1][]{\par\medskip\noindent \textbf{\textsc{{\ifthenelse{\isempty{#1}}{Definition.}{#1.}}}} \rmfamily}{\medskip}
\RequirePackage{fancyhdr,authoraftertitle}

\renewcommand*{\chapterautorefname}{Chapter}
\renewcommand*{\sectionautorefname}{Section}
\renewcommand{\theequation}{$\ddagger$\ \thechapter.\arabic{equation}}
\interfootnotelinepenalty=10000

\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
\pagestyle{fancyplain}
\fancyhf{}
\rhead{ \fancyplain{}{\small\textit{{Masum Billal}}} }
\lhead{ \fancyplain{}{\small$\S$\thechapter. \ \textsc{\leftmark}} }
\rfoot{ \fancyplain{}{\thepage}}
\renewcommand{\headrulewidth}{.1pt} % remove lines as well

\titleformat{\chapter}[display]{\bfseries\scshape\Huge}{}{1ex}{\centering\titlerule\vspace{1ex}}[\vspace{1ex}\titlerule]
\titleformat{\section}[display]{\bfseries\scshape\Large}{}{1ex}{\centering$\S$\ifthenelse{\value{section}>0}{\thesection}{}\;}[\titlerule]
\titleformat{\subsection}[display]{\bfseries\scshape\large}{}{1ex}{\centering$\S$\ifthenelse{\value{section}>0}{\thesubsection}{}\;}[\titlerule]