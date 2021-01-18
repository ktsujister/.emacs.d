;; (setq debug-on-error t)

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

(add-to-list 'load-path "~/env/share/emacs/site-lisp/mew")

;; Enable my preferred defaults
(require 'my-defaults)
(require 'setup-straight)

(require 'cl-lib)

;; (setq rbenv-modeline-function 'rbenv--modeline-plain)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;; (load-theme 'solarized t)
(setq solarized-termcolors 256)

(require 'setup-hooks)
(require 'my-functions)

(setq
 auto-mode-alist
 (append
  '(("\\.cs$" . csharp-mode)
    ("\\.cs$\\|\\.cpp$\\|\\.c$\\|\\.h$" . c++-mode)
    ("\\.xsd$\\|\\.xml$\\|\\.xsx$" . nxml-mode)
    ("\\.jsp$" . html-mode)
    ("\\.toml$" . conf-toml-mode)
    ("\\.txt$" . fundamental-mode))
  auto-mode-alist))

(require 'setup-mew)
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
 '(font-lock-doc-face ((t (:foreground "cyan" :slant normal))))
 '(powerline-evil-base-face ((t (:foreground "black" :inherit mode-line))))
 '(powerline-evil-emacs-face ((t (:foreground "violet" :inherit powerline-evil-base-face))))
 '(powerline-evil-insert-face ((t (:foreground "blue" :inherit powerline-evil-base-face))))
 '(powerline-evil-motion-face ((t (:foreground "magenta" :inherit powerline-evil-base-face))))
 '(powerline-evil-normal-face ((t (:foreground "green" :inherit powerline-evil-base-face)))))
