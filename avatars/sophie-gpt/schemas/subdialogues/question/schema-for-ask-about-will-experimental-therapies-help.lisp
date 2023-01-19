;; *ask-about-will-experimental-therapies-help*: development version 6
;;
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defparameter *ask-about-will-experimental-therapies-help*

'(event-schema :header (((set-of ^me ^you) ask-about-will-experimental-therapies-help.v) ** ?e)
;````````````````````````````````````````````````````````````````````````````````

:goals (
  ; Sophie wants to know whether experimental treatments will help her
  ?g1 (^me ((pres want.v) (to (know.v (whether
        ((k (experimental.a (plur treatment.n))) ((pres will.aux-s) (help.v ^me))))))))
)

:preconds (
)

:episodes (

?e1 (^me paraphrase-to.v ^you '(Do you think experimental therapies will help ?))
 
?e2 (^you reply-to.v ?e1)

)

)) ; END defparameter *ask-about-will-experimental-therapies-help*



;````````````````````````````````````````````````````````
; Store schema variable name under header in *schemas*
;
(store-schema-name 'ask-about-will-experimental-therapies-help.v '*ask-about-will-experimental-therapies-help*)



;````````````````````````````````````````````````````````
; Create empty hash tables for semantics,
; gist-clauses, and topic-keys
;
(setf (get '*ask-about-will-experimental-therapies-help* 'semantics) (make-hash-table))
(setf (get '*ask-about-will-experimental-therapies-help* 'gist-clauses) (make-hash-table))
(setf (get '*ask-about-will-experimental-therapies-help* 'topic-keys) (make-hash-table))



;````````````````````````````````````````````````````````
; EL Semantics - Not yet used
;
(mapcar #'(lambda (x)
      (store-output-semantics (first x) (second x) '*ask-about-will-experimental-therapies-help*))
  '()
) ; END mapcar #'store-output-semantics



;````````````````````````````````````````````````````````
; Gist clauses
;
(mapcar #'(lambda (x) 
      (store-output-gist-clauses (first x) (second x) '*ask-about-will-experimental-therapies-help*))
  '()
) ; END mapcar #'store-output-gist-clauses



;````````````````````````````````````````````````````````
; Topic keys
;
(mapcar #'(lambda (x) 
      (store-topic-keys (first x) (second x) '*ask-about-will-experimental-therapies-help*))
  '()
) ; END mapcar #'store-topic-keys
