;; (use-package solarized-theme
;;   :config
;;   (load-theme 'solarized-dark t))
(use-package color-theme-solarized
  :straight (color-theme-solarized :type git :host github :repo "sellout/emacs-color-theme-solarized")
  ;; :defer t
  :ensure t
  :config
  ;; (load-theme 'solarized t)
  (setq solarized-termcolors 256)
  )
