(use-package ivy
  :init
  (use-package counsel)
  (use-package swiper)
  (use-package hydra)
  (use-package ivy-hydra)
  :diminish ivy-mode
  :bind
  (
   ("C-s" . counsel-grep-or-swiper)
   ("C-S-s" . swiper-all)
   ("C-M-s" . counsel-git-grep)
   ("C-x C-f" . counsel-find-file)
   ("M-x" . counsel-M-x)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-variable)
   ("<f1> l" . counsel-find-library)
   ("C-c C-r" . ivy-resume)
   ("C-h C-k" . counsel-descbinds)
   :map ivy-mode-map
   ("C-'" . ivy-avy)
   :map counsel-git-grep-map
   ("C-h" . counsel-git-grep-query-replace)
   )
  :config

  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  (setq ivy-re-builders-alist
        '((read-file-name-internal . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  (setq ivy-count-format "(%d/%d) ")
  (setq counsel-git-cmd "git ls-files --full-name -- && git ls-files . --exclude-standard --others")
  (define-key ivy-minibuffer-map (kbd "C-h") 'swiper-query-replace)
  
  (global-set-key (kbd "C-s") 'counsel-grep-or-swiper)
  (global-set-key (kbd "C-S-s") 'swiper-all)
  (global-set-key (kbd "C-M-s") 'counsel-git-grep)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)

  (global-set-key (kbd "C-x f") 'counsel-git)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)

  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-h C-k") 'counsel-descbinds)
  )
