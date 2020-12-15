;;; keymaps
(global-set-key [f1] 'help-for-help)
(global-set-key [f2] 'eshell)
(global-set-key [f3] 'mew)
(global-set-key [f4] 'toggle-evil-local-mode)
(global-set-key [f5] 'toggle-truncate-lines)
(global-set-key [f6] 'my-count-words)
;; (global-set-key [f7] 'slime-repl)
(global-set-key [f7] 'cider-switch-to-repl-buffer)
(global-set-key [f8] 'todo-show)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-x\M-b" 'my-buffer-fix)
;(global-set-key "\M-s" 'my-save-buffer)
(global-set-key "\C-xw" 'my-forward-word)

;; (global-set-key "\C-h" 'delete-backward-char)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>")) ;; works in minibuffer as well

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key "\M-z" 'fastnav-zap-up-to-char-forward)
(global-set-key "\M-Z" 'fastnav-zap-up-to-char-backward)
;; (global-set-key "\M-s" 'fastnav-jump-to-char-forward)
;; (global-set-key "\M-S" 'fastnav-jump-to-char-backward)
;; (global-set-key "\M-r" 'fastnav-replace-char-forward)
;; (global-set-key "\M-R" 'fastnav-replace-char-backward)
(global-set-key "\M-i" 'fastnav-insert-at-char-forward)
(global-set-key "\M-I" 'fastnav-insert-at-char-backward)
;; (global-set-key "\M-j" 'fastnav-execute-at-char-forward)
;; (global-set-key "\M-J" 'fastnav-execute-at-char-backward)
;; (global-set-key "\M-k" 'fastnav-delete-char-forward)
;; (global-set-key "\M-K" 'fastnav-delete-char-backward)
;; (global-set-key "\M-m" 'fastnav-mark-to-char-forward)
;; (global-set-key "\M-M" 'fastnav-mark-to-char-backward)

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-xb" 'anything-mini)
(global-set-key "\C-xa" 'my-anything)
(global-set-key "\C-xc" 'compile)

;;; aliases
(defalias 'rof 'recentf-open-files)
(defalias 'git 'magit-status)
;; (defalias 'hg 'monky-status)
(defalias 'cji 'cider-jack-in)
(defalias 'qr 'quickrun)
(defalias 'cb 'comment-box)

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +" "C-x RET" "C-x 5"))
;; (guide-key-mode 1)
(setq guide-key/idle-delay 0.1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; evil-numbers
(define-key evil-normal-state-map (kbd "C-c +") #'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") #'evil-numbers/dec-at-pt)

(provide 'setup-key-bindings)
