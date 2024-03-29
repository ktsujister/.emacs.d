(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)

(setq auto-mode-alist
      (append '(("\\.xsd$\\|\\.xml$\\|\\.xsx$" . nxml-mode)) auto-mode-alist))

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"
               "<!--"
               sgml-skip-tag-forward
               nil))

(add-hook 'nxml-mode-hook 'hs-minor-mode)

;; optional key bindings, easier than hs defaults
(define-key nxml-mode-map (kbd "C-c h") 'hs-toggle-hiding)
