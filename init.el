;; ---------------------------------------------------------------------------
;; Version check
;; ---------------------------------------------------------------------------

(let ((minver 24))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

;; ---------------------------------------------------------------------------
;; Melpa
;; ---------------------------------------------------------------------------

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(setq package-user-dir (concat user-emacs-directory "elpa"))

(package-initialize)

;; ---------------------------------------------------------------------------
;; Bootstrap
;; ---------------------------------------------------------------------------

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)
;; ---------------------------------------------------------------------------
;; Package Loading
;; ---------------------------------------------------------------------------

(defvar modules-dir (expand-file-name  "modules" user-emacs-directory))
(defvar personal-dir (expand-file-name  "personal" user-emacs-directory))
(defvar vendor-dir (expand-file-name "vendor" user-emacs-directory))

(message "Loading modules in %s..." modules-dir)
(mapc 'load (directory-files modules-dir 't "^[^#]*el$"))

(when (file-exists-p personal-dir)
  (message "Loading personal configuration files in %s..." personal-dir)
  (mapc 'load (directory-files personal-dir 't "^[^#]*el$")))

;; ---------------------------------------------------------------------------
;; Generated code
;; ---------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
   (quote
    ("d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" default)))
 '(org-agenda-files (quote ("d:/test.org")))
 '(org-todo-keywords (quote ((sequence "TODO(t)" "DONE(d)"))))
 '(package-selected-packages
   (quote
    (helm-descbinds git-gutter blackboard-theme magit powerline projectile yasnippet web-mode use-package php-mode multiple-cursors helm-ls-git expand-region bookmark+ auto-complete ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
