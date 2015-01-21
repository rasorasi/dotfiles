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
 '(tool-bar-mode nil)
 '(menu-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;(setq initial-frame-alist
;;      '((top . 10) (left . 1000) (width . 98) (height . 52)))


(set-frame-font "ricty-12")
;;(add-to-list 'default-frame-alist '(font . "ricty-13.5"))


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

;; setting of modes
(defun my-c-mode-common-init ()
  "C, C++ mode set up function"
  (setq tab-width 4)
  (c-set-style "k&r")
  (setq c-basic-offset 4)
  (setq indent-tabs-mode t)
  (setq c-auto-newline nil))

(add-hook 'c-mode-hook 'my-c-mode-common-init)
(add-hook 'c++-mode-hook 'my-c-mode-common-init) 

;;python-mode
(add-hook 'python-mode-hook
      '(lambda()
         (setq indent-tabs-mode t)
         (setq indent-level 4)
         (setq python-indent 4)
         (setq tab-width 4)))



;; keybinds

(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)
(global-set-key (kbd "C-c b ") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c o") 'windmove-right)

(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <left> ") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)


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
;;(global-set-key (kbd "M-#") 'newline-and-indent)
;;(keyboard-translate ?\C-m ?\M-#)
(global-set-key (kbd "C-x C-b") (lambda()(interactive)(ibuffer-list-buffers)(switch-to-buffer-other-window '"*Ibuffer*")))

(global-set-key (kbd "M-q") 'query-replace-regexp)
(global-set-key (kbd "M-z") 'term)
(global-set-key (kbd "C-M-p") 'cua-scroll-down)
(global-set-key (kbd "C-M-n") 'cua-scroll-up)

(global-set-key [f6] 'revert-buffer)
		

;;(global-set-key (kbd "C-x C-z") 'change-favorite-command)
(defalias 'exit 'save-buffers-kill-emacs)



;;(global-set-key (kbd "M-r") ')
;;(global-set-key (kbd "M-v") ')
;;(global-set-key (kbd "C-v") ')
;;(global-set-key (kbd "M-z") ')
;;(global-set-key (kbd "M-t") ')
;;(global-set-key (kbd "M-l") ')


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
(global-set-key (kbd "C-c 4") (lambda()(interactive)(conf_theme 'haker ntheme)(setq ntheme 'haker)))
(global-set-key (kbd "C-c 5") (lambda()(interactive)(conf_theme 'reki ntheme)(setq ntheme 'reki)))

( global-set-key (kbd "C-c 0")(lambda()(interactive)(disable-theme ntheme)))




(defun kill-region-or-delete-window (beg end)
  (interactive "r")
  (if mark-active 
      (kill-region beg end)
    (delete-window)))			 ; change favorit command
(global-set-key (kbd "C-w") 'kill-region-or-delete-window)



;;input method "mozc" and utf-8
(when (require 'ibus nil t)
  (add-hook 'after-init-hook 'ibus-mode-on)
  (ibus-define-common-key ?\C-\s nil)
  (setq ibus-cursor-color '("firebrick" "dark orange" "royal blue")))


(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(global-set-key (kbd "C-\\") 'toggle-input-method)

;;(set-fontset-font
;; nil
;; 'japanese-jisx0208
;; (font-spec :family "Droid Sans Japanese")) ;; font

(setq face-font-rescale-alist
      '(("Droid Sans Japanese" . 1.2)))

(setq default-file-name-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)


;;(setq auto-mode-alist
;;      (append '(("\\.tex$" . yatex-mode)) auto-mode-alist))
;;(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;;(add-hook 'yatex-mode-hook 'font-latex-setup)
;;(add-hook 'yatex-mode-hook 'turn-on-font-lock 'append)
;; 
;;(cond
;; ((featurep 'font-lock)
;;  (defface font-latex-math-face
;;    '((((class grayscale) (background dark)) 
;;       (:foreground "DimGray" :underline t))
;;      ;;(((class grayscale) (background dark)) 
;;      ;;(:foreground "LightGray" :underline t))
;;      ;;(((class color) (background dark)) (:foreground "SaddleBrown"))
;;      ;;(((class color) (background dark))  (:foreground "burlywood"))
;;      (t (:underline t)))
;;    "Font Lock mode face used to highlight math in LaTeX."
;;    :group 'font-latex-highlighting-faces)
;;  
;;  (defface font-latex-label-face
;;    '((((class static-color)) (:foreground "yellow" :underline t))
;;      (((type tty)) (:foreground "yellow" :underline t))
;;      (((class color) (background dark)) (:foreground "pink"))
;;      (((class color) (background dark)) (:foreground "ForestGreen"))
;;      (t (:bold t :underline t)))
;;    "Font Lock mode face used to highlight labels."
;;    :group 'font-lock-faces)))
;; 
;;(setq YaTeX-font-lock-formula-face 'font-latex-math-face
;;      YaTeX-font-lock-label-face 'font-latex-label-face)


;;paren-mode
(setq show-paren-delay 0)
(show-paren-mode t)
;;hilight in paren
(setq show-parenpstyle 'expression)
;;change paren of face
;;(set-face-background 'show-paren-match-face "yellew")

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
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  
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

(when (require 'popwin nil t)
(push '(direx:direx-mode :position left :windth 40 :dedicated t)
      popwin:special-display-config))

(require 'color-moccur)

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
  
  ;;(when (and (executable-find "cmigemo")
  ;;           (require 'migemo nil t))
  ;; (require 'anything-migemo nil t))
  
  (when (require 'anything-complete nil t)
    ;;
    (anything-lisp-complete-symbol-set-timer 150))
  
  (require 'anything-show-completion nil t)
  
  (when (require 'auto-install nil t)
    (require 'anything-auto-install nil t))
  
  (when (require 'descbinds-anything nil t)
    ;;
    (descbinds-anything-install))

  (global-set-key (kbd "C-z") 'anything)
  (global-set-key (kbd "M-y") 'anything-show-kill-ring)
  (global-set-key (kbd "M-m") 'anything-imenu)

  (when (require 'anything-c-moccur nil t)
    (setq
     anything-c-moccur-anything-idle-delay 0.1
     anything-c-moccur-higligt-info-line-flag t
     anything-c-moccur-enable-auto-look-flag t
     anything-c-moccur-enable-initial-pattern t)))


;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

(when (require 'recentf nil t)
(setq recentf-exclude '(".scratch$"
                        ".recentf$"
                        ".framesize.el$")))

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
(global-set-key (kbd "C-'") 'upcase-backward-word)
(defun upcase-backward-word (arg)
  "Convert previous word (or arg words) to upper case."
  (interactive "p")
  (upcase-word (- arg)))

(when (require 'point-undo nil t)
(global-set-key (kbd "C-;") 'point-undo)
(global-set-key (kbd "C-M-;") 'point-redo))

(when (require 'undo-tree nil t)
  (global-undo-tree-mode))


(setq howm-menu-lang 'ja)
(when (require 'howm-mode nil t)
  ;;(global-set-key (kbd "C-c , ,") 'howm-menu)
  (autoload 'howm-menu "howm-mode" "Hitori Otegaru Wiki Modoki" t)

  (define-key howm-mode-map (kbd "C-x C-s")
    (lambda()(interactive)(save-buffer) (kill-buffer nil) (howm-menu)))

 ;; (define-key howm-view-summary-mode-map "D" 'delete-howm-file)
)


(when (require 'tramp nil t)
  (setq tramp-default-method "ssh"))


(when (require 'zlc nil t)
(setq zlc-select-completion-immediately t))


(when (require 'server nil t)
(unless (server-running-p)
  (server-start)))


(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)
 
(when (require 'edit-server nil t)
  (edit-server-start))



;;;; flymakeパッケージを読み込み
;;(when (require 'flymake nil t)
;;  ;; 全てのファイルでflymakeを有効化
;;  (add-hook 'find-file-hook 'flymake-find-file-hook)
;;  
;;  ;; miniBufferにエラーを出力
;;  (defun flymake-show-and-sit ()
;;    "Displays the error/warning for the current line in the minibuffer"
;;    (interactive)
;;    (progn
;;      (let* ((line-no (flymake-current-line-no) )
;; 	     (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
;; 	     (count (length line-err-info-list)))
;; 	(while (> count 0)
;; 	  (when line-err-info-list
;; 	    (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
;; 		   (full-file
;; 		    (flymake-ler-full-file (nth (1- count) line-err-info-list)))
;; 		   (text (flymake-ler-text (nth (1- count) line-err-info-list)))
;; 		   (line (flymake-ler-line (nth (1- count) line-err-info-list))))
;; 	      (message "[%s] %s" line text)))
;; 	  (setq count (1- count)))))
;;    (sit-for 60.0))
;;  (global-set-key "\C-cd" 'flymake-show-and-sit)
;;  
;;  ;; flymakeの色を変更
;;  (set-face-background 'flymake-errline "red4")
;;  (set-face-background 'flymake-warnline "dark slate blue")
;;  
;;;; Makefile が無くてもC/C++のチェック
;;  (defun flymake-simple-generic-init (cmd &optional opts)
;;    (let* ((temp-file  (flymake-init-create-temp-buffer-copy
;; 			'flymake-create-temp-inplace))
;; 	   (local-file (file-relative-name
;; 			temp-file
;; 			(file-name-directory buffer-file-name))))
;;      (list cmd (append opts (list local-file)))))
;;  
;;  (defun flymake-simple-make-or-generic-init (cmd &optional opts)
;;    (if (file-exists-p "Makefile")
;; 	(flymake-simple-make-init)
;;      (flymake-simple-generic-init cmd opts)))
;;  
;;  (defun flymake-c-init ()
;;    (flymake-simple-make-or-generic-init
;;     "gcc" '("-Wall" "-Wextra" "-pedantic" "-fsyntax-only")))
;;  
;;  (defun flymake-cc-init ()
;;    (flymake-simple-make-or-generic-init
;;     "g++" '("-Wall" "-Wextra" "-pedantic" "-fsyntax-only")))
;;  
;;  (push '("\\.c\\'" flymake-c-init) flymake-allowed-file-name-masks)
;;  (push '("\\.\\(cc\\|cpp\\|C\\|CPP\\|hpp\\)\\'" flymake-cc-init)
;; 	flymake-allowed-file-name-masks))

(when (require 'helm-config nil t)
  (require 'helm-descbinds)
  (helm-mode 1)
  (global-set-key (kbd "C-z") 'helm-mini)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-s") 'helm-c-moccur-occur)
  (define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))

  )


;;(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;;(run-with-idle-timer 2 t ')
;;session.el
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

(load "csharp-mode-0.8.5.el")

(when (require 'highlight-symbol nil t)
  (global-set-key (kbd "M-l") 'highlight-symbol-at-point))


(defun make-other-buffer-below ()
  (split-window-below)
  (windmove-down)
  (helm-mini))


(defun make-other-buffer-right ()
  (split-window-right)
  (windmove-right)
  (helm-mini))


(global-set-key (kbd "C-x C-2") (lambda()(interactive)(make-other-buffer-below)))
(global-set-key (kbd "C-x C-3") (lambda()(interactive)(make-other-buffer-right)))

;;(load "user1.el")
(load "user2.el")



(require 'python-environment)
(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")

(setq tab_mode 0)

(require 'whitespace)

(global-set-key (kbd "C-x p") (lambda()(interactive)
				(cond ((equal tab_mode 0)
				       (setq whitespace-display-mappings
					     '((space-mark ?\x3000 [?\□])
					       (tab-mark  ?\t     [?\xBB ?\t])))
				       (setq tab_mode 1))
				      ((equal tab_mode 1)
				       (setq whitespace-display-mappings
					     '((space-mark ?\x3000 [?\x3000])
					       (tab-mark  ?\t     [?\t])))
				       (setq tab_mode 0)))
				(global-whitespace-mode 1)))


(require 'python)				       
(require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:install-server)

(require 'twittering-mode)
(load "twit.el")

(require 'auto-complete-config)
(ac-config-default)


;;
;; YaTeX
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
(setq tex-command "~/.emacs.d/elisp/yatex1.77/texbin/ptex2pdf -u -l -ot '-synctex=1'")
;(setq tex-command "/usr/texbin/pdflatex -synctex=1")
;(setq tex-command "/usr/texbin/lualatex -synctex=1")
;(setq tex-command "/usr/texbin/luajitlatex -synctex=1")
;(setq tex-command "/usr/texbin/xelatex -synctex=1")
;(setq tex-command "/usr/texbin/latexmk")
;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/mendex %O -U -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/mendex %O -U -o %D %S/' -e '$dvips=q/dvips %O -z -f %S | convbkmk -u > %D/' -e '$ps2pdf=q/ps2pdf %O %S %D/' -norc -gg -pdfps")
;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/pdflatex %O -synctex=1 %S/' -e '$bibtex=q/bibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/makeindex %O -o %D %S/' -norc -gg -pdf")
;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/lualatex %O -synctex=1 %S/' -e '$bibtex=q/bibtexu %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/makeindex %O -o %D %S/' -norc -gg -pdf")
;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/luajitlatex %O -synctex=1 %S/' -e '$bibtex=q/bibtexu %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/makeindex %O -o %D %S/' -norc -gg -pdf")
;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/xelatex %O -synctex=1 %S/' -e '$bibtex=q/bibtexu %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/makeindex %O -o %D %S/' -norc -gg -pdf")
(setq bibtex-command "/usr/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/mendex %O -U -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq makeindex-command "/usr/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/mendex %O -U -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq dvi2-command "/usr/bin/open -a Skim")
;(setq dvi2-command "/usr/bin/open -a Preview")
;(setq dvi2-command "/usr/bin/open -a TeXShop")
;(setq dvi2-command "/Applications/TeXworks.app/Contents/MacOS/TeXworks")
;(setq dvi2-command "/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only")
(setq tex-pdfview-command "/usr/bin/open -a Skim")
;(setq tex-pdfview-command "/usr/bin/open -a Preview")
;(setq tex-pdfview-command "/usr/bin/open -a TeXShop")
;(setq tex-pdfview-command "/Applications/TeXworks.app/Contents/MacOS/TeXworks")
;(setq tex-pdfview-command "/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only")
(setq dviprint-command-format "/usr/bin/open -a \"Adobe Reader\" `echo %s | gsed -e \"s/\\.[^.]*$/\\.pdf/\"`")

(defun skim-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process  
      "displayline"
      nil
      "/Applications/Skim.app/Contents/SharedSupport/displayline"
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      buffer-file-name))))

(add-hook 'yatex-mode-hook
          '(lambda ()
	     (define-key YaTeX-mode-map [f4] 'YaTeX-typeset-menu)
             (define-key YaTeX-mode-map (kbd "C-c s") 'skim-forward-search)))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))


;;
;; RefTeX with YaTeX
;;
;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

(global-linum-mode t)
;;(pdf-tools-install)
;;(setq pdf-isearch-minor-mode t)
;;(setq pdf-sync-minor-mode t)
;;(setq pdf-links-do-action t)


;;(require 'term+mux)
;;(require 'xterm-256color)
;;(require 'term+key-intercept)
;;(require 'term+mode)
;;(term+mux-new)
