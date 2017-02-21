(global-unset-key (kbd "<f2>"))

;; (global-set-key (kbd "<f2> r 1") (lambda () (interactive) (shell-command "xfce4-terminal --working-directory=/home/anhnhoktvn/Documents/prod/tracker -e 'bash -c \"npm run dev;bash\"'")))
(global-set-key (kbd "<f2> k ,") (lambda () (interactive) (set-mark-command nil)(set-mark-command nil)(end-of-line)(insert ",")(set-mark-command 1)))

(bind-keys :prefix-map f2-map
           :prefix "<f2>"
           ("<f2>" . keyboard-quit)
           ("b" . counsel-bookmark)
           ("B" . bookmark-set)
           ("c" . calc)
           ("C" . calendar)
           ("d" . ediff-buffers)
           ("e" . eshell-here)
           ("E" . eww)
           ("h" . keyfreq-show)
           ("l" . paradox-list-packages)
           ("u" . paradox-upgrade-packages)
           ("o" . (lambda () (interactive) (counsel-find-file "~/org")))
           ("p l" . paradox-list-packages)
           ("p u" . paradox-upgrade-packages)
           ("P" . proced)
           ("s" . scratch)

           ("r" . (lambda () (interactive) (shell-command "xfce4-terminal --working-directory=/home/anhnhoktvn/Documents/prod/tracker-mobi -e 'bash -c \"npm run dev;bash\"'")))
           )

(which-key-add-key-based-replacements
  "<f2> o" "org files"
  "<f2> r" "track build"
  )
