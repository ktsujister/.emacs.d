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
  (remove-hook 'elpy-modules 'elpy-module-highlight-indentation)
  (when (load "flycheck" t t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  )

;; (use-package highlight-indentation
;;   :config
;;   (add-hook 'python-mode-hook 'highlight-indentation-mode)
;;   ;; (add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
;;   (setq highlight-indentation-blank-lines t)
;;   )

(use-package highlight-indent-guides
  :config
  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
  (add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
  ;; (setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-auto-enabled t)
  (setq highlight-indent-guides-responsive 'top)
  (setq highlight-indent-guides-auto-top-odd-face-perc 10) ;; default 25
  (setq highlight-indent-guides-auto-top-even-face-perc 15) ;; default 30
  (setq highlight-indent-guides-auto-top-character-face-perc 15) ;; default 30
  ;; (setq highlight-indent-guides-responsive 'stack)
  (setq highlight-indent-guides-delay 0)
  (setq highlight-indent-guides-character ?\|)
  )

(use-package pyenv-mode)
