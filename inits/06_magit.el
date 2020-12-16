(use-package magit
  :config
  (add-hook
   'magit-mode-hook
   (lambda ()
     ;; remove keybinding for magit-add-change-log-entry for anything
     (define-key magit-status-mode-map "\C-xa" nil)
     ;; remove keybinding for magit-add-change-log-entry for anything
     (define-key magit-log-mode-map "\C-xa" nil)
     )))

(global-set-key (kbd "C-x g") 'magit-status)
