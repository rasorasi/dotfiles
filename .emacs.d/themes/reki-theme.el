(deftheme reki
  "Reki color theme")

(custom-theme-set-faces
 'reki
 ;; 背景・文字・カーソル
 '(cursor ((t (:foreground "#f8f8f2"))))
 '(default ((t (:background "#10101a" :foreground "#78ff00"))))
 '(fringe ((t (:background "#10101a"))))
 ;; 選択範囲
 '(region ((t (:background "#203D3D"))))

 ;; モードライン
 '(mode-line ((t (:foreground "#200000" :background "#00fa9a"
;                  :box (:line-width 0 :color "#ffffff" :style released-button)
			      ))))
 '(mode-line-buffer-id ((t (:foreground nil :background nil))))
 ;'(mode-line-inactive ((t (:foreground "#7f1184" :background "#040004"
  ;                         :box (:line-width 1 :color "#7f1184")))))

 ;; ハイライト
;; '(highlight ((t (:background "#FFFFFF")))) ;:foreground "#30ff30"
 '(hl-line ((t (:background "#120412"))))

 ;; 関数名
 '(font-lock-function-name-face ((t (:foreground "#00a1e9"))))

 ;; 変数名・変数の内容
 '(font-lock-variable-name-face ((t (:foreground "#a0d8ef"))))
 '(font-lock-string-face ((t (:foreground "#fad09e"))))

 ;; 特定キーワード
 '(font-lock-keyword-face ((t (:foreground "#00aef4"))))

 ;; Boolean
 '(font-lock-constant-face((t (:foreground "#9079b6"))))

 ;; 括弧
 '(show-paren-match-face ((t (:foreground "#1B1D1E" :background "#FD971F"))))
 '(paren-face ((t (:foreground "#A6E22A" :background nil))))

 ;; コメント
 '(font-lock-comment-face ((t (:foreground "#217e74"))))

 ;;行番号
 '(linum ((t (:foreground "#006046"))))

 ;; CSS
 '(css-selector ((t (:foreground "#66D9EF"))))
 '(css-property ((t (:foreground "#000000"))))

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

(provide-theme 'reki)
(set-frame-font "ricty-12")
