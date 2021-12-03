(use-package tree-sitter-langs
  :defer t
  :ensure t)
(use-package tree-sitter
  :defer t
  :ensure t
  :after (tree-sitter-langs)
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
  (tree-sitter-require 'rust)
  (tree-sitter-require 'python)
  ;; (add-hook 'rustic-mode-hook #'tree-sitter-hl-mode)
  ;; (add-hook 'python-mode-hook #'tree-sitter-hl-mode)
  ;; (add-to-list 'tree-sitter-major-mode-language-alist '(python-mode . python))
  ;; (add-to-list 'tree-sitter-major-mode-language-alist '(elpy-mode . python))
  ;; (tree-sitter-require 'ruby)
  )
