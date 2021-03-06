;;; package -- Summary
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-forward-word (&optional arg)
  "Move to head of next word.  This is like 'w' in vi."
  (interactive "p")
  (forward-word (1+ arg))
  (forward-word -1))

(defun my-count-words (&optional arg)
  "Count words and characters in current buffer."
  (interactive "p")
  (count-words-region (point-min) (point-max)))

(defun my-buffer-fix (&optional arg)
  "Remove spaces before tab, and space or tab at the end of the line."
  (interactive "p")
  (point-to-register t)
  ;replace zenkaku space to two spaces.
  (goto-char (point-min))
  (while (re-search-forward "  " nil t)
    (replace-match "  " nil nil))
  ;replace four continuous spaces to tab.
  (tabify (point-min) (point-max))
  ;delete blank space and tab at the end of line
  (goto-char (point-min))
  (while (re-search-forward "[ \t]+$" nil t)
    (replace-match "" nil nil))
  ;delete space before tab
  (goto-char (point-min))
  (while (re-search-forward " +\t" nil t)
    (replace-match "\t" nil nil))
  (jump-to-register t))

(defun my-save-buffer (&optional arg)
  "Remove spaces before tab, and space or tab at the end of the line."
  (interactive "p")
  (my-buffer-fix)
  (save-buffer))

(defun my-copy-block (&optional arg)
  "Perform `backward-up-list` and save the sexp in ring."
  (interactive "p")
  (backward-up-list)
  (mark-sexp)
  (kill-ring-save (region-beginning) (region-end)))

(global-set-key "\C-cw" 'cb-copy)
(global-set-key "\C-cy" 'cb-paste)
(defun cb-copy ()
  "Copy to clipboard."
  (interactive)
;  (let ((coding-system-for-write 'shift_jis-dos))
;    (shell-command-on-region (region-beginning) (region-end) "cat > /dev/clipboard" nil nil nil))
  (let ((coding-system-for-write 'utf-8))
    (shell-command-on-region (region-beginning) (region-end) "cat | pbcopy" nil nil nil))
  (message ""))
(defun cb-paste ()
  "Paste from clipboard."
  (shell-command-to-string "pbpaste"))
;  (interactive)
;  (let ((coding-system-for-read 'shift_jis-dos))
;    (goto-char
;     (+ (point) (cadr (insert-file-contents "/dev/clipboard"))))))

;; http://stackoverflow.com/a/23382008/262750
(defun display-ansi-colors ()
  "Displays ansi colors."
  (interactive)
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'my-functions)
;;; my-functions.el ends here
