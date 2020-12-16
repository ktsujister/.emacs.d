;;; package --- Summary
;;; Commentary:
;;; Code:

(setq inhibit-default-init t)
(setq inhibit-startup-message t)
;; *scratch* starts empty
(setq initial-scratch-message nil)

(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
;(setq display-time-load-average-threshold 0.5)
(display-time)

(line-number-mode t)
(setq column-number-mode t)
;; (display-battery-mode t)

;(setq default-fill-column 80)
(setq next-line-add-newlines nil)
(setq case-replace nil)
;(setq truncate-partial-width-windows 'nil)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;;; nil - do not require, t - do not ask, else - ask
(setq require-final-newline t)

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;(setq lazy-highlight-initial-delay 0)
(setq-default show-trailing-whitespace t)

;;; Japanesse Environment Settings
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
;(set-terminal-coding-system 'sjis)
;(set-keyboard-coding-system 'sjis)

(global-font-lock-mode t)
(setq font-lock-support-mode 'jit-lock-mode)

;; highlight region when selected by C-SPACE mark
(setq-default transient-mark-mode t)

(setq default-frame-alist initial-frame-alist)

(grep-compute-defaults)
;; (grep-apply-setting 'grep-find-command "find . ! -name \"*~\" ! -name \"#*#\" -type f -print0 | xargs -0 -e grep -nH -e ")
(grep-apply-setting 'grep-find-command "rg -Hn --no-heading --color=never ")

(setq auto-save-default nil)

;; (require 'modeline-git-branch)
;; (modeline-git-branch-mode 1)

;; fix for slow emacs when saving files
;; (setq vc-handled-backends ())

;; (remove-hook 'find-file-hook 'vc-find-file-hook)
;; (remove-hook 'kill-buffer-hook 'vc-kill-buffer-hook)

;;; bookmarks
(setq bookmark-save-flag 1) ;; save bookmark if changed

;; winner-mode
(when (fboundp 'winner-mode)
  (winner-mode 1))
(windmove-default-keybindings)

;; ispell
(setq ispell-personal-dictionary "~/.emacs.d/.ispell-dictionary")


(provide 'my-defaults)
;;; my-defaults.el ends here
