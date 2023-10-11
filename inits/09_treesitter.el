;; (use-package treesit
;;   :defer 1
;;   :config
;;   (setq treesit-font-lock-level 4)
;;   )

;; (use-package treesit-auto
;;   :ensure t
;;   :config
;;   (setq treesit-auto-install t)
;;   (global-treesit-auto-mode))

(use-package tree-sitter-langs
  :ensure t)

(use-package tree-sitter
  :requires tree-sitter-langs
  :init
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

  (setq tree-sitter-debug-highlight-jump-region 't)
  (setq tree-sitter-debug-jump-buttons 't)
  )

(use-package evil-textobj-tree-sitter
  :defer 1
  :straight (evil-textobj-tree-sitter
	     :type git :host github :repo "meain/evil-textobj-tree-sitter"
	     :files (:defaults "queries" "treesit-queries"))
  ;; :after (evil treesit)
  :after (evil tree-sitter)
  :config
  ;; (define-key evil-outer-text-objects-map "f" (cons "evil-outer-function" (evil-textobj-tree-sitter-get-textobj "function.outer")))
  ;; (define-key evil-inner-text-objects-map "f" (cons "evil-inner-function" (evil-textobj-tree-sitter-get-textobj "function.inner")))
  (define-key evil-outer-text-objects-map "m" (evil-textobj-tree-sitter-get-textobj "import"
										    '((python-mode . [(import_statement) @import])
										      (go-mode . [(import_spec) @import])
										      (rust-mode . [(use_declaration) @import]))))
  ;; bind `function.outer`(entire function block) to `f` for use in things like `vaf`, `yaf`
  (define-key evil-outer-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.outer"))
  ;; bind `function.inner`(function block without name and args) to `f` for use in things like `vif`, `yif`
  (define-key evil-inner-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.inner"))

  ;; bind `block.outer` to `b` for use in things like `vab`, `yab`
  (define-key evil-outer-text-objects-map "b" (evil-textobj-tree-sitter-get-textobj "block.outer"))
  ;; bind `block.inner` to `b` for use in things like `vib`, `yib`
  (define-key evil-inner-text-objects-map "b" (evil-textobj-tree-sitter-get-textobj "block.inner"))
  ;; You can also bind multiple items and we will match the first one we can find
  (define-key evil-outer-text-objects-map "a" (evil-textobj-tree-sitter-get-textobj ("conditional.outer" "loop.outer")))
  )

(use-package ts-fold
  :straight (ts-fold
	     :type git :host github :repo "emacs-tree-sitter/ts-fold")
  :requires (tree-sitter))
