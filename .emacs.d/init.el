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

;; keybinds
(define-key global-map (kbd "C-m") 'newline-and-indent);;;
(define-key global-map (kbd "C-t") 'other-window)


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

;; yatex
;;(load "init-yatex")

;;paren-mode
(setq show-paren-delay 0)
(show-paren-mode t)
  ;hilight in paren
(setq show-parenpstyle 'expression)
  ;change paren of face
(set-face-background 'show-paren-match-face "yellow")

;;backup
(setq make-back-files t)
(add-to-list 'backup-directory-alist
	     (cons ".""~/.emacs.d/backups/"))
;;autosave
(setq auto-save-default t)

;;when a file begins #!, I add +x and save it
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;;auto-install
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp")
  (auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup))

;;redo+
(when (require 'redo+ nil t)
   (global-set-key (kbd "C-'") 'redo))

;;ELPA
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("marmalade"."http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA"."http://tromey.com/elpa/"))
  (package-initialize))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
