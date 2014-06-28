(deftheme jpaper
  "Jpaper color theme")

(custom-theme-set-faces
 'jpaper
 ;; 背景・文字・カーソル
 '(cursor ((t (:foreground "#180614"))))
 '(default ((t (:background "#ffffdf" :foreground "#180614"))))
 ;; 左右のライン
 '(fringe ((t (:background "#ffffdf"))))
 ;; 選択範囲
 '(region ((t (:background "#deb068"))))

 ;; モードライン
 '(mode-line ((t (:foreground "#f8b862" :background "#762f07"
                  :box (:line-width 1 :color "#f39800" :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground nil :background nil))))
 '(mode-line-inactive ((t (:foreground "#bc763c" :background "lidcd3b2"
                           :box (:line-width 1 :color "#bc763c")))))

 ;; ハイライト
;; '(highlight ((t (:background "#FFFFFF")))) ;:foreground "#30ff30" 
 '(hl-line ((t (:background "#120412"))))

 ;; 関数名
 '(font-lock-function-name-face ((t (:foreground "#2ca9e1"))))

 ;; 変数名・変数の内容
 '(font-lock-variable-name-face ((t (:foreground "#008899"))))
 '(font-lock-string-face ((t (:foreground "#928c36"))))

 ;; 特定キーワード
 '(font-lock-keyword-face ((t (:foreground "#e83929"))))

 ;; Boolean
 '(font-lock-constant-face((t (:foreground "#e2041b"))))

 ;; 括弧
 '(show-paren-match-face ((t (:foreground "#1B1D1E" :background "#e7609e"))))
 '(paren-face ((t (:foreground "#e7609e" :background nil))))

 ;; コメント
 '(font-lock-comment-face ((t (:foreground "#595857"))))

;;行番号
 '(linum ((t (:foreground "#762f07"))))

 ;; CSS
 '(css-selector ((t (:foreground "#66D9EF"))))
 '(css-property ((t (:foreground "#000000"))))

;;;
'(toolbar ((t (:background "#000000"))))
'(blank-space-face ((t (:background "green" :foreground "red"))))
'(blank-space-face ((t (:background "green" :foreground "red"))))
'(custom-set-face ((t (:foreground "#000000"))))

 ;; nXML-mode
 ;; タグ名
 '(nxml-element-local-name ((t (:foreground "#009b9f"))))
 ;; 属性
 '(nxml-attribute-local-name ((t (:foreground "#66D9EF"))))
 ;; 括弧
 '(nxml-tag-delimiter ((t (:foreground "#A6E22A"))))
 ;; DOCTYPE宣言
 '(nxml-markup-declaration-delimiter ((t (:foreground "#74715D"))))

 ;; dired
 '(dired-directory ((t (:foreground "#A6E22A"))))
 '(dired-symlink ((t (:foreground "#66D9EF"))))

 ;; MMM-mode
 '(mmm-default-submode-face ((t (:foreground nil :background "#000000")))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jpaper)
(set-frame-font "ricty-12")
