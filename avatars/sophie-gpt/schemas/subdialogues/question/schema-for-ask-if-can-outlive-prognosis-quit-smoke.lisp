;; *ask-if-can-outlive-prognosis-quit-smoke*: development version 6
;;
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defparameter *ask-if-can-outlive-prognosis-quit-smoke*

'(event-schema :header (((set-of ^me ^you) ask-if-can-outlive-prognosis-quit-smoke.v) ** ?e)
;````````````````````````````````````````````````````````````````````````````````

:types (
  !t1 (^me person.n)
  !t2 (^you person.n)
)

:rigid-conds (
  ; Sophie is a woman
  !r1 (^me ((pres be.v) (= (a.d woman.n))))
  ; Sophie is 65 years old
  !r2 (^me ((pres be.v) ((mod-a (65.a (plur year.n))) old.a)))
)

:static-conds (
  ; Sophie has lung cancer
  ?s1 (^me ((pres have.v) (k (lung.n cancer.n))))
  ; Sophie has an uncle Fred who outlived his prognosis
  ?s2 (^me ((pres have.v) (an.d (n+preds uncle.n (= |Fred|) (who.rel ((past outlive.v) (his.d prognosis.n)))))))
  ; Sophie wants to be able to watch her grandson graduate
  ?s3 (^me ((pres want.v) (to (be.v able.a (to (watch.v ((^me 's) grandson.n) (ke graduate.v)))))))
)

:preconds (
  ; Sophie stopped smoking after hearing her diagnosis
  ?p1 (^me ((past stop.v) (ka smoke.v) (adv-e (after.p (ka (hear.v ((^me 's) diagnosis.n)))))))
  ; Sophie doesn't fully accept her prognosis
  ?p2 (^me ((pres do.aux-s) not fully.adv-a (accept.v ((^me 's) prognosis.n))))
)

:goals (
  ; Sophie wants to know more about her prognosis
  ?g1 (^me ((pres want.v) (to (know.v (more.d
        (n+preds {information}.n (about.p ((^me 's) prognosis.n))))))))
  ; Sophie wants to know whether she can outlive the user's prognosis if she quit smoking
  ?g2 (^me ((pres want.v) (to (know.v (whether (^me ((pres can.aux-s) (outlive.v ((^you 's) prognosis.n)
        (if.ps (^me ((past quit.v) (ka smoke.v))))))))))))
)

:episodes (

?e1 (^me paraphrase-to.v ^you '(Can I outlive your prognosis if I quit smoking ?))
 
?e2 (^you reply-to.v ?e1)

)

)) ; END defparameter *ask-if-can-outlive-prognosis-quit-smoke*



;````````````````````````````````````````````````````````
; Store schema variable name under header in *schemas*
;
(store-schema-name 'ask-if-can-outlive-prognosis-quit-smoke.v '*ask-if-can-outlive-prognosis-quit-smoke*)



;````````````````````````````````````````````````````````
; Create empty hash tables for semantics,
; gist-clauses, and topic-keys
;
(setf (get '*ask-if-can-outlive-prognosis-quit-smoke* 'semantics) (make-hash-table))
(setf (get '*ask-if-can-outlive-prognosis-quit-smoke* 'gist-clauses) (make-hash-table))
(setf (get '*ask-if-can-outlive-prognosis-quit-smoke* 'topic-keys) (make-hash-table))



;````````````````````````````````````````````````````````
; EL Semantics - Not yet used
;
(mapcar #'(lambda (x)
      (store-output-semantics (first x) (second x) '*ask-if-can-outlive-prognosis-quit-smoke*))
  '()
) ; END mapcar #'store-output-semantics



;````````````````````````````````````````````````````````
; Gist clauses
;
(mapcar #'(lambda (x) 
      (store-output-gist-clauses (first x) (second x) '*ask-if-can-outlive-prognosis-quit-smoke*))
  '()
) ; END mapcar #'store-output-gist-clauses



;````````````````````````````````````````````````````````
; Topic keys
;
(mapcar #'(lambda (x) 
      (store-topic-keys (first x) (second x) '*ask-if-can-outlive-prognosis-quit-smoke*))
  '()
) ; END mapcar #'store-topic-keys
