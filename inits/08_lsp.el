(use-package lsp-mode
  :commands lsp
  :init (setq lsp-keymap-prefix "C-c l")
  :hook (c++-mode . lsp)
  :custom
  (lsp-prefer-flymake nil)
  (create-lockfiles nil)
  (lsp-inhibit-message t)
  (lsp-message-project-root-warning t)
  (lsp-eldoc-enable-hover nil)
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  ;; lsp-ui-doc
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-max-width  60)
  (lsp-ui-doc-max-height 20)
  ;; (lsp-ui-doc-use-childframe t)
  ;; (lsp-ui-doc-use-webkit nil)
  (lsp-ui-doc-delay 2.0)

  ;; ;; lsp-ui-doc
  ;; (lsp-ui-doc-enable            t)
  ;; ;; (lsp-ui-doc-header            t)
  ;; (lsp-ui-doc-include-signature t)
  ;; (lsp-ui-doc-position          'top)         ;; top bottom at-point
  ;; (lsp-ui-doc-alignment         'frame)
  ;; (lsp-ui-doc-use-childframe    t)

  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable t)

  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-symbol t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-diagnostics nil)
  (lsp-ui-sideline-show-code-actions nil)

  ;; lsp-ui-imenu
  (lsp-ui-imenu-enable nil)
  (lsp-ui-imenu-kind-position 'top)
  ;; lsp-ui-peek
  (lsp-ui-peek-enable nil)
  (lsp-ui-peek-peek-height 20)
  (lsp-ui-peek-list-width 50)
  (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  )

(use-package company-lsp
  :commands company-lsp
  :after (lsp-mode company yasnippet)
  :defines company-backends
  :custom
  (company-lsp-cache-candidates t) ;; always using cache
  (company-lsp-async t)
  (company-lsp-enable-recompletion nil)
  ;; :functions company-backend-with-yas
  ;;:init (cl-pushnew (company-backend-with-yas 'company-lsp) company-backends)
  )
