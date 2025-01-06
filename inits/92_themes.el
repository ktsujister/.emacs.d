(use-package color-theme-solarized
  :straight (color-theme-solarized :type git :host github :repo "sellout/emacs-color-theme-solarized")
  :ensure t
  :defer t
  ;; :load-path "straight/build/color-theme-solarized"
  :init
  ;; (setq solarized-termcolors 256)
  (load-theme 'solarized t))
