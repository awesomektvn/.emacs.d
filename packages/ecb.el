(use-package ecb
  :commands (ecb-activate ecb-deactivate)
  :config
  ;; (setq ecb-new-ecb-frame nil)
  (setq ecb-layout-name 'left10)
  (setq ecb-windows-height 0.20)
  (setq ecb-windows-width 0.20)
  (setq ecb-compile-window-height nil)
  ;; (defvar ecb-examples-bufferinfo-buffer-name nil "otherwise it complains.")
  ;; (setq ecb-compile-window-height nil)
  ;; (setq ecb-display-news-for-upgrade nil)
  ;; ;;(setq ecb-display-upgraded-options nil)
  (setq ecb-tip-of-the-day nil)
  (setq ecb-show-sources-in-directories-buffer 'always)
  :bind
  ("<f7>" . ecb-minor-mode)
)
