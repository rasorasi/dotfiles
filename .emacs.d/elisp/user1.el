(run-with-idle-timer (* 60 30) t
                     (lambda()(interactive)
                       (find-file '"~/.emacs.d/themes/sinku2.jpg")
                       (message "進捗どうですか？")))

(conf_theme 'reki ntheme)
(setq ntheme 'reki)
