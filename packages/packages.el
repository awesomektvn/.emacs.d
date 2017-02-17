;; ---------------------------------------------------------------------------
;; Navigation
;; --------------------------------------------------------------------------
(use-package multiple-cursors
  :config

  (global-set-key (kbd "C-d") 'delete-char)
  (global-set-key (kbd "C-S-d") 'mc/mark-next-like-this)
  )

(bind-key "C-x SPC" 'cycle-spacing)

(require 'saveplace) ; built-in
(setq-default save-place t)

;; ---------------------------------------------------------------------------
;; System
;; ---------------------------------------------------------------------------
;; (use-package hungry-delete

;;   :diminish hungry-delete-mode
;;   :init
;;   (global-hungry-delete-mode))

