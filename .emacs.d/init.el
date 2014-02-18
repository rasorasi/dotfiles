(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(global-linum-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq initial-frame-alist
      '((top . 10) (left . 1000) (width . 98) (height . 52)))

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
(add-to-load-path "elisp" "conf")

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
(global-set-key (kbd "C-m") 'newline)
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)
(global-set-key (kbd "C-c b ") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)

(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <left> ") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)

(global-set-key [f5] 'kmacro-end-and-call-macro)

(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key(kbd "M-+") 'goto-line)
(keyboard-translate ?\C-i ?\M-+)
(keyboard-translate ?\C-o ?\C-f)
(global-set-key (kbd "M-o") 'forward-word)
(global-set-key (kbd "C-<tab>") 'dabbrev-expand)



;; 初期画面設定
(setq inhibit-startup-message t)


;; change theme
(setq custom-theme-directory "~/.emacs.d/themes/")
(global-set-key (kbd "C-c 1") (lambda()(interactive)(load-theme 'molokai t)(setq ntheme 'molokai)))
(global-set-key (kbd "C-c 2") (lambda()(interactive)(load-theme 'patyu t)(setq ntheme 'patyu)))
(global-set-key (kbd "C-c 3") (lambda()(interactive)(load-theme 'jpaper t)(setq ntheme 'jpaper)))
(global-set-key (kbd "C-c 4") (lambda()(interactive)(load-theme 'black-on-gray t)(setq ntheme 'black-on-gray)))
(global-set-key (kbd "C-c 5") (lambda()(interactive)(load-theme 'oswald t)(setq ntheme 'oswald)))


;;修正必要　
(global-set-key (kbd "C-c 0")(lambda()(interactive)(disable-theme ntheme)))


;;input method "mozc" and utf-8
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(ibus-define-common-key ?\C-\s nil)
(setq ibus-cursor-color '("firebrick" "dark orange" "royal blue"))

(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(set-default-coding-systems 'utf-8)


;; ;; yatex
;; ;;(load "init-yatex")

;;paren-mode
(setq show-paren-delay 0)
(show-paren-mode t)
  ;hilight in paren
(setq show-parenpstyle 'expression)
  ;change paren of face
;(set-face-background 'show-paren-match-face "yellew")

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

;; colortheme ch

;;direx
(require 'direx)
(require 'direx-project)

(defun my/dired-jump()
  (interactive)
  (cond (current-prefix-arg
	 (dired-jump))
	((not (one-window-p))
	 (or (ignore-errors
	       (direx-project:jump-to-project-root) t)
	     (direx:jump-to-directory)))
	(t
 	 (or (ignore-errors
 	       (direx-project:jump-to-project-root-other-windwo) t)
 	     (direx:jump-to-directory-other-window)))))
 
(global-set-key (kbd "C-c C-j") 'my/dired-jump)
 
(require 'popwin)
(push '(direx:direx-mode :position left :windth 40 :dedicated t)
      popwin:special-display-config)
 
 
;;anything
(when (require 'anything nil t)
  (setq
   ;;候補を表示するまでの時間
   anything-idle-delay 0.3
   ;;
   anythong-input-idle-delay 0.2
   ;;
   anything-candidate-number-limit 100
   ;;
   anything-quick-update t
   ;;
   anything-enable-shortcuts 'alphabet
   ;;
   )
 
  (when (require 'anything-config nil t)
    ;;
    ;;
    (setq anything-su-or-sudo "sudo"))
 
  (require 'anything-match-plugin nil t)
 
  (when (and (executable-find "cmigemo")
 	     (require 'migemo nil t))
    (require 'anything-migemo nil t))
 
  (when (require 'anything-complete nil t)
    ;;
    (anything-lisp-complete-symbol-set-timer 150))
 
  (require 'anything-show-completion nil t)
 
  (when (require 'auto-install nil t)
      (require 'anything-auto-install nil t))
 
  (when (require 'descbinds-anything nil t)
    ;;
    (descbinds-anything-install)))
 
 
;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)


;;auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
 	       "~/.emacs.d/elisp/ac-dict")
  (global-set-key  (kbd "C-x C-a") 'auto-complete-mode)
  (ac-config-default))
 
