;; https://stackoverflow.com/questions/41389571/c-does-not-escape-from-insert-mode-in-evil-local-mode

(setq evil-cross-lines t
      evil-search-module 'evil-search
      evil-ex-search-vim-style-regexp t
      evil-want-C-u-scroll t
      evil-want-fine-undo t)

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

;; (evil-esc-mode 1)
(provide 'setup-evil)
