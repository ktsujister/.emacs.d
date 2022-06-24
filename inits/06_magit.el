(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status)
  :config
  (add-hook
   'magit-mode-hook
   (lambda ()
     ;; remove keybinding for magit-add-change-log-entry for anything
     (define-key magit-status-mode-map "\C-xa" nil)
     ;; remove keybinding for magit-add-change-log-entry for anything
     (define-key magit-log-mode-map "\C-xa" nil)
     ))

  ;; revision
  ;; (remove-hook 'magit-revision-sections-hook 'magit-insert-revision-headers)
  ;; (remove-hook 'magit-revision-sections-hook 'magit-insert-revision-notes)
  ;; (remove-hook 'magit-revision-sections-hook 'magit-insert-revision-diff)
  (remove-hook 'magit-revision-sections-hook 'magit-insert-revision-tag)
  (remove-hook 'magit-revision-sections-hook 'magit-insert-xref-buttons)

  ;; status
  (remove-hook 'magit-status-sections-hook 'magit-insert-tags-header)
  ;; (remove-hook 'magit-status-sections-hook 'magit-insert-status-headers)
  )

(global-set-key (kbd "C-x g") 'magit-status)
