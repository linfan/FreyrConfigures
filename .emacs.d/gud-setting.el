(require 'gdb-ui)
(defun gdb-or-gud-go ()
  "If gdb isn't running; run gdb, else call gud-go."
  (interactive)
  (if (and gud-comint-buffer
           (buffer-name gud-comint-buffer)
           (get-buffer-process gud-comint-buffer)
           (with-current-buffer gud-comint-buffer (eq gud-minor-mode 'gdba)))
      (gud-call (if gdb-active-process "continue" "run") "")
    (gdb (gud-query-cmdline 'gdb))))
(defun gud-break-remove ()
  "Set/clear breakpoin."
  (interactive)
  (save-excursion
    (if (eq (car (fringe-bitmaps-at-pos (point))) 'breakpoint)
        (gud-remove nil)
      (gud-break nil))))
(defun gud-kill ()
  "Kill gdb process."
  (interactive)
  (with-current-buffer gud-comint-buffer (comint-skip-input))
  (kill-process (get-buffer-process gud-comint-buffer)))
(setq gdb-many-windows t)
(define-key c-mode-base-map [f5] 'gdb-or-gud-go) ;start debug or start running
;(define-key c-mode-base-map [S-f5] '(lambda () (interactive) (gud-call "quit" nil)))
(define-key c-mode-base-map [S-f5] 'gud-kill) ;stop debug
;(define-key c-mode-base-map [f7] '(lambda () (interactive) (compile compile-command)))
(define-key c-mode-base-map [f8] 'gud-print) ;print variable value under cursor
(define-key c-mode-base-map [C-f8] 'gud-pstar) ;print point value under cursor
(define-key c-mode-base-map [f9] 'gud-break-remove) ;add or remove break-point under cursor
;(define-key c-mode-base-map [f9] 'gud-break)
;(define-key c-mode-base-map [C-f9] 'gud-remove)
(define-key c-mode-base-map [f10] 'gud-next) ;step over
(define-key c-mode-base-map [C-f10] 'gud-until) ;run to cursor
(define-key c-mode-base-map [S-f10] 'gud-jump) ;jump to cursor
(define-key c-mode-base-map [f11] 'gud-step) ;step into
(define-key c-mode-base-map [C-f11] 'gud-finish) ;run until finish current function

(provide 'gud-setting)
