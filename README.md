#About
"artclcomp" is an alternative "custom" LaTeX article class which is more compressed in terms of header, while allowing for more information.

Aside from the standard fields for a header (title, abstract, date, author), some other (optional) fields are possible (email, keywords, ArXiV, AMs, JEL, Funding, etc.). To spare space, redundant information are gathered (similar addresses, funding or thanks for two are more authors are printed only once). The bibliography is slightly more compressed too.

#Howto
Download the class artclcomp.cls in your project directory or to a place where it can be called.
Ensure that the package Bundle Koma-script is installed.
Use package "times" for the fonts (is in the file head.tex as default) it looks better so.
Look at the template.tex as for the use of the different fields.
Feedback is welcome.

#License
This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3 of this license or (at your option) any later versions.
The latest version of this license is in
       http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX version 2005/12/01 or later.

To be mentioned, this file has been for some coding parts inspired by the elsarticle.cls also under the LPPL.
The class elsarticle.cls and the related source code can be found at
       http://www.elsevier.com/author-schemas/the-elsarticle-latex-document-class      
Some parts of the present code has been taken verbatim or slightly modified.

#To Do

       * Add an option to set the horizontal ratio Abstract/Author Info
       * Create a new command for the classifications instead of separated one for AMS, JEL, etc.
       * Clean the code
       * Add an Option for the size of the Biliography
       * ...

