(use-package color-theme-solarized
  :straight (color-theme-solarized :type git :host github :repo "sellout/emacs-color-theme-solarized")
  :ensure t
  :config
  (setq solarized-termcolors 256)
  (load-theme 'solarized t))
