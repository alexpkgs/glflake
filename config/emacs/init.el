;; Emacs Configuration

;; Font
(add-to-list 'default-frame-alist '(font . "Fira Code Light 12"))
(set-face-attribute 'default t :font "Fira Code Light 12")
(set-face-attribute 'default nil :font "Fira Code Light 12")
(set-frame-font "Fira Code Light 12" nil t)

;; UI Stuff
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode +1)

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Custom
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; GCMH
(use-package gcmh :ensure t :init
  (gcmh-mode +1))

;; Evil
(use-package evil :ensure t :init
  (evil-mode +1))

;; Kanagawa
(use-package almost-mono-themes :ensure t
  :init (load-theme 'almost-mono-black t))

;; Smartparens
(use-package smartparens :ensure t
  :init (smartparens-global-mode)
  (require 'smartparens-config))

;; Ivy
(use-package ivy :ensure t
  :init (ivy-mode))

;; Start screen
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "alex")

;; Doom thingy
(use-package mood-line :ensure t
  :config (mood-line-mode)
  :custom (mood-line-glyph-alist mood-line-format-default-extended))

;; Typescript
(use-package typescript-mode :ensure t)
(use-package lsp-ui :ensure t)
(use-package tree-sitter-langs :ensure t :defer t)
(add-to-list 'auto-mode-alist '("\\.js?\\'" . typescript-mode))
(add-hook 'typescript-mode-hook #'lsp)
(add-hook 'lsp-mode-hook #'tree-sitter-hl-mode)

;; Welcome
(defun ar/show-welcome-buffer ()
  "Show *Welcome* buffer."
  (with-current-buffer (get-buffer-create "*Welcome*")
    (setq truncate-lines t)
    (let* ((buffer-read-only)
           (image-path "~/.config/emacs/river.png")
           (image (create-image image-path))
           (size (image-size image))
           (height (cdr size))
           (width (car size))
           (top-margin (floor (/ (- (window-height) height) 2)))
           (left-margin (floor (/ (- (window-width) width) 2)))
           (prompt-title "Welcome To River!"))
      (erase-buffer)
      (setq mode-line-format nil)
      (goto-char (point-min))
      (insert (make-string top-margin ?\n))
      (insert (make-string left-margin ?\ ))
      (insert-image image)
      (insert "\n\n\n")
      (insert (make-string (floor (/ (- (window-width) (string-width prompt-title)) 2)) ?\ ))
      (insert prompt-title))
    (setq cursor-type nil)
    (read-only-mode +1)
    (switch-to-buffer (current-buffer))
    (local-set-key (kbd "q") 'kill-this-buffer)))

(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)

(when (< (length command-line-args) 2)
  (add-hook 'emacs-startup-hook (lambda ()
                                  (when (display-graphic-p)
                                    (ar/show-welcome-buffer)))))
