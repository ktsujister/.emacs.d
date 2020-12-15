;; desktop
(setq desktop-globals-to-save '(extended-command-history))
;; (setq desktop-files-not-to-save "")
;; (desktop-save-mode t)
(desktop-save-mode 1)
(setq desktop-restore-eager 10)
(setq desktop-save t)

(setq desktop-restore-frames nil)

;; https://emacs.stackexchange.com/a/40844/9376
(defvar *my-desktop-save* nil
  "Should I save the desktop when Emacs is shutting down?")

(add-hook 'desktop-after-read-hook
          (lambda () (setq *my-desktop-save* t)))

(advice-add 'desktop-save :around
            (lambda (fn &rest args)
              (if (bound-and-true-p *my-desktop-save*)
                  (apply fn args))))
