(TeX-add-style-hook
 "7_1"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("adjustbox" "export")))
   (add-to-list 'LaTeX-verbatim-environments-local "semiverbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (TeX-run-style-hooks
    "latex2e"
    "beamer"
    "beamer10"
    "graphicx"
    "booktabs"
    "amsfonts"
    "mathrsfs"
    "bbold"
    "amsmath"
    "amssymb"
    "mathtools"
    "adjustbox")
   (TeX-add-symbols
    '("widebar" 1)
    "rel"
    "mathaccent"
    "mathaccentV")))

