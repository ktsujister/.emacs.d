;;; ruby-mode

(setq auto-mode-alist
      (append '(("\\.ruby$" . ruby-mode)) auto-mode-alist))

(add-hook
 'ruby-mode-hook
 (lambda ()
   (setq tab-width 4)
   (setq show-trailing-whitespace t)
   (setq flycheck-checker 'ruby-rubocop)
   (flycheck-mode 1)))

;; (setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
;; 				     interpreter-mode-alist))
;(autoload 'run-ruby "inf-ruby"
;  "Run an inferior Ruby process")
;(autoload 'inf-ruby-keys "inf-ruby"
;  "Set local key defs for inf-ruby in ruby-mode")
;(add-hook 'ruby-mode-hook
;	  '(lambda ()
;	     (inf-ruby-keys)))

(setq ruby-insert-encoding-magic-comment nil)
