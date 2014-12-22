(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(after-load 'paredit
  (diminish 'paredit-mode " Par"))

(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)

(add-hook 'paredit-mode-hook 'evil-paredit-mode)

;; ----------------------------------------------------------------------------
;; Enable some handy paredit functions in all prog modes
;; ----------------------------------------------------------------------------

(add-hook 'prog-mode-hook 'paredit-everywhere-mode)

(provide 'init-paredit)
