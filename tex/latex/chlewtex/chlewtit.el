(TeX-add-style-hook "chlewtit"
 (function
  (lambda ()
    (LaTeX-add-environments
     "copyrightpage")
    (TeX-add-symbols
     '("halftitlebottom" 1)
     '("titlebottom" 1)
     '("halftitlemid" 1)
     '("titlemid" 1)
     '("halftitletop" 1)
     '("titletop" 1)
     "makehalftitle"
     "adjusttitleskips"
     "adjusthalftitleskips"
     "printtitletop"
     "titletopstyle"
     "printhalftitletop"
     "halftitletopstyle"
     "printtitlemid"
     "titlemidstyle"
     "printhalftitlemid"
     "halftitlemidstyle"
     "printtitlebottom"
     "titlebottomstyle"
     "printhalftitlebottom"
     "halftitlebottomstyle"))))

