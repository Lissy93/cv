%-------------------------------------------------------------------------------
% Resume Class File (resume.cls)
%-------------------------------------------------------------------------------
% Licensed under MIT, ⓒ 2025 Alicia Sykes <aliciasykes.com>
% Full source and usage docs at https://github.com/lissy93/cv
%-------------------------------------------------------------------------------
% This LaTeX class file defines the structure and layout for resume and CV 
% documents. It provides a comprehensive and customizable format for creating
% professional resumes, inspired by the Awesome-CV template by Claud D. Park
% (http://posquit0.com).
%
% Usage:
% - To use this class, include it in the preamble of your LaTeX document:
%   \documentclass{resume}
% - Customize your document using the provided commands and environments.
% - For examples and documentation, visit: https://github.com/lissy93/cv
%
% Features:
% - Built for styling a CV PDF. With sections like skills, experience, education..
% - Outputs a clean, modern design with support for various font and color options.
% - Compatibility with both XeLaTeX and pdfLaTeX.
%
% Buggy? Spaghetti code? Yeah. I know.
%
% Heavily inspired by github.com/posquit0/Awesome-CV by Claud D. Park <posquit0.com>
%
% Dependencies are used in accordance with the LaTeX Project Public License (LPPL) v1.3c:
% http://www.latex-project.org/lppl
%
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{resume-format}[2015/12/14 v1.3 Alicia Sykes Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\ifxetex
  \RequirePackage[quiet]{fontspec}
  % To support LaTeX quoting style
  \defaultfontfeatures{Ligatures=TeX}
\else
  \RequirePackage[T1]{fontenc}
  % Replace by the encoding you are using
  \RequirePackage[utf8]{inputenc}
\fi
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed for rounded corners on header
\RequirePackage{tcolorbox}
% Needed to deal hyperlink
\RequirePackage{hyperref}
\hypersetup{
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={},
  colorlinks=false,
  allbordercolors=white
}


%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration variables for spacing and sizing
%-------------------------------------------------------------------------------
% Font sizes
\newcommand*{\@headernamefontsize}{32pt}
\newcommand*{\@headernamelineheight}{38pt}
\newcommand*{\@headerpositionfontsize}{8pt}
\newcommand*{\@headerpositionlineheight}{10pt}
\newcommand*{\@headeraddressfontsize}{9pt}
\newcommand*{\@headeraddresslineheight}{11pt}
\newcommand*{\@headersocialfontsize}{8pt}
\newcommand*{\@headersociallineheight}{10pt}
\newcommand*{\@headerquotefontsize}{10pt}
\newcommand*{\@sectionfontsize}{16pt}
\newcommand*{\@sectionlineheight}{18pt}
\newcommand*{\@subsectionfontsize}{12pt}
\newcommand*{\@subsectionlineheight}{14pt}
\newcommand*{\@entrytitlefontsize}{12pt}
\newcommand*{\@entrytitlelineheight}{14pt}
\newcommand*{\@entrypositionfontsize}{11pt}
\newcommand*{\@entrypositionlineheight}{13pt}
\newcommand*{\@entrydatefontsize}{9pt}
\newcommand*{\@entrydatelineheight}{11pt}
\newcommand*{\@entrylocationfontsize}{10pt}
\newcommand*{\@entrylocationlineheight}{12pt}
\newcommand*{\@descriptionfontsize}{11pt}
\newcommand*{\@descriptionlineheight}{13pt}
\newcommand*{\@skillfontsize}{10pt}
\newcommand*{\@skilltypefontsize}{9pt}
\newcommand*{\@skillsetfontsize}{9pt}
\newcommand*{\@achievementfontsize}{9pt}
\newcommand*{\@personalstatementfontsize}{10pt}
\newcommand*{\@footerfontsize}{9pt}
\newcommand*{\@honortitlefontsize}{10pt}
\newcommand*{\@honorpositionfontsize}{10pt}
\newcommand*{\@honordatefontsize}{10pt}
\newcommand*{\@honorlocationfontsize}{10pt}
\newcommand*{\@subentrytitlefontsize}{9pt}
\newcommand*{\@subentrypositionfontsize}{7pt}
\newcommand*{\@subentrydatefontsize}{7pt}
\newcommand*{\@subentrylocationfontsize}{7pt}
\newcommand*{\@subdescriptionfontsize}{9pt}

% Spacing
\newcommand*{\@sectionspacebefore}{1.5ex}
\newcommand*{\@sectionspaceafter}{1ex}
\newcommand*{\@entryspacing}{2mm}
\newcommand*{\@bulletindent}{2ex}
\newcommand*{\@bulletspacebefore}{-4mm}
\newcommand*{\@bulletspaceafter}{0mm}
\newcommand*{\@achievementspacing}{1.2mm}
\newcommand*{\@achievementspaceafter}{2mm}

% Header styling
\newcommand*{\@headerboxradius}{3pt}
\newcommand*{\@headerbiospacing}{1.5mm}

% Define rounded header box command
\newcommand{\roundedheaderbox}[2]{%
  \begin{tcolorbox}[
    colback=#1,
    colframe=#1,
    boxrule=0pt,
    arc=\@headerboxradius,
    left=10pt,
    right=10pt,
    top=10pt,
    bottom=10pt,
    width=\textwidth
  ]
    #2
  \end{tcolorbox}%
}


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------

%% Page Layout
% Configure page margins with geometry
\geometry{left=1.5cm, top=0.5cm, right=1.5cm, bottom=0.5cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and offset
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{000000}
\definecolor{awesome-pink}{HTML}{F04C8A}
\definecolor{headerbg}{HTML}{F04C8A}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

% Awesome section color
\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        awesome\or%
        awesome\or%
        awesome\or%
        awesome\or%
        awesome\else%
        awesome\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

% Set font for footer (default is Source Sans Pro)
\newfontfamily\footerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold
]{Roboto}

% Set font for body (default is Source Sans Pro)
\newfontfamily\bodyfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic
]{Roboto}

\newfontfamily\bodyfontlight[
  Path=\@fontdir,
  UprightFont=*-Light,
  ItalicFont=*-LightItalic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic
]{Roboto}

% Needed to manage fonts
\ifxetex
  \RequirePackage[quiet]{fontspec}
  % To support LaTeX quoting style
  \defaultfontfeatures{Ligatures=TeX}
  \setmainfont[
    Path=\@fontdir,
    UprightFont=*-Regular,
    ItalicFont=*-Italic,
    BoldFont=*-Bold,
    BoldItalicFont=*-BoldItalic,
  ]{Roboto}
\else
  \RequirePackage[T1]{fontenc}
  % Replace by the encoding you are using
  \RequirePackage[utf8]{inputenc}
\fi

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures

\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{\@headernamefontsize}{\@headernamelineheight}\headerfontlight\color{white} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{\@headernamefontsize}{\@headernamelineheight}\headerfont\color{white} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{\@headerpositionfontsize}{\@headerpositionlineheight}\bodyfont\scshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{\@headeraddressfontsize}{\@headeraddresslineheight}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{\@headersocialfontsize}{\@headersociallineheight}\headerfont\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{\@headerquotefontsize}{1em}\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{\@footerfontsize}{1em}\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{\@sectionfontsize}{\@sectionlineheight}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{\@subsectionfontsize}{\@subsectionlineheight}\bodyfont\scshape\textcolor{text}{#1}}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\vspace*{0mm}\fontsize{\@entrytitlefontsize}{\@entrytitlelineheight}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{\@entrypositionfontsize}{\@entrypositionlineheight}\bodyfont\scshape\color{graytext} #1}}


\newcommand*{\entrydatestyle}[1]{{\fontsize{\@entrydatefontsize}{\@entrydatelineheight}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{\@entrylocationfontsize}{\@entrylocationlineheight}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{\@descriptionfontsize}{\@descriptionlineheight}\bodyfontlight\upshape\color{text} #1}}
\newcommand*{\skill}[1]{{\fontsize{\@skillfontsize}{1em}\bodyfontlight\upshape\color{text} \textnormal{#1}}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{\@subentrytitlefontsize}{1em}\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{\@subentrypositionfontsize}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{\@subentrydatefontsize}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{\@subentrylocationfontsize}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{\@subdescriptionfontsize}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{\@honortitlefontsize}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{\@honorpositionfontsize}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{\@honordatefontsize}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{\@honorlocationfontsize}{1em}\bodyfontlight\slshape\color{awesome} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{\@skilltypefontsize}{1em}\bodyfontlight\color{text}\textbf{#1}}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{\@skillsetfontsize}{1em}\bodyfontlight\color{text} #1}}

% For elements of Achievements
\newcommand*{\achievementstyle}[1]{{\fontsize{\@achievementfontsize}{1em}\bodyfontlight\upshape\color{text} #1}}
\newcommand*{\cvparagraphstyle}[1]{{\fontsize{\@achievementfontsize}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of personal statement
\newcommand*{\personalstatementstyle}[1]{{\fontsize{\@personalstatementfontsize}{1em}\bodyfontlight\upshape\color{text} #1}}

% Custom command for displaying URLs without the protocol
\newcommand{\displayurl}[1]{\href{#1}{\nolinkurl{#1}}}
\newcommand{\shortdisplayurl}[1]{\href{#1}{\urlstyle{same}\url{\detokenize{#1}}}}

% Custom command for displaying short URLs without the protocol
\ExplSyntaxOn
\NewDocumentCommand{\shorturl}{m}
 {
  \tl_set:Nx \l_tmpa_tl { \tl_trim_spaces:n { #1 } }
  \href{#1}
   {
    \str_if_eq:eeTF { \tl_item:Nn \l_tmpa_tl { 1 } } { https:// }
     { \tl_set:Nx \l_tmpa_tl { \tl_range:nn { \l_tmpa_tl } { 8 } { -1 } } }
     { \str_if_eq:eeTF { \tl_item:Nn \l_tmpa_tl { 1 } } { http:// }
       { \tl_set:Nx \l_tmpa_tl { \tl_range:nn { \l_tmpa_tl } { 7 } { -1 } } }
       { }
     }
    \url{ \l_tmpa_tl }
   }
 }
\ExplSyntaxOff



% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{
  \vspace{\@bulletspacebefore}
  \begin{justify}
  \begin{itemize}[leftmargin=\@bulletindent, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{
  \end{itemize}
  \end{justify}
  \vspace{\@bulletspaceafter}
}

% Define an environment for cvparagraphs
\newenvironment{cvparagraphs}{
  \vspace{-4mm}
  \begin{justify}
  \begin{itemize}[leftmargin=-2ex, nosep, noitemsep, before=\achievementstyle]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{
  \end{itemize}
  \end{justify}
  \vspace{-2mm}
}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's link (optional)
% Usage: \link{<url>}
\newcommand*{\link}[1]{\def\@link{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\location}[1]{\def\@location{#1}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
% Define separator for social informations in header
% Usage: \headersocialsep{<separator>}
% Default: \quad\textbar\quad
\newcommand*{\headersocialsep}[1][\quad\textbar\quad]{\def\@headersocialsep{#1}}
\headersocialsep


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific tickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}{
  \begin{center}
    \headerfirstnamestyle{
      \@firstname
    } \headerlastnamestyle{
      \@lastname
    }
    \\
    \vspace{0.4mm}
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\}}
    \vspace{0.4mm}
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\}}
    \vspace{-0.5mm}
    \headersocialstyle{
      \newbool{isstart}
      \setbool{isstart}{true}
      \ifthenelse{\isundefined{\@mobile}}
        {}
        {
          \faMobile\ \@mobile
          \setbool{isstart}{false}
        }
      \ifthenelse{\isundefined{\@email}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{isstart}{false}
            }
            {\@headersocialsep}
          \href{mailto:\@email}{\faEnvelope\ \@email}
        }
      \ifthenelse{\isundefined{\@link}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{isstart}{false}
            }
            {\@headersocialsep}
          \href{http://\@link}{\faLink\ \@link}
        }
      \ifthenelse{\isundefined{\@github}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{isstart}{false}
            }
            {\@headersocialsep}
          \href{https://github.com/\@github}{\faGithubSquare\ \@github}
        }
      \ifthenelse{\isundefined{\@stackoverflowid}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{isstart}{false}
            }
            {\@headersocialsep}
          \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\ \@stackoverflowname}
        }
      \ifthenelse{\isundefined{\@linkedin}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{isstart}{false}
            }
            {\@headersocialsep}
          \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedinSquare\ \@linkedin}
        }
      \ifthenelse{\isundefined{\@location}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{isstart}{false}
            }
            {\@headersocialsep}
          {}{\faMapMarker\ \@location}
        }
      \ifthenelse{\isundefined{\@twitter}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{isstart}{false}
            }
            {\@headersocialsep}
          \href{https://twitter.com/\@twitter}{\faTwitter\ \@twitter}
        }
      \ifthenelse{\isundefined{\@skype}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{isstart}{false}
            }
            {\@headersocialsep}
          \faSkype\ \@skype
        }
    } \\
    \ifthenelse{\isundefined{\@quote}}
      {}
      {\vspace{6.0mm}\headerquotestyle{\@quote\\}\vspace{5.0mm}}
  \end{center}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{
  \fancyfoot{}
  \fancyfoot[L]{
    \footerstyle{#1}
  }
  \fancyfoot[C]{
    \footerstyle{#2}
  }
  \fancyfoot[R]{
    \footerstyle{#3}
  }
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{
  \par\addvspace{\@sectionspacebefore}
  \phantomsection{}
  \sectionstyle{#1}
  \color{gray}\vhrulefill{0.10pt}
  \par\nobreak\addvspace{\@sectionspaceafter}
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{
  \phantomsection{}
  \subsectionstyle{#1}
}

% Define an environment for cventry
\newenvironment{cventries}{
}{
}
% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[5]{
  \ifempty{#2#3}
    {\entrytitlestyle{#1} \hfill \entrydatestyle{#4} \\
     \descriptionstyle{#5}}
    {\entrytitlestyle{#2} \hfill \entrylocationstyle{#3} \\
     \entrypositionstyle{#1} \hfill \entrydatestyle{#4} \\
     \descriptionstyle{#5}}
  \vspace{\@entryspacing}
}

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{
  \begin{center}
}{
  \end{center}
}
% Define a subentry of cv information
% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
\newcommand*{\cvsubentry}[4]{
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{12.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
      {\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}
      {}
      {\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}
      {}
      {\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{1.5cm} L{13.0cm} R{2.5cm}}
}{
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
\newcommand*{\cvhonor}[4]{
  \honordatestyle{#4} & \honorpositionstyle{#1}, \honortitlestyle{#2} & \honorlocationstyle{#3}
  \\
}

% Define an environment for cvachievements
\newenvironment{cvachievements}{
  \vspace{-2mm}
  \bodyfontlight
  \begin{justify}
  \fontsize{\@achievementfontsize}{1em}\selectfont
  \begin{itemize}[leftmargin=0ex, label={}, nosep, noitemsep, before=\achievementstyle]
    \setlength{\parskip}{\@achievementspacing}
}{
  \end{itemize}
  \end{justify}
  \vspace{\@achievementspaceafter}
}

% Define an environment for personal statement
\newenvironment{cvpersonalstatement}{
  \vspace{2mm}
  \bodyfontlight
  \begin{justify}
  \fontsize{\@personalstatementfontsize}{1em}\selectfont
  \begin{itemize}[leftmargin=0ex, label={}, nosep, noitemsep, before=\cvparagraphstyle]
    \setlength{\parskip}{2mm}
}{
  \end{itemize}
  \end{justify}
  \vspace{0mm}
}

\renewenvironment{cvpersonalstatement}{
  \vspace{4mm}
  \bodyfontlight
  \begin{justify}
  \fontsize{\@personalstatementfontsize}{14pt}\selectfont
  \begin{itemize}[
    leftmargin=0ex,
    label={},
    nosep,
    noitemsep,
    before=\cvparagraphstyle
  ]
  \setlength{\parskip}{3mm}
}{
  \end{itemize}
  \end{justify}
  \vspace{2mm}
}

% Define an environment for cvskill
\newenvironment{cvskills}{
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} l L{20.2cm}}
}{
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{
	\skilltypestyle{#1} & \skillsetstyle{#2}
  \\
}

% Define an environment for cvlinks
\newenvironment{cvlinks}{
  \vspace{2mm}
  \bodyfontlight
  \color{lighttext}
  \begin{flushright}
}{
  \end{flushright}
  \vspace{2mm}
}

% Define an environment for cvfooterlink
\newenvironment{cvfooterlink}{
  \vspace{2mm}
  \bodyfontlight
  \color{lighttext}
  \begin{flushright}
  \tiny
}{
  \end{flushright}
  \vspace{2mm}
}


% Define a new command to convert markdown links to LaTeX links
\newcommand{\markdownlink}[1]{%
  \ifthenelse{\boolean{shownotes}}{\href{\detokenize{#1}}{#1}}{}%
}

% Define a command to handle markdown links
\newcommand{\processMarkdownLinks}[1]{%
  \def\process##1[##2](##3){%
    \href{##3}{##2}%
  }%
  \expandafter\process#1
}

% Define an environment for cvparagraphs
\newenvironment{cvparagraph}{
  \vspace{-2mm}
  \begin{justify}
  \begin{itemize}[leftmargin=0ex, label={}, nosep, noitemsep, before=\descriptionstyle]
    \setlength{\parskip}{0pt}
}{
  \end{itemize}
  \end{justify}
  \vspace{-2mm}
}

