;;;---------------------------------
;;; R & ESS の設定
;;;---------------------------------
;; 拡張子が r, R の場合に R-mode を起動
(add-to-list 'auto-mode-alist '("\\.[rR]$" . R-mode))
;; R-mode を起動する時に ess-site をロード
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
;; R を起動する時に ess-site をロード
(autoload 'R "ess-site" "start R" t)

;; R-mode, iESS を起動する際に呼び出す初期化関数
(setq ess-loaded-p nil)
(defun ess-load-hook (&optional from-iess-p)
  ;; インデントの幅を4にする（デフォルト2）
  (setq ess-indent-level 4)
  ;; インデントを調整
  (setq ess-arg-function-offset-new-line (list ess-indent-level))
  ;; comment-region のコメントアウトに # を使う（デフォルト##）
  (make-variable-buffer-local 'comment-add)
  (setq comment-add 0)

  ;; 最初に ESS を呼び出した時の処理
  (when (not ess-loaded-p)
    ;; アンダースコアの入力が " <- " にならないようにする
    (ess-toggle-underscore nil)
    ;; キャレットがシンボル上にある場合にもエコーエリアにヘルプを表示する
    (setq ess-eldoc-show-on-symbol t)
    ;; 起動時にワーキングディレクトリを尋ねられないようにする
    (setq ess-ask-for-ess-directory nil)
    ;; # の数によってコメントのインデントの挙動が変わるのを無効にする
    (setq ess-fancy-comments nil)
    (setq ess-loaded-p t)
    ;; (unless from-iess-p
    ;;   ;; ウィンドウが1つの状態で *.R を開いた場合はウィンドウを縦に分割して R を表示する
    ;;   (when (one-window-p)
    ;;     (split-window-horizontally)
    ;;     (let ((buf (current-buffer)))
    ;;       (ess-switch-to-ESS nil)
    ;;       (switch-to-buffer-other-window buf)))
    ;;   )
    )

  ;; (if from-iess-p
  ;;     ;; R のプロセスが他になければウィンドウを分割する
  ;;     (if (> (length ess-process-name-list) 0)
  ;;         (when (one-window-p)
  ;;           (split-window-horizontally)
  ;;           (other-window 1)))
  ;;   ;; *.R と R のプロセスを結びつける
  ;;   ;; これをしておかないと補完などの便利な機能が使えない
  ;;   (ess-force-buffer-current "Process to load into: "))

  (local-set-key [f7] 'ess-switch-to-inferior-or-script-buffer)
  )

;; R-mode 起動直後の処理
(add-hook 'R-mode-hook 'ess-load-hook)

;; R 起動直前の処理
(add-hook 'ess-pre-run-hook (lambda () (ess-load-hook t)))

(add-hook
 'ess-mode-load-hook
 (lambda ()
   (local-set-key [f7] 'ess-switch-to-inferior-or-script-buffer)))

(provide 'setup-ess)
