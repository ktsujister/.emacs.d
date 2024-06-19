(use-package powerline
  :ensure t)
(use-package powerline-evil
  :after powerline
  ;; :init
  ;; ;; (powerline-evil-center-color-theme)
  ;; (powerline-evil-vim-color-theme)
  ;; ;; (powerline-default-theme)
  ;; ;; (powerline-center-evil-theme)
  ;; ;; (powerline-vim-theme)
  :custom-face
  (powerline-evil-base-face    ((t (:background "black" :inherit mode-line))))
  (powerline-evil-emacs-face   ((t (:background "black" :foreground "violet"  :inherit powerline-evil-base-face))))
  (powerline-evil-insert-face  ((t (:background "white" :foreground "blue"    :inherit powerline-evil-base-face))))
  (powerline-evil-motion-face  ((t (:background "white" :foreground "magenta" :inherit powerline-evil-base-face))))
  (powerline-evil-normal-face  ((t (:background "black" :foreground "green"   :inherit powerline-evil-base-face))))
  (powerline-evil-replace-face ((t (:background "white" :foreground "red"     :inherit powerline-evil-base-face))))
  (powerline-evil-visual-face  ((t (:background "black" :foreground "yellow"  :inherit powerline-evil-base-face))))
  ;; (powerline-evil-base-face   ((nil (:background "black" :inherit mode-line))))
  ;; (powerline-evil-emacs-face  ((nil (:foreground "violet" :inherit powerline-evil-base-face))))
  ;; (powerline-evil-insert-face ((nil (:foreground "blue" :inherit powerline-evil-base-face))))
  ;; (powerline-evil-motion-face ((nil (:foreground "magenta" :inherit powerline-evil-base-face))))
  ;; (powerline-evil-normal-face ((nil (:foreground "green" :inherit powerline-evil-base-face))))
  )
