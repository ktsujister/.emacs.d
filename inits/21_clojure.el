;; clojure
(use-package clojure-mode
  :straight (clojure-mode :type git :host github :repo "clojure-emacs/clojure-mode")
  )

(use-package cider
  :straight (cider :type git :host github :repo "clojure-emacs/cider")
  )

(use-package clj-refactor
  :straight (clj-refactor :type git :host github :repo "clojure-emacs/clj-refactor.el")
  )
