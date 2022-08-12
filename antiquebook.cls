\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{antiquebook}
\LoadClass[12pt]{book}

\usepackage{amsmath,amssymb,amsthm,etoolbox}
\usepackage[left=.5in,right=.5in,top=.5in,]{geometry}
\usepackage{xcolor,color,fancyhdr,}
\usepackage{subfiles}

\usepackage{enumerate}

\usepackage{titletoc,tocloft,fmtcount}
\renewcommand{\thechapter}{\Roman{chapter}}
\renewcommand{\theequation}{$\ddagger$\arabic{equation}}
%\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\contentsname}{\parbox{\linewidth}{\centerline{\normalfont\LARGE CONTENTS}~\\[-1.5cm]}}

\renewcommand{\thesection}{$\S$\arabic{section}\hspace{.1em}.\hspace{.2em}}
%\addtolength{\cftchapnumwidth}{70pt}
%\addtolength{\cftsecnumwidth}{30pt}
\makeatletter
\renewcommand*\l@chapter[2]{%
	\ifnum \c@tocdepth >\m@ne\relax
	\addpenalty{-\@highpenalty}%
	\addvspace{1.0em \@plus\p@}%
	\setlength\@tempdima{3em}%
	\begingroup
	\def\numberline##1{\xdef\@chapternumber{##1}}%
	\setbox0=\vbox{\centering #1.\vspace{1\baselineskip}}% Could be more than one line
	\centering
	\leavevmode
	\hyperlink{\Hy@tocdestname}{\vspace{1\baselineskip} \MakeUppercase\chaptername\hspace{.5em}\@chapternumber.}\\
	\unvbox0
	\par
	\nobreak
	\global\@nobreaktrue
	\everypar{\global\@nobreakfalse\everypar{}}%
	\endgroup
	\fi}
\makeatother

\usepackage{hyperref,titlesec,xifthen,iftex,authoraftertitle,}

\usepackage[bibstyle=philosophy-modern,citestyle=philosophy-verbose,backend=biber,autopunct,sortcites,dashed,datamodel=ext-eprint,doi,eprint]{biblatex}

\hypersetup{linktocpage,unicode,pdfencoding=auto,pdfstartview=,allcolors=black,anchorcolor=black,allbordercolors=black,hidelinks}
\DeclareNameAlias{sortname}{given-family}
\interfootnotelinepenalty=10000

\ifxetex
	\usepackage{unicode-math}
	\newcommand{\fakebold}{0.}
	\newcommand{\fakestretch}{1.}
	\newcommand{\scale}{1.}
	\newcommand{\fakemathbold}{0.}
	\setmainfont[FakeBold=\fakebold,ItalicFont=CenturymodernTT-Italic.otf,BoldItalicFont=CenturymodernTT-Italic.otf,SmallCapsFont={CenturymodernTT-SC.otf},BoldFont=CenturymodernTT-Regular.otf,BoldFeatures={SmallCapsFeatures={FakeBold=2}},BoldItalicFeatures={FakeBold=2},Scale=\scale,FakeStretch=\fakestretch]{CenturymodernTT-Regular.otf}
	\setsansfont[FakeBold=\fakebold,Scale=\scale,FakeStretch=\fakestretch]{NewCMSans10-Book.otf}
	\setmonofont[FakeBold=\fakebold,Scale=\scale,FakeStretch=\fakestretch]{NewCMMono10-Book.otf}
	\setmathfont[,Scale=\scale,FakeStretch=\fakestretch,FakeBold=\fakemathbold]{NewCMMath-Regular.otf}% KpMath-Regular.otf,KpMath-Light.otf
	
	\setmathfont[range={it,"007D,frak,"2022,{up/Greek},{it/Greek},"22EF,"2217-"2219,"2229-"222B,"2208,"2022,"211C,"2111},Scale=\scale,FakeStretch=\fakestretch,FakeBold=\fakemathbold]{CenturymodernTT-Italic.otf}
	\setmathfont{CenturymodernTT-Regular.otf}[range={it/{num,"03BB},up/{num,"03BB},"00A7,"03BB,"007B-"007D,"0028-"0029,"002F,"005B-"005D,"00A7,\mid,},Scale=\scale,FakeStretch=\fakestretch,FakeBold=\fakemathbold]
	%\setmathfont{ModernMT-ExtendedItalic-New.otf}[range={"2260-"2267,"226A-"226B,"003C,"003E,"03B1},FakeBold=\fakemathbold,FakeStretch=1.1\fakestretch]
	\setmathfont[range={bb,"2022,{up/Greek},{it/Greek},"22EF,"2217-"2219,"2229-"222B,"2208,"2022,"003D,"2264-"2265,"2260,"22C4,frak,"221E,"002F,"00B1,"0021,},Scale=\scale,FakeStretch=1.05\fakestretch,FakeBold=2]{CenturymodernTT-Italic.otf}
	
	\newfontfamily{\sumfont}{CenturymodernTT-Italic.otf}[]% GFSSolomos.otf,lmroman17-regular.otf,lmromanslant17-regular.otf,Theano Didot Regular V1.otf
	\makeatletter
	\RenewDocumentCommand{\sum@}{}{\DOTSB\baskervillesum}
	\AtBeginDocument{%
		\RenewDocumentCommand{\sum}{}{\mathop{\sum@}\slimits@}%
	}
	\NewDocumentCommand{\baskervillesum}{}{%
		\mathchoice
		{\makebaskervillesum{1.6}}% displaystyle
		{\makebaskervillesum{1.2}}% textstyle
		{\makebaskervillesum{1}}% scriptstyle
		{\makebaskervillesum{0.7}}% scriptscriptstyle
	}
	\NewDocumentCommand{\makebaskervillesum}{m}{%
		\vcenter{\hbox{\scalebox{#1}{\sumfont Σ}}}%
	}
	\newfontfamily{\prodfont}{CenturymodernTT-Italic.otf}[FakeStretch=.9\fakestretch]%OldStandard-Italic.otf,ModernExtT-Theano.otf
	\makeatletter
	\RenewDocumentCommand{\prod@}{}{\DOTSB\baskervilleprod}
	\AtBeginDocument{%
		\RenewDocumentCommand{\prod}{}{\mathop{\prod@}\slimits@}%
	}
	\NewDocumentCommand{\baskervilleprod}{}{%
		\mathchoice
		{\makebaskervilleprod{1.6}}% displaystyle
		{\makebaskervilleprod{1.2}}% textstyle
		{\makebaskervilleprod{1}}% scriptstyle
		{\makebaskervilleprod{0.7}}% scriptscriptstyle
	}
	\NewDocumentCommand{\makebaskervilleprod}{m}{%
		\vcenter{\hbox{\scalebox{#1}{\prodfont ∏}}}%
	}
	\newfontfamily\intfont{CenturymodernTT-Italic.otf}[FakeBold=0,FakeStretch=1.1]% OldStandard-Italic.otf,latinmodern-math.otf,Erewhon-Math.otf
	\makeatletter
	\NewDocumentCommand{\int@}{}{\DOTSB\baskervilleint}
	\AtBeginDocument{%
		\RenewDocumentCommand{\int}{}{\mathop{\int@}\slimits@}%
	}
	\NewDocumentCommand{\baskervilleint}{}{%
		\mathchoice
		{\makebaskervilleint{1.6}}% displaystyle
		{\makebaskervilleint{1.2}}% textstyle
		{\makebaskervilleint{1}}% scriptstyle
		{\makebaskervilleint{0.7}}% scriptscriptstyle
	}
	\NewDocumentCommand{\makebaskervilleint}{m}{%
		\vcenter{\hbox{\scalebox{#1}{\intfont ∫}}}%
	}
	\newfontfamily\titlefont{CenturymodernTT-Regular.otf}[FakeBold=0,UprightFeatures={Letters=Uppercase},]
	\defaultfontfeatures{Mapping=tex-text,Ligatures=Tex}
	\newcommand{\wb}[2]{\fontsize{#1}{#2}\usefont{U}{webo}{xl}{n}}
	\newcommand{\wbc}[3]{\vspace*{#1}\begin{center}
			\wb{#2}{#2}#3\end{center}\vspace*{#1}}
	% Fix pmatrix for custom brackets
	\ExplSyntaxOn
	\box_new:N \l_masum_box
	\RenewDocumentEnvironment{pmatrix}{}
	{ 
		\hbox_set:Nw \l_masum_box 
		\c_math_toggle_token
		\begin{matrix}
		}
		{ 
		\end{matrix}
		\c_math_toggle_token
		\hbox_set_end:
		\scaleleftright[.8ex]{(}{\box_use:N \l_masum_box}{)}
	}
	
	\box_new:N \l_masum_box_vm
	\RenewDocumentEnvironment{vmatrix}{}
	{ 
		\hbox_set:Nw \l_masum_box_vm
		\c_math_toggle_token
		\begin{matrix}
		}
		{ 
		\end{matrix}
		\c_math_toggle_token
		\hbox_set_end:
		\scaleleftright[.5ex]{|}{\box_use:N \l_masum_box_vm}{|}
	}
	
	\box_new:N \l_masum_box_new
	\RenewDocumentEnvironment{cases}{}
	{ 
		\hbox_set:Nw \l_masum_box_new
		\c_math_toggle_token
		\begin{matrix}
		}
		{
		\end{matrix}
		\c_math_toggle_token
		\hbox_set_end:
		\scaleleftright[1.2ex]{\{}{\box_use:N \l_masum_box_new}{}
	}
	\ExplSyntaxOff
	\makeatletter
	\let\fontspec@setsansfont\setsansfont
	\def\setsansfont{%
		\let\Alegreya@boldstyle\AlegreyaSans@boldstyle
		\let\setsansfont\fontspec@setsansfont
		\setsansfont
	}
	\makeatother
	\defaultfontfeatures{Ligatures={NoCommon, NoDiscretionary, NoHistoric, NoRequired, NoContextual}}
\else
	\usepackage{pdfrender, xcolor,relsize}
	\usepackage[T1]{fontenc}
	%\usepackage{baskervillef}
	%\usepackage[baskerville]{newtxmath}
	\pdfrender{StrokeColor=black,TextRenderingMode=2,LineWidth=0.0pt}
	\makeatletter\let\normalrender\PdfRender@NormalColorHook\let\PdfRender@NormalColorHook\@empty\newcommand*{\textnormalrender}[1]{\begingroup\normalrender#1\endgroup}\makeatother
\fi

\usepackage[,nopostdot,]{glossaries}
\usepackage{makeidx}

\usepackage{nomencl}
\renewcommand{\nomname}{Notations}
\makenomenclature
%\glstoctrue
\makeindex
\makeglossaries

\titleformat{\chapter}[display]{\Huge}{\normalfont\large\centering\MakeUppercase\chaptername\hspace{.5em}\thechapter.}{1ex}{\centering\vspace{1ex}\ifthenelse{\value{chapter}>0}{\MakeUppercase}{}}[\vspace{1ex}]
\titleformat{\section}[display]{\LARGE}{}{1ex}{\centering\ifthenelse{\value{section}>0}{\thesection\;}{}\vspace{.2in}}[]
%\titleformat{\subsection}[display]{\bfseries\scshape\Large}{}{1ex}{\centering\ifthenelse{\value{section}>0}{$\S\S$\thesubsection\;}{}}[\titlerule]

\newtheorem{theorem}{\textbf{\textbf{Theorem}}}
%\numberwithin{theorem}{chapter}
%\renewcommand{\thetheorem}{\arabic{theorem}}
\theoremstyle{definition}
\newenvironment{definition}[1][]{\par\medskip\noindent \textit{\textbf{{\ifthenelse{\isempty{#1}}{Definition.}{#1.}}}} \rmfamily}{\medskip}

\usepackage{scalerel}
\newcommand{\floor}[1]{\ifxetex{\squarebracket{#1}}\else{\left\lfloor{#1}\right\rfloor}\fi}
\newcommand{\ceiling}[1]{\left\lceil{#1}\right\rceil}
\ifxetex\renewcommand{\binom}[2]{\scaleleftright[.8ex]{(}{\genfrac{}{}{0pt}{0}{#1}{#2}}{)}}\fi
\newcommand{\parenthesis}[1]{\ifxetex{\scaleleftright[.8ex]{(}{#1}{)}}\else{\left(#1\right)}\fi}
\newcommand{\curlybrace}[1]{\ifxetex{\scaleleftright[1.2ex]{\{}{#1}{\}}}\else{\left\{#1\right\}}\fi}
\newcommand{\squarebracket}[1]{\ifxetex{\scaleleftright[1.2ex]{\kern 4pt[}{#1}{]\kern 4pt}}\else{\left[#1\right]}\fi}
\newcommand{\qr}[2]{\parenthesis{\frac{#1}{#2}}}
\newcommand{\bigo}[1]{O\parenthesis{#1}}
\newcommand{\func}[2]{\kern3pt#1\parenthesis{#2}}
\DeclareMathOperator{\ord}{ord}
\newcommand{\F}[1]{\mathbb{F}_{#1}}
\DeclareMathOperator{\rad}{rad}
\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\SL}{SL}

\renewcommand*{\chapterautorefname}{Chapter}
\renewcommand*{\sectionautorefname}{Section}
\renewcommand*{\subsectionautorefname}{Subsection}

\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
\renewcommand{\sectionmark}[1]{\markboth{#1}{#1}}

\usepackage{extramarks}
\AtBeginEnvironment{theorem}{\addtocounter{theorem}{1}%
	\extramarks{\thetheorem}{}\addtocounter{theorem}{-1}}

\pagestyle{fancy}
\fancypagestyle{fancy}{
	\fancyhf{}
	\fancyhead[L]{\ifthenelse{0\firstleftxmark=0}
		{}% no theorems yet, so no header
		{\ifthenelse{\equal{\firstleftxmark}{\lastleftxmark}}
			{\textit{Theorem} \firstleftxmark}% Only one theorem on the page
			{\textit{Theorems} \firstleftxmark–\lastleftxmark}}}
	\fancyhead[CE]{\small\itshape \MyAuthor}
	\fancyhead[R]{\thepage}
	\fancyhead[CO]{\small\itshape \thesection\hspace{.1em}\nouppercase\rightmark}
}

\setcounter{secnumdepth}{3}

\theoremstyle{definition}
\newtheorem{problem}{\text{Problem}}
\newcommand*{\problemautorefname}{Problem}
\newtheorem*{remark}{\text{Remark}}
\newtheorem*{note}{\text{Note}}
\newtheorem*{solution}{\text{Solution}}
%\numberwithin{problem}{chapter}

\defbibfilter{books}{type=book or type=inbook}

\DeclareSourcemap{
	\maps[datatype=bibtex]{
		\map{
			\step[fieldsource=pmid, fieldtarget=pubmed]
		}
	}
}

\makeatletter
\DeclareFieldFormat{arxiv}{%
	arXiv\addcolon\space
	\ifhyperref
	{\href{http://arxiv.org/\abx@arxivpath/#1}{%
			\nolinkurl{#1}%
			\iffieldundef{arxivclass}
			{}
			{\addspace\texttt{\mkbibbrackets{\thefield{arxivclass}}}}}}
	{\nolinkurl{#1}
		\iffieldundef{arxivclass}
		{}
		{\addspace\texttt{\mkbibbrackets{\thefield{arxivclass}}}}}}
\makeatother
\DeclareFieldFormat{pmcid}{%
	PMCID\addcolon\space
	\ifhyperref
	{\href{http://www.ncbi.nlm.nih.gov/pmc/articles/#1}{\nolinkurl{#1}}}
	{\nolinkurl{#1}}}
\DeclareFieldFormat{mr}{%
	MR\addcolon\space
	\ifhyperref
	{\href{http://www.ams.org/mathscinet-getitem?mr=MR#1}{\nolinkurl{#1}}}
	{\nolinkurl{#1}}}
\DeclareFieldFormat{zbl}{%
	Zbl\addcolon\space
	\ifhyperref
	{\href{http://zbmath.org/?q=an:#1}{\nolinkurl{#1}}}
	{\nolinkurl{#1}}}
\DeclareFieldAlias{jstor}{eprint:jstor}
\DeclareFieldAlias{hdl}{eprint:hdl}
\DeclareFieldAlias{pubmed}{eprint:pubmed}
\DeclareFieldAlias{googlebooks}{eprint:googlebooks}

\renewbibmacro*{eprint}{%
	\printfield{arxiv}%
	\newunit\newblock
	\printfield{jstor}%
	\newunit\newblock
	\printfield{mr}%
	\newunit\newblock
	\printfield{zbl}%
	\newunit\newblock
	\printfield{hdl}%
	\newunit\newblock
	\printfield{pubmed}%
	\newunit\newblock
	\printfield{pmcid}%
	\newunit\newblock
	\printfield{googlebooks}%
	\newunit\newblock
	\iffieldundef{eprinttype}
	{\printfield{eprint}}
	{\printfield[eprint:\strfield{eprinttype}]{eprint}}}


\usepackage{graphicx}
\usepackage{eso-pic}
\AddToShipoutPictureBG{\includegraphics[width=\paperwidth,height=\paperheight]{background}}
