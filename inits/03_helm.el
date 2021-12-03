(use-package helm
  :straight t
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
	 ("C-x r b" . helm-filtered-bookmarks)
         ("C-c y"   . helm-show-kill-ring)
         ("C-c m"   . helm-man-woman)
         ("C-c o"   . helm-occur)
         :map helm-map ("C-h" . delete-backward-char)
         ;; :map helm-find-files-map
         ;; ("C-h" . delete-backward-char)
         :map helm-read-file-map ("C-h" . delete-backward-char)
	 ;; :map helm-read-file-map
	 ;; ("C-i" . helm-execute-persistent-action)
	 )
  :config
  (require 'helm-config)
  (setq
   helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
   helm-quick-update t ; do not display invisible candidates
   helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
   helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
   helm-split-window-default-side 'other ;; open helm buffer in another window
   helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
   helm-candidate-number-limit 200 ; limit the number of displayed canidates
   ;; helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
   helm-move-to-line-cycle-in-source nil ; move to end or beginning of source when reaching top or bottom of source.
   )
  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
  ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
  ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  ;; (global-unset-key (kbd "C-x c"))

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  ;; (helm-M-x-fuzzy-match t)
  (helm-autoresize-mode 1)
  (helm-mode 0))

(use-package helm-descbinds
  :bind ("C-c b" . helm-descbinds)
  :config
  (helm-descbinds-mode))
