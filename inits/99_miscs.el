;;; uniquify settings
(use-package parseedn)
(use-package uniquify
  :straight nil
  :config
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  (setq uniquify-ignore-buffers-re "*[^*]+*"))

;;; recentf
(use-package recentf-ext
  :config
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '("recentf"))
  (setq recentf-auto-cleanup 60)
  ;; (setq recentf-auto-cleanup 'never)
  (setq recentf-auto-cleanup-timer (run-with-idle-timer 60 t 'recentf-save-list))
  (recentf-mode 1)
  :init
  (add-hook 'after-recentf-add-file-hook #'recentf-save-list))

;; guide-key
(use-package guide-key
  :config
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +" "C-x RET" "C-x 5"))
  ;; (guide-key-mode 1)
  (setq guide-key/idle-delay 0.1)
  (setq guide-key/recursive-key-sequence-flag t)
  (setq guide-key/popup-window-position 'bottom))

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
  :config
  (toggle-hl-line-when-idle)
  (setq hl-line-idle-interval 3)
  )

(use-package sr-speedbar)
