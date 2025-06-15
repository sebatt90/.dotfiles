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

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
	  use-package-expand-minimally t))

(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

(global-set-key (kbd "C-c y") 'my/paste-from-clipboard)
(global-set-key (kbd "C-c w") 'my/copy-to-clipboard)

(global-set-key (kbd "C-c g") 'goto-line)

(global-set-key (kbd "C-c s") 'query-replace)

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
