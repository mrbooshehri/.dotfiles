(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)

(add-to-list 'default-frame-alist '(font . "Victor Mono"))
(set-face-attribute 'default t :font "Victor Mono")
(set-face-background  'region "color-17")
(set-face-foreground  'region "red")
(load-theme 'gruvbox t)


(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(neotree projectile dired-du dired-git-info dired-icon org gruvbox-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )