;;; mew settings.
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
(autoload 'mew-user-agent-compose "mew" nil t)

;;; todo-mode
(setq todo-file-do "~/Mail/.todo-do"
      ;; todo-save-top-priorities-too nil
      todo-file-top "~/Mail/.todo-top"
      todo-file-done "~/Mail/.todo-done")

(provide 'setup-mew)
