;; (el-get-bundle evil :build (("make")) :info nil)
;; (el-get-bundle evil-numbers)

(use-package evil
  :init
  ;; evil-mode related. this needs to be set before (require 'evil)
  ;; https://stackoverflow.com/questions/41389571/c-does-not-escape-from-insert-mode-in-evil-local-mode
  (setq evil-cross-lines t
	evil-search-module 'evil-search
	evil-ex-search-vim-style-regexp t
	evil-want-C-u-scroll t
	evil-want-fine-undo t)
  :config
  (progn
    ;; emacs state
    (dolist (mode '(calendar-mode
		    ;; dired-mode
		    magit-mode
		    mew-draft-mode
		    mew-message-mode
		    mew-summary-mode
		    mew-virtual-mode
		    org-mode
		    term-mode))
      (add-to-list 'evil-emacs-state-modes mode))
    ;; insert state
    (add-to-list 'evil-insert-state-modes 'cider-repl-mode)
    ;; turn on evil-mode
    (evil-mode 1)

    ;; (evil-set-initial-state 'calendar-mode 'emacs)
    ))

(use-package evil-numbers
  :requires evil
  :bind
  (:map evil-normal-state-map
	("C-c +" . evil-numbers/inc-at-pt)
	("C-c -" . evil-numbers/dec-at-pt))
  )

;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :after evil
  :ensure t
  :custom (evil-collection-calendar-want-org-bindings t)
  :config
  (evil-collection-init))
