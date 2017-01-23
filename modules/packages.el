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

(use-package avy
  :config
  (global-set-key (kbd "C-:") 'avy-goto-char)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
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
  (global-set-key [f9] 'counsel-bookmark)
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
(use-package emmet-mode
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
  )
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  ;; adjust indents for web-mode to 2 spaces
  (defun my-web-mode-hook ()
    "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2))
  (add-hook 'web-mode-hook  'my-web-mode-hook)
  )

(use-package js2-mode
  :config
  (add-hook 'js-mode-hook 'js2-minor-mode)
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
