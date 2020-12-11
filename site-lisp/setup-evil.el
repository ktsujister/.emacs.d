;; (defun turn-on-evil-mode-fixed-escape ()
;;   "Turn on Evil in the current buffer AND `evil-esc-mode'. This makes C-[ work
;; like <escape> when using `evil-local-mode'."
;;   (interactive)
;;   (turn-on-evil-mode)
;;   (evil-esc-mode 1))

;; (defun toggle-evil-local-mode ()
;; "Toggle on and off evil mode in local buffer."
;; (interactive)
;; (if evil-local-mode
;;     (turn-off-evil-mode)
;;   (turn-on-evil-mode-fixed-escape)))

;; (setq evil-default-state 'emacs)

;; ;; normal state
;; (dolist (mode '(clojure-mode
;; 		rust-mode
;; 		python-mode
;; 		sh-mode
;; 		js-mode
;; 		emacs-lisp-mode
;; 		java-mode
;; 		conf-toml-mode
;; 		yaml-mode
;; 		markdown-mode
;; 		c-mode
;; 		c++-mode
;; 		make-mode))
;;   (add-to-list 'evil-normal-state-modes mode))

;; emacs state
(dolist (mode '(dired-mode
		org-mode
		magit-mode
		mew-summary-mode
		mew-virtual-mode
		mew-message-mode
		mew-draft-mode
		term-mode))
  (add-to-list 'evil-emacs-state-modes mode))

;; insert state
(add-to-list 'evil-insert-state-modes 'cider-repl-mode)

;; (setq evil-emacs-state-cursor '("green" box))
;; (setq evil-motion-state-cursor '("orange" box))
;; (setq evil-normal-state-cursor '("yellow" box))
;; (setq evil-visual-state-cursor '("blue" box))
;; (setq evil-insert-state-cursor '("purple" (bar . 2)))
;; (setq evil-replace-state-cursor '("red" bar))
;; (setq evil-operator-state-cursor '("red" bar))

;; turn on evil-mode
(evil-mode 1)

(provide 'setup-evil)
