(use-package tree-sitter-langs
  :ensure t)

(use-package tree-sitter
  :after tree-sitter-langs
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
