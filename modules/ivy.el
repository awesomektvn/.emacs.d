(use-package ivy
  :init
  (use-package counsel)
  (use-package swiper)
  (use-package hydra)
  (use-package ivy-hydra)
  :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
        ("C-'" . ivy-avy))
  :config
  
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; ;; number of result lines to display
  ;; (setq ivy-height 10)
  ;; ;; does not count candidates
  ;; (setq ivy-count-format "")
  ;; ;; no regexp by default
  ;; (setq ivy-initial-inputs-alist nil)
  ;; ;; configure regexp engine.
  (setq ivy-re-builders-alist
        '((read-file-name-internal . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))

  (setq ivy-count-format "(%d/%d) ")
  (setq counsel-git-cmd "git ls-files --full-name -- && git ls-files . --exclude-standard --others")
  
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)

  (global-set-key (kbd "C-x f") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-h C-k") 'counsel-descbinds)
  )
