;; hooks

(add-hook
 'html-mode-hook
 (lambda ()
   (setq tab-width 4)
   (setq show-trailing-whitespace t)))
(add-hook
 'sql-mode-hook
 (lambda ()
   (setq tab-width 4)
   (setq show-trailing-whitespace t)))
(add-hook
 'java-mode-hook
 (lambda ()
   (setq tab-width 4)
   (setq show-trailing-whitespace t)))
(add-hook
 'ruby-mode-hook
 (lambda ()
   (setq tab-width 4)
   (setq show-trailing-whitespace t)))
(add-hook
 'js-mode-hook
 (lambda ()
   (setq tab-width 4)
   (setq show-trailing-whitespace t)
   ;;(turn-on-evil-mode-fixed-escape)
   ))
(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   (paredit-mode 1)
   (highlight-parentheses-mode)
   ;;(turn-on-evil-mode-fixed-escape)
   ))
(add-hook
 'slime-repl-mode-hook
 (lambda ()
   (paredit-mode 1)
   (highlight-parentheses-mode)))
(add-hook
 'sh-mode-hook
 (lambda ()
   (yas-minor-mode 1)
   ;;(turn-on-evil-mode-fixed-escape)
   ))
;;(add-hook 'conf-toml-mode-hook 'turn-on-evil-mode-fixed-escape)
;;(add-hook 'java-mode-hook 'turn-on-evil-mode-fixed-escape)
;;(add-hook 'yaml-mode-hook 'turn-on-evil-mode-fixed-escape)

(add-hook
 'sh-mode-hook
 (lambda ()
   ;; remove keybinding for sh-if to use company-mode
   (define-key sh-mode-map "\C-c\C-i" nil)
   ))

(add-hook
 'emacs-startup-hook
 (lambda ()
   (switch-to-buffer (get-buffer-create "*scratch*"))
   (delete-other-windows)) t)

;; http://stackoverflow.com/a/20788623/262750
(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

;; https://stackoverflow.com/a/18317181/262750
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (linum-mode -1)
    (font-lock-mode -1)
    (fundamental-mode)))
(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

(add-hook 'c++-mode-hook 'company-mode) ; 補完用
(add-hook 'c++-mode-hook 'flycheck-mode) ; チェック用
;; DEL		paredit-backward-delete

(provide 'setup-hooks)
