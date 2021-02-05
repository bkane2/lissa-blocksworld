;; *discuss-smoking-habits.lisp*: development version 6
;;
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defparameter *discuss-smoking-habits.lisp*

'(event-schema :header (((set-of ^me ^you) discuss-smoking-habits.lisp.v) ** ?e)
;````````````````````````````````````````````````````````````````````````````````

:episodes (

?e1 (^me paraphrase-to.v ^you '(I have a history of smoking but quit six months ago \.))
 
?e2 (^you reply-to.v ?e1)

?e3 (^me react-to.v ?e2)

)

)) ; END defparameter *discuss-smoking-habits.lisp*



;````````````````````````````````````````````````````````
; Store schema variable name under header in *schemas*
;
(store-schema-name 'discuss-smoking-habits.lisp.v '*discuss-smoking-habits.lisp*)



;````````````````````````````````````````````````````````
; Create empty hash tables for semantics,
; gist-clauses, and topic-keys
;
(setf (get '*discuss-smoking-habits.lisp* 'semantics) (make-hash-table))
(setf (get '*discuss-smoking-habits.lisp* 'gist-clauses) (make-hash-table))
(setf (get '*discuss-smoking-habits.lisp* 'topic-keys) (make-hash-table))



;````````````````````````````````````````````````````````
; EL Semantics - Not yet used
;
(mapcar #'(lambda (x)
      (store-output-semantics (first x) (second x) '*discuss-smoking-habits.lisp*))
  '()
) ; END mapcar #'store-output-semantics



;````````````````````````````````````````````````````````
; Gist clauses
;
(mapcar #'(lambda (x) 
      (store-output-gist-clauses (first x) (second x) '*discuss-smoking-habits.lisp*))
  '()
) ; END mapcar #'store-output-gist-clauses



;````````````````````````````````````````````````````````
; Topic keys
;
(mapcar #'(lambda (x) 
      (store-topic-keys (first x) (second x) '*discuss-smoking-habits.lisp*))
  '()
) ; END mapcar #'store-topic-keys
