
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

    (add-to-list 'load-path "~/.emacs.d/evil")
    (require 'evil)
    (evil-mode 1)
    (load "~/.emacs.d/norang.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (manoj-dark)))
 ;;'(org-agenda-files
 ;;  (quote
 ;;   ("~/git/org/unito.org" "~/git/org/mine.org" "/home/manto89/git/org/diary.org" "/home/manto89/git/org/refile.org")))
 '(org-agenda-files
    (quote
      ("~/git/org/")
      )
    )
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button))))))
(setq org-image-actual-width nil)
(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))
