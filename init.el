;; (setq debug-on-error t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(setq byte-compile-warnings '(not cl-functions obsolete))

(unless window-system (menu-bar-mode -1))
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))

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

;; Enable my preferred defaults
(require 'my-defaults)
(require 'setup-straight)
;; (require 'setup-el-get)

(require 'cl-lib)

;; (setq rbenv-modeline-function 'rbenv--modeline-plain)

;; (require 'setup-clojure)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;; (load-theme 'solarized t)
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

;; (require 'setup-org)

(require 'setup-mew)

;; ;;; w3m
;; (require 'w3m)
;; (require 'mew-w3m)
;; (setq w3m-use-cookies t)
;; (setq browse-url-browser-function 'w3m-browse-url)


;; (global-eldoc-mode -1) ;; disable eldoc globally

;; (require 'setup-ess)
;; (require 'setup-python)

(require 'setup-key-bindings)
(require 'setup-eww)
(require 'setup-xml)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(solarized))
 '(custom-safe-themes
   '("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))
 '(frame-background-mode 'dark)
 '(magit-pull-arguments nil)
 '(org-agenda-files '("~/memo/todo.org"))
 '(package-selected-packages nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "magenta" :slant normal))))
 '(font-lock-comment-face ((t (:foreground "magenta" :slant normal))))
 '(powerline-evil-base-face ((t (:foreground "black" :inherit mode-line))))
 '(powerline-evil-emacs-face ((t (:foreground "violet" :inherit powerline-evil-base-face))))
 '(powerline-evil-insert-face ((t (:foreground "blue" :inherit powerline-evil-base-face))))
 '(powerline-evil-motion-face ((t (:foreground "magenta" :inherit powerline-evil-base-face))))
 '(powerline-evil-normal-face ((t (:foreground "green" :inherit powerline-evil-base-face)))))
