(use-package multicolumn
  :config
  (multicolumn-global-mode 1)
  (setq multicolumn-min-width 120)
  (define-key multicolumn-map (kbd "C-x 4 4")
    'multicolumn-delete-other-windows-and-split-with-follow-mode)
  )
