\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{antiquebook}
\LoadClass[12pt]{book}

\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage{hyperref}
\RequirePackage{tocloft,xifthen,centernot, iftex,titlesec,ifthen,rotating,fancyhdr,subfiles,authoraftertitle}
\usepackage[bibstyle=philosophy-modern,citestyle=philosophy-verbose,backend=biber,autopunct,sortcites,]{biblatex}

\hypersetup{linktocpage,unicode,pdfencoding=auto,}
\DeclareNameAlias{sortname}{given-family}
\interfootnotelinepenalty=10000

\ifxetex
	\usepackage{unicode-math}
	\newcommand{\fakebold}{1}
	\newcommand{\scale}{1}
	\newcommand{\fakemathbold}{1}
	\setmainfont[FakeBold=\fakebold,ItalicFont=ModernMT-ExtendedItalic-New.otf,ItalicFeatures={FakeBold=\fakebold,Scale=\scale},BoldItalicFont=ModernMT-ExtendedItalic-New.otf,SmallCapsFont={OldStandard-Regular.otf},SmallCapsFeatures={Letters=SmallCaps,FakeBold=\fakebold,RawFeature=+smcp,Scale=\scale},BoldFont=OldStandard-Bold.otf,BoldFeatures={FakeBold=0,Scale=\scale,SmallCapsFont=OldStandard-Bold.otf,SmallCapsFeatures={RawFeature=+smcp,Scale=\scale}},BoldItalicFeatures={FakeBold=3},]{ModernMT-Extended-New.otf}
	\setsansfont[FakeBold=1,Scale=\scale]{Latin Modern Sans}
	\setmonofont[FakeBold=1,Scale=\scale]{Latin Modern Mono}
	\setmathfont[FakeBold=\fakemathbold,Scale=\scale]{NewCMMath-Book.otf}
	\setmathfont[range={it,},FakeBold=\fakemathbold,Scale=\scale]{ModernMT-ExtendedItalic-New.otf}
	\setmathfont[range={up,},FakeBold=\fakemathbold,Scale=\scale]{ModernMT-Extended-New.otf}
	\setmathfont{texgyrepagella-math.otf}[range={"0028,"0029,"005B,"005D,"007B,"007D,}]
	\setmathfont{OldStandard-Regular.otf}[range={\partial},FakeBold=\fakemathbold]

	\newfontfamily{\bask}{ModernExtT-Theano.otf}
	\makeatletter
	\RenewDocumentCommand{\sum@}{}{\DOTSB\baskervillesum}
	\AtBeginDocument{%
		\RenewDocumentCommand{\sum}{}{\mathop{\sum@}\slimits@}%
	}
	\NewDocumentCommand{\baskervillesum}{}{%
		\mathchoice
		{\makebaskervillesum{1.8}}% displaystyle
		{\makebaskervillesum{1.2}}% textstyle
		{\makebaskervillesum{1}}% scriptstyle
		{\makebaskervillesum{0.7}}% scriptscriptstyle
	}
	\NewDocumentCommand{\makebaskervillesum}{m}{%
		\vcenter{\hbox{\scalebox{#1}{\bask Σ}}}%
	}
	\makeatletter
	\RenewDocumentCommand{\prod@}{}{\DOTSB\baskervilleprod}
	\AtBeginDocument{%
		\RenewDocumentCommand{\prod}{}{\mathop{\prod@}\slimits@}%
	}
	\NewDocumentCommand{\baskervilleprod}{}{%
		\mathchoice
		{\makebaskervilleprod{1.5}}% displaystyle
		{\makebaskervilleprod{1.2}}% textstyle
		{\makebaskervilleprod{1}}% scriptstyle
		{\makebaskervilleprod{0.7}}% scriptscriptstyle
	}
	\NewDocumentCommand{\makebaskervilleprod}{m}{%
		\vcenter{\hbox{\scalebox{#1}{\bask ∏}}}%
	}
	\newfontfamily\intfont{Old Standard Italic}
	\makeatletter
	\NewDocumentCommand{\int@}{}{\DOTSB\baskervilleint}
	\AtBeginDocument{%
		\RenewDocumentCommand{\int}{}{\mathop{\int@}\slimits@}%
	}
	\NewDocumentCommand{\baskervilleint}{}{%
		\mathchoice
		{\makebaskervilleint{1.5}}% displaystyle
		{\makebaskervilleint{1.2}}% textstyle
		{\makebaskervilleint{1}}% scriptstyle
		{\makebaskervilleint{0.7}}% scriptscriptstyle
	}
	\NewDocumentCommand{\makebaskervilleint}{m}{%
		\vcenter{\hbox{\scalebox{#1}{\intfont ∫}}}%
	}
	\defaultfontfeatures{Mapping=tex-text,Ligatures=Tex}
\else
	%\usepackage{pdfrender, xcolor}
	\renewcommand*\rmdefault{cmdh}
	\usepackage[T1]{fontenc}
	%\pdfrender{StrokeColor=black,TextRenderingMode=2,LineWidth=0.1pt}
	%\makeatletter\let\normalrender\PdfRender@NormalColorHook\let\PdfRender@NormalColorHook\@empty\newcommand*{\textnormalrender}[1]{\begingroup\normalrender#1\endgroup}\makeatother
\fi

\renewcommand{\contentsname}{\centering\bfseries\scshape Contents}
\usepackage{tocloft}
\renewcommand{\cftsecfont}{\normalsize\normalfont\scshape}
\renewcommand{\cftchapfont}{\normalsize\normalfont\scshape\bfseries}
\renewcommand{\cftsubsecfont}{\normalsize\normalfont\scshape}
\renewcommand{\cftpartfont}{\normalsize\normalfont\scshape\bfseries}

\usepackage[toc,nopostdot,]{glossaries}
\usepackage{makeidx}

\usepackage{nomencl}
\renewcommand{\nomname}{Notations}
\makenomenclature
\glstoctrue
\makeindex
\makeglossaries

\titleformat{\chapter}[display]{\bfseries\scshape\Huge}{}{1ex}{\centering\titlerule\vspace{1ex}\ifthenelse{\value{chapter}>0}{$\S\S$\thechapter\;}{}}[\vspace{1ex}\titlerule]
\titleformat{\section}[display]{\bfseries\scshape\LARGE}{}{1ex}{\centering\ifthenelse{\value{section}>0}{$\S\S$\thesection\;}{}}[\titlerule]
\titleformat{\subsection}[display]{\bfseries\scshape\Large}{}{1ex}{\centering\ifthenelse{\value{section}>0}{$\S\S\S$\thesection\;}{}}[\titlerule]

\newtheorem{theorem}{\textsc{\textbf{Theorem}}}[chapter]
\theoremstyle{definition}
\newenvironment{definition}[1][]{\par\medskip\noindent \textsc{\textbf{{\ifthenelse{\isempty{#1}}{Definition.}{#1.}}}} \rmfamily}{\medskip}

\newcommand{\floor}[1]{\left\lfloor{#1}\right\rfloor}
\newcommand{\ceiling}[1]{\left\lceil{#1}\right\rceil}
\newcommand{\parenthesis}[1]{\left(#1\right)}
\newcommand{\curlybrace}[1]{\left\{#1\right\}}
\newcommand{\squarebracket}[1]{\left[#1\right]}
\newcommand{\bigo}[1]{O\parenthesis{#1}}
\newcommand{\F}[1]{\mathbb{F}_{#1}}
\newcommand{\Q}[1]{\mathbb{Q}_{#1}}
\newcommand{\Z}[1]{\mathbb{Z}_{#1}}
\DeclareMathOperator{\rad}{rad}
\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\SL}{SL}

\renewcommand*{\chapterautorefname}{Chapter}
\renewcommand*{\sectionautorefname}{Section}
\renewcommand*{\subsectionautorefname}{Subsection}

\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
\pagestyle{fancyplain}
\fancyhf{}
\rhead{ \fancyplain{}{\small\textit{{\MyAuthor}}} }
\lhead{ \fancyplain{}{\small$\S$\thechapter. \ \textsc{\leftmark}} }
\rfoot{ \fancyplain{}{\thepage}}