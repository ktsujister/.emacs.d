(use-package company
  :init
  (global-company-mode)
  :bind
  (:map company-active-map
	("M-n" . nil)
	("M-p" . nil)
	("C-n" . company-select-next)
	("C-p" . company-select-previous)
	("C-h" . nil)
	("C-c y /" . company-yasnippet)
	)
  :config
  (setq company-selection-wrap-around t
	completion-ignore-case t)
  (add-to-list 'company-backends 'company-yasnippet)
  )

(global-set-key "\C-c\C-i" 'company-complete)
