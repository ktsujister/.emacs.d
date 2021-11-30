(use-package lsp-mode
  :hook ((python-mode c++-mode) . lsp)
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil)
  ;;(add-hook 'c++-mode-hook #'lsp)
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :after lsp-mode
  :custom
  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable t))

(use-package company-lsp
  :commands company-lsp)
