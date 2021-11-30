(use-package lsp-mode
  :config
  (add-hook 'c++-mode-hook #'lsp))
(use-package lsp-ui)
(use-package clang-format)
(use-package company-lsp)
;; lsp-mode lsp-ui company-lsp clang-format
