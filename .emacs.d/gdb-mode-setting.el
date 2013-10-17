;;C/C++ FN keys 
(defun define-c-mode-fn-key-debug ()
  (define-key c-mode-base-map (kbd "<f5>") 'gud-go)

  (define-key c-mode-base-map (kbd "<f10>") 'gud-step)
  (define-key c-mode-base-map (kbd "<f11>") 'gud-next)
  (define-key c-mode-base-map (kbd "S-<f10>") 'gud-finish)
  (define-key c-mode-base-map (kbd "<f9>") 'gud-break)
  (define-key c-mode-base-map (kbd "S-<f9>") 'gud-remove)
 
  (define-key gud-mode-map (kbd "<f5>") 'gud-go)
  (define-key gud-mode-map (kbd "<f10>") 'gud-step)
  (define-key gud-mode-map (kbd "<f11>") 'gud-next)
  (define-key gud-mode-map (kbd "S-<f10>") 'gud-finish)
  (define-key gud-mode-map (kbd "<f9>") 'gud-break))
 
(defun define-c-mode-fn-key-edit ()
  ;;Code Reference
;  (define-key c-mode-base-map (kbd "<f12>") (lambda ()
;					      (interactive)
;					      (if (semantic-tag-of-class-p (semantic-current-tag) 'include)
;						  (progn 
;						    (push-mark)
;						    (when (fboundp 'push-tag-mark)
;						      (push-tag-mark))))
;					      (semantic-ia-fast-jump (point))))
;  (define-key c-mode-base-map (kbd "S-<f12>") (lambda ()
;						(interactive)
;						(if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
;						    (error "Semantic Bookmark Ring is empty"))
;						(let* ((ring (oref semantic-mru-bookmark-ring ring))
;						       (alist (semantic-mrub-ring-to-assoc-list ring))
;						       (first (cdr (car alist))))
;						  (if (semantic-equivalent-tag-p (oref first tag)
;										 (semantic-current-tag))
;						      (setq first (cdr (car (cdr alist)))))
;						  (semantic-mrub-switch-tags first))))
;  (define-key c-mode-base-map (kbd "M-<f12>") 'eassist-switch-h-cpp)
;  (define-key c-mode-base-map (kbd "M-S-<f12>") 'semantic-analyze-proto-impl-toggle)
 
  ;;Compile and Debug
  (define-key c-mode-base-map (kbd "<f5>") (lambda ()
					       (interactive)				     
					       (call-interactively 'gdb)
					       (call-interactively 'gdb-many-windows)))
  (define-key c-mode-base-map (kbd "S-<f5>") (lambda ()
					     (interactive)				     
					     (call-interactively 'gdb)))
  (define-key c-mode-base-map (kbd "C-<f5>") (lambda ()
						 (interactive)
						 (compile "make -k")				     
						 (call-interactively 'gdb)
						 (call-interactively 'gdb-many-windows))))
 
;; Close compilation buffer if successful
(add-to-list 'compilation-finish-functions
	     (lambda (buffer string)
	       (when (and (string= (buffer-name buffer) "*compilation*")
			  (not (string-match "exited abnormally" string)))
		 (run-at-time 2.5 nil 'delete-windows-on buffer))))
 
;; When gdb/gud finished, back to source code or *scratch* buffer
(defun kill-buffers-when-gdb-quit ()
  "Close gdb buffer when gdb quit. This function is invoked when gdb mode is enabled with gdb-mode-hook" 
  (let ((process (get-buffer-process (current-buffer))))
    (when (processp process)
      (set-process-sentinel process 
			    (lambda (proc change)
			      (when (string-match "//(finished//|exited//|killed//)" change)
				(condition-case nil
				    (progn 
				      (gdb-many-windows -1)
				      (delete-other-windows 
				       (get-buffer-window
					(switch-to-buffer 
					 (condition-case nil
					     (gud-find-file gdb-main-file)
					   (error "*Scratch*")))))
				      (define-c-mode-fn-key-edit)
				      (gud-reset)
				      (gdb-reset)					  
				      (kill-buffer (process-buffer proc)))
				  (error nil))))))))
;(defun gud-kill () 
;  "kill gdb process"
;  (interactive)
;  (with-current-buffer gud-comint-buffer (comint-skip-input))
;  (set-process-query-on-exit-flag (get-buffer-process gud-comint-buffer) nil)
;  (kill-buffer gud-comint-buffer))
 
(mapc (lambda (mode-hook)
	(add-hook mode-hook (lambda ()
			      (kill-buffers-when-gdb-quit)
			      (define-c-mode-fn-key-debug))))
      (list 'gdb-mode-hook 'gud-mode-hook))
 
(mapc (lambda (mode-hook)
	(add-hook mode-hook (lambda ()
			      (progn 
				(linum-mode 1)
				(define-c-mode-fn-key-edit)
				(tool-bar-add-item "gud" 'gdb 'gdb :visible '(memq major-mode '(c++-mode c-mode)))
				(tool-bar-add-item "compile" 'compile 'compile :visible '(memq major-mode '(c++-mode c-mode)))))))
      (list 'c-mode-hook 'c++-mode-hook))

(provide 'gdb-mode-setting)
