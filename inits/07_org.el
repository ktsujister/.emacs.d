(use-package org
  :straight nil
  :mode (("\\.org$" . org-mode))
  :init
  (setq tab-width 4)
  (setq show-trailing-whitespace t)
  (setq org-agenda-include-diary t
	org-log-done t
	;; Stop org-mode from highjacking shift-cursor keys
	org-replace-disputed-keys t
	org-startup-indented t    ;; 見出しをインデント
	;; org-indent-mode-turns-on-hiding-stars nil  ;; 見出しをインデントした時にアスタリスクが減るのを防ぐ
	org-indent-indentation-per-level 2  ;; インデントの幅を設定
	org-startup-folded 'content  ;; 見出しの初期状態（見出しだけ表示）
	org-use-speed-commands t
	)

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
     (R . t)))


  (global-set-key (kbd "C-c c") 'org-capture)
  (setq org-directory "~/memo/")
  (setq org-default-notes-file (concat org-directory "notes.org"))
  )
