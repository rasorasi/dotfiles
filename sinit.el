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


;; 最後に改行を入れる
(setq require-final-newline t)

;;can use copy and past clipboard with
(setq x-select-enable-clipboard t)

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
(add-to-load-path "elisp" "conf" "elpa")

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

; setting of modes
(defun my-c-mode-common-init ()
  "C, C++ mode set up function"
  (setq tab-width 4)
  (c-set-style "k&r")
  (setq c-basic-offset 4)
  (setq indent-tabs-mode t)
  (setq c-auto-newline nil))

(add-hook 'c-mode-hook 'my-c-mode-common-init)
(add-hook 'c++-mode-hook 'my-c-mode-common-init) 


             

;; keybinds
;(global-set-key (kbd "C-m") 'newline)
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)
(global-set-key (kbd "C-c b ") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c o") 'windmove-right)

(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <left> ") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)

;(global-set-key (kbd "C-j"))
(global-set-key [f5] 'kmacro-end-and-call-macro)

(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key(kbd "M-+") 'goto-line)
(keyboard-translate ?\C-i ?\M-+)
(global-set-key (kbd "C-o") 'forward-char)
(global-set-key (kbd "M-o") 'forward-word)
(global-set-key (kbd "M-p") 'backward-sentence)
(global-set-key (kbd "M-n") 'forward-sentence)

(global-set-key (kbd "C-<tab>") 'dabbrev-expand)

(global-set-key (kbd "C-!") (lambda()(interactive)(find-file '"~/.emacs.d/init.el")))
(global-set-key (kbd "C-m") 'newline)
;(global-set-key (kbd "M-#") 'newline-and-indent)
;(keyboard-translate ?\C-m ?\M-#)
(global-set-key (kbd "C-x C-b") (lambda()(interactive)(ibuffer-list-buffers)(switch-to-buffer-other-window '"*Ibuffer*")))

(global-set-key (kbd "C-t") 'query-replace-regexp)
(global-set-key (kbd "M-z") 'term)
;(global-set-key (kbd "C-x C-c") 'helm-M-x)
;(global-set-key (kbd "C-x C-z") 'change-favorite-command)
(defalias 'exit 'save-buffers-kill-emacs)


;;後ろから大文字に変換
(global-set-key (kbd "M-j") 'upcase-backward-word)
(defun upcase-backward-word (arg)
  "Convert previous word (or arg words) to upper case."
  (interactive "p")
  (upcase-word (- arg)))


;; 初期画面設定
(setq inhibit-startup-message t)



;; change theme
;(setq custom-theme-directory "~/.emacs.d/themes/")
;(setq ntheme nil)
;(defun conf_theme(theme now)
;  (disable-theme now)
;  (load-theme theme t))
; 
;(global-set-key (kbd "C-c 1") (lambda()(interactive)(conf_theme 'molokai ntheme)(setq ntheme 'molokai)))
;(global-set-key (kbd "C-c 2") (lambda()(interactive)(conf_theme 'patchouli ntheme)(setq ntheme 'patchouli)))
;(global-set-key (kbd "C-c 3") (lambda()(interactive)(conf_theme 'jpaper ntheme)(setq ntheme 'jpaper)))
;(global-set-key (kbd "C-c 4") (lambda()(interactive)(conf_theme 'subdued ntheme)(setq ntheme 'subdued)))
; 
;(global-set-key (kbd "C-c 0")(lambda()(interactive)(disable-theme ntheme)))
; 
;(defun kill-region-or-delete-window (beg end)
;  (interactive "r")
;  (if mark-active 
;      (kill-region beg end)
;    (delete-window)))                    ;; change favorit command
;(global-set-key (kbd "C-w") 'kill-region-or-delete-window)



;input method "mozc" and utf-8
;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)
;(ibus-define-common-key ?\C-\s nil)
;(setq ibus-cursor-color '("firebrick" "dark orange" "royal blue"))
; 
; 
;(require 'mozc)
;(set-language-environment "Japanese")
;(setq default-input-method "japanese-mozc")
;(global-set-key (kbd "C-\\") 'mozc-mode)


(setq default-file-name-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)


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


;;redo+
(when (require 'redo+ nil t)
   (global-set-key (kbd "C-M-/") 'redo))



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

  (when (require 'anything-complete nil t)
    ;;
    (anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil ))

(require 'color-moccur)

(when (require 'anything-c-moccur nil t)
  (setq
   anything-c-moccur-anything-idle-delay 0.1
   anything-c-moccur-higligt-info-line-flag t
   anything-c-moccur-enable-auto-look-flag t
   anything-c-moccur-enable-initial-pattern t))

(global-set-key (kbd "C-z") 'anything)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "M-s") 'anything-c-moccur-occur-by-moccur)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)


;;auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
 	       "~/.emacs.d/elisp/ac-dict")
  (define-key ac-completing-map "\t" 'ac-complete)
  (define-key ac-completing-map "\r" nil)
  (global-set-key  (kbd "C-x C-a") 'auto-complete-mode)
  (ac-config-default))



(require 'point-undo)
(global-set-key (kbd "C-;") 'point-undo)
(global-set-key (kbd "C-M-;") 'point-redo)

(when (require 'undo-tree nil t)
  (global-undo-tree-mode))


(require 'tramp)
(setq tramp-default-method "ssh")


(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)


