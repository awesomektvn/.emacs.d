(use-package helm
  :config
  (use-package helm-ls-git
    :config
    (setq helm-ls-git-fuzzy-match t)
    )
  (use-package helm-descbinds
    :config
    (helm-descbinds-mode)
    (global-set-key (kbd "C-h C-k") 'helm-descbinds)
    )
  (use-package helm-swoop)
  
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x C-r") 'helm-recentf)
  (global-set-key (kbd "C-x C-b") 'helm-mini)
  (global-set-key (kbd "C-x f") 'helm-ls-git-ls)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  ;;  (global-set-key (kbd "C-x C-b") 'helm-bookmarks)

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
        helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
        helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
        helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
        helm-ff-file-name-history-use-recentf t
        helm-echo-input-in-header-line t)

  
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-locate-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)

  ;; (defun fu/helm-find-files-navigate-forward (orig-fun &rest args)
  ;;   (if (file-directory-p (helm-get-selection))
  ;;       (apply orig-fun args)
  ;;     (helm-maybe-exit-minibuffer)))
  ;; (advice-add 'helm-execute-persistent-action :around #'fu/helm-find-files-navigate-forward)
  ;; (define-key helm-find-files-map (kbd "<return>") 'helm-execute-persistent-action)

  (defun fu/helm-find-files-navigate-back (orig-fun &rest args)
    (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
	(helm-find-files-up-one-level 1)
      (apply orig-fun args)))
  (advice-add 'helm-ff-delete-char-backward :around #'fu/helm-find-files-navigate-back)
  )
