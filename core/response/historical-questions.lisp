;; Dec 9/19
;; ================================================
;;
;; Functions used in answering historical questions
;;

; NOW0
; "Where is the Target block?"
; ((|Target| at-loc.p ($ loc 0 0 0)) (|Starbucks| at-loc.p ($ loc 1 0 0)) (|Twitter| at-loc.p ($ loc 2 0 0)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))  )
; NOW0
; [ans]
; *Moves Starbucks, Target blocks*
; "Where is the Target block?"
; ((|Target| at-loc.p ($ loc 5 5 1)) (|Starbucks| at-loc.p ($ loc 5 5 0)) (|Twitter| at-loc.p ($ loc 2 0 0)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))      (|Starbucks| ((past move.v) (from.p-arg ($ loc 1 0 0)) (to.p-arg ($ loc 5 5 0)))) (|Target| ((past move.v) (from.p-arg ($ loc 0 0 0)) (to.p-arg ($ loc 5 5 1)))))
; NOW2
; [ans]
; *Moves Target, Twitter blocks*
; "Where was the Target block before I moved it?"
; ((|Target| at-loc.p ($ loc 2 0 1)) (|Starbucks| at-loc.p ($ loc 5 5 0)) (|Twitter| at-loc.p ($ loc 5 5 1)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))      (|Target| ((past move.v) (from.p-arg ($ loc 5 5 1)) (to.p-arg ($ loc 2 0 1)))) (|Twitter| ((past move.v) (from.p-arg ($ loc 2 0 0)) (to.p-arg ($ loc 5 5 1)))))
; NOW4
; [ans]

; "What blocks did I move?"
; "What blocks did I move since the beginning?"
; "What block did I just move?"

; "Where did I move the Texaco block" => "Where was the Texaco block after I moved it"

; '((|Target| at-loc.p ($ loc 2 0 1)) (|Starbucks| at-loc.p ($ loc 5 5 0)) (|Twitter| at-loc.p ($ loc 5 5 1)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0)))
; '((SUB (AT.P (WHAT.D PLACE.N)) ((THE.D (|Twitter| BLOCK.N)) ((PAST BE.V) *H (ADV-E (BEFORE.P (KE (I.PRO ((PAST MOVE.V) (THE.D (|Twitter| BLOCK.N)))))))))) ?)
; '((SUB (AT.P (WHAT.D PLACE.N)) ((THE.D (|Target| BLOCK.N)) ((PAST BE.V) *H (ADV-E (BEFORE.P (KE (I.PRO ((PAST MOVE.V) (THE.D (|Target| BLOCK.N)))))))))) ?)
; '((SUB (AT.P (WHAT.D PLACE.N)) ((THE.D (|Target| BLOCK.N)) ((PAST BE.V) *H (ADV-E (BEFORE.P (KE ((THE.D (|Target| BLOCK.N)) ((PAST BE.V) (ON.P (THE.D (|Starbucks| BLOCK.N))))))))))) ?)


;
; ((|Target| at-loc.p ($ loc 0 0 0)) (|Starbucks| at-loc.p ($ loc 1 0 0)) (|Twitter| at-loc.p ($ loc 2 0 0)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))  )
; ((|Target| at-loc.p ($ loc 0 0 0)) (|Starbucks| at-loc.p ($ loc 0 2 0)) (|Twitter| at-loc.p ($ loc 2 0 0)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))      (|Starbucks| ((past move.v) (from.p-arg ($ loc 1 0 0)) (to.p-arg ($ loc 0 2 0))))  )
; ((|Target| at-loc.p ($ loc 0 0 0)) (|Starbucks| at-loc.p ($ loc 0 2 0)) (|Twitter| at-loc.p ($ loc 2 0 0)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))  )
; 
; ((|Target| at-loc.p ($ loc 0 0 0)) (|Starbucks| at-loc.p ($ loc 1 0 0)) (|Twitter| at-loc.p ($ loc 2 0 0)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))  )
; ((|Target| at-loc.p ($ loc 0 0 0)) (|Starbucks| at-loc.p ($ loc 0 2 0)) (|Twitter| at-loc.p ($ loc 2 0 0)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))      (|Starbucks| ((past move.v) (from.p-arg ($ loc 1 0 0)) (to.p-arg ($ loc 0 2 0))))  )
; ((|Target| at-loc.p ($ loc 0 0 0)) (|Starbucks| at-loc.p ($ loc 0 2 0)) (|Twitter| at-loc.p ($ loc 0 4 0)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))      (|Twitter| ((past move.v) (from.p-arg ($ loc 2 0 0)) (to.p-arg ($ loc 0 4 0)))) )
; ((|Target| at-loc.p ($ loc 0 0 0)) (|Starbucks| at-loc.p ($ loc 0 2 0)) (|Twitter| at-loc.p ($ loc 0 4 0)) (|Texaco| at-loc.p ($ loc 3 0 0)) (|McDonalds| at-loc.p ($ loc 4 0 0)) (|Mercedes| at-loc.p ($ loc 5 0 0)) (|Toyota| at-loc.p ($ loc 6 0 0)) (|Burger King| at-loc.p ($ loc 7 0 0))  )
;


(defun recall-answer (object-locations ulf)
; ````````````````````````````````````````````
; Given current observed block locations and the ULF of the query, recall the answer by consulting
; historical record of block moves stored in context.
;
  (format t "object locations: ~a~%" object-locations) ; DEBUGGING
  (let ((coords (extract-coords object-locations))
        (when-question (extract-when-question ulf)) answer)

    ; Generate any pragmatic inferences for underspecified queries
    (setq ulf (infer-temporal-adverbials ulf))

    ; If when question, remove when adv-e from ulf
    (setq ulf (remove-when-adv-e ulf))

    ; TODO: split off times (and add certainties) or return rels depending on whether when-question or not
    (setq answer (find-answer-times coords ulf :debug t))

    (if when-question
      (mapcar (lambda (time) (add-certainty time time)) answer)
      (mapcan (lambda (time)
        (mapcar (lambda (prop) (add-certainty prop time)) (get time '@))) answer))
        ; check if next time, if so return BEFORE.P <prop> as answer relation, resolved into S by response generator
    
  )
) ; END recall-answer


(defun find-answer-times (coords ulf &key debug)
; ````````````````````````````````````````````````
; Given coordinates and a query ulf, return a list of time/event symbols corresponding to the ULF.
;
  (let* ((ulf-base (uninvert-question (remove-not (remove-adv-e (remove-adv-f ulf)))))
         (where-question (extract-where-question ulf))
         (neg (extract-neg ulf))
         (adv-e (extract-adv-e ulf))
         (constraints-unary (resolve-unary-constraint (first adv-e)))
         (constraints-binary (resolve-binary-constraint coords (second adv-e)))
         (constraints-freq (extract-adv-f ulf))
         (subj (extract-subj ulf-base))
         (obj (extract-obj ulf-base))
         (relation (extract-relation ulf-base))
         (action (extract-action ulf-base))
         func ans-times)

    ; Select appropriate function depending on whether it's a where-question, asking about a relation,
    ; asking about an action, or both (e.g. "when did I put the Twitter block on the Starbucks block")
    (cond
      (where-question
        (setq func `(compute-relations ,subj)))
      ((and relation action)
        (setq func `(compute-move+relation ,relation ,obj ,neg)))
      (relation
        (setq func `(compute-relation ,relation ,neg)))
      (action
        (setq func `(compute-move ,obj ,neg))))

    ; Find the times where the function holds (determining the relevant answer propositions),
    ; and constrain by any given temporal adverbials
    (setq ans-times (find+constrain-times func constraints-unary constraints-binary constraints-freq coords))

    (when debug
      (format t "where question: ~a~%" where-question)
      (format t "neg: ~a~%" neg)
      (format t "adv-e: ~a~%" adv-e)
      (format t "constraint-unary: ~a~%" constraints-unary)
      (format t "constraint-binary: ~a~%" constraints-binary)
      (format t "constraint-freq: ~a~%" constraints-freq)
      (format t "base ulf: ~a~%" ulf-base)
      (format t "subj: ~a~%" subj)
      (format t "obj: ~a~%" obj)
      (format t "extracted relation: ~a~%" relation)
      (format t "extracted action-verb: ~a~%" action)
      (format t "blocks at coordinates: ~a~%" coords)
      (format t "ans-times: ~a~%" ans-times)) ; DEBUGGING
    
  ans-times)
) ; END find-answer-times


(defun infer-temporal-adverbials (ulf)
; ``````````````````````````````````````
; Given an underspecified query (e.g. "what blocks did I move"), we want to generate temporal adverbials
; corresponding to the likely intended scope of the question (e.g. in this case, the speaker likely means
; something like "since the last utterance").
;
  'TODO
  ulf
) ; END infer-temporal-adverbials


(defun extract-where-question (ulf)
; ```````````````````````````````````
; Returns t if ULF contains an 'at what place' phrase, nil otherwise.
;
  (ttt:match-expr '(^* (at.p (what.d place.n))) ulf)
) ; END extract-where-question


(defun extract-when-question (ulf)
; ```````````````````````````````````
; Returns t if ULF contains a phrase like 'at what time' (and isn't a where question), nil otherwise.
;
  (and (ttt:match-expr '(^* (hist-prep-during? wh-np?)) ulf) (not (extract-where-question ulf)))
) ; END extract-when-question


(defun remove-when-adv-e (ulf)
; ``````````````````````````````
; Removes an adv-e such as "(at.p (what.d time.n))" from a ULF.
;
  (ttt:apply-rules '(
    (/ (sub (prep? (wh-det? not-place.n?)) _!) _!)
    (/ (_! (adv-e (! hole? (prep? (wh-det? not-place.n?))))) _!)
    (/ (_*1 (adv-e (! hole? (prep? (wh-det? not-place.n?)))) _*2) (_*1 _*2))
  ) ulf)
) ; END remove-when-adv-e


(defun extract-neg (ulf)
; ````````````````````````
; Returns t if ULF is in a negative environment.
;
  (or (ttt:match-expr '(^* not) ulf)
      (ttt:match-expr '(^* never.adv-f) ulf))
) ; END extract-neg


(defun extract-action (ulf)
; ``````````````````````````
; Extracts a spatial action verb, e.g. put.v.
;
  (let ((action
      (ttt:apply-rules '(
        (/ (^* action-verb?) action-verb?))
      ulf :shallow t)))
    (if (action-verb? action) action nil))
) ; END extract-action


(defun extract-relation (ulf)
; `````````````````````````````
; Extracts a relation (e.g. (|Twitter| on.p |Texaco)) from a ULF.
; If subject or object is not definite, use variables with restrictors, e.g.
; (?x on.p ?y), ((?x red.a) on.p |Texaco|), etc.
;
  (let ((relation
      (ttt:apply-rules '(
        ; Straightforward predicative cases
        (/ (_!1 ((tense? be.v) (^* (between.p (set-of _!2 _!3)))))
           ((resolve-rel-np! _!1) between.p (resolve-rel-np! _!2) (resolve-rel-np! _!3)))
        (/ (_!1 ((tense? be.v) (^* (prep? _!2))))
           ((resolve-rel-np! _!1) prep? (resolve-rel-np! _!2)))
        (/ (_!1 ((tense? aspect?) (be.v (^* (between.p (set-of _!2 _!3))))))
           ((resolve-rel-np! _!1) between.p (resolve-rel-np! _!2) (resolve-rel-np! _!3)))
        (/ (_!1 ((tense? aspect?) (be.v (^* (prep? _!2)))))
           ((resolve-rel-np! _!1) prep? (resolve-rel-np! _!2)))
        ; "what block did I put on the Twitter block?" (TODO: currently this is just treated as
        ; meaning the same as "what block was on the Twitter block", but it really is asking about
        ; this PLUS some block that I actually moved recently).
        (/ (_! ((tense? verb-untensed?) _!1 (between.p (set-of _!2 _!3))))
           ((resolve-rel-np! _!1) between.p (resolve-rel-np! _!2) (resolve-rel-np! _!3)))
        (/ (_! ((tense? verb-untensed?) _!1 (prep? _!2)))
           ((resolve-rel-np! _!1) prep? (resolve-rel-np! _!2)))
        (/ (_!1 ((tense? (pasv verb-untensed?)) (between.p (set-of _!2 _!3))))
           ((resolve-rel-np! _!1) between.p (resolve-rel-np! _!2) (resolve-rel-np! _!3)))
        (/ (_!1 ((tense? (pasv verb-untensed?)) (prep? _!2)))
           ((resolve-rel-np! _!1) prep? (resolve-rel-np! _!2)))
        ; "what block touches the Twitter block?" (TODO: needs to be generalized)
        (/ (_!1 ((tense? spatial-verb?) _!2))
           ((resolve-rel-np! _!1) (spatial-verb-to-prep! spatial-verb?) (resolve-rel-np! _!2)))
        (/ (_!1 ((tense? aspect?) (spatial-verb? _!2)))
           ((resolve-rel-np! _!1) (spatial-verb-to-prep! spatial-verb?) (resolve-rel-np! _!2)))
      )
      ulf)))
    (if (relation-prop? relation) relation nil))
) ; END extract-relation


(defun extract-subj (ulf)
; ````````````````````````
; Extracts a subject (e.g. |Twitter|) of a ULF.
; If subject is not definite, use variables with restrictors, e.g.
; ?x or (?x red.a).
;
  (let ((subj
      (ttt:apply-rules '(
        (/ (_!1 (! (^* (tense? verb-untensed?)))) (resolve-rel-np! _!1)))
      ulf))) 
    (if (or (nnp? subj) (variable? subj) (restricted-variable? subj)) subj nil))
) ; END extract-subj


(defun extract-obj (ulf)
; ````````````````````````
; Extracts an object (e.g. |Twitter|) of a ULF.
; If object is not definite, use variables with restrictors, e.g.
; ?x or (?x red.a).
;
  (let ((obj
    (ttt:apply-rules '(
      (/ (_! (^* ((tense? verb-untensed?) (^*2 (! wh-pron? (det? _!1)))))) (resolve-rel-np! !))
      (/ (_! (^* ((tense? aspect?) (verb-untensed? (^*2 (! wh-pron? (det? _!1))))))) (resolve-rel-np! !)))
    ulf)))
  (if (or (nnp? obj) (variable? obj) (restricted-variable? obj)) obj nil))
) ; END extract-obj


(defun resolve-rel-np! (ulf)
; ```````````````````````````
; Turns a np ULF into a corresponding proper name if something like (the.d (|Twitter| block.n)),
; otherwise turns it into a variable (or a variable with a list of adj restrictors).
; TODO: deal with more complex restrictors, such as n+preds, superlatives, multiple adjectives,
; conjunctions such as ((set-of (the.d (|Twitter| block.n)) (the.d (|Starbucks| block.n)))) ...
;
  (ttt:apply-rules '(
    (/ (det? (nnp? noun?)) nnp?)
    (/ (det? (color? noun?)) ((new-var!) (color-of.f color?)))
    (/ (det? _!) (new-var!))
    (/ wh-pron? (new-var!))
  ) ulf)
) ; END resolve-rel-np!


(defun extract-coords (prop-list)
; `````````````````````````````````
; Extracts all coordinates from a list of propositions, returned in the form: (|Name| ?x ?y ?z)
; NOTE: assuming that all at-loc.p propositions use explicit location record, i.e. ($ loc ?x ?y ?z)
;
  (mapcar (lambda (prop) (append (list (first prop)) (cddr (third prop))))
    (remove-if-not #'at-loc-prop? prop-list))
) ; END extract-coords


(defun extract-questions (prop-list)
; ```````````````````````````````````
; Extracts all questions from a list of propositions, returned in the form:
; (you 'ulf)
;
  (mapcar (lambda (prop)
      (list (first prop) (second (second prop))))
    (remove-if-not #'ask-prop? prop-list))
) ; END extract-questions


(defun extract-moves (prop-list)
; ```````````````````````````````
; Extracts all moves from a list of propositions, returned in the form:
; (|Name| (?x1 ?y1 ?z1) (?x2 ?y2 ?z2))
; (|Twitter| ((pres move.v) (from.p-arg ($ loc ...)) (to.p-arg ($ loc ...)) ))
; NOTE: assuming that all move.v propositions use explicit location record, i.e. ($ loc ?x1 ?y1 ?z1)
;
  (mapcar (lambda (prop)
      (list (first prop) (cddr (second (second (second prop)))) (cddr (second (third (second prop))))))
    (remove-if-not #'move-prop? prop-list))
) ; END extract-moves


(defun extract-adv-e (ulf)
; ``````````````````````````
; Extracts all adv-e phrases from ULF (dividing into two sublists, one for unary preds,
; e.g. recent.a, and one for binary preds, e.g. before.p).
;
  (setq ulf (apply-sub-macro ulf))
  (let (adv-e-unary adv-e-binary)
    (labels ((extract-adv-e-recur (ulf-part)
        (cond
          ; If ULF is an adv-e with a unary pred, cons to adv-e-unary
          ((ttt:match-expr '(! (adv-e adj?) (adv-e (mod-a? adj?))) ulf-part)
            (setq adv-e-unary (cons (second ulf-part) adv-e-unary)))
          ; If ULF is an adv-e with a binary pred, cons to adv-e-binary
          ((ttt:match-expr '(! (adv-e prep-phrase?) (adv-e (mod-a? prep-phrase?))) ulf-part)
            (setq adv-e-binary (cons (second ulf-part) adv-e-binary)))
          ((ttt:match-expr '(! (sent-prep? _!) (mod-a? (sent-prep? _!))) ulf-part)
            (setq adv-e-binary (cons ulf-part adv-e-binary)))
          ; Otherwise, if ULF is atom, do nothing
          ((atom ulf-part) nil)
          ; Otherwise, if ULF is list, recur on each sub-part
          (t (mapcar #'extract-adv-e-recur ulf-part)))))
      (extract-adv-e-recur ulf))
    (list adv-e-unary adv-e-binary))
) ; END extract-adv-e


(defun extract-adv-f (ulf)
; ``````````````````````````
; Extracts all adv-f phrases from ULF.
;
  (setq ulf (apply-sub-macro ulf))
  (let (adv-f)
    (labels ((extract-adv-f-recur (ulf-part)
        (cond
          ; If ULF is an adv-f, cons to adv-f
          ((ttt:match-expr '(adv-f _!) ulf-part)
            (setq adv-f (cons (second ulf-part) adv-f)))
          ; Otherwise, if ULF is atom, do nothing
          ((atom ulf-part) nil)
          ; Otherwise, if ULF is list, recur on each sub-part
          (t (mapcar #'extract-adv-f-recur ulf-part)))))
      (extract-adv-f-recur ulf))
    adv-f)
) ; END extract-adv-f


(defun resolve-unary-constraint (constraints-unary)
; ``````````````````````````````````````````````````
; Resolves each unary constraint (currently does nothing).
;
  constraints-unary
) ; END resolve-unary-constraint


(defun resolve-binary-constraint (coords constraints-binary)
; ````````````````````````````````````````````````````````````
; Resolves each constraint in constraints-binary to a simple binary predicate involving a
; time individual or set of time individuals.
; e.g. (before.p (the.d (last.a turn.n))) => (before.p |Now3|)
;
  (mapcar (lambda (constraint)
    (ttt:apply-rules `(
      (/ (prep? np?) (prep? (resolve-time-np! ,coords np?)))
      (/ (sent-prep? _!) ((ps-to-p! sent-prep?) (resolve-time-s! ,coords _!)))
    ) constraint))
  constraints-binary)
) ; END resolve-binary-constraint


(defun plur-as-mod-a (np)
; `````````````````````````
; This removes any plur in a np and adds it as a mod-a to any temporal adjectives, unless it
; is redundant to do so, e.g. "the last few turns".
; TODO: this is somewhat flawed currently, because sentences like "the most recent turns" is
; intelligible (although a bit awkward), and appears to indicate multiple (most) recent turns.
; However, the most.mod-a is redundant, so this will simply drop the plur, giving "the most recent
; turn", which does NOT capture the same meaning. However, we leave these sorts of low-frequency
; expressions untouched for now.
;
  (ttt:apply-rules '(
    (/ (adj? (plur noun?)) ((plur.mod-a adj?) noun?))
    (/ (plur noun?) noun?)
  ) np)
) ; END plur-as-mod-a


(defun resolve-time-np! (coords np)
; ```````````````````````````````````
; Resolves a temporal noun phrase to a corresponding time individual, or set
; of time individuals.
; NOTE: currently assumes that a np will have at most one unary constraint (i.e. adjective,
; possibly with modifier such as "last few"). If a temporal np can have multiple, this
; will need changing.
; TODO: this function is a bit messy and could use some refactoring.
;
  (let ((np1 (plur-as-mod-a np)); transform plur to mod-a, remove determiner
        det noun constraints-binary constraints-unary times)
    ; Save and remove det
    (setq det (first np1))
    (setq np1 (second np1))
    ; Map indexical det (i.e. 'this.d') to now.n
    (if (equal det 'this.d) (setq np1 'now.n))
    ; If n+preds, extract preds as binary constraints and resolve
    (when (n+preds? np1)
      (setq constraints-binary (resolve-binary-constraint coords (cddr np1)))
      (setq np1 (second np1)))
    ; Get head noun
    (setq noun (get-head-noun np1))
    ; Extract any unary constraints
    (when (ttt:match-expr '((! adj? (mod-a? adj?)) noun?) np1)
      (setq constraints-unary (list (resolve-unary-constraint (first np1)))))

    ; Get times corresponding to head noun
    (setq times (eval-temporal-noun noun))
    ; Constrain times using binary constraints, if any
    (mapcar (lambda (constraint)
      (setq times (remove-if-not (lambda (time)
        (apply-binary-constraint constraint time)) times))) constraints-binary)
    ; Apply unary constraints to get subset of times
    (mapcar (lambda (constraint)
      (setq times (apply-unary-constraint constraint times))) constraints-unary)
    ; Return set of times (or individual time if only one)
    (make-set times))
) ; END resolve-time-np!


(defun resolve-time-s! (coords s)
; `````````````````````````````````
; Resolves a sentence to the time at which the sentence was true, or set of times.
; NOTE: in theory this should support sentential prepositions which themselves have
; adverbials (e.g. "what block did I move before I last moved the Twitter block"),
; though this isn't supported on the parsing side yet.
;
  (make-set (mapcar (lambda (time) (setf (get time '@) nil) time)
    (find-answer-times coords s)))
) ; END resolve-time-s!


(defun form-pred-list (coords-list1 prep-list coords-list2 &key neg)
; ```````````````````````````````````````````````````````````````````
; Form predicates from all relations that are satisfied having
; things from coords-list1 as the subject, a preposition from
; prep-list, and coords-list2 as the object.
; If neg is given as t, return negated predicates.
; NOTE: preds are returned in decreasing order of certainty.
; TODO: if between.p is added to the spatial-prep-list, this function will need adjusting.
; TODO: this is kind of messy, could use some cleaning.
;
  (let ((pred-list (remove nil
        ; Check all combination of blocks between coords-list1 and coords-list2
        (mapcan (lambda (coords1) (mapcan (lambda (coords2)
          (if (not (equal (car coords1) (car coords2)))
            ; Evaluate all prepositions in prep-list
            (mapcar (lambda (prep)
              (let ((certainty (eval-spatial-relation prep coords1 coords2)))
                (if neg
                  ; If neg, add negated tuple + certainty for all with zero certainty
                  (if (and (numberp certainty) (<= certainty 0))
                    (list (list (car coords1) 'not prep (car coords2)) (- 1.0 certainty)))
                  ; Otherwise, if certainty is greater than threshold, add tuple + certainty to pred-list
                  (if (and (numberp certainty) (> certainty *certainty-threshold*))
                    (list (list (car coords1) prep (car coords2)) certainty))
                )))
            prep-list)))
          coords-list2)) coords-list1))))
    ; Sort by certainty
    (mapcar #'first (sort (copy-seq pred-list) #'> :key #'second)))
) ; END form-pred-list


(defun compute-relations (scene moves scene1 subj)
; ``````````````````````````````````````````````````
; Computes all spatial relations that hold at a particular scene, for a particular
; subject (may be a variable with or without restrictors).
; NOTE: we assume uniqueness of coords in the scene, or else this will break.
; TODO: if between.p is added to the spatial-prep-list, this function will need adjusting.
;
  ; Find all possible pairs of subject + object in the scene, and check if relation holds
  (let ((relations (form-pred-list scene *spatial-prep-list* scene)))
    ; Filter relations
    (last (reverse (find-cars-var subj relations)) 2))
) ; END compute-relations


(defun compute-move+relation (scene moves scene1 rel obj neg)
; `````````````````````````````````````````````````````````````
; Computes all moves of a block into a particular relation, i.e. whether the
; given object was moved, and that the relation holds in the resulting scene.
; If neg is given, either the object was not moved, or the relation didn't hold in the scene.
;
  (let ((relations (compute-relation scene moves scene1 rel nil)))
    ; Get rid of any moves for which the relation does not hold in scene1
    (setq moves (remove-if-not (lambda (move) (find move relations
                 :test (lambda (x y) (equal (car x) (car y))))) moves))
    ; If negation, find complement of moves
    (if neg (setq moves (negate-moves moves)))
    ; Simplify form of relations and filter based on obj
    (filter+process-moves moves obj))
) ; END compute-move+relation


(defun compute-relation (scene moves scene1 rel neg)
; ````````````````````````````````````````````````````
; Computes a relation at a particular scene (relation may include variables with/without
; restrictors, in which case it returns a list of all relations satisfying that form).
; TODO: if between.p is added to the spatial-prep-list, this function will need adjusting.
;
  (let* ((subj (first rel)) (prep (second rel)) (obj (third rel)) (obj2 (fourth rel))
        (coords-list1 (find-cars-var subj scene)) (coords-list2 (find-cars-var obj scene)))
    (form-pred-list coords-list1 (list prep) coords-list2 :neg neg))
) ; END compute-relation


(defun compute-move (scene moves scene1 obj neg)
; ````````````````````````````````````````````````
; Computes all moves at a particular time with the given object (may be a variable with/without
; restrictors).
;
  ; If negation, we need to access context to see all blocks (or more generally, 'movable entities'),
  ; and remove all of the blocks which moved during Ti.
  (if neg (setq moves (negate-moves moves)))
  ; Simplify form of relations and filter based on obj
  (filter+process-moves moves obj)
) ; END compute-move


(defun filter+process-moves (moves obj)
; ``````````````````````````````````````
; Filters all moves to ones involving the given object, and processes to form (|Texaco| (past move.v))
;
  (mapcar (lambda (move) `(,(car move) (past move.v))) (find-cars-var obj moves))
) ; END filter+process-moves


(defun negate-moves (moves)
; ``````````````````````````
; Given a list of block moves, return the complement of that list by accessing context.
;
  (set-difference (gethash 'block.n *context*) moves
    :test (lambda (x y) (equal (car x) (car y))))
) ; END negate-moves


(defun apply-unary-constraint (constraint times)
; `````````````````````````````````````````````````
; Applies a unary constraint (e.g. RECENT.A) to list of times.
;
  (let ((constraint-eval (ttt:apply-rule `(/ (! adj? (mod-a? adj?))
          (eval-temporal-modifier 'adj? ',times '(ensure-bound! mod-a?))) constraint :shallow t)))
    (eval constraint-eval))
) ; END apply-unary-constraint


(defun apply-binary-constraint (constraint time)
; ```````````````````````````````````````````````
; Applies a binary constraint (e.g. (BEFORE.P NOW2)) to time and returns t or nil.
;
  (let ((constraint-eval (ttt:apply-rule `(/ (! (prep? _!) (mod-a? (prep? _!)))
          (eval-temporal-relation 'prep? ',time '_! '(ensure-bound! mod-a?))) constraint :shallow t)))
    (eval constraint-eval))
) ; END apply-binary-constraint


(defun find+constrain-times (func constraints-unary constraints-binary constraints-freq coords)
; ```````````````````````````````````````````````````````````````````````````````````````````````
; Finds all times, constrained by the given adverbials, at which func holds. Return all
; satisfying times conjoined with the relevant propositions given by func.
; 
  (let ((f (car func)) (args (cdr func)) (time *time*) (scene coords) moves scene1 props times)
    ; Backtrack through times until the initial time is reached
    (loop while time do

      ; Get moves and 'backup' current scene (so we can use the scene of the consecutive turn)
      (setq moves (extract-moves (gethash time *context*)))
      (setq scene1 scene)
      ; Undo all moves that happened at current time to get new scene
      (mapcar (lambda (move)
        (setq scene (subst-move-scene move scene))) moves)

      ; Only consider this time if it satisfies all binary relations given by the binary adv-e phrases
      (when (every (lambda (constraint) (apply-binary-constraint constraint time)) constraints-binary)
        ; Call func using current scene, any moves, result scene, and any special args
        (setq props (if f (apply f (append (list scene moves scene1) args))))
        ; Attach propositions to time and cons to result list
        (setf (get time '@) props)
        (setq times (cons time times)))

      ; Go to previous time
      (setq time (get-prev-time time)))

    ; Apply all unary constraints to further constrain times
    (mapcar (lambda (constraint) (setq times (apply-unary-constraint constraint times))) constraints-unary)

    ; Apply all frequency constraints phrases to select times which satisfy frequency
    'TODO

    ; Remove any times with no props
    (setq times (remove-if-not (lambda (time) (get time '@)) times))

  times)
) ; END find+constrain-times


(defun subst-move-scene (move scene)
; ````````````````````````````````````
; Substitutes the from.p coordinates into the to.p coordinates of a move in a given scene,
; effectively undoing the move.
;
  (subst (cons (first move) (second move)) (cons (first move) (third move)) scene :test #'~equal)
) ; END subst-move-scene


(defun add-certainty (rel time)
; ```````````````````````````````
; Adds certainty to a relation based on time.
; NOTE: currently always set to 1.0 - see note on 'apply-to-times' func.
;
  (list rel 1.0)
) ; END add-certainty


(defun add-certainty-list (rels time)
; ````````````````````````````````````
; Adds certainties to a list of relations.
; NOTE: currently always set to 1.0 - see note on 'apply-to-times' func.
;
  (mapcar (lambda (rel) (add-certainty rel time)) rels)
) ; END add-certainty-list


(defun not-place.n? (x)
  (not (equal x 'place.n)))