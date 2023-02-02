(use-package clang-format)

(use-package cmake-mode
  :mode ("CMakeLists\\.txt$" . cmake-mode))

(defun cc-mode-init ()
  (google-set-c-style)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 4)
  (setq indent-level 4)
  (setq tab-width 4)
  (c-set-offset 'case-label 0))

(use-package google-c-style
  :config
  (add-hook 'c-mode-hook 'cc-mode-init)
  (add-hook 'c++-mode-hook 'cc-mode-init)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  ;; (add-hook 'c-mode-hook 'google-set-c-style)
  ;; (add-hook 'c++-mode-hook 'google-set-c-style)
  ;; (setq indent-tabs-mode t)
  ;; (setq c-basic-offset 4)
  ;; (c-set-offset 'case-label 0)
  )

(add-hook 'c++-mode-hook 'company-mode) ; 補完用
(add-hook 'c++-mode-hook 'flycheck-mode) ; チェック用
