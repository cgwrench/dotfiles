;;;; Emacs initialisation file.
;;;; Chris Wrench, <c.g.wrench@gmail.com>

; Generic emacs customisations

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Separate "custom" file.
(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

(setq load-home-init-file t) ; don't load init file from ~/.xemacs/init.el

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Control creation of backup files (ending in `~`)
(setq backup-directory-alist `(("." . "~/.backup_files")))
(setq backup-by-copying t
  delete-old-versions t
  version-control t)

;; Display line and column numbers on the status line
(setq line-number-mode   t)
(setq column-number-mode t)

;; Line number
(require 'linum)
(global-linum-mode)

;; Emacs gurus don't need no stinking scroll/menu/tool bars
(scroll-bar-mode -1)
(tool-bar-mode -1)
;(menu-bar-mode -1) ;; Ok, maybe just the menu bar.

(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 80))

;; Line-wrapping
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Turn on font-lock mode
(global-font-lock-mode t)

;; Always end a file with a newline
(setq require-final-newline t)

;; Do not use tabs!
(setq-default indent-tabs-mode nil)

;; Flash the screen on error; don't beep
(setq visible-bell t)

;; Enable mouse wheel scrolling
(mouse-wheel-mode t)

;; Ordinarily emacs jumps by half a page when scrolling - reduce this to 1 line
(setq scroll-step 1)

(setq delete-auto-save-files t)		; no "#" files after a save
(setq auto-save-list-file-prefix nil)	; don't record sessions

;; When saving files, set execute permission if #! is in first line.
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; When saving files, delete any trailing whitespace.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Adjust auto-mode-alist list, see <http://blog.plover.com/prog/elisp.html>.
(push '("\\.[tT]e[xX]\\'" . latex-mode) auto-mode-alist)
(push '("\\.[fF]\\'" . f90-mode) auto-mode-alist)

; Major mode configuration

;; Configuration related to org-mode.
(setq org-agenda-files (list "~/documents/main.org"))

(define-key global-map "\C-ca" 'org-agenda)

(setq org-archive-location "~/.org/%s_archive::")

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(add-hook 'org-mode-hook 'flyspell-mode)

;; Configuration related to Python-mode.
(add-hook 'python-mode-hook '(lambda ()
    (define-key python-mode-map "\C-m" 'newline-and-indent)))

;;; Enable Flyspell program mode: highlights all misspelled words in comments 
;;; and strings.
;;; TODO Do this for other modes, e.g. C, Fortran etc.
(add-hook 'python-mode-hook 'flyspell-prog-mode)

;; LaTeX-mode related settings.

;;; Configuration of AUCTeX. See: <http://www.emacswiki.org/emacs/AUCTeX#toc2>,
;;; <http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html> and
;;; <http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html>.
;(setq TeX-auto-save t)  ; Enable parse on save.
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-save-query nil) ; Autosave before compiling.
(setq-default TeX-master nil)

(add-hook 'TeX-mode-hook 'visual-line-mode)
(add-hook 'TeX-mode-hook 'flyspell-mode)
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)

(add-hook 'TeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t) ; Compile documents to PDF by default.

;; Markdown-mode related settings.
(autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'flyspell-mode)

;; Configuration related to (reStructuredText) rst-mode.
(add-to-list 'auto-mode-alist '("\\.rst\\'" . rst-mode))
(add-hook 'rst-mode-hook 'flyspell-mode)
;(add-hook 'rst-adjust-hook 'rst-toc-update)
