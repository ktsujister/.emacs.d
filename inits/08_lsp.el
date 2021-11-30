(use-package lsp-mode
  :commands lsp
  :init (setq lsp-keymap-prefix "C-c l")
  :hook (c++-mode . lsp)
  :config
  (setq lsp-prefer-flymake nil)
  (setq create-lockfiles nil)
  (setq lsp-inhibit-message t)
  (setq lsp-message-project-root-warning t)
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-flycheck-enable t)
  (lsp-ui-doc-deley 2))

(use-package company-lsp
  :commands company-lsp
  :after (lsp-mode company yasnippet)
  :defines company-backends
  ;; :functions company-backend-with-yas
  ;;:init (cl-pushnew (company-backend-with-yas 'company-lsp) company-backends)
  )
