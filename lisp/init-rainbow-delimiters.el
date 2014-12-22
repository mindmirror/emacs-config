(rainbow-delimiters-mode t)

;(add-hook 'emacs-lisp-mode-hook       #'rainbow-delimiters-mode)
;(add-hook 'eval-expression-minibuffer-setup-hook #'rainbow-delimiters-mode)
;(add-hook 'ielm-mode-hook             #'rainbow-delimiters-mode)
;(add-hook 'lisp-mode-hook             #'rainbow-delimiters-mode)
;(add-hook 'lisp-interaction-mode-hook #'rainbow-delimiters-mode)
;(add-hook 'clojure-mode-hook          #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook             #'rainbow-delimiters-mode)

(provide 'init-rainbow-delimiters)
