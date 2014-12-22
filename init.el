(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(require 'cask "~/cask/cask.el")
(cask-initialize)
(require 'pallet)

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)     ;; Some handy utils
(require 'init-exec-path) ;; Set up $PATH


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)


;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require 'wgrep)
(require 'diminish)
(require 'command-log-mode)

(require 'init-frame-hooks)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-evil)
(require 'init-guide-key)
(require 'init-dired)
(require 'init-isearch)
;(require 'init-grep)
;(require 'init-uniquify)
;(require 'init-ibuffer)
;(require 'init-flycheck)
(require 'init-rainbow-delimiters)

;(require 'init-recentf)
;(require 'init-ido)
;(require 'init-hippie-expand)
;(require 'init-auto-complete)
;(require 'init-windows)
;(require 'init-sessions)
;(require 'init-fonts)
;(require 'init-mmm)

;(require 'init-editing-utils)

;(require 'init-vc)
;(require 'init-darcs)
;(require 'init-git)
;(require 'init-github)

;(require 'init-compile)
;(require 'init-crontab)
;(require 'init-textile)
;(require 'init-markdown)
;(require 'init-csv)
;(require 'init-erlang)
;(require 'init-javascript)
;(require 'init-php)
;(require 'init-org)
;(require 'init-nxml)
;(require 'init-html)
;(require 'init-css)
;(require 'init-haml)
;(require 'init-python-mode)
;(require 'init-haskell)
;(require 'init-ruby-mode)
;(require 'init-rails)
;(require 'init-sql)

;; Lispy
(require 'init-paredit)
;(require 'init-lisp)
;(require 'init-slime)
;(require 'init-clojure)
;(require 'init-clojure-cider))
;(require 'init-common-lisp)

;(when *spell-check-support-enabled*
;  (require 'init-spelling))

;(require 'init-misc)

;(require 'init-dash)
;(require 'init-ledger)

;; Extra packages which don't require any configuration
;(require-package 'gnuplot)
;(require-package 'lua-mode)
;(require-package 'htmlize)
;(require-package 'dsvn)
;(when *is-a-mac*
;  (require-package 'osx-location))
;(require-package 'regex-tool)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
(require 'init-local nil t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)


(add-hook 'after-init-hook
	  (lambda ()
	    (message "init completed in %.2fms"
		     (sanityinc/time-subtract-millis after-init-time before-init-time))))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
