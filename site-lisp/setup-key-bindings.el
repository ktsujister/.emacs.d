;;; keymaps
(global-set-key [f1] 'help-for-help)
(global-set-key [f2] 'eshell)
(global-set-key [f3] 'mew)
(global-set-key [f4] 'display-line-numbers-mode)
(global-set-key [f5] 'toggle-truncate-lines)
;; (global-set-key [f6] 'my-count-words)
(global-set-key [f7] 'cider-switch-to-repl-buffer)
(global-set-key [f8] 'todo-show)
(global-set-key [f9] 'sr-speedbar-toggle)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-x\M-b" 'my-buffer-fix)
;(global-set-key "\M-s" 'my-save-buffer)
(global-set-key "\C-xw" 'my-forward-word)

;; (global-set-key "\C-h" 'delete-backward-char)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>")) ;; works in minibuffer as well

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-xc" 'compile)

;;; aliases
(defalias 'rof 'recentf-open-files)
(defalias 'git 'magit-status)
;; (defalias 'hg 'monky-status)
(defalias 'cji 'cider-jack-in)
(defalias 'qr 'quickrun)
(defalias 'cb 'comment-box)


(provide 'setup-key-bindings)
