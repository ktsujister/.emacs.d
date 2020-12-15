(use-package rustic
  :ensure t
  :defer t
  :mode ("\\.rs$" . rustic-mode)
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
