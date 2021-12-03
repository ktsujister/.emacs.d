(use-package tree-sitter-langs
  :ensure t)

(use-package tree-sitter
  :requires tree-sitter-langs
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

  (setq tree-sitter-debug-highlight-jump-region 't)
  (setq tree-sitter-debug-jump-buttons 't)
  )

(use-package evil-textobj-tree-sitter
  :straight (evil-textobj-tree-sitter
	     :type git :host github :repo "meain/evil-textobj-tree-sitter" :files (:defaults "queries"))

  :requires (evil tree-sitter)
  :config
  ;; bind `function.outer`(entire function block) to `f` for use in things like `vaf`, `yaf`
  (define-key evil-outer-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.outer"))
  ;; bind `function.inner`(function block without name and args) to `f` for use in things like `vif`, `yif`
  (define-key evil-inner-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.inner"))

  ;; bind `block.outer` to `b` for use in things like `vab`, `yab`
  (define-key evil-outer-text-objects-map "b" (evil-textobj-tree-sitter-get-textobj "block.outer"))
  ;; bind `block.inner` to `b` for use in things like `vib`, `yib`
  (define-key evil-inner-text-objects-map "b" (evil-textobj-tree-sitter-get-textobj "block.inner"))
  )

;; (use-package tree-sitter-fold
;;   :straight (tree-sitter-fold :type git :host github :repo "junyi-hou/tree-sitter-fold")
;;   :requires tree-sitter)
