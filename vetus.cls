%% vetus.cls
%% An antique (old-style) book class, in the spirit of the classic German
%% mathematical monographs (Landau, Bachmann, Riemann, ...).
%%
%% The only invariant of the class is its set of fonts (Century Modern for
%% text, New Computer Modern for sans/mono/maths, plus old-style large
%% operators).  Every other layout change is opt-in through a class option,
%% so that by default the document behaves like the standard `book' class.
%%
%% Options:
%%   titles      antique numbering and chapter/section title blocks
%%               (Roman chapters, prefixed equations/sections, centred
%%               uppercase chapter/section titles)
%%   toc         antique, centred table of contents
%%   header      running page header (author, section, page number)
%%   delimiters  delimiters drawn from the body font (parentheses, braces,
%%               brackets, binomials and matrices)
%%   background  old-paper background image (background.png)
%%
%% Any other option is passed on to the `book' class.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vetus}[2026/06/06 v1.0 Antique old-style book class]

%% ---------------------------------------------------------------------------
%% Options
%% ---------------------------------------------------------------------------
\newif\ifvetus@titles     \vetus@titlesfalse
\newif\ifvetus@toc        \vetus@tocfalse
\newif\ifvetus@header     \vetus@headerfalse
\newif\ifvetus@delimiters \vetus@delimitersfalse
\newif\ifvetus@background  \vetus@backgroundfalse

\DeclareOption{titles}{\vetus@titlestrue}
\DeclareOption{toc}{\vetus@toctrue}
\DeclareOption{header}{\vetus@headertrue}
\DeclareOption{delimiters}{\vetus@delimiterstrue}
\DeclareOption{background}{\vetus@backgroundtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[12pt]{book}

%% ---------------------------------------------------------------------------
%% Engine detection and core maths packages
%% ---------------------------------------------------------------------------
\RequirePackage{iftex}
\RequirePackage{amsmath,amssymb}

%% ===========================================================================
%% Fonts -- the invariant core of the class
%% ===========================================================================
\newcommand{\vetus@scale}{1.1}   % overall font scale
\newcommand{\vetus@stretch}{1.}  % FakeStretch factor

\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage{pdfrender,relsize}
  \ClassWarningNoLine{vetus}{%
    This class is designed for LuaLaTeX or XeLaTeX (it relies on\MessageBreak
    fontspec/unicode-math and the bundled OpenType fonts).\MessageBreak
    Under pdfLaTeX the antique fonts are unavailable and the default\MessageBreak
    Computer Modern fonts are used instead%
  }
\else
  \RequirePackage{unicode-math}
  \RequirePackage{graphicx}% provides \scalebox for the large operators
  \defaultfontfeatures{Ligatures=TeX}

  %% --- Text fonts --------------------------------------------------------
  %% Small caps are taken from the dedicated CenturymodernTT-SC face and are
  %% scaled automatically (Scale=MatchUppercase) so they track the main
  %% font's cap height without a hand-tuned factor.
  \setmainfont{CenturymodernTT-Regular.otf}[%
    ItalicFont        = CenturymodernTT-Italic.otf,%
    BoldFont          = CenturymodernTT-Regular.otf,%
    BoldItalicFont    = CenturymodernTT-Italic.otf,%
    SmallCapsFont     = CenturymodernTT-SC.otf,%
    SmallCapsFeatures = {Scale=MatchUppercase},%
    BoldFeatures      = {FakeBold=2,SmallCapsFeatures={Scale=MatchUppercase,FakeBold=2}},%
    BoldItalicFeatures= {FakeBold=2},%
    Scale             = \vetus@scale,%
    FakeStretch       = \vetus@stretch%
  ]
  \setsansfont{NewCMSans10-Book.otf}[Scale=\vetus@scale,FakeStretch=\vetus@stretch]
  \setmonofont{NewCMMono10-Book.otf}[Scale=\vetus@scale,FakeStretch=\vetus@stretch]

  %% --- Maths fonts -------------------------------------------------------
  \setmathfont{NewCMMath-Book-custom2.otf}[Scale=\vetus@scale,FakeStretch=\vetus@stretch]
  %% Italic letters, fraktur, some operators and relations from Century Modern
  \setmathfont{CenturymodernTT-Italic.otf}[%
    range={it,"007D,frak,"2018-"2022,{up/Greek},{it/Greek},"22EF,"2217-"2219,%
           "2229-"222B,"2208,"2022,"211C,"2111},%
    Scale=\vetus@scale,FakeStretch=\vetus@stretch]
  %% Digits, lambda and assorted ASCII symbols from the upright text font
  \setmathfont{CenturymodernTT-Regular.otf}[%
    range={"0030-"0039,"03BB,"002D,"005E-"0060,"00A7,"007B-"007D,"002F,"005F,"007C},%
    Scale=\vetus@scale,FakeStretch=\vetus@stretch]
  \setmathfont{CenturymodernTT-Italic.otf}[%
    range={frak,"221E},Scale=\vetus@scale,FakeStretch=\vetus@stretch]
  \setmathfont{CenturymodernTT-Italic.otf}[%
    range={bb,"2022,"22EF,"2217-"2219,"2229-"222B,"2208,"2022,"2260,"22C4,%
           "002F,"00B1,"0021,"002D},%
    Scale=\vetus@scale,FakeStretch=\vetus@stretch]

  %% --- Old-style large operators (Sigma, Pi, integral from the text font) -
  \newfontfamily{\vetus@sumfont}{CenturymodernTT-Italic.otf}
  \newfontfamily{\vetus@prodfont}{CenturymodernTT-Italic.otf}[FakeStretch=.9\vetus@stretch]
  \newfontfamily{\vetus@intfont}{CenturymodernTT-Italic.otf}[FakeStretch=1.1]
  \RenewDocumentCommand{\sum@}{}{\DOTSB\vetus@bigsum}
  \RenewDocumentCommand{\prod@}{}{\DOTSB\vetus@bigprod}
  \NewDocumentCommand{\int@}{}{\DOTSB\vetus@bigint}
  \AtBeginDocument{%
    \RenewDocumentCommand{\sum}{}{\mathop{\sum@}\slimits@}%
    \RenewDocumentCommand{\prod}{}{\mathop{\prod@}\slimits@}%
    \RenewDocumentCommand{\int}{}{\mathop{\int@}\slimits@}%
  }
  \NewDocumentCommand{\vetus@bigsum}{}{%
    \mathchoice{\vetus@makesum{1.6}}{\vetus@makesum{1.2}}%
               {\vetus@makesum{1}}{\vetus@makesum{0.7}}}
  \NewDocumentCommand{\vetus@makesum}{m}{\vcenter{\hbox{\scalebox{#1}{\vetus@sumfont Σ}}}}
  \NewDocumentCommand{\vetus@bigprod}{}{%
    \mathchoice{\vetus@makeprod{1.8}}{\vetus@makeprod{1.2}}%
               {\vetus@makeprod{1}}{\vetus@makeprod{0.7}}}
  \NewDocumentCommand{\vetus@makeprod}{m}{\vcenter{\hbox{\scalebox{#1}{\vetus@prodfont ∏}}}}
  \NewDocumentCommand{\vetus@bigint}{}{%
    \mathchoice{\vetus@makeint{1.8}}{\vetus@makeint{1.2}}%
               {\vetus@makeint{1}}{\vetus@makeint{0.7}}}
  \NewDocumentCommand{\vetus@makeint}{m}{\vcenter{\hbox{\scalebox{#1}{\vetus@intfont ∫}}}}

  %% Title font (used by the [titles] option)
  \newfontfamily{\vetustitlefont}{CenturymodernTT-Regular.otf}
\fi

%% ===========================================================================
%% [titles] -- antique numbering and chapter/section title blocks
%% ===========================================================================
\ifvetus@titles
  \RequirePackage{titlesec}
  \RequirePackage{xifthen}
  \renewcommand{\thechapter}{\Roman{chapter}}
  \renewcommand{\theequation}{$\ddagger$\arabic{equation}}
  \renewcommand{\thesection}{$\S$\arabic{section}\hspace{.1em}.\hspace{.2em}}
  \setcounter{secnumdepth}{3}
  \titleformat{\chapter}[display]%
    {\Huge}%
    {\normalfont\large\centering\MakeUppercase\chaptername\hspace{.5em}\thechapter.}%
    {1ex}%
    {\centering\vspace{1ex}\ifthenelse{\value{chapter}>0}{\MakeUppercase}{}}%
    [\vspace{1ex}]
  \titleformat{\section}[display]%
    {\LARGE}{}{1ex}%
    {\centering\ifthenelse{\value{section}>0}{\thesection\;}{}\vspace{.2in}}[]
\fi

%% ===========================================================================
%% [toc] -- antique, centred table of contents
%% ===========================================================================
\ifvetus@toc
  \newif\ifvetus@hyper
  \AtBeginDocument{\@ifpackageloaded{hyperref}{\vetus@hypertrue}{}}
  \renewcommand{\contentsname}{%
    \parbox{\linewidth}{\centerline{\normalfont\LARGE CONTENTS}~\\[-1.5cm]}}
  \renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne\relax
      \addpenalty{-\@highpenalty}%
      \addvspace{1.0em \@plus\p@}%
      \setlength\@tempdima{3em}%
      \begingroup
        \def\numberline##1{\xdef\@chapternumber{##1}}%
        \setbox0=\vbox{\centering #1.\vspace{1\baselineskip}}% may be > 1 line
        \centering
        \leavevmode
        \ifvetus@hyper
          \hyperlink{\Hy@tocdestname}%
            {\vspace{1\baselineskip} \MakeUppercase\chaptername\hspace{.5em}\@chapternumber.}\\
        \else
          \vspace{1\baselineskip} \MakeUppercase\chaptername\hspace{.5em}\@chapternumber.\\
        \fi
        \unvbox0
        \par
        \nobreak
        \global\@nobreaktrue
        \everypar{\global\@nobreakfalse\everypar{}}%
      \endgroup
    \fi}
\fi

%% ===========================================================================
%% [header] -- running header/footer
%% ===========================================================================
\ifvetus@header
  \RequirePackage{fancyhdr}
  \setlength{\headheight}{14.5pt}
  %% \maketitle clears \@author, so snapshot it for use in the header
  \providecommand{\vetus@author}{}
  \AtBeginDocument{\@ifundefined{@author}{}{\let\vetus@author\@author}}
  \renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
  \renewcommand{\sectionmark}[1]{\markboth{#1}{#1}}
  \fancypagestyle{fancy}{%
    \fancyhf{}%
    \fancyhead[CE]{\small\itshape\def\and{\unskip, }\vetus@author}% authors, comma separated
    \fancyhead[CO]{\small\itshape\nouppercase\rightmark}%
    \fancyhead[R]{\thepage}%
  }
  \pagestyle{fancy}
\fi

%% ===========================================================================
%% [delimiters] -- delimiters drawn from the body font
%% ===========================================================================
\ifvetus@delimiters
  \RequirePackage{scalerel}
  \newcommand{\parenthesis}[1]{\scaleleftright[.8ex]{(}{#1}{)}}
  \newcommand{\curlybrace}[1]{\scaleleftright[1.2ex]{\{}{#1}{\}}}
  \newcommand{\squarebracket}[1]{\scaleleftright[1.2ex]{\kern 4pt[}{#1}{]\kern 4pt}}
  \renewcommand{\binom}[2]{\scaleleftright[.8ex]{(}{\genfrac{}{}{0pt}{0}{#1}{#2}}{)}}
  \ExplSyntaxOn
  \box_new:N \l__vetus_box
  \RenewDocumentEnvironment{pmatrix}{}
    { \hbox_set:Nw \l__vetus_box \c_math_toggle_token \begin{matrix} }
    { \end{matrix} \c_math_toggle_token \hbox_set_end:
      \scaleleftright[.8ex]{(}{\box_use:N \l__vetus_box}{)} }
  \box_new:N \l__vetus_box_vm
  \RenewDocumentEnvironment{vmatrix}{}
    { \hbox_set:Nw \l__vetus_box_vm \c_math_toggle_token \begin{matrix} }
    { \end{matrix} \c_math_toggle_token \hbox_set_end:
      \scaleleftright[.5ex]{|}{\box_use:N \l__vetus_box_vm}{|} }
  \box_new:N \l__vetus_box_cs
  \RenewDocumentEnvironment{cases}{}
    { \hbox_set:Nw \l__vetus_box_cs \c_math_toggle_token \begin{matrix} }
    { \end{matrix} \c_math_toggle_token \hbox_set_end:
      \scaleleftright[1.2ex]{\{}{\box_use:N \l__vetus_box_cs}{} }
  \ExplSyntaxOff
\fi

%% ===========================================================================
%% [background] -- old-paper background image
%% ===========================================================================
\ifvetus@background
  \RequirePackage{graphicx}
  \RequirePackage{eso-pic}
  \AddToShipoutPictureBG{%
    \includegraphics[width=\paperwidth,height=\paperheight]{background}}
\fi

%% ===========================================================================
%% Blank verso pages inserted by \cleardoublepage carry no header/footer
%% (otherwise the empty page after the title page shows the header rule and
%%  page number)
%% ===========================================================================
\def\cleardoublepage{%
  \clearpage
  \if@twoside
    \ifodd\c@page\else
      \hbox{}%
      \thispagestyle{empty}%
      \newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \fi}

\endinput
