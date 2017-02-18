(use-package bookmark+
  :bind (("<f6>" . counsel-bookmark)
         ("C-<f6>" . bookmark-set))
  :config
  (setq bookmark-default-file "~/.emacs.d/bookmarks")  ;define file to use.
  (setq bookmark-save-flag 1)  ;save bookmarks to .emacs.bmk after each entry
  )
