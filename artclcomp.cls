%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%		This is file 'artclcomp.cls' for article class compressed
%%		Version: 0.5
%%		Date: 	2013/07/25
%%		Author: 	Samuel Drapeau
%%		Address:	Humboldt Universitaet zu Berlin
%%					Unter den Linden 6,
%%					10099 Berlin
%%		Email:	drapeau@mathematik.hu-berlin.de
%%					samuel.drapeau@gmail.com
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%		Copyright 2013 S. Drapeau
%%		
%%		This work may be distributed and/or modified under the
%%		conditions of the LaTeX Project Public License, either version 1.3
%%		of this license or (at your option) any later version.
%%		The latest version of this license is in
%%			http://www.latex-project.org/lppl.txt
%%		and version 1.3 or later is part of all distributions of LaTeX
%%		version 2005/12/01 or later.
%%		
%%		This work has the LPPL maintenance status `maintained'.
%%		
%%		The Current Maintainer of this work is S. Drapeau.
%%		
%%		This work consists of the file artcomp.cls
%%
%%		This file has been heavily inspired by the elsarticle.cls
%%		also under the LPPL.
%%		This class and the related source code can be found at
%%			http://www.elsevier.com/author-schemas/the-elsarticle-latex-document-class	
%%		Some part of the codes has been taken verbatim or 
%%		only slightly modified.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%		General Infos:
%%		This file intends to provide an alternative article class with a 
%%		slightly compressed head. It is based on the Koma-script bundle.
%%		A template file is provided illustrating the different options.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{artclcomp}[2013/07/25 artclcomp]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}

\ProcessOptions\relax
\LoadClass[onecolumn]{scrartcl}


%%%%%%%%% Kommaskript Options %%%%%%%%%%
%%
%%	Other Komascript options may be overwritten in the tex file
%%

\setkomafont{title}{\upshape}
%\setkomafont{disposition}{\normalcolor\scshape}

%\setkomafont{title}{\bfseries}
\setkomafont{disposition}{\normalfont\normalcolor\bfseries}



%%%%%%%%% Required Packages %%%%%%%%%%

\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[latin1]{inputenc}
\RequirePackage{pifont}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage[intlimits]{amsmath}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage[colorlinks=true,urlcolor=blue,anchorcolor=blue,citecolor=blue,filecolor=blue,linkcolor=blue,menucolor=blue,pagecolor=blue,linktocpage=true,pdfproducer=medialab,pdfa=true]{hyperref}



%%%%%%%%% Mails %%%%%%%%%%

\newcommand{\emailAdd}[2]{
\affil@toks=\expandafter{\the\affil@toks{\item[$^{#1}$]\@email{#2}}}
	}
	\newcommand{\@email}[1]{\href{mailto:#1}{\tt #1}}

%%%%%%%%% Thanksfootnote %%%%%%%%%%
%% Title thanks note
	\def\elsRef#1{\@ifundefined{X@#1}{0}{\csname X@#1\endcsname}}
	\def\elsLabel#1{\@bsphack\protected@write\@auxout{}{\string\Newlabel{#1}{\@currentlabel}}\@esphack}
	\def\Newlabel#1#2{\expandafter\xdef\csname X@#1\endcsname{#2}}

	\def\tnoteref#1{\tnotemark[#1]}
	\def\tnotemark[#1]{\textsuperscript{\@for\@@tmark:=#1\do{\edef\tnotenum{\@ifundefined{X@\@@tmark}{1}{\elsRef{\@@tmark}}}\ifcase\tnotenum\or\ding{73}\or,\ding{73}\ding{73}\fi}}}

	\let\@tnotemark\@empty

	\let\@tnotes\@empty
	\newcounter{tnote}
	\def\tnotetext[#1]#2{\g@addto@macro\@tnotes{\refstepcounter{tnote}\elsLabel{#1}
	\def\thefootnote{\ifcase\c@tnote\or\ding{73}\or\ding{73}\ding{73}\fi}\footnotetext{#2}}}


%%%%%%% AUTHOR
	\def\elsauthors{}
	\def\useauthors{}

%\def\pprinttitle{}
	\let\authorsep\@empty
	\let\sep\@empty
	\newcounter{author}
	\def\author{\@ifnextchar[{\@@author}{\@author}}

	\newtoks\@eadauthor
	\def\@@author[#1]#2{\g@addto@macro\elsauthors{%
	\def\baselinestretch{1}%
	\authorsep#2\unskip\textsuperscript{%#1%
	\@for\@@affmark:=#1\do{%
	\edef\affnum{\@ifundefined{X@\@@affmark}{1}{\elsRef{\@@affmark}}}%
	\unskip\sep\affnum\let\sep=,}%
%      \ifx\@fnmark\@empty\else\unskip\sep\@fnmark\let\sep=,\fi
%      \ifx\@corref\@empty\else\unskip\sep\@corref\let\sep=,\fi
	}%
	\def\authorsep{\unskip,\space}%
	\global\let\sep\@empty\global\let\@corref\@empty
	\global\let\@fnmark\@empty}%
	\@eadauthor={#2}%
	\g@addto@macro\useauthors{#2; }%
	}

	\def\@author#1{\g@addto@macro\elsauthors{\normalsize%
	\def\baselinestretch{1}%
	\upshape\authorsep#1\unskip\textsuperscript{%
	\ifx\@fnmark\@empty\else\unskip\sep\@fnmark\let\sep=,\fi
	\ifx\@corref\@empty\else\unskip\sep\@corref\let\sep=,\fi
	}%
	\def\authorsep{\unskip,\space}%
	\global\let\@fnmark\@empty
	\global\let\@corref\@empty    \global\let\sep\@empty}%
	\@eadauthor={#1}%
	\g@addto@macro\useauthors{#1; }%
	}




%% Author Address

	\def\printaddress{}
	\def\addsep{\par\vskip6pt}
	\def\address{\@ifnextchar[{\@@address}{\@address}}

	\def\@alph#1{%
	\ifcase#1\or a\or b\or c\or d\or e\or f\or g\or h\or i\or j\or k\or
	l\or m\or n\or o\or p\or q\or r\or s\or t\or u\or v\or w\or x\or
	y\or z%
	\or aa\or ab\or ac\or ad\or ae\or af\or ag\or ah\or ai\or aj\or
	ak\or al\or am\or an\or ao\or ap\or aq\or ar\or as\or at\or au\or
	av\or aw\or ax\or ay\or az%
	\or ba\or bb\or bc\or bd\or be\or bf\or bg\or bh\or bi\or bj\or
	bk\or bl\or bm\or bn\or bo\or bp\or bq\or br\or bs\or bt\or bu\or
	bv\or bw\or bx\or by\or bz%
	\or ca\or cb\or cc\or cd\or ce\or cf\or cg\or ch\or ci\or cj\or
	ck\or cl\or cm\or cn\or co\or cp\or cq\or cr\or cs\or ct\or cu\or
	cv\or cw\or cx\or cy\or cz%
	\or da\or db\or dc\or dd\or de\or df\or dg\or dh\or di\or dj\or
	dk\or dl\or dm\or dn\or do\or dp\or dq\or dr\or ds\or dt\or du\or
	dv\or dw\or dx\or dy\or dz%
	\or ea\or eb\or ec\or ed\or ee\or ef\or eg\or eh\or ei\or ej\or
	ek\or el\or em\or en\or eo\or ep\or eq\or er\or es\or et\or eu\or
	ev\or ew\or ex\or ey\or ez%
	\or fa\or fb\or fc\or fd\or fe\or ff\or fg\or fh\or fi\or fj\or
	fk\or fl\or fm\or fn\or fo\or fp\or fq\or fr\or fs\or ft\or fu\or
	fv\or fw\or fx\or fy\or fz%
	\or ga\or gb\or gc\or gd\or ge\or gf\or gg\or gh\or gi\or gj\or
	gk\or gl\or gm\or gn\or go\or gp\or gq\or gr\or gs\or gt\or gu\or
	gv\or gw\or gx\or gy\or gz%
	\else\@ctrerr\fi}

	\newcounter{affn}
	\renewcommand\theaffn{\alph{affn}}

	\long\def\@@address[#1]#2{\g@addto@macro\printaddress{%
	 %\def\baselinestretch{0}%
	\refstepcounter{affn}
	\xdef\@currentlabel{\theaffn}
	\elsLabel{#1}%
	\textsuperscript{\theaffn}\,#2\par}}

	\long\def\@address#1{\g@addto@macro\elsauthors{%
	\def\baselinestretch{1}%
	\addsep\footnotesize\itshape#1\def\addsep{\par\vskip6pt}%
	\def\authorsep{\par\vskip8pt}}}

%%%%%%% Author Email and URL
	\def\printMailUrl{}
%\def\addsep{\par\vskip6pt}
	\def\eMail{\@ifnextchar[{\@@eMail}{\@eMail}}

%\def\@arabic#1{\ifcase#1\or 1\or 2\or 3\or 4\or 5\or 6\or 7\or 8\or 9\or 10\or 11\or 12\or 13\or 14\or 15\or 16\or 17\or 18\or 19\or 20\or 21\or 22\or 23\or 24\or 25\or 26 \else\@ctrerr\fi}

	\newcounter{afffn}
	\renewcommand\theafffn{\arabic{afffn}}

	\long\def\@@eMail[#1]#2{\g@addto@macro\printMailUrl{%
	 %\def\baselinestretch{0}%
	\refstepcounter{afffn}
	\xdef\@currentlabel{\theafffn}
	\elsLabel{#1}%
	\textsuperscript{\theafffn}\,\href{mailto:#2}{\scriptsize\tt #2}\par}}

	\long\def\@eMail#1{\g@addto@macro\elsauthors{%
	\def\baselinestretch{1}%
	\addsep\footnotesize\itshape#1\def\addsep{\par\vskip6pt}%
	\def\authorsep{\par\vskip8pt}}}

%%%%%%% Author Thanks
	\def\printThanks{}
%\def\addsep{\par\vskip6pt}
	\def\myThanks{\@ifnextchar[{\@@myThanks}{\@myThanks}}

%\def\@bloblo#1{\ifcase#1\or 1\or 2\or 3\or 4\or 5\or 6\or 7\or 8\or 9\or 10\or 11\or 12\or 13\or 14\or 15\or 16\or 17\or 18\or 19\or 20\or 21\or 22\or 23\or 24\or 25\or 26 \else\@ctrerr\fi}

%{\ifcase#1\or \ding{84}\or \ding{84}\ding{84}\or \ding{84}\ding{84}\ding{84}\or \ding{84}\ding{84}\ding{84}\ding{84}\or \ding{84}\ding{84}\ding{84}\ding{84}\ding{84} \else\@ctrerr\fi}

	\newcounter{blabla}
	\renewcommand\theblabla{\fnsymbol{blabla}}

	\long\def\@@myThanks[#1]#2{\g@addto@macro\printThanks{%
	 %\def\baselinestretch{0}%
	\refstepcounter{blabla}
	\xdef\@currentlabel{\theblabla}
	\elsLabel{#1}%
	\textsuperscript{\theblabla}\,#2\par}}

	\long\def\@myThanks#1{\g@addto@macro\elsauthors{%
	\def\baselinestretch{1}%
	\addsep\footnotesize\itshape#1\def\addsep{\par\vskip6pt}%
	\def\authorsep{\par\vskip8pt}}}


%%%%%%%% Define Keywords
	\def\@keyWords{\@empty}
	\newcommand{\keyWords}[1]{\gdef\@keyWords{#1}}

%%%%%%%% Define AMS CLassification
	\def\@keyAMSClassification{\@empty}
	\newcommand{\keyAMSClassification}[1]{\gdef\@keyAMSClassification{#1}}


%%%%%%%% Define JEL Classification
	\def\@keyJELClassification{\@empty}
	\newcommand{\keyJELClassification}[1]{\gdef\@keyJELClassification{#1}}



%%%%%%%% Define ArXiV
	\def\@ArXiV{\@empty}
	\newcommand{\ArXiV}[1]{\gdef\@ArXiV{#1}}


%%%%%%%% Thanks Colleagues
	\def\@thanksColleagues{\@empty}
	\newcommand{\thanksColleagues}[1]{\gdef\@thanksColleagues{#1}}

%%%%%%%% Variable for the ratio Abstract / Paper Info
%	\def\@Ratio{\@empty}
%	\newcommand{\Ratio}[1]{\gdef\@Ratio{#1}}
%	\Ratio{0.1}
%	\if\@Ratio<1 {\Ratio{I am empty}\else {\Ratio{hoasdflasdflasdf}}\fi


%%%%%%%%% Define additional Components for the title

	\def\@abstract{\@empty}
	\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}

	\newcommand{\raisedrule}[3][0em]{\leavevmode\leaders\hbox{\rule[#1]{1pt}{#2}}\hfill\kern0pt \;\;\small\textsc{#3}\;\; \leavevmode\leaders\hbox{\rule[#1]{1pt}{#2}}\hfill\kern0pt}

\renewcommand*{\@maketitle}{%
	\clearpage
	\let\footnote\thanks
	\vskip -2em%
	\noindent
%\arraystretch{1.3}
	\begin{tabularx}{\linewidth}{@{}X@{}}
%	\toprule
		\ifx\@subject\@empty \else
		{\subject@font \@subject \par}\\
		\fi
		{\titlefont\huge \@title \par}\\
		{\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\\\fi}
		{\large  \elsauthors
%	\begin{tabular}[t]{@{}l}
%		\the\auth@toks\par
%	\end{tabular}\par
		}
		\\
		\\
		{\large \@date \par}\\
%	\midrule[\heavyrulewidth]
		\begin{minipage}[t]{0.6\textwidth}
			\vspace{0pt}
			\raisedrule[0.2em]{0.1pt}{\footnotesize Abstract}

			\footnotesize\@abstract

			\vspace{5pt}
			\footnotesize\if!\@keyWords!\else\noindent{\textsc{Keywords: }}\@keyWords \fi

			\vspace{5pt}
%			\footnotesize\if!\@keyWords!\else\noindent{\textsc{JEL Classification: }}\@keyJELClassification \fi 
		\end{minipage}
		\hfill
		\begin{minipage}[t]{0.35\textwidth}
			\vspace{0pt}
			\raisedrule[0.2em]{0.1pt}{\footnotesize Authors Info}

			\scriptsize\itshape\printaddress

			\vspace{5pt}
			\scriptsize\printMailUrl

			\vspace{8pt}
			\scriptsize\printThanks
%			\ifaffil\raggedright\begin{enumerate}[noitemsep, nosep,leftmargin=1em]\itshape\footnotesize\the\affil@toks \end{enumerate}\fi	
%			\footnotesize \raggedright \the\email@toks 
			%\footnotesize \raggedright \textit{Humboldt Universit\"at zu Berlin\\Unter den Linden 6\\10099 Berlin} 

%			\vspace{1em}

			%fucking tex language which can not handle multiple boolean valued.
			\if!\@ArXiV!
				\if!\@thanksColleagues!
					\if!\@keyJELClassification!
						\if!\@keyAMSClassification!
							% nix machen
						\else
							\raisedrule[0.2em]{0.1pt}{\footnotesize Paper Info}
							\vspace{3pt}
						\fi
					\else
						\raisedrule[0.2em]{0.1pt}{\footnotesize Paper Info}
						\vspace{3pt}
					\fi
				\else
					\raisedrule[0.2em]{0.1pt}{\footnotesize Paper Info}
					\vspace{3pt}
				\fi
			\else
				\raisedrule[0.2em]{0.1pt}{\footnotesize Paper Info}
				\vspace{3pt}
			\fi

			\if!\@ArXiV!\else{
				\scriptsize \raggedright \noindent{ArXiv ePrint:} \href{http://arxiv.org/abs/\@ArXiV}{\@ArXiV}

				\vspace{3pt}
			}
			\fi

			\if!\@thanksColleagues!\else{
				\scriptsize \raggedright \@thanksColleagues

				\vspace{3pt}
			}
			\fi


			\if!\@keyAMSClassification!\else{
				\scriptsize\noindent{\textsc{AMS Classification: }}\@keyAMSClassification

				\vspace{3pt}
			}
			\fi

			\if!\@keyJELClassification!\else{
				\scriptsize\noindent{\textsc{JEL Classification: }}\@keyAMSClassification

				\vspace{3pt}
			}
			\fi
		\end{minipage}
		\\
		\\
\bottomrule
	\end{tabularx}
	\ifx\@tnotes\@empty\else\@tnotes\fi
	}
%%%%%%%%%% BIBLIOGRAPHY

\let\oldthebibliography=\thebibliography
\let\endoldthebibliography=\endthebibliography
\renewenvironment{thebibliography}[1]{%
\begin{oldthebibliography}{#1}%
\small
%\raggedright%
\setlength{\itemsep}{2pt plus 0.2ex minus 0.05ex}%
}%
{%
\end{oldthebibliography}%
}


