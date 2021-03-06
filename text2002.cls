%
%	text2002.cls
%		written by Takahiko Mendori
%
\typeout{text2002.cls Ver.0.1 written by Takahiko Mendori}
\input{jbook.cls}
\setlength{\topmargin}{-6mm}%
\setlength{\textheight}{24cm}%
\setlength{\textwidth}{16cm}%
\setlength{\oddsidemargin}{1.5mm}%
\setlength{\evensidemargin}{1.5mm}%

\renewcommand{\baselinestretch}{1.054} % ASCII
\let\tendm\tenmin
\let\fakejchar\empty
\def\@chapapp#1{第 #1}

\def\@makechapterhead#1{ \vspace*{50pt} { \parindent 0pt \raggedright 
    \ifnum \c@secnumdepth >\m@ne \huge\bf \@chapapp{\thechapter} 章 \par 
    \vskip 20pt \fi \Huge \bf #1\par 
   \nobreak \vskip 40pt } }

\def\thebibliography#1{\chapter*{参考文献\@mkboth
    {参考文献}{参考文献}}\list
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
  \def\newblock{\hskip .11em plus .33em minus .07em}
  \sloppy
  \sfcode`\.=1000\relax}

\def\ps@headings{\let\@mkboth\markboth
  \def\@oddfoot{}\def\@evenfoot{}\def\@evenhead{\rm \thepage\hfil \sl
    \leftmark}\def\@oddhead{\hbox{}\sl \rightmark \hfil
    \rm\thepage}\def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth
        >\m@ne
        \@chapapp{\thechapter} \ \fi ##1}}{}}\def\sectionmark##1{\markright
    {\uppercase{\ifnum \c@secnumdepth >\z@
        \thesection. \ \fi ##1}}}}

\def\appendix{\par
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \def\@chapapp##1{付録 ##1}
  \def\thechapter{\Alph{chapter}}}

%
% table of contents : depth
%
\setcounter{tocdepth}{2} % subsection までを目次に出す


%
% subsubsection
%
\def\thesubsubsection{(\arabic{subsubsection})}
\setcounter{secnumdepth}{3} % subsubsection までに番号を付ける
%
% section number reference etc.
%
\def\chapno#1{第\refno{#1}章}
\def\secno#1{第\refno{#1}節}
\def\appno#1{付録\refno{#1}}
\ifx\gtfam\undefined
\def\refno#1{#1\,\fakejchar}
\else
\def\refno#1{\mbox{#1}}
\fi
%
% FOOTNOTE style : all lines are indented
%
\long\def\@makefntext#1{\parindent 1em\noindent
  \hbox to2em{\hss$\m@th^{\@thefnmark}$~}% by watanabe
  \@tempdima\columnwidth\advance\@tempdima-2em\parbox[t]{\@tempdima}{#1}}
%
% FLOATS
%
\def\figurename{図}
\def\tablename{表}
%
% FIGURE/TABLE/PHOTO CAPTIONS
%   positions and style change {\bf }
%
\def\fnum@figure{\figurename\thefigure}
\def\fnum@table{\tablename\thetable}
%
\def\fps@figure{htbp}
\def\fps@table{htbp}
%
\long\def\@makecaption#1#2{%
  \vskip 10\p@
  \setbox\@tempboxa\hbox{{\bf #1}\ \ }%
   \@tempdima\hsize\advance\@tempdima-\wd\@tempboxa
   \setbox\@tempboxa\hbox{{\bf #1}\ \ #2}%
  \ifdim \wd\@tempboxa <\hsize
      \hfil {\bf#1}\ \ #2\hfil\par
  \else
      \hbox to\hsize{\hfil {\bf #1}\ \ \parbox[t]\@tempdima{#2}\hfil}%
  \fi}
%
\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}\begingroup
    \@parboxrestore
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}
%
% FIGURE/TABLE/PHOTO REFERENCE
%
% \def\figno#1{\figurename#1}
% \def\tabno#1{\tablename#1}
% \def\photono#1{\photoname#1}
%
\def\figno{\@ifstar{\@floatno{\figurename}}{\@floatnoo{\figurename}}}
\def\tabno{\@ifstar{\@floatno{\tablename}}{\@floatnoo{\tablename}}}
\def\photono{\@ifstar{\@floatno{\photoname}}{\@floatnoo{\photoname}}}
%
\def\@floatno#1#2{#1#2}
\ifx\gtfam\undefined
 \def\@floatnoo#1#2{#1#2\,\fakejchar}
\else
 \def\@floatnoo#1#2{#1\mbox{#2}}
\fi
%
% FLOATS control: floats can be within 90% of textheight
%
\setcounter{topnumber}{4}            % ordinary +2
\setcounter{totalnumber}{5}          % ordinary +3
\setcounter{dbltopnumber}{4}         % ordinary +2
\def\textfraction{.08}               % 4 lines / 48(page)
\def\topfraction{.9}
\def\floatpagefraction{.99}
\def\dbltopfraction{.9}
\def\dblfloatpagefraction{.99}

%--------- Additional Parts -------------------------------
%		added by Takahiko Mendori
%----------------------------------------------------------
%--------- for page styles
\renewcommand{\part}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \thispagestyle{jpl@in}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \null\vfil
  \secdef\@part\@spart}

\newcommand{\mypart}[1]{%
  \par\vspace{1zh}{\huge\bfseries%
  \hfil 第\arabic{part}部の概要\hfill}\\[-1zh]%
  \rule{\textwidth}{2pt}\par\vspace{1zh}}

%
%	chapter design
%
\renewcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{jpl@in}%
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter}

\def\@makechapterhead#1{\hbox{}%
  {\parindent\z@
   \raggedright
   \reset@font\sffamily\bfseries
   \ifnum \c@secnumdepth >\m@ne
     \vbox{%
       \hrule height.4pt depth 0pt
       \vskip1mm
       \hbox to \linewidth{\hfil\Large\@chapapp\thechapter~\@chappos\hfil}
       \vskip1mm
       }
   \fi
     \vbox{%
       \hrule height0pt depth 6mm
       \vskip1mm
%       \hbox to \linewidth{\hfil\Huge#1\hfil}
       \centering
       \Huge#1
       \vskip1mm
       \hrule height.4pt depth 0pt
       }
   }\vskip1\Cvs}

%	chapter* design

\def\@schapter#1{%
  \@makeschapterhead{#1}\@afterheading
}
\def\@makeschapterhead#1{\hbox{}%
  \vskip2\Cvs
  {\parindent\z@
   \raggedright
   \reset@font\huge\bfseries
   \setlength\@tempdima{\linewidth}%
   \vtop{\hsize\@tempdima#1}}
   \vskip3\Cvs}

%	section design
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
   {1.5\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
   {.5\Cvs \@plus.3\Cvs}%
   {\normalfont\Large\bfseries}}

%\renewcommand{\section}[1]{%
%	\refstepcounter{section}%
%	\addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}%
%	\par\vspace{3zh}{\Large\bfseries%
%		\noindent~\thesection~~#1\hfill}\\[-1zh]%
%		\rule{\textwidth}{1pt}\par\vspace{1zh}}
		
\usepackage[nobottomtitles*,explicit]{titlesec}
\titleformat{\section}{\Large\bfseries}{\Large\bfseries}{0pt}{\titleline[l]{\thesection~~#1\hfill}\vspace{0.3zh}\titlerule[1pt]}{}


%--------- for table of contents design
\def\contentsname{\hfill \Large{情報学群実験第3i・4C} %
	\par\hfill \Huge{目　次}}

%	toc design for part
\renewcommand*{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{3\baselineskip \@plus\p@}%
   \begingroup
    \parindent\z@
    \rightskip\@pnumwidth
    %\parfillskip-\rightskip
    {\leavevmode\Large\bfseries\gtfamily
     \hrule height1.2pt width \textwidth
       %\vfil
      \vskip .25\baselineskip
      {\Large\bfseries\gtfamily
        \hbox to \textwidth{~#1\hfil\large\hbox to\@pnumwidth{\hss #2}~}%
      }%
      \vskip .25\baselineskip
      %\vfil
      \hrule depth .4pt height 0pt width \textwidth
    }\par
    \nobreak
    \global\@nobreaktrue
    \everypar{\global\@nobreakfalse\everypar{}}%
   \endgroup
  \fi
}

% 	toc design for chapter
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter\space\@chappos}%
    \addcontentsline{toc}{chapter}%
      {\protect\numberline{~\@chapapp\hbox to0.4cm{\hfill\thechapter\hfill}~%
      \@chappos}\hspace{0.5cm}#1}%
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading}

