;;; package --- Summary
;;; Commentary:
;;; Code:

;; (require 'python-mode)

;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; ; use IPython
;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; ; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--gui=wx" "--pylab=wx"))
;; (setq py-force-py-shell-name-p t)

;; ; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ; try to automagically figure out indentation
;; (setq py-smart-indentation t)
;; (setq py-company-pycomplete-p t)
;; (setq highlight-indent-guides-method 'character)
;; (setq highlight-indent-guides-method 'column)
;; (setq highlight-indent-guides-responsive 'top)

;; (add-hook 'prog-mode-hook )
;; (add-hook 'python-mode-hook
;;           (lambda ()
;; 	    (setq indent-tabs-mode nil)
;; 	    (setq indent-level 4)
;; 	    (setq tab-width 4)
;; 	    (eldoc-mode -1)
;;             (define-key python-mode-map [f7] 'py-shell)
;; 	    (flycheck-mode)
;; 	    ;; (highlight-indent-guides-mode)
;; 	    ;; (local-set-key (kbd "TAB") 'py-indent-line)
;; 	    ;; (local-set-key "\C-c\C-d" nil)
;; 	    ;; (local-set-key "\C-c\C-dd" 'py-help-at-point)
;; 	    ;; (define-key python-mode-map (kbd "TAB") 'py-indent-line)
;; 	    ;; (define-key py-ipython-shell-mode-map (kbd "TAB") 'py-indent-line)
;; 	    ;;(turn-on-evil-mode-fixed-escape)
;; 	    ))

(add-hook 'python-mode-hook
          (lambda ()
	    ;; (flymake-mode)
	    (elpy-enable)
 	    (setq indent-tabs-mode nil)
 	    (setq indent-level 4)
 	    (setq tab-width 4)
	    (setq elpy-rpc-backend "jedi")
	    (setq indent-tabs-mode nil)
	    (setq indent-level 4)
	    (setq tab-width 4)

	    (when (load "flycheck" t t)
	      (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
	      (add-hook 'elpy-mode-hook 'flycheck-mode))
	    ))


;; (setq py-complete-function nil)
;; (add-hook 'py-ipython-shell-mode-hook
;; 	  (lambda ()
;; 	    (local-set-key (kbd "TAB") 'py-indent-line)
;; 	    (local-set-key "\C-c\C-i" 'py-shell-complete)
;; 	    ))

;; ;; company-jedi
;; (require 'jedi-core)
;; ;; (setq jedi:complete-on-dot t)
;; (setq jedi:use-shortcuts t)
;; (add-hook 'python-mode-hook 'jedi:setup)
(add-to-list 'company-backends 'company-jedi) ; add to backend

;; py-help-at-point
(provide 'setup-python)
