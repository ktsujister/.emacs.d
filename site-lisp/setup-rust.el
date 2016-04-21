(add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode) ;; racer is slow sometimes
(add-hook 'racer-mode-hook #'company-mode)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'racer-mode-hook
	  '(lambda ()
	     (set (make-local-variable 'eldoc-idle-delay) 5)
	     (setq company-tooltip-align-annotations t)))

(provide 'setup-rust)
