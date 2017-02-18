(use-package company
  :config
  (global-company-mode)
  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  (global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key
  )
