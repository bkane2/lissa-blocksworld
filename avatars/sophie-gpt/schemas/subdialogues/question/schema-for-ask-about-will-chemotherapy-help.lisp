;; *ask-about-will-chemotherapy-help*: development version 6
;;
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defparameter *ask-about-will-chemotherapy-help*

'(event-schema :header (((set-of ^me ^you) ask-about-will-chemotherapy-help.v) ** ?e)
;````````````````````````````````````````````````````````````````````````````````

:goals (
  ; Sophie wants to know whether chemotherapy will help her
  ?g1 (^me ((pres want.v) (to (know.v (whether
        ((k chemotherapy.n) ((pres will.aux-s) (help.v ^me))))))))
)

:preconds (
  ; Sophie is unsure about chemotherapy
  ?p1 (^me ((pres be.v) unsure.a (about.p-arg (k chemotherapy.n))))
)

:episodes (

?e1 (^me paraphrase-to.v ^you '(Do you think chemotherapy will help ?))
 
?e2 (^you reply-to.v ?e1)

)

)) ; END defparameter *ask-about-will-chemotherapy-help*



;````````````````````````````````````````````````````````
; Store schema variable name under header in *schemas*
;
(store-schema-name 'ask-about-will-chemotherapy-help.v '*ask-about-will-chemotherapy-help*)



;````````````````````````````````````````````````````````
; Create empty hash tables for semantics,
; gist-clauses, and topic-keys
;
(setf (get '*ask-about-will-chemotherapy-help* 'semantics) (make-hash-table))
(setf (get '*ask-about-will-chemotherapy-help* 'gist-clauses) (make-hash-table))
(setf (get '*ask-about-will-chemotherapy-help* 'topic-keys) (make-hash-table))



;````````````````````````````````````````````````````````
; EL Semantics - Not yet used
;
(mapcar #'(lambda (x)
      (store-output-semantics (first x) (second x) '*ask-about-will-chemotherapy-help*))
  '()
) ; END mapcar #'store-output-semantics



;````````````````````````````````````````````````````````
; Gist clauses
;
(mapcar #'(lambda (x) 
      (store-output-gist-clauses (first x) (second x) '*ask-about-will-chemotherapy-help*))
  '()
) ; END mapcar #'store-output-gist-clauses



;````````````````````````````````````````````````````````
; Topic keys
;
(mapcar #'(lambda (x) 
      (store-topic-keys (first x) (second x) '*ask-about-will-chemotherapy-help*))
  '()
) ; END mapcar #'store-topic-keys
