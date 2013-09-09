(TeX-add-style-hook "chlewmem"
 (function
  (lambda ()
    (LaTeX-add-environments
     '("seclanguage" 1)
     "copyrightpage")
    (TeX-add-symbols
     '("subtilte" 1)
     '("sigdate" 1)
     "longline"
     "shortline"
     "abreak"
     "thesubtitle"
     "makehalftitle"))))

