;; ---------------------------------------------------------------------------
;; Navigation
;; ---------------------------------------------------------------------------

(use-package expand-region
  :ensure expand-region
  :bind ("C-=" . er/expand-region))

(use-package change-inner

  :bind (("M-i" . change-inner)
         ("M-o" . change-outer)))

(use-package multiple-cursors
  :config

  (global-set-key (kbd "C-d") 'delete-char)
  (global-set-key (kbd "C-S-d") 'mc/mark-next-like-this)
  )

(use-package ace-window
  :bind (("C-x o" . ace-window)
         ("M-2" . ace-window))
  :init
  (setq aw-background nil)
  (setq aw-keys '(?a ?s ?d ?f ?i ?d ?h ?t ?n)))

(use-package avy
  :bind ("M-SPC" . avy-goto-char-2)
  :config
  (setq avy-background t))

(use-package ace-link
  :init
  (ace-link-setup-default))

(bind-key "C-x SPC" 'cycle-spacing)

(require 'saveplace) ; built-in
(setq-default save-place t)

(use-package move-text
  :config
  (move-text-default-bindings)
  )
;; ---------------------------------------------------------------------------
;; System
;; ---------------------------------------------------------------------------
(use-package async)
(setq paradox-github-token "b50d7930efba2b8c04a307e1245fb97ef4bedfbd")

(use-package paradox
  :config
  (setq paradox-execute-asynchronously t)
  )
;; (use-package nlinum
;;   :config
;;   (global-nlinum-mode t))

;; (use-package hungry-delete

;;   :diminish hungry-delete-mode
;;   :init
;;   (global-hungry-delete-mode))

(use-package browse-kill-ring

  :bind ("C-x C-y" . browse-kill-ring)
  :config
  (setq browse-kill-ring-quit-action 'kill-and-delete-window))

(setq save-interprogram-paste-before-kill t)

(use-package which-key
  :diminish which-key-mode
  :init
  (which-key-mode)
  :config
  (setq which-key-popup-type 'minibuffer)
  )

(use-package help-fns+
  :bind ("C-h M-k" . describe-keymap)) ; For autoloading.

(use-package discover-my-major
  :bind ("C-h C-m" . discover-my-major))

(use-package restclient
  )

(use-package comment-dwim-2
  :ensure t
  :bind ("M-;" . comment-dwim-2))
;; ---------------------------------------------------------------------------
;; Git
;; ---------------------------------------------------------------------------
(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  )
(use-package git-gutter
  :diminish git-gutter-mode
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

(use-package company
  :config
   (global-company-mode))

;; (use-package auto-complete
;;   :diminish auto-complete-mode
;;   :config
;;   (ac-config-default)
;;   (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;;   )

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
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1)
  )
;; ---------------------------------------------------------------------------
;; Themes
;; ---------------------------------------------------------------------------
(use-package blackboard-theme)
