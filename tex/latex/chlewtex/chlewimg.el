(TeX-add-style-hook "chlewimg"
 (function
  (lambda ()
    (LaTeX-add-labels
     "fig:#1"
     "fig:#1")
    (TeX-add-symbols
     '("includeblank" ["argument"] 3)
     '("includefigure" ["argument"] 0)
     '("graphic" ["argument"] 2)
     '("includepicture" ["argument"] 2)
     '("reffig" 1)
     '("makepicturename" 2)
     '("makepicturename" 2)))))

