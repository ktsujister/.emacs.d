;;; uniquify settings
(use-package parseedn)
(use-package uniquify
  :straight nil
  :init
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  (setq uniquify-ignore-buffers-re "*[^*]+*"))

;;; recentf
(use-package recentf-ext
  :init
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '("recentf"))
  (setq recentf-auto-cleanup 60)
  ;; (setq recentf-auto-cleanup 'never)
  (setq recentf-auto-cleanup-timer (run-with-idle-timer 60 t 'recentf-save-list))
  (recentf-mode 1)
  :init
  (add-hook 'after-recentf-add-file-hook #'recentf-save-list))

;;; which-key
(use-package which-key
  :straight t
  :init
  (which-key-mode)
  :custom
  (which-key-max-description-length 40)
  (which-key-use-C-h-commands t)
  )

(use-package highlight-parentheses
  :config
  (setq hl-paren-colors
	'("red1" "yellow1" "green1" "blue1" "magenta1" "purple1")))

;; paredit
(use-package paredit
  :ensure t
  :defer t)

;; https://github.com/emacs-jp/emacs-jp.github.com/issues/38
(use-package hl-line+
  :init
  (toggle-hl-line-when-idle)
  (setq hl-line-idle-interval 3)
  )

(use-package sr-speedbar)
