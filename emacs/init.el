(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)



(setq x-select-enable-clipboard nil)

(global-display-line-numbers-mode)

(add-to-list 'default-frame-alist
           '(font . "Iosevka-13"))

(require 'org)

(setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))

(setq org-startup-truncated 'nil)

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; package list
(setq my-packages
      '(
	use-package
	magit
	rust-mode
	go-mode
	multiple-cursors
	company
	smex
	
	;; themes and customization
	spacemacs-theme
	doom-modeline
	nerd-icons

	;; other
	ox-hugo
	))


(defun my/install-packages ()
  "Automatically install packages in `my-packages' if missing."
  ;; Refresh package metadata (optional but ensures latest versions)
  (unless package-archive-contents
    (package-refresh-contents))
  ;; Iterate over `my-packages' and install missing ones
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (message "Installing missing package: %s" package)
      (package-install package))))
 
;; Run the installation function when Emacs starts
(my/install-packages)

;; theme
(load "~/.emacs.d/masked-theme")

(load-theme 'masked t)
      
;; smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; setup company mode
(add-hook 'after-init-hook 'global-company-mode)

;; setup multiple cursors
(require 'multiple-cursors)

;; (use-package rust-mode
;;   :defer t
;;   :init (require 'rust-mode))

;; (use-package magit
;;   :defer t
;;   :init (require 'magit))

;; (use-package spacemacs-theme
;;   :defer t
;;   :init (load-theme 'spacemacs-dark t))

;; (use-package nerd-icons
;;   ;; :custom
;;   ;; The Nerd Font you want to use in GUI
;;   ;; "Symbols Nerd Font Mono" is the default and is recommended
;;   ;; but you can use any other Nerd Font if you want
;;   ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
;;   )

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))

;; (use-package ox-hugo
;;   :ensure t   ;Auto-install the package from Melpa
;;   :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
;;   :after ox)

;; (with-eval-after-load 'ox
;;   (require 'ox-hugo))

;; setup rust mode
(require 'rust-mode)

;; setup magit
(require 'magit)


(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

(global-set-key (kbd "C-c y") 'my/paste-from-clipboard)
(global-set-key (kbd "C-c w") 'my/copy-to-clipboard)

(global-set-key (kbd "C-c g") 'goto-line)

(global-set-key (kbd "C-c s") 'query-replace)

;; multiple cursors
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-#") 'mc/mark-all-like-this)

;; function def ;;
(defun my/paste-from-clipboard ()
  (interactive)
  (setq x-select-enable-clipboard t)
  (yank)
  (setq x-select-enable-clipboard nil))

(defun my/copy-to-clipboard ()
  (interactive)
  (setq x-select-enable-clipboard t)
  (kill-ring-save (region-beginning) (region-end))
  (setq x-select-enable-clipboard nil))

(defun rvbuf ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
