(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(global-linum-mode t)
 '(helm-ff-auto-update-initial-value nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;(setq initial-frame-alist
;      '((top . 10) (left . 1000) (width . 98) (height . 52)))



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

(fset 'yes-or-no-p 'y-or-n-p)

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
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "C-!") (lambda()(interactive)(find-file '"~/.emacs.d/init.el")))
(global-set-key (kbd "C-m") 'newline)
;(global-set-key (kbd "M-#") 'newline-and-indent)
;(keyboard-translate ?\C-m ?\M-#)
(global-set-key (kbd "C-x C-b") (lambda()(interactive)(ibuffer-list-buffers)(switch-to-buffer-other-window '"*Ibuffer*")))

(global-set-key (kbd "M-q") 'query-replace-regexp)
(global-set-key (kbd "M-z") 'term)
(global-set-key (kbd "C-M-p") 'cua-scroll-down)
(global-set-key (kbd "C-M-n") 'cua-scroll-up)

;(global-set-key (kbd "C-x C-c") 'helm-M-x)
;(global-set-key (kbd "C-x C-z") 'change-favorite-command)
(defalias 'exit 'save-buffers-kill-emacs)

;(global-set-key (kbd "M-r") ')
;(global-set-key (kbd "M-i") ')
;(global-set-key (kbd "M-v") ')
;(global-set-key (kbd "C-v") ')
;(global-set-key (kbd "M-z") ')
;(global-set-key (kbd "M-t") ')
;(global-set-key (kbd "M-l") ')

;(global-set-key (kbd "C-x") ')
;; 初期画面設定
(setq inhibit-startup-message t)



;; change theme
(setq custom-theme-directory "~/.emacs.d/themes/")
(setq ntheme nil)
(defun conf_theme(theme now)
  (disable-theme now)
  (load-theme theme t))

(global-set-key (kbd "C-c 1") (lambda()(interactive)(conf_theme 'molokai ntheme)(setq ntheme 'molokai)))
(global-set-key (kbd "C-c 2") (lambda()(interactive)(conf_theme 'patchouli ntheme)(setq ntheme 'patchouli)))
(global-set-key (kbd "C-c 3") (lambda()(interactive)(conf_theme 'jpaper ntheme)(setq ntheme 'jpaper)))
(global-set-key (kbd "C-c 4") (lambda()(interactive)(conf_theme 'subdued ntheme)(setq ntheme 'subdued)))

(global-set-key (kbd "C-c 0")(lambda()(interactive)(disable-theme ntheme)))

(conf_theme 'molokai ntheme)

(defun kill-region-or-delete-window (beg end)
  (interactive "r")
  (if mark-active 
      (kill-region beg end)
    (delete-window)))                    ;; change favorit command
(global-set-key (kbd "C-w") 'kill-region-or-delete-window)



;input method "mozc" and utf-8
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(ibus-define-common-key ?\C-\s nil)
(setq ibus-cursor-color '("firebrick" "dark orange" "royal blue"))


(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(global-set-key (kbd "C-\\") 'toggle-input-method)


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
 	     (cons ".*""~/.emacs.d/backups/"))
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
   (global-set-key (kbd "C-M-/") 'redo))

;;ELPA
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("marmalade"."http://marmalade-repo.org/packages/"))
 (add-to-list 'package-archives '("ELPA"."http://tromey.com/elpa/"))
  (package-initialize))



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

(require 'recentf)
(setq recentf-exclude '(".scratch$"
			".recentf$"
			".framesize.el$"))

;; recentf-ext
(when (require 'recentf-ext nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))
 
;; 起動画面で recentf を開く
(add-hook 'after-init-hook (lambda()
    (recentf-open-files)))


;; auto save and restore scratch buffer
(defun save-scratch-data ()
  (let ((str (progn
               (set-buffer (get-buffer "*scratch*"))
               (buffer-substring-no-properties
                (point-min) (point-max))))
        (file "~/.emacs.d/.scratch"))
    (if (get-file-buffer (expand-file-name file))
        (setq buf (get-file-buffer (expand-file-name file)))
      (setq buf (find-file-noselect file)))
    (set-buffer buf)
    (erase-buffer)
    (insert str)
    (save-buffer)
    (kill-buffer buf)))

(defadvice save-buffers-kill-emacs
  (before save-scratch-buffer activate)
  (save-scratch-data))

(defun read-scratch-data ()
  (let ((file "~/.emacs.d/.scratch"))
    (when (file-exists-p file)
      (set-buffer (get-buffer "*scratch*"))
      (erase-buffer)
      (insert-file-contents file))
    ))


(read-scratch-data)

;;後ろから大文字に変換
(global-set-key (kbd "M-j") 'upcase-backward-word)
(defun upcase-backward-word (arg)
  "Convert previous word (or arg words) to upper case."
  (interactive "p")
  (upcase-word (- arg)))

(require 'point-undo)
(global-set-key (kbd "C-;") 'point-undo)
(global-set-key (kbd "C-M-;") 'point-redo)

(when (require 'undo-tree nil t)
  (global-undo-tree-mode))


(setq howm-menu-lang 'ja)
(require 'howm-mode)
;;(global-set-key (kbd "C-c , ,") 'howm-menu)
(autoload 'howm-menu "howm-mode" "Hitori Otegaru Wiki Modoki" t)

(define-key howm-mode-map (kbd "C-x C-s")
  (lambda()(interactive)(save-buffer) (kill-buffer nil) (howm-menu)))

(define-key howm-view-summary-mode-map "D" 'delete-howm-file)


(require 'tramp)
(setq tramp-default-method "ssh")


(require 'zlc)
(setq zlc-select-completion-immediately t)


(require 'ac-python)


(require 'server)
(unless (server-running-p)
  (server-start))


(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)
 
(require 'edit-server)
(edit-server-start)
 
(flymake-mode t)
 
(require 'helm-config)
(require 'helm-descbinds)
(global-set-key (kbd "C-z") 'helm-mini)
(helm-mode 1)
 
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
;(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
 
 
;(run-with-idle-timer 2 t ')
 
 
; session.el
;; http://emacs-session.sourceforge.net/
(when (require 'session nil t)
  (setq session-save-file-coding-system 'utf-8-unix)
  (setq session-save-file (expand-file-name "~/.emacs.d/.session"))
  (setq session-initialize '(session places))
  (setq session-globals-max-size 1024)
  (setq session-globals-max-string (* 1024 1024))
  (setq session-globals-include '((kill-ring 512)
                                  (session-file-alist 512)
                                  (file-name-history 512)
                                  (tags-table-set-list 128)
                                  (tags-table-list 128)))
  (add-hook 'after-init-hook 'session-initialize)
  ;; Save session info every 30 minutes
  (setq my-timer-for-session-save-session (run-at-time t 1800 'session-save-session)))
 
(run-with-idle-timer (* 60 30) t
		     (lambda()(interactive)
		       (find-file '"~/.emacs.d/themes/sinku2.jpg")
		       (message "進捗どうですか？")))



(defun my-copy-file-path ()
  "show the full path file name in the minibuffer and copy to kill ring."
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))
    (message (buffer-file-name))))

;;; 終了時のフレームサイズを記憶する
(defun my-window-size-save ()
  (let* ((rlist (frame-parameters (selected-frame)))
         (ilist initial-frame-alist)
         (nCHeight (frame-height))
         (nCWidth (frame-width))
         (tMargin (if (integerp (cdr (assoc 'top rlist)))
                      (cdr (assoc 'top rlist)) 0))
         (lMargin (if (integerp (cdr (assoc 'left rlist)))
                      (cdr (assoc 'left rlist)) 0))
         buf
         (file "~/.emacs.d/.framesize.el"))
    (if (get-file-buffer (expand-file-name file))
        (setq buf (get-file-buffer (expand-file-name file)))
      (setq buf (find-file-noselect file)))
    (set-buffer buf)
    (erase-buffer)
    (insert (concat
             ;; 初期値をいじるよりも modify-frame-parameters
             ;; で変えるだけの方がいい?
             "(delete 'width initial-frame-alist)\n"
             "(delete 'height initial-frame-alist)\n"
             "(delete 'top initial-frame-alist)\n"
             "(delete 'left initial-frame-alist)\n"
             "(setq initial-frame-alist (append (list\n"
             "'(width . " (int-to-string nCWidth) ")\n"
             "'(height . " (int-to-string nCHeight) ")\n"
             "'(top . " (int-to-string tMargin) ")\n"
             "'(left . " (int-to-string lMargin) "))\n"
             "initial-frame-alist))\n"
             ;;"(setq default-frame-alist initial-frame-alist)"
             ))
    (save-buffer)
    ))

(defun my-window-size-load ()
  (let* ((file "~/.emacs.d/.framesize.el"))
    (if (file-exists-p file)
        (load file))))

(my-window-size-load)

;; Call the function above at C-x C-c.
(defadvice save-buffers-kill-emacs
  (before save-frame-size activate)
  (my-window-size-save))
