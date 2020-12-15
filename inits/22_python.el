(use-package elpy
  :after flycheck
  :config
  (elpy-enable)
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq tab-width 4)
  (setq elpy-rpc-backend "jedi")
  (setq indent-tabs-mode nil)
  (when (load "flycheck" t t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  )
