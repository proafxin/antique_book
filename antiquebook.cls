\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{antiquebook}
\LoadClass[12pt]{book}

\usepackage{amsmath,amssymb,amsthm,etoolbox}
\usepackage[left=.5in,right=.5in,top=.5in,]{geometry}
\usepackage{xcolor,color,fancyhdr,}
\usepackage{subfiles}

\usepackage{enumerate}

\usepackage{hyperref,titlesec,xifthen,iftex,authoraftertitle,}

\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thechapter}{\NUMBERstring{chapter}}
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\contentsname}{\parbox{\linewidth}{\centerline{\LARGE CONTENTS}~\\[-1.5cm]}}

\renewcommand{\thesection}{$\S$\Roman{section}\hspace{.1em}:\hspace{.2em}}
\renewcommand{\thesubsection}{\arabic{section}.\hspace{.1em}\arabic{subsection}}
\renewcommand{\theequation}{$\ddagger$\arabic{equation}}

%\addtolength{\cftchapnumwidth}{70pt}
%\addtolength{\cftsecnumwidth}{30pt}
\setcounter{tocdepth}{2}

\makeatletter
\renewcommand*\l@chapter[2]{%
	\ifnum \c@tocdepth >\m@ne\relax
	\addpenalty{-\@highpenalty}%
	\addvspace{1.0em \@plus\p@}%
	\setlength\@tempdima{3em}%
	\begingroup
	\def\numberline##1{\bfseries\Large\xdef\@chapternumber{##1}}%
	\setbox0=\vbox{\centering\strut #1}% Could be more than one line
	\centering
	\leavevmode
	\hyperlink{\Hy@tocdestname}{\vspace{.5\baselineskip}\bfseries \chaptername\hspace{.5em}\@chapternumber}\\
	\unvbox0
	\par
	\nobreak
	\global\@nobreaktrue
	\everypar{\global\@nobreakfalse\everypar{}}%
	\endgroup
	\fi}
\makeatother

\usepackage{filecontents}

\begin{filecontents*}{ext-eprint.dbx}
	\ProvidesFile{ext-eprint.dbx}[2016/09/11 extended stand-alone eprint fields]
	\DeclareDatamodelFields[type=field,datatype=verbatim]{arxiv,mr,zbl,jstor,hdl,pubmed,googlebooks,pmcid}
	\DeclareDatamodelEntryfields{arxiv,mr,zbl,jstor,hdl,pubmed,googlebooks,pmcid}
	\DeclareDatamodelFields[type=field,datatype=literal]{arxivclass}
	\DeclareDatamodelEntryfields{arxivclass}
\end{filecontents*}

\usepackage[bibstyle=philosophy-modern,citestyle=philosophy-verbose,backend=biber,autopunct,sortcites,dashed,datamodel=ext-eprint,doi,eprint]{biblatex}
\hypersetup{linktocpage,unicode,pdfencoding=auto,pdfstartview=,allcolors=black,anchorcolor=black,allbordercolors=black,hidelinks}
\DeclareNameAlias{sortname}{given-family}
\interfootnotelinepenalty=10000

\ifxetex
\usepackage{titletoc,tocloft,fmtcount}
\renewcommand{\thechapter}{\Roman{chapter}}
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

\usepackage{unicode-math}
\newcommand{\fakebold}{0.}
\newcommand{\fakestretch}{1.}
\newcommand{\scale}{1.1}
\newcommand{\fakemathbold}{1.}
\setmainfont[FakeBold=\fakebold,ItalicFont=CenturymodernTT-Italic.otf,ItalicFeatures={FakeBold=.5},BoldItalicFont=CenturymodernTT-Italic.otf,SmallCapsFont={OldStandard-Regular.otf},SmallCapsFeatures={Letters=SmallCaps,RawFeature=+smcp,Scale=\scale,FakeStretch=\fakestretch},BoldFont=CenturymodernTT-Regular.otf,BoldFeatures={,Scale=\scale,SmallCapsFont=OldStandard-Bold.otf,SmallCapsFeatures={RawFeature=+smcp,Scale=\scale},FakeStretch=\fakestretch,FakeBold=2},BoldItalicFeatures={FakeBold=2},Scale=\scale,FakeStretch=\fakestretch]{CenturymodernTT-Regular.otf}
\setsansfont[FakeBold=\fakebold,Scale=\scale,FakeStretch=\fakestretch]{CenturymodernTT-Regular.otf}
\setmonofont[FakeBold=\fakebold,Scale=\scale,FakeStretch=\fakestretch]{CenturymodernTT-Regular.otf}
\setmathfont[,Scale=\scale,FakeStretch=\fakestretch,FakeBold=\fakemathbold]{NewCMMath-Regular.otf}% KpMath-Regular.otf,KpMath-Light.otf

\setmathfont[range={it,"007D,},Scale=\scale,FakeStretch=\fakestretch,FakeBold=\fakemathbold]{CenturymodernTT-Italic.otf}
\setmathfont[range={up,"03BB},Scale=\scale,FakeStretch=\fakestretch,FakeBold=\fakemathbold]{CenturymodernTT-Regular.otf}
%\setmathfont{latinmodern-math.otf}[range={bfup,},Scale=\scale,FakeStretch=\fakestretch,FakeBold=\fakemathbold]
%\setmathfont{CenturymodernTT-Regular.otf}[range={"005B,"005D,"2308-"230B,"005B,"005D,"003A,"003B,"002C,"003D,"2260-"2267,"00A7},FakeStretch=1.1\fakestretch]% NewCMMath-Regular.otf,texgyrepagella-math.otf
\setmathfont{CenturymodernTT-Regular.otf}[range={bb,frak,it/{num,"03BB},up/{num,"03BB},"00A7,"03BB,},Scale=\scale,FakeStretch=\fakestretch,FakeBold=\fakemathbold]
%\setmathfont{FeDPrm2.ttf}[range={"0028-"0029,"00A7,"005B-"005D},]
%\setmathfont{IMFellEnglish-Regular.ttf}[range={"007B-"007D,}]
\setmathfont{ModernMT-ExtendedItalic-New.otf}[range={"2260-"2267,"226A-"226B,"003C-"003E,},FakeBold=\fakemathbold,FakeStretch=1.1\fakestretch]
%\setmathfont{OldStandard-Italic.otf}[range={it/{Greek,greek},},FakeBold=\fakemathbold]
%\setmathfont{ModernMT-ExtendedItalic-New.otf}[range={"003D},Scale=\scale,FakeStretch=1.2]
%\setmathfont{CenturymodernTT-regular.otf}[range={up/{greek,Greek},it/{greek,Greek},},FakeBold=\fakemathbold,Scale=\scale,FakeStretch=\fakestretch]
\setmathfont{IM_FELL_Double_Pica_Roman_SC.otf}[range={"007B-"007D,"0028-"0029,"002F,"005B-"005D,"00A7,\mid,},FakeBold=0]
\setmathfont{IMFellEnglish-Regular.ttf}[range={"007B,"007D,},]
\newfontfamily{\sumfont}{ModernMT-ExtendedItalic-New.otf}[]% GFSSolomos.otf,lmroman17-regular.otf,lmromanslant17-regular.otf,Theano Didot Regular V1.otf
\makeatletter
\RenewDocumentCommand{\sum@}{}{\DOTSB\baskervillesum}
\AtBeginDocument{%
	\RenewDocumentCommand{\sum}{}{\mathop{\sum@}\slimits@}%
}
\NewDocumentCommand{\baskervillesum}{}{%
	\mathchoice
	{\makebaskervillesum{1.8}}% displaystyle
	{\makebaskervillesum{1.4}}% textstyle
	{\makebaskervillesum{1}}% scriptstyle
	{\makebaskervillesum{0.7}}% scriptscriptstyle
}
\NewDocumentCommand{\makebaskervillesum}{m}{%
	\vcenter{\hbox{\scalebox{#1}{\sumfont Σ}}}%
}
\newfontfamily{\prodfont}{ModernMT-ExtendedItalic-New.otf}[FakeStretch=.9\fakestretch]%OldStandard-Italic.otf,ModernExtT-Theano.otf
\makeatletter
\RenewDocumentCommand{\prod@}{}{\DOTSB\baskervilleprod}
\AtBeginDocument{%
	\RenewDocumentCommand{\prod}{}{\mathop{\prod@}\slimits@}%
}
\NewDocumentCommand{\baskervilleprod}{}{%
	\mathchoice
	{\makebaskervilleprod{1.7}}% displaystyle
	{\makebaskervilleprod{1.2}}% textstyle
	{\makebaskervilleprod{1}}% scriptstyle
	{\makebaskervilleprod{0.7}}% scriptscriptstyle
}
\NewDocumentCommand{\makebaskervilleprod}{m}{%
	\vcenter{\hbox{\scalebox{#1}{\prodfont ∏}}}%
}
\newfontfamily\intfont{CenturymodernTT-Italic.ttf}[FakeBold=0]% OldStandard-Italic.otf,latinmodern-math.otf,Erewhon-Math.otf
\makeatletter
\NewDocumentCommand{\int@}{}{\DOTSB\baskervilleint}
\AtBeginDocument{%
	\RenewDocumentCommand{\int}{}{\mathop{\int@}\slimits@}%
}
\NewDocumentCommand{\baskervilleint}{}{%
	\mathchoice
	{\makebaskervilleint{1.8}}% displaystyle
	{\makebaskervilleint{1.2}}% textstyle
	{\makebaskervilleint{1}}% scriptstyle
	{\makebaskervilleint{0.7}}% scriptscriptstyle
}
\NewDocumentCommand{\makebaskervilleint}{m}{%
	\vcenter{\hbox{\scalebox{#1}{\intfont ∫}}}%
}
\newfontfamily\titlefont{CenturymodernTT-Regular.otf}[FakeBold=1,UprightFeatures={Letters=Uppercase},]
\defaultfontfeatures{Mapping=tex-text,Ligatures=Tex}
\else
\usepackage{pdfrender, xcolor,relsize}
\usepackage[T1]{fontenc}
\usepackage{baskervillef}
\usepackage[baskerville]{newtxmath}
\pdfrender{StrokeColor=black,TextRenderingMode=2,LineWidth=0.2pt}
\makeatletter\let\normalrender\PdfRender@NormalColorHook\let\PdfRender@NormalColorHook\@empty\newcommand*{\textnormalrender}[1]{\begingroup\normalrender#1\endgroup}\makeatother
\fi

\usepackage[toc,nopostdot,]{glossaries}
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
\newcommand{\floor}[1]{\squarebracket{#1}}
\newcommand{\ceiling}[1]{\left\lceil{#1}\right\rceil}
\renewcommand{\binom}[2]{\scaleleftright[.8ex]{(}{\genfrac{}{}{0pt}{0}{#1}{#2}}{)}}
\newcommand{\parenthesis}[1]{\scaleleftright[.8ex]{(}{#1}{)}}
\newcommand{\curlybrace}[1]{\scaleleftright[1.2ex]{\{}{#1}{\}}}
\newcommand{\squarebracket}[1]{\scaleleftright[1ex]{[}{#1}{]}}
\newcommand{\bigo}[1]{O\parenthesis{#1}}
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

\addbibresource{ref.bib}
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
