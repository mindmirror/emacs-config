(require 'anzu)
(global-anzu-mode +1)
(diminish 'anzu-mode)
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
(global-set-key [remap query-replace] 'anzu-query-replace)

(provide 'init-isearch)
