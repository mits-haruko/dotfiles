;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;;;;;;;;;;;;;;; APPEARANCE;;;;;;;;;;;;;;;;;;;;

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 16)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24 :weight 'bold))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

(setq fancy-splash-image "~/.doom.d/doom-banners/splashes/emacs/emacs-e-logo-mid.png")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;;;;;;;;;KEYBINDS;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
       :desc "Peep-dired image previews" "d p" #'peep-dired
       :desc "Dired view file" "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  )

(map! :leader
      :desc "Toggle neotree" "t n" #'neotree-toggle
      :desc "Open directory" "d n" #'neotree-dir
      :desc "VTerm" "v t" #'vterm)

(map! :leader
      :desc "TeX errors" "l e" #'TeX-next-error)

;;;;;;;;;;;;OPTIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Delete to trash
(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")

(yas-global-mode 1)
(add-hook 'yas-minor-mode-hook (lambda ()
                                 (yas-activate-extra-mode 'fundamental-mode)))

;; Auctex mainfiles
(setq-default TeX-master nil)
;; Auctex config
(setq TeX-electric-sub-and-superscript nil)

;; nested snippets
(setq yas-triggers-in-field t)


(use-package! aas
  :hook (LaTeX-mode . aas-activate-for-major-mode)
  :config
  (aas-set-snippets 'latex-mode
                    "mk" (lambda () (interactive)
                           (yas-expand-snippet "$$1$$0") (aas--shut-up-smartparens))
                    :cond #'texmathp
                    "supp" "\\supp"
                    "//" (lambda () (interactive)
                           (yas-expand-snippet "\\frac{$1}{$2}$0") (aas--shut-up-smartparens))
                    "sm" (lambda () (interactive)
                           (yas-expand-snippet "\\sum_{$1}^{$2}$0") (aas--shut-up-smartparens))
                    "\9" (lambda () (interactive)
                           (yas-expand-snippet "\\($1\\)$0") (aas--shut-up-smartparens))
                    "td" (lambda () (interactive)
                           (yas-expand-snippet "^{$1}$0") (aas--shut-up-smartparens))
                    "__" (lambda () (interactive)
                           (yas-expand-snippet "_{$1}$0") (aas--shut-up-smartparens))
                    )
  )



;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
