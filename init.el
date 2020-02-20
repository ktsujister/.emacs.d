;; (setq debug-on-error t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(unless window-system (menu-bar-mode -1))

(let ((base (expand-file-name "site-lisp" user-emacs-directory)))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)
	(let ((default-directory name))
	  (normal-top-level-add-subdirs-to-load-path))
	))))
;; (add-to-list 'load-path "~/env/share/emacs/site-lisp/w3m")
(add-to-list 'load-path "~/env/share/emacs/site-lisp/mew")

(require 'setup-evil)
(require 'setup-el-get)
;; (package-initialize)

;; Enable my preferred defaults
(require 'my-defaults)
(require 'cl-lib)

;; ;; Install packages
;; (require 'setup-packages)

;; (setq rbenv-modeline-function 'rbenv--modeline-plain)

(require 'setup-clojure)
(require 'setup-rust)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;; (load-theme 'solarized t)
;; (add-hook 'after-init-hook (lambda () (load-theme 'solarized)))
;; (setq solarized-termcolors 256)

(require 'setup-hooks)
(require 'my-functions)

(setq
 auto-mode-alist
 (append
  '(("\\.cs$" . csharp-mode)
    ("\\.cs$\\|\\.cpp$\\|\\.c$\\|\\.h$" . c++-mode)
    ("\\.xsd$\\|\\.xml$\\|\\.xsx$" . nxml-mode)
    ("\\.jsp$" . html-mode)
    ("\\.yml$" . yaml-mode)
    ("\\.yaml$" . yaml-mode)
    ("\\.toml$" . conf-toml-mode)
    ("\\.txt$" . fundamental-mode))
  auto-mode-alist))

;;; uniquify settings
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

(require 'setup-org)

(require 'setup-mew)

;; ;;; w3m
;; (require 'w3m)
;; (require 'mew-w3m)
;; (setq w3m-use-cookies t)
;; (setq browse-url-browser-function 'w3m-browse-url)

;;; ruby-mode
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
				     interpreter-mode-alist))
;(autoload 'run-ruby "inf-ruby"
;  "Run an inferior Ruby process")
;(autoload 'inf-ruby-keys "inf-ruby"
;  "Set local key defs for inf-ruby in ruby-mode")
;(add-hook 'ruby-mode-hook
;	  '(lambda ()
;	     (inf-ruby-keys)))

;; (require 'highlight-parentheses)
(setq hl-paren-colors
      '("red1" "yellow1" "green1" "blue1" "magenta1" "purple1"))

;;; bookmarks
(setq bookmark-save-flag 1) ; save bookmark if changed

(when (require 'recentf-ext nil t)
  ;; (setq recentf-save-file
  ;; 	;; "~/.emacs.d/.recentf"
  ;; 	(expand-file-name ".recentf" user-emacs-directory))
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '("recentf"))
  (setq recentf-auto-cleanup 60)
  ;; (setq recentf-auto-cleanup 'never)
  (setq recentf-auto-cleanup-timer (run-with-idle-timer 60 t 'recentf-save-list))
  (recentf-mode 1))

(require 'setup-desktop)

;; winner-mode
(when (fboundp 'winner-mode)
  (winner-mode 1))
(windmove-default-keybindings)

(require 'setup-anything)
(require 'setup-popwin)

(setq ispell-personal-dictionary "~/.emacs.d/.ispell-dictionary")

;; (global-eldoc-mode -1) ;; disable eldoc globally

;; (require 'setup-ess)
(global-company-mode)
(setq company-idle-delay nil) ;; no auto complete
;; (setq company-minimum-prefix-length 100)
(setq company-selection-wrap-around t)
(define-key company-active-map (kbd "C-h") nil) ;; C-h needs to be backspace for me :)
;; new
;; (setq company-complete-on-edit nil)
;; (setq company-tooltip-delay 0)
;; (setq company-auto-expand t) ;; auto expand first candidate

(require 'setup-python)

(require 'setup-key-bindings)
(require 'setup-eww)
(require 'setup-xml)

(yas-reload-all)

;;; ido-mode
;; (ido-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(frame-background-mode (quote dark))
 '(magit-pull-arguments nil)
 '(org-agenda-files (quote ("~/memo/todo.org")))
 '(package-selected-packages (quote (queue elixir-mode company))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "magenta" :slant italic))))
 '(font-lock-comment-face ((t (:foreground "magenta" :slant italic)))))
