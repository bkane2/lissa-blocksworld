; Load ttt
;``````````
; NOTE: This is now loaded as part of the ulf2english dependencies. The local version is currently unused.
;; (load (truename "ttt/src/load.lisp"))


; Load ulf2english
;```````````````````
(ql:quickload "ulf2english")
;; (sys:run-shell-command (format nil "python %s 8080 \"g:g\"" (truename "core/resources/python-repl-server.py")))
;; python core/resources/python-repl-server.py 8080 "g:g"


; Load core code
; (in directory 'core/')
;````````````````````````
(mapcar (lambda (file) (load file))
    (directory "core/*.lisp"))


; Load core coreference code
; (in directory 'core/coref')
;````````````````````````
(mapcar (lambda (file) (load file))
    (directory "core/coref/*.lisp"))


; Load core resources
; (in directory 'core/resources/')
;``````````````````````````````````
(mapcar (lambda (file) (load file))
    (directory "core/resources/*.lisp"))


; Load schema files
; (in directory 'schemas/')
;````````````````````````````
(mapcar (lambda (file) (load file))
    (directory "schemas/*.lisp"))


; Load general rule files
; (in directory 'rules/')
;`````````````````````````
(mapcar (lambda (file) (load file))
    (directory "rules/*.lisp"))


; Load topic-specific rule files
; (in subdirectories of 'rules/')
;`````````````````````````````````
(mapcar (lambda (directory)
    (mapcar (lambda (file) (load file))
        (directory (concatenate 'string (namestring directory) "/*.lisp"))))
    (remove nil (mapcar (lambda (p) (if (not (pathname-name p)) p)) (directory "rules/*"))))