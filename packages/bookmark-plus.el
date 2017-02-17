(use-package bookmark+
  :config
  (global-set-key [f9] 'counsel-bookmark)
  (global-set-key [f11] 'bookmark-set)
  (setq bookmark-default-file "~/.emacs.d/bookmarks")  ;define file to use.
  (setq bookmark-save-flag 1)  ;save bookmarks to .emacs.bmk after each entry
  )
