;;; uniquify settings
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  (setq uniquify-ignore-buffers-re "*[^*]+*"))

;;; bookmarks
(use-package bookmarks
  (setq bookmark-save-flag 1)) ; save bookmark if changed

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
