(TeX-add-style-hook "chlcv"
 (function
  (lambda ()
    (LaTeX-add-environments
     "profile"
     "cvlist"
     "studies"
     "workexp"
     "specifics"
     "languages"
     "perref")
    (TeX-add-symbols
     '("photo" ["argument"] 1)
     '("ahref" 2)
     '("candidate" 1)
     '("prot" 1)
     '("com" 1)
     '("urlst" 1)
     '("urlft" 1)
     '("emailst" 1)
     '("emailft" 1)
     '("add" 1)
     '("addft" 1)
     '("tel" 1)
     '("telft" 1)
     '("cvlabel" 1)
     '("introitem" 1)
     "chl"
     "profilename"
     "workexpname"
     "studiesname"
     "specificsname"
     "languagesname"
     "perrefname"
     "perdataname"
     "iddocname"
     "addressname"
     "telephonename"
     "mobilephonename"
     "emailname"
     "baseurlname"
     "metainame"
     "metaiiname"
     "metaiiiname"
     "metaivname"
     "metavname"
     "defitem"
     "makelabel"
     "thephoto"
     "thephoto"))))

