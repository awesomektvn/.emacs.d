;; Don't jank backups errywhere
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/backups"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t) ; use versioned backups


;; Fuck GUI shit
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; Always highlight parens
(show-paren-mode 1)

;; Show column numbers
(setq column-number-mode t)

;; show line number
;(global-linum-mode t)

(setq set-mark-command-repeat-pop t)

;; auto pair
(electric-pair-mode 1)
;; make electric-pair-mode work on more brackets
;; (setq electric-pair-pairs '(
;;                             (?\" . ?\")
;;                             (?\' . ?\')
;;                             (?\{ . ?\})
;;                             ) )
(use-package smartparens
  :diminish smartparens-mode
  :config
  (smartparens-global-mode t))
;; indent js file
(setq js-indent-level 2)

(diminish 'auto-revert-mode)

;; Use a better unique buffer naming scheme
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Tabs to Spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 2) ; or any other preferred value

;; Overrite/delete selected region
(delete-selection-mode t)

;; Better char search
(setq search-default-mode #'char-fold-to-regexp)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Encoding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(setq-default default-buffer-file-coding-system 'utf-8-unix)

;; ---------------------------------------------------------------------------
;; Shell
;; ---------------------------------------------------------------------------
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)

;; ---------------------------------------------------------------------------
;; handy functions
;; ---------------------------------------------------------------------------
(defun my-expand-file-name-at-point ()
  "Use hippie-expand to expand the filename"
  (interactive)
  (let ((hippie-expand-try-functions-list '(try-complete-file-name-partially try-complete-file-name)))
    (call-interactively 'hippie-expand)))

(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%d.%m.%Y")
                 ((equal prefix '(4)) "%Y-%m-%d")
                 ((equal prefix '(16)) "%A, %d. %B %Y")))
        (system-time-locale "de_DE"))
    (insert (format-time-string format))))

(defun indent-buffer ()
  "Indent the current buffer."
  (interactive)
  (indent-region (point-min) (point-max)))


(defun untabify-buffer ()
  "Untabify the current buffer."
  (interactive)
  (untabify (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a cleanup operations on a buffer, tabs to spaces, re-indent, trim whitespace."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))
;; ---------------------------------------------------------------------------
;; Launcher
;; ---------------------------------------------------------------------------

(defun scratch ()
  (interactive)
  (switch-to-buffer-other-window (get-buffer-create "*scratch*")))

(bind-keys :prefix-map launcher-map
           :prefix "C-x l"
           ("A" . ansi-term) ;; save "a" for open-agenda
           ("c" . calc)
           ("C" . calendar)
           ("d" . ediff-buffers)
           ("e" . eshell)
           ("E" . eww)
           ("h" . man)
           ("l" . paradox-list-packages)
           ("u" . paradox-upgrade-packages)
           ("p l" . paradox-list-packages)
           ("p u" . paradox-upgrade-packages)
           ("P" . proced)
           ("s" . scratch)
           ("@" . (lambda () (interactive) (find-file "~/org/tasks.org"))))
;; ---------------------------------------------------------------------------
;; Key bindings
;; ---------------------------------------------------------------------------
(global-unset-key (kbd "<f2>"))
(global-set-key (kbd "<f2> b b") 'counsel-bookmark)
(global-set-key (kbd "<f2> f 1") (lambda () (interactive) (find-file "~/org/tasks.org")))
(global-set-key (kbd "<f2> f 2") (lambda () (interactive) (bookmark-jump "tasks.org")))
(global-set-key (kbd "<f2> f 3") (lambda () (interactive) (find-file "~/org/tracker.org")))

;; (global-set-key (kbd "<f2> r 1") (lambda () (interactive) (shell-command "xfce4-terminal --working-directory=/home/anhnhoktvn/Documents/prod/tracker -e 'bash -c \"npm run dev;bash\"'")))
(global-set-key (kbd "<f2> r") (lambda () (interactive) (shell-command "xfce4-terminal --working-directory=/home/anhnhoktvn/Documents/prod/tracker-mobi -e 'bash -c \"npm run dev;bash\"'")))
(global-set-key (kbd "<f2> k ,") (lambda () (interactive) (set-mark-command nil)(set-mark-command nil)(end-of-line)(insert ",")(set-mark-command 1)))

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c TAB") 'indent-buffer)
(global-set-key (kbd "C-c C-c TAB") 'cleanup-buffer)
(global-set-key (kbd "C-x 5") 'toggle-window-split)

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'my-expand-file-name-at-point)

(define-prefix-command 'toggle-map)
(bind-key "C-x t" 'toggle-map)
(bind-keys :map toggle-map
           ("d" . toggle-debug-on-error)
           ("l" . linum-mode)
           ("o" . org-mode)
           ("t" . text-mode)
           ("w" . whitespace-mode))
