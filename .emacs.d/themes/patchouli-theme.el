(deftheme patchouli
  "Patchouli color theme")

(custom-theme-set-faces
 'patchouli
 ;; 背景・文字・カーソル
 '(cursor ((t (:foreground "#f8f8f2"))))
 '(default ((t (:background "#141014" :foreground "#00ff00"))))
 '(fringe ((t (:background "#201020"))))
 ;; 選択範囲
 '(region ((t (:background "#403D3D"))))

 ;; モードライン
 '(mode-line ((t (:foreground "#9b72b0" :background "#7f1184"
                  :box (:line-width 1 :color "#000000" :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground nil :background nil))))
 '(mode-line-inactive ((t (:foreground "#7f1184" :background "#040004"
                           :box (:line-width 1 :color "#7f1184")))))

 ;; ハイライト
;; '(highlight ((t (:background "#FFFFFF")))) ;:foreground "#30ff30"
 '(hl-line ((t (:background "#120412"))))

 ;; 関数名
 '(font-lock-function-name-face ((t (:foreground "#00a1e9"))))

 ;; 変数名・変数の内容
 '(font-lock-variable-name-face ((t (:foreground "#a0d8ef"))))
 '(font-lock-string-face ((t (:foreground "#fad09e"))))

 ;; 特定キーワード
 '(font-lock-keyword-face ((t (:foreground "#f6ae54"))))

 ;; Boolean
 '(font-lock-constant-face((t (:foreground "#9079b6"))))

 ;; 括弧
 '(show-paren-match-face ((t (:foreground "#1B1D1E" :background "#FD971F"))))
 '(paren-face ((t (:foreground "#A6E22A" :background nil))))

 ;; コメント
 '(font-lock-comment-face ((t (:foreground "#618e34"))))

 ;;行番号
 '(linum ((t (:foreground "#47266e"))))

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

(provide-theme 'patchouli)
