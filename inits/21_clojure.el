;; clojure
(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package clojure-mode
  :straight (clojure-mode :type git :host github :repo "clojure-emacs/clojure-mode")
  :defer t
  :ensure t
  :after (highlight-parentheses paredit)
  :config
  (add-hook 'clojure-mode-hook
	    '(lambda ()
	       (paredit-mode 1)
	       (highlight-parentheses-mode 1)
	       (clj-refactor-mode 1)
	       (cljr-add-keybindings-with-prefix "C-c C-m")
	       (my-clojure-mode-hook)))
  )

(use-package cider
  :straight (cider :type git :host github :repo "clojure-emacs/cider")
  :defer t
  :ensure t
  :after (clojure-mode paredit highlight-parentheses)
  :config
  (add-hook 'cider-repl-mode-hook
	    '(lambda ()
	       (paredit-mode 1)
	       (highlight-parentheses-mode 1)
	       (local-set-key "\C-h" 'paredit-backward-delete)))
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-print-length 100)
  (add-hook
   'cider-popup-buffer-mode-hook
   '(lambda ()
      (local-set-key "\C-g" 'cider-popup-buffer-quit)))
  (setq cider-auto-select-error-buffer t)
  ;; (setq cider-popup-stacktraces-in-repl t)
  ;; (add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)
  (setq cider-repl-display-help-banner nil)
  (setq cider-repl-pop-to-buffer-on-connect 'display-only)
  (setq cider-print-fn 'fipp)
  (setq cider-eval-result-prefix ";; => ")
  (setq cider-test-show-report-on-success t)
  )

(use-package clj-refactor
  :straight (clj-refactor :type git :host github :repo "clojure-emacs/clj-refactor.el")
  :config
  (setq cljr-suppress-middleware-warnings t)
  (setq cljr-favor-prefix-notation nil)

  ;; Add custom magic requires.
  (dolist (mapping '(("time" . "clj-time.core")
		     ("edn" . "clojure.edn")
		     ("cli" . "clojure.tools.cli")
		     ("log" . "clojure.tools.logging")
		     ("t"   . "taoensso.timbre")))
    (add-to-list 'cljr-magic-require-namespaces mapping t))
  )
