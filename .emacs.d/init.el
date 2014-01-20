;;load-pathを追加
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if(fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;;引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;;
(prefer-coding-system 'utf-8)

;;
(global-linum-mode t)
;;行の何文字目かを表示
(column-number-mode t)

;;ファイルサイズを表示
(size-indication-mode t)

;;時刻
(setq display-time-day-and-date t) ;曜日、月、日を表示
(setq display-time-24hr-format t) ; 24h
(display-time-mode t)

;; バッテリー
(display-battery-mode t)

;; frame titel show absolute path
(setq frame-title-format "%f")

;; C-m: newline-and-indent
(define-key global-map (kbd "C-m") 'newline-and-indent)


;; 初期画面設定
(setq inhibit-startup-message t)

;; change theme
(setq custom-theme-directory "~/.emacs.d/themes/")

(global-set-key (kbd "C-c 1") (lambda()(interactive)(load-theme 'molokai t)(setq ntheme 'molokai)))
(global-set-key (kbd "C-c 2") (lambda()(interactive)(load-theme 'mytheme t)(setq ntheme 'mytheme)))
;;修正必要　
(global-set-key (kbd "C-c 0")(lambda()(interactive)(disable-theme ntheme)))

;;input method "mozc"
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
