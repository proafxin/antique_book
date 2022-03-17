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
\setmainfont[FakeBold=\fakebold,ItalicFont=ModernMT-ExtendedItalic.otf,BoldItalicFont=OldStandard-BoldItalic.otf,SmallCapsFont={OldStandard-Regular.otf},SmallCapsFeatures={Letters=SmallCaps,FakeBold=\fakebold,RawFeature=+smcp},BoldFont=OldStandard-Bold.otf,BoldFeatures={FakeBold=0,SmallCapsFont=OldStandard-Bold.otf,SmallCapsFeatures={RawFeature=+smcp}},BoldItalicFeatures={FakeBold=0}]{ModernMT-Extended-OldStandard.otf}
\setmathfont[FakeBold=\fakebold,]{NewCMMath-Book.otf}
\setmathfont[range={it},FakeBold=\fakebold]{ModernMT-ExtendedItalic-OldStandard-Italic.otf}
\setmathfont[range={"0030-"0039}]{ModernMT-Extended-OldStandard.otf}
\setmathfont[range={\symfrak,},Scale=MatchUppercase]{Asana Math}
\setmathfont[range={\int},Scale=1.6,]{Old Standard Italic}
\setmathfont[range={\sum,\prod},Scale=1.4]{Old Standard}
\setmathfont[range={\partial},FakeBold=\fakebold]{Old Standard}
\setmathfont[range={"005B,"005D,"0028,"0029,"007B,"007D,}]{Asana Math}
%\usepackage{mathspec}
%\setmathsfont(Digits)[Scale=MatchUppercase,FakeBold=\fakebold]{ModernMTStd-Extended.otf}
%\setmathsfont(Latin)[Uppercase=Italic,Lowercase=Italic,FakeBold=\fakebold,Scale=MatchUppercase]{ModernMTStd-ExtendedItalic.otf}
%\defaultfontfeatures{Mapping=tex-text,Ligatures=Tex}
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
\titleformat{\chapter}[display]{\bfseries\scshape\Huge}{}{1ex}{\centering\titlerule\vspace{1ex}\ifthenelse{\value{chapter}>0}{$\S$\thechapter\;}{}}[\vspace{1ex}\titlerule]
\titleformat{\section}[display]{\bfseries\scshape\LARGE}{}{1ex}{\centering\ifthenelse{\value{section}>0}{$\S\S$\thesection\;}{}}[\titlerule]
\titleformat{\subsection}[display]{\bfseries\scshape\Large}{}{1ex}{\centering\ifthenelse{\value{section}>0}{$\S\S\S$\thesection\;}{}}[\titlerule]