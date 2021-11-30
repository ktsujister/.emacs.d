(use-package clang-format)

(use-package cmake-mode
  :config
  (add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode)))
