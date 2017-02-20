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
(defvar packages-dir (expand-file-name  "packages" user-emacs-directory))
(defvar personal-dir (expand-file-name  "personal" user-emacs-directory))
(defvar vendor-dir (expand-file-name "vendor" user-emacs-directory))

(mapc 'load (directory-files packages-dir 't "^[^#]*el$"))

(when (file-exists-p personal-dir)
  (message "Loading personal configuration files in %s..." personal-dir)
  (mapc 'load (directory-files personal-dir 't "^[^#]*el$")))

;; ---------------------------------------------------------------------------
;; Custom settings
;; ---------------------------------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
