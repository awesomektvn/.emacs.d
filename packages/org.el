(setq org-log-done 'time)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(custom-set-variables '(org-agenda-files (quote ("~/org")))
                      '(org-todo-keywords (quote ((sequence "TODO(t)" "WIP(w)" "DONE(d)"))))
                      )

