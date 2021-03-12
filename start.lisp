;; January 6/2020
;; ================================================
;;
;; Starts Eta using the configuration specified in config.lisp
;;

(load "./config.lisp")


(defun clean-io-files ()
;``````````````````````````
; Overwrites all io files used by Eta with blank files
;
  (ensure-directories-exist "./io/")
  (ensure-directories-exist "./io/in/")
  (ensure-directories-exist "./io/out/")
  (ensure-directories-exist "./io/user-log/")
  (when *read-log-mode*
    (ensure-directories-exist "./logs/")
    (ensure-directories-exist "./logs/logs/")
    (ensure-directories-exist "./logs/logs_out/"))

  ; Ensure all standard input & output files for registered subsystems exist and are empty
  ; Note: input files only created for non-terminal systems,
  ;       output files are only created for non-terminal and non-audio systems
  (mapcar (lambda (system)
  (let ((fname-in (if (not (member system '(|Terminal|)))
                  (concatenate 'string "./io/in/" (string system) ".lisp")))
        (fname-out (if (not (member system '(|Terminal| |Audio|)))
                  (concatenate 'string "./io/out/" (string system) ".lisp"))))
    (if fname-in
    (with-open-file (outfile fname-in :direction :output :if-exists
                                      :supersede :if-does-not-exist :create)))
    (if fname-out
    (with-open-file (outfile fname-out :direction :output :if-exists
                                      :supersede :if-does-not-exist :create)))))
  (append *subsystems-perception* *subsystems-specialist*))

  ; Delete the contents of user-log files
  (with-open-file (outfile "./io/user-log/text.txt" :direction :output :if-exists
                                                    :supersede :if-does-not-exist :create))
  (with-open-file (outfile "./io/user-log/gist.txt" :direction :output :if-exists
                                                    :supersede :if-does-not-exist :create))
  (with-open-file (outfile "./io/user-log/ulf.txt" :direction :output :if-exists
                                                   :supersede :if-does-not-exist :create))

  ; Delete the content of the sessionInfo.lisp file after reading
  (with-open-file (outfile "./io/sessionInfo.lisp" :direction :output :if-exists
                                                   :supersede :if-does-not-exist :create))
  ; Delete the content of output.txt, if it exists, otherwise create
  (with-open-file (outfile "./io/output.txt" :direction :output :if-exists 
                                             :supersede :if-does-not-exist :create))                                                                        
) ; END clean-io-files





(defun load-avatar-files (avatar-name)
;``````````````````````````````````````
; Loads all schema and rule files used by a particular avatar
;
  (labels ((load-files-recur (directory)
      (mapcar (lambda (d)
          (mapcar (lambda (f) (load f))
            (directory (concatenate 'string (namestring d) "/*.lisp")))
          (load-files-recur (concatenate 'string
            (coerce (butlast (explode (namestring d))) 'string) "/*")))
        (remove nil (mapcar (lambda (p)
            ; This is pretty awkward, but has to be done to handle differences btwn ACL and SBCL
            (if (fboundp 'probe-directory)
              (if (probe-directory p) p)
              (if (not (pathname-name p)) p)))
          (directory directory))))))
    ; Load all shared rules and schemas files
    (load-files-recur (concatenate 'string "./avatars/" avatar-name "/schemas"))
    (load-files-recur (concatenate 'string "./avatars/" avatar-name "/rules"))
    ; If a multi-session avatar, load all files specific to that day
    (when (and (boundp '*session-number*) (integerp *session-number*))
      (load-files-recur (concatenate 'string "./avatars/" avatar-name "/" (format nil "day~a" *session-number*)))))
) ; END load-avatar-files


; If live mode, load *user-id* from sessionInfo file (if it exists).
; Otherwise, manually set *user-id* (or prompt user for input).
;````````````````````````````````````````````````````````````````
(defparameter *user-id* nil)
(if (probe-file "./io/sessionInfo.lisp")
  (load "./io/sessionInfo.lisp"))
(when (not *user-id*)
  (defparameter *user-id* "_test")
  ;; (format t "~%~%Enter user-id ~%")
  ;; (princ "user id: ") (finish-output)
  ;; (setq *user-id* (write-to-string (read))))
)


; Clean IO files, load Eta, and load avatar-specific files
;``````````````````````````````````````````````````````````
(clean-io-files)
(load "load-eta.lisp")
(load-avatar-files *avatar*)


(cond

  ; Run Eta (safe mode)
  ;`````````````````````````
  (*safe-mode*
    (handler-case (eta nil *subsystems-perception* *subsystems-specialist* *dependencies*)
      (error (c)
        (error-message "Execution of Eta failed due to an internal error.")
        (values 0 c))))

  ; Run Eta (read-log mode)
  ;`````````````````````````
  (*read-log-mode*
    (let ((logs (if (stringp *read-log-mode*)
                  (directory (concatenate 'string "logs/logs/" *read-log-mode*))
                  (directory "logs/logs/*"))))
      ; Create empty log_out file
      (mapcar (lambda (log)
        (with-open-file (outfile (pathname (concatenate 'string "logs/logs_out/" (pathname-name log)))
          :direction :output :if-exists :supersede :if-does-not-exist :create))) logs)
      ; Start eta using log
      (mapcar (lambda (log)
        (format t "==:: READING LOG ~a ::==~%" log)
        (load "load-eta.lisp")
        (load-avatar-files *avatar*)
        (eta log *subsystems-perception* *subsystems-specialist* *dependencies*)) logs)))

  ; Run Eta
  ;`````````````````````````
  (t (eta nil *subsystems-perception* *subsystems-specialist* *dependencies*)))


; Write user gist clauses to file
;````````````````````````````````````
(print-gist-kb :filename
  (ensure-directories-exist (concatenate 'string "./gist-kb/" *user-id* ".txt")))