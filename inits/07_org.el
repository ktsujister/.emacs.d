(use-package org
  :straight nil
  :mode (("\\.org$" . org-mode))
  :config
  (setq org-agenda-include-diary t)
  (setq org-log-done t)
  ;; Stop org-mode from highjacking shift-cursor keys
  (setq org-replace-disputed-keys t)

  ;; Set to the location of your Org files on your local system
  (setq org-directory "~/memo")
  ;; Set to the name of the file where new notes will be stored
  (setq org-mobile-inbox-for-pull "~/memo/mobile.org")
  ;; Set to <your Dropbox root directory>/MobileOrg.
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

  ;; diary-mode
  (add-hook 'diary-display-hook 'fancy-diary-display)
  (setq diary-file "~/Mail/.diary")
  ;; (load "~/Mail/japanese-holidays.el")
  (use-package japanese-holidays
    :config
    (setq calendar-holidays
	  (append japanese-holidays holiday-local-holidays holiday-other-holidays)))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (shell . t)
     ;; (sh . t)
     (python . t)
     (ruby . t)
     (java . t)
     (R . t))))
