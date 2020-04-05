;; http://d.hatena.ne.jp/tarao/20150221/1424518030

;; (when load-file-name
;;   (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)

(el-get-bundle queue)

;;; clojure related
;; (el-get-bundle clojure-emacs/cider
;;   :name cider :checkout "v0.15.0")
(el-get-bundle clojure-emacs/clojure-mode
  :name clojure-mode :checkout "5.11.0")
(el-get-bundle clojure-emacs/cider
  :name cider :checkout "v0.21.0")
(el-get-bundle clojure-emacs/clj-refactor.el
  :name clj-refactor :checkout "2.4.0")

(el-get-bundle with-editor)
;; (el-get-bundle magit/with-editor
;;   :name with-editor :checkout "v2.5.5")

;; (el-get-bundle clj-refactor)
(el-get-bundle inflections)
(el-get-bundle hydra)

;;; others
(el-get-bundle alchemist)
(el-get-bundle anything)
;; (el-get-bundle bind-key)
(el-get-bundle cedit)

;; (el-get-bundle clojure-mode)
(el-get-bundle company-mode/company-mode)
;; (el-get-bundle parseedn)
;; (el-get-bundle company)
(el-get-bundle dash)
;; (el-get-bundle drag-stuff)
(el-get-bundle elixir-lang/emacs-elixir :name elixir-mode)
;; (el-get-bundle ess :build ("cd lisp && make && cd .. && cd etc && make"))
(el-get-bundle exec-path-from-shell)
;; (el-get-bundle expand-region)
(el-get-bundle f)
(el-get-bundle inflections)
(el-get-bundle fastnav)
(el-get-bundle flycheck)
(el-get-bundle gist)
(el-get-bundle guide-key)
(el-get-bundle highlight-parentheses)
(el-get-bundle highlight-symbol)
(el-get-bundle htmlize)
;; (el-get-bundle idle-highlight-mode)
(el-get-bundle japanese-holidays)
(el-get-bundle magit)
(el-get-bundle markdown-mode)
(el-get-bundle monky)
(el-get-bundle multiple-cursors)
(el-get-bundle nyan-mode)
;; (el-get-bundle pallet)
(el-get-bundle paredit)
(el-get-bundle popwin)
(el-get-bundle prodigy)
(el-get-bundle projectile)
(el-get-bundle emacsmirror/python-mode)

;; (el-get-bundle rbenv)
(el-get-bundle recentf-ext)
(el-get-bundle s)
;; (el-get-bundle slamhound)
(el-get-bundle smartparens)
(el-get-bundle smex)
(el-get-bundle use-package)
(el-get-bundle web-mode)
(el-get-bundle yasnippet)

;; gnu
(el-get-bundle queue)
(el-get-bundle spinner)
(el-get-bundle vspinu/sesman)

;; additional
(el-get-bundle edn)
(el-get-bundle epc)
(el-get-bundle python-environment)
(el-get-bundle tkf/emacs-jedi
  :load ("jedi-core.el")
  :name jedi-core
  :depends (epc python-environment))
(el-get-bundle company-jedi
  :depends (company-mode))

(el-get-bundle tarao/el-get-lock)
(el-get-bundle quickrun)
(el-get-bundle daichirata/emacs-rotate)

;; rust
(el-get-bundle rust-mode)
(el-get-bundle emacs-racer)
(el-get-bundle cargo)

(el-get-bundle evil :build (("make")) :info nil)
(el-get-bundle evil-numbers)
;; (el-get-bundle org-evil)

(el-get-bundle yoshiki/yaml-mode)

;; (el-get-bundle groovy-emacs-mode)

(el-get-lock)
(el-get-lock 'magit 'clj-refactor 'cider 'clojure-mode)
(provide 'setup-el-get)
