(use-package elpy
  :after flycheck
  :config
  (elpy-enable)
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq tab-width 4)
  ;; (setq elpy-rpc-backend "jedi")
  (setq elpy-rpc-virtualenv-path 'current)
  (setq indent-tabs-mode nil)
  ;; (remove-hook 'elpy-modules 'elpy-module-highlight-indentation)
  (when (load "flycheck" t t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  )

;; (use-package highlight-indentation
;;   :config
;;   ;; (add-hook 'python-mode-hook 'highlight-indentation-mode)
;;   (add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
;;   (setq highlight-indentation-blank-lines t)
;;   )

(use-package pyenv-mode)
