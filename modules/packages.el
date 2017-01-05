;; ---------------------------------------------------------------------------
;; Navigation
;; ---------------------------------------------------------------------------

(use-package expand-region
  :ensure expand-region
  :bind ("C-=" . er/expand-region))

(use-package multiple-cursors
  :config
  
  (global-set-key (kbd "C-d") 'delete-char)
  (global-set-key (kbd "C-S-d") 'mc/mark-next-like-this)
  )

(use-package ace-jump-mode
  :config
  (global-set-key (kbd "C-,") 'ace-jump-mode)
  )

(require 'saveplace) ; built-in
(setq-default save-place t)
;; ---------------------------------------------------------------------------
;; Git
;; ---------------------------------------------------------------------------
(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  )
(use-package git-gutter
  :config
  (global-git-gutter-mode +1)
  )
;; ---------------------------------------------------------------------------
;; Bookmark
;; ---------------------------------------------------------------------------
(use-package bookmark+
  :config
  (global-set-key [f9] 'helm-bookmarks)
  (global-set-key [f11] 'bookmark-set)
  (setq bookmark-default-file "~/.emacs.d/bookmarks")  ;define file to use.
  (setq bookmark-save-flag 1)  ;save bookmarks to .emacs.bmk after each entry
  )

;; ---------------------------------------------------------------------------
;; Project
;; ---------------------------------------------------------------------------
(use-package projectile
  :config
  )
;; ---------------------------------------------------------------------------
;; Autocomplete
;; ---------------------------------------------------------------------------

(use-package auto-complete
  :config
  (ac-config-default)
  )
;; ---------------------------------------------------------------------------
;; Appearance
;; ---------------------------------------------------------------------------
(use-package powerline
  :config
  (powerline-default-theme)
  )
;; ---------------------------------------------------------------------------
;; Web development
;; ---------------------------------------------------------------------------

(use-package php-mode
  )
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  )

;; ---------------------------------------------------------------------------
;; Snippet
;; ---------------------------------------------------------------------------
(use-package yasnippet
  :config
  (yas-global-mode 1)
  )
;; ---------------------------------------------------------------------------
;; Themes
;; ---------------------------------------------------------------------------
(use-package blackboard-theme)
