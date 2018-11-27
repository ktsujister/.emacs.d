;;; org-mode
(require 'org)
;(autoload 'org-mode "org" "Org mode" t)
;(autoload 'org-diary "org" "Diary entries from Org mode")
;(autoload 'org-agenda "org" "Multi-file agenda from Org mode" t)
;(autoload 'org-store-link "org" "Store a link to the current location" t)
;(autoload 'orgtbl-mode "org" "Org tables as a minor mode" t)
;(autoload 'turn-on-orgtbl "org" "Org tables as a minor mode")
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;(setq org-lowest-priority Z)
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

;;; diary-mode
(add-hook 'diary-display-hook 'fancy-diary-display)
(setq diary-file "~/Mail/.diary")
;; (load "~/Mail/japanese-holidays.el")
(require 'japanese-holidays)
(setq calendar-holidays
      (append japanese-holidays holiday-local-holidays holiday-other-holidays))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t)
   ;; (sh . t)
   (python . t)
   (ruby . t)
   (java . t)
   (R . t)))

(provide 'setup-org)
