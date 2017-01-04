(use-package helm
  :config
  (use-package helm-ls-git
    :config
    (setq helm-ls-git-fuzzy-match t)
    )
  
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x C-r") 'helm-recentf)
  (global-set-key (kbd "C-x C-b") 'helm-mini)
  (global-set-key (kbd "C-x f") 'helm-ls-git-ls)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  ;;  (global-set-key (kbd "C-x C-b") 'helm-bookmarks)
  
  
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-locate-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  )
