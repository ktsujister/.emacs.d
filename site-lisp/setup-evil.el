(defun turn-on-evil-mode-fixed-escape ()
  "Turn on Evil in the current buffer AND `evil-esc-mode'. This makes C-[ work
like <escape> when using `evil-local-mode'."
  (interactive)
  (turn-on-evil-mode)
  (evil-esc-mode 1))

(defun toggle-evil-local-mode ()
"Toggle on and off evil mode in local buffer."
(interactive)
(if evil-local-mode
    (turn-off-evil-mode)
  (turn-on-evil-mode-fixed-escape)))

(setq evil-default-state 'emacs)

;; normal state
(dolist (mode '(clojure-mode
		rust-mode
		python-mode
		sh-mode
		js-mode
		emacs-lisp-mode
		java-mode
		conf-toml-mode
		yaml-mode
		markdown-mode
		c-mode
		c++-mode
		make-mode))
  (add-to-list 'evil-normal-state-modes mode))

;; insert state
(add-to-list 'evil-insert-state-modes 'cider-repl-mode)

;; turn on evil-mode
(evil-mode 1)

(provide 'setup-evil)
