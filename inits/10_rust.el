(use-package rustic
  :mode (("\\.rs\\'" . rustic-mode))
  :commands (rustic-mode)
  :config
  (use-package quickrun
    :defer t
    :ensure t)
  (use-package racer
    :defer t
    :ensure t)
  (use-package lsp-mode
    :defer t
    :ensure t)
  )
;; (use-package rust-mode
;;   :mode (("\\.rs\\'" . rust-mode))
;;   :commands (rust-mode)
;;   :init
;;   (add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
;;   )

;; ;; (use-package cargo
;; ;;   :after rust-mode
;; ;;   :config
;; ;;   (add-hook 'rust-mode-hook 'cargo-minor-mode))

;; (use-package racer
;;   :after rust-mode
;;   :if (executable-find "racer")
;;   ;; :diminish racer-mode
;;   :init
;;   (add-hook 'rust-mode-hook 'racer-mode)
;;   ;; (setq racer-rust-src-path
;;   ;; 	(concat (string-trim
;;   ;; 		 (shell-command-to-string "rustc --print sysroot"))
;;   ;; 		"/lib/rustlib/src/rust/src"))
;;   :config
;;   (when (featurep 'company)
;;     (add-hook 'racer-mode-hook 'company-mode)
;;     (set (make-local-variable 'eldoc-idle-delay) 5)
;;     (setq company-tooltip-align-annotations t))
;;   (add-hook 'racer-mode-hook 'eldoc-mode))

;; ;; (use-package flycheck-rust
;; ;;   :if (featurep 'flycheck)
;; ;;   :after (rust-mode flycheck)
;; ;;   :init
;; ;;   (add-hook 'rust-mode-hook 'flycheck-mode)
;; ;;   (add-hook 'flycheck-mode-hook 'flycheck-rust-setup))
