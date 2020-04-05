;; (add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

;;; clojure related
(add-hook
 'clojure-mode-hook
 '(lambda ()
    (paredit-mode 1)
    (highlight-parentheses-mode)
    ;; (setq show-paren-style 'expression)
    ;; (local-set-key "\C-c)" 'paredit-forward-slurp-sexp)
    ;; (local-set-key "\C-c(" 'paredit-backward-slurp-sexp)
    ;; (local-set-key "\C-c}" 'paredit-forward-barf-sexp)
    ;; (local-set-key "\C-c{" 'paredit-backward-barf-sexp)
    (local-set-key "\C-h" 'paredit-backward-delete)
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import
    (cljr-add-keybindings-with-prefix "C-c C-m")
    ;;(turn-on-evil-mode-fixed-escape)
    ))

(add-hook
 'cider-repl-mode-hook
 '(lambda ()
    (paredit-mode 1)
    (highlight-parentheses-mode)
    ;; (local-set-key "\C-c)" 'paredit-forward-slurp-sexp)
    ;; (local-set-key "\C-c(" 'paredit-backward-slurp-sexp)
    ;; (local-set-key "\C-c}" 'paredit-forward-barf-sexp)
    ;; (local-set-key "\C-c{" 'paredit-backward-barf-sexp)
    (local-set-key "\C-h" 'paredit-backward-delete)
    (setq cider-repl-use-pretty-printing t)
    (setq cider-repl-print-length 100)
    ;;(turn-on-evil-mode-fixed-escape)
    ))
(add-hook
 'cider-popup-buffer-mode-hook
 '(lambda ()
    (local-set-key "\C-g" 'cider-popup-buffer-quit)))

;; (require 'clojure-mode)

;; (put-clojure-indent '-> 4)
;; (put-clojure-indent '->> 5)

;; (add-hook 'cider-repl-mode-hook #'company-mode)
;; (add-hook 'cider-mode-hook #'company-mode)

;; cider
;; (require 'cider)
;; (setq cider-popup-stacktraces nil)
;; (setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
;; (setq cider-popup-stacktraces-in-repl t)
;; (add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-display-help-banner nil)
(setq cider-repl-pop-to-buffer-on-connect 'display-only)
(setq cider-print-fn 'fipp)
(setq cider-eval-result-prefix ";; => ")
(setq cider-test-show-report-on-success t)

(require 'clj-refactor)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(setq cljr-suppress-middleware-warnings t)
(setq cljr-favor-prefix-notation nil)

;; Add custom magic requires.
(dolist (mapping '(("time" . "clj-time.core")
		   ("edn" . "clojure.edn")
		   ("cli" . "clojure.tools.cli")
		   ("log" . "clojure.tools.logging")
		   ("t"   . "taoensso.timbre")))
  (add-to-list 'cljr-magic-require-namespaces mapping t))

(provide 'setup-clojure)
