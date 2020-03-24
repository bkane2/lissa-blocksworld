;; Gist clause extraction
;; simple nested rules + features + wildcards
;;
;; "How did you get here today?"

  (MAPC 'ATTACHFEAT
  '(
    (special-request bye goodbye pause stop exit moment minute that that\'s
      second bit quit resume david now today finished-word)
    (finished-word it all everything)

    (spatial-beginning-pair spatial-beginning there)
    (spatial-beginning spatial-verb between prep conj-prep)
    (spatial-verb be modal wh_ do)
    (spatial-ending noun adj there directions ana-pron prep conj-prep facing
      adv-hist-word prep-history-adj verb-rel that this those corp)
    (spatial-word noun ana-pron supporting corp adj
      uppermost under close touching farthest rotated)
    (spatial-word-potential spatial-word be wh_ prep conj-prep)
    (kinds types sorts kind type sort formats format)
    (question questions)
    (answer understand hear interpret parse)
    (here here\'s heres)
    (directions left right top bottom back front)
  ))

  ; This is the top level choice tree for processing spatial question inputs.
  ; Currently, redirect input to *asr-fix-tree* as the very first step.
  (READRULES '*spatial-question-input*
  '(
    1 (0)
      2 (*asr-fix-tree* (1)) (0 :subtree+clause)
  ))

  ; After fixing asr mistakes, we want to check whether the response _is_ a spatial question, which
  ; we can do pretty generally by checking if it has any spatial keyword in it. If so,
  ; we sent it to further subtrees to do some simple preprocessing. Otherwise, we can check
  ; for any number of "small talk" patterns, which we should also be able to handle.
  (READRULES '*detect-smalltalk-tree*
  '(
    ;; ----------------------------------------
    ;; For now, preempt any references/pronouns
    ;; ----------------------------------------
    ;; 1 (0 spatial-word-potential 0 ANA-PRON 0)
    ;;   2 ((Can you answer my question referring to a past question ?)) (0 :gist)
    ;; 1 (0 spatial-word-potential 0 that block 0)
    ;;   2 ((Can you answer my question referring to a past question ?)) (0 :gist)
    ;; 1 (0 spatial-word-potential 0 that one 0)
    ;;   2 ((Can you answer my question referring to a past question ?)) (0 :gist)
    ;; ----------------------------------------
    ;; If spatial question, start preprocessing
    ;; ----------------------------------------
    1 (- 0 that is finished-word 0)
      2 (0 spatial-word 0)
        3 (*multi-token-word-tree* (1 2 3)) (0 :subtree+clause)
    ;; -----------------
    ;; Special requests
    ;; -----------------
    1 (0 special-request 0)
      2 (*request-input* (1 2 3)) (0 :subtree+clause)
    ;; ---------------------
    ;; "Small talk" patterns
    ;; ---------------------
    1 (0 wh_ 1 your name 0)
      2 ((What is your name ?)) (0 :gist)
    1 (0 aux you 1 answer 3 question 0)
      2 ((Can you answer my question ?)) (0 :gist)
    1 (0 aux you 0)
      2 ((Can you do something ?)) (0 :gist)
    1 (0 wh_ 1 kinds 2 question 1 aux you 1 answer 0)
      2 ((What questions can you answer ?)) (0 :gist)
    1 (0)
      2 ((NIL Gist \: Eta could not understand my question \.)) (0 :gist)
  ))

  ; The first stage of preprocessing. Here we combine any words that have multiple tokens,
  ; e.g. "burger king" into a single word, joined by an underscore.
  (READRULES '*multi-token-word-tree*
  '(
    1 (0 burger king 0)
      2 (*multi-token-word-tree* (1 burger_king 4)) (0 :subtree+clause)
    1 (0 sri international 0)
      2 (*multi-token-word-tree* (1 sri_international 4)) (0 :subtree+clause)
    1 (0 next to 0)
      2 (*multi-token-word-tree* (1 next_to 4)) (0 :subtree+clause)
    1 (0 on top of 0)
      2 (*multi-token-word-tree* (1 on_top_of 5)) (0 :subtree+clause)
    1 (0 to the left of 0)
      2 (*multi-token-word-tree* (1 to_the_left_of 6)) (0 :subtree+clause)
    1 (0 to the right of 0)
      2 (*multi-token-word-tree* (1 to_the_right_of 6)) (0 :subtree+clause)
    1 (0 left of 0)
      2 (*multi-token-word-tree* (1 to_the_left_of 4)) (0 :subtree+clause)
    1 (0 right of 0)
      2 (*multi-token-word-tree* (1 to_the_right_of 4)) (0 :subtree+clause)
    1 (0 left to 0)
      2 (*multi-token-word-tree* (1 to_the_left_of 4)) (0 :subtree+clause)
    1 (0 right to 0)
      2 (*multi-token-word-tree* (1 to_the_right_of 4)) (0 :subtree+clause)
    1 (0 prior to 0)
      2 (*multi-token-word-tree* (1 prior_to 4)) (0 :subtree+clause)
    1 (0 near to 0)
      2 (*multi-token-word-tree* (1 near 4)) (0 :subtree+clause)
    1 (0 close to 0)
      2 (*multi-token-word-tree* (1 near 4)) (0 :subtree+clause)
    1 (0 on to 0)
      2 (*multi-token-word-tree* (1 on_to 4)) (0 :subtree+clause)
    1 (0 onto 0)
      2 (*multi-token-word-tree* (1 on_to 3)) (0 :subtree+clause)
    1 (0 in front of 0)
      2 (*multi-token-word-tree* (1 in_front_of 5)) (0 :subtree+clause)
    1 (0 adjacent to 0)
      2 (*multi-token-word-tree* (1 adjacent_to 4)) (0 :subtree+clause)
    1 (0 flush with 0)
      2 (*multi-token-word-tree* (1 flush_with 4)) (0 :subtree+clause)
    1 (0 pick up 0)
      2 (*multi-token-word-tree* (1 pick_up 4)) (0 :subtree+clause)
    1 (0 picks up 0)
      2 (*multi-token-word-tree* (1 picks_up 4)) (0 :subtree+clause)
    1 (0 picked up 0)
      2 (*multi-token-word-tree* (1 picked_up 4)) (0 :subtree+clause)
    1 (0 consist of 0)
      2 (*multi-token-word-tree* (1 consist_of 4)) (0 :subtree+clause)
    1 (0 consists of 0)
      2 (*multi-token-word-tree* (1 consists_of 4)) (0 :subtree+clause)
    1 (0 consisted of 0)
      2 (*multi-token-word-tree* (1 consisted_of 4)) (0 :subtree+clause)
    1 (0)
      2 (*trim-suffix-tree* (1)) (0 :subtree+clause)
  ))

  ; The second stage of preprocessing. We want to remove any "suffix" that the user might
  ; throw after the query, such as tag questions. We do this by trimming off everything at
  ; the end that isn't a spatial-ending (noun or adj). Right now this is being done in a rather
  ; unwieldy way, due to the problem of recursion (i.e. an input can theoretically have any number
  ; of spatial-ending words).
  (READRULES '*trim-suffix-tree*
  '(
    1 (0 spatial-ending ?)
      2 (*trim-prefix-tree* (1 2 ?)) (0 :subtree+clause)
    1 (0 spatial-ending)
      2 (*trim-prefix-tree* (1 2 ?)) (0 :subtree+clause)
    1 (0 spatial-ending 0 spatial-ending 0 spatial-ending 0 spatial-ending 0
         spatial-ending 0 spatial-ending 0 spatial-ending 0 spatial-ending 0)
      2 (*trim-prefix-tree* (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 ?)) (0 :subtree+clause)
    1 (0 spatial-ending 0 spatial-ending 0 spatial-ending 0 spatial-ending 0
         spatial-ending 0 spatial-ending 0 spatial-ending 0)
      2 (*trim-prefix-tree* (1 2 3 4 5 6 7 8 9 10 11 12 13 14 ?)) (0 :subtree+clause)
    1 (0 spatial-ending 0 spatial-ending 0 spatial-ending 0 spatial-ending 0
         spatial-ending 0 spatial-ending 0)
      2 (*trim-prefix-tree* (1 2 3 4 5 6 7 8 9 10 11 12 ?)) (0 :subtree+clause)
    1 (0 spatial-ending 0 spatial-ending 0 spatial-ending 0 spatial-ending 0
         spatial-ending 0)
      2 (*trim-prefix-tree* (1 2 3 4 5 6 7 8 9 10 ?)) (0 :subtree+clause)
    1 (0 spatial-ending 0 spatial-ending 0 spatial-ending 0 spatial-ending 0)
      2 (*trim-prefix-tree* (1 2 3 4 5 6 7 8 ?)) (0 :subtree+clause)
    1 (0 spatial-ending 0 spatial-ending 0 spatial-ending 0)
      2 (*trim-prefix-tree* (1 2 3 4 5 6 ?)) (0 :subtree+clause)
    1 (0 spatial-ending 0 spatial-ending 0)
      2 (*trim-prefix-tree* (1 2 3 4 ?)) (0 :subtree+clause)
    1 (0 spatial-ending 0)
      2 (*trim-prefix-tree* (1 2 ?)) (0 :subtree+clause)
    1 (0 spatial-word 0)
      2 (*trim-prefix-tree* (1 2 ?)) (0 :subtree+clause)
  ))

  ; The third stage of preprocessing. We want to remove any "prefix" that the user might
  ; use as an opening, e.g. "my question is ...".
  (READRULES '*trim-prefix-tree*
  '(
    1 (yes I do \, 0)
      2 (*trim-prefix-tree* (5)) (0 :subtree+clause)
    1 (yes I do 0)
      2 (*trim-prefix-tree* (4)) (0 :subtree+clause)
    1 (yes \, 0)
      2 (*trim-prefix-tree* (3)) (0 :subtree+clause)
    1 (yes 0)
      2 (*trim-prefix-tree* (2)) (0 :subtree+clause)
    1 (0 here 1 my 1 question 0)
      2 (*trim-prefix-tree* (7)) (0 :subtree+clause)
    1 (0 my 1 question 2 be this 0)
      2 (*trim-prefix-tree* (8)) (0 :subtree+clause)
    1 (0 my 1 question 2 be 0)
      2 (*trim-prefix-tree* (7)) (0 :subtree+clause)
    1 (0 aux you 1 know if 0)
      2 ((spatial-question 7)) (0 :gist)
    1 (0 aux you 1 know 0)
      2 ((spatial-question 6)) (0 :gist)
    1 (0 aux you 1 see if 0)
      2 ((spatial-question 7)) (0 :gist)
    1 (0 aux you 1 see 0)
      2 ((spatial-question 6)) (0 :gist)
    1 (0 aux you 1 tell 1 if 0)
      2 ((spatial-question 8)) (0 :gist)
    1 (0 aux you 1 tell me 0)
      2 ((spatial-question 7)) (0 :gist)
    1 (0 aux you 1 tell 0)
      2 ((spatial-question 6)) (0 :gist)
    1 (0 spatial-beginning-pair spatial-beginning-pair spatial-beginning-pair ; meant to match something
        spatial-beginning-pair 0)                                             ; like "is there...what is next
                                                                              ; to the red block?"
      2 ((spatial-question 4 5 6)) (0 :gist)
    1 (between spatial-beginning 0)
      2 ((spatial-question 1 2 3)) (0 :gist)
    1 (wh_ spatial-beginning 0)
      2 ((spatial-question 1 2 3)) (0 :gist)
    1 (prep spatial-beginning 0)
      2 ((spatial-question 1 2 3)) (0 :gist)
    1 (NIL so spatial-beginning 0)
      2 ((spatial-question 3 4)) (0 :gist)
    1 (NIL \, spatial-beginning 0)
      2 ((spatial-question 3 4)) (0 :gist)
    1 (NIL spatial-beginning 0)
      2 ((spatial-question 2 3)) (0 :gist)
    1 (0)
      2 ((spatial-question 1)) (0 :gist)
  ))

  ; We want to check for common ASR mistakes, and map those to the (most plausibly)
  ; correct input.
  ; NOTE: Moved closer to end of file since the code was getting pretty long.
  (READRULES '*asr-fix-tree*
  '(
    1 (0 do not pron 0)
      2 (*asr-fix-tree* (1 2 4 3 5)) (0 :subtree+clause)
    1 (0 anything 0); not a mistake per se, but want to split into two words for parsing
      2 (*asr-fix-tree* (1 any thing 3)) (0 :subtree+clause)
    1 (0 mcdonald\'s 0)
      2 (*asr-fix-tree* (1 mcdonalds 3)) (0 :subtree+clause)
    1 (0 mcdonalds black 0)
      2 (*asr-fix-tree* (1 mcdonalds block 4)) (0 :subtree+clause)
    1 (0 show 0)
      2 (*asr-fix-tree* (1 Shell 3)) (0 :subtree+clause)
    1 (0 sra 0)
      2 (*asr-fix-tree* (1 SRI 3)) (0 :subtree+clause)
    1 (0 s or i 0)
      2 (*asr-fix-tree* (1 SRI 5)) (0 :subtree+clause)
    1 (0 meats are i 0)
      2 (*asr-fix-tree* (1 SRI 5)) (0 :subtree+clause)
    1 (0 meats? are i 0)
      2 (*asr-fix-tree* (1 SRI 5)) (0 :subtree+clause)
    1 (0 meats ? are i 0)
      2 (*asr-fix-tree* (1 SRI 6)) (0 :subtree+clause)
    1 (0 bsri 0)
      2 (*asr-fix-tree* (1 the SRI 3)) (0 :subtree+clause)
    1 (0 bsr i 0)
      2 (*asr-fix-tree* (1 the SRI 4)) (0 :subtree+clause)
    1 (0 psri 0)
      2 (*asr-fix-tree* (1 the SRI 3)) (0 :subtree+clause)
    1 (0 psr i 0)
      2 (*asr-fix-tree* (1 the SRI 4)) (0 :subtree+clause)
    1 (0 dsri 0)
      2 (*asr-fix-tree* (1 the SRI 3)) (0 :subtree+clause)
    1 (0 dsr i 0)
      2 (*asr-fix-tree* (1 the SRI 4)) (0 :subtree+clause)
    1 (0 esri 0)
      2 (*asr-fix-tree* (1 the SRI 3)) (0 :subtree+clause)
    1 (0 esr i 0)
      2 (*asr-fix-tree* (1 the SRI 4)) (0 :subtree+clause)
    1 (0 ssri block 0)
      2 (*asr-fix-tree* (1 SRI block 4)) (0 :subtree+clause)
    1 (0 sr. i block 0)
      2 (*asr-fix-tree* (1 SRI block 5)) (0 :subtree+clause)
    1 (0 sr \. i block 0)
      2 (*asr-fix-tree* (1 SRI block 6)) (0 :subtree+clause)
    1 (0 psr i block 0)
      2 (*asr-fix-tree* (1 the SRI block 5)) (0 :subtree+clause)
    1 (0 they survived look 0)
      2 (*asr-fix-tree* (1 the SRI block 5)) (0 :subtree+clause)
    1 (0 in their survival 0)
      2 (*asr-fix-tree* (1 and the SRI block 5)) (0 :subtree+clause)
    1 (0 novita 0)
      2 (*asr-fix-tree* (1 NVidia 3)) (0 :subtree+clause)
    1 (0 univita 0)
      2 (*asr-fix-tree* (1 NVidia 3)) (0 :subtree+clause)
    1 (0 aveda 0)
      2 (*asr-fix-tree* (1 NVidia 3)) (0 :subtree+clause)
    1 (0 play media 0)
      2 (*asr-fix-tree* (1 the NVidia 4)) (0 :subtree+clause)
    1 (0 play video 0)
      2 (*asr-fix-tree* (1 the NVidia 4)) (0 :subtree+clause)
    1 (0 visiting aveda block 0)
      2 (*asr-fix-tree* (1 is the NVidia block 5)) (0 :subtree+clause)
    1 (0 ultra 0)
      2 (*asr-fix-tree* (1 Toyota 3)) (0 :subtree+clause)
    1 (0 yoda 0)
      2 (*asr-fix-tree* (1 Toyota 3)) (0 :subtree+clause)
    1 (0 traffic 0)
      2 (*asr-fix-tree* (1 Target 3)) (0 :subtree+clause)
    1 (0 chopping 0)
      2 (*asr-fix-tree* (1 Target 3)) (0 :subtree+clause)
    1 (0 pocket 0)
      2 (*asr-fix-tree* (1 Target 3)) (0 :subtree+clause)
    1 (0 charger 0)
      2 (*asr-fix-tree* (1 Target 3)) (0 :subtree+clause)
    1 (0 talking block 0)
      2 (*asr-fix-tree* (1 Target block 4)) (0 :subtree+clause)
    1 (0 texican 0)
      2 (*asr-fix-tree* (1 Texaco 3)) (0 :subtree+clause)
    1 (0 Mexico 0)
      2 (*asr-fix-tree* (1 Texaco 3)) (0 :subtree+clause)
    1 (0 texas call 0)
      2 (*asr-fix-tree* (1 Texaco 4)) (0 :subtree+clause)
    1 (0 critter 0)
      2 (*asr-fix-tree* (1 Twitter 3)) (0 :subtree+clause)
    1 (0 butcher 0)
      2 (*asr-fix-tree* (1 Twitter 3)) (0 :subtree+clause)
    1 (0 mass of the 0)
      2 (*asr-fix-tree* (1 Mercedes 5)) (0 :subtree+clause)
    1 (0 merced us 0)
      2 (*asr-fix-tree* (1 Mercedes 4)) (0 :subtree+clause)
    1 (0 merced is 0)
      2 (*asr-fix-tree* (1 Mercedes 4)) (0 :subtree+clause)
    1 (0 mercer does 0)
      2 (*asr-fix-tree* (1 Mercedes 4)) (0 :subtree+clause)
    1 (0 messages 0)
      2 (*asr-fix-tree* (1 Mercedes 3)) (0 :subtree+clause)
    1 (0 merciless 0)
      2 (*asr-fix-tree* (1 Mercedes 3)) (0 :subtree+clause)
    1 (0 varsity sports 0)
      2 (*asr-fix-tree* (1 Mercedes 4)) (0 :subtree+clause)
    1 (0 in the table 0)
      2 (*asr-fix-tree* (1 on the table 5)) (0 :subtree+clause)
    1 (0 in a cup 0)
      2 (*asr-fix-tree* (1 on top 5)) (0 :subtree+clause)
    1 (0 involved 0)
      2 (*asr-fix-tree* (1 above 3)) (0 :subtree+clause)
    1 (0 about 0)
      2 (*asr-fix-tree* (1 above 3)) (0 :subtree+clause)
    1 (0 above to 0)
      2 (*asr-fix-tree* (1 above the 4)) (0 :subtree+clause)
    1 (0 after the right 0)
      2 (*asr-fix-tree* (1 are to the right 5)) (0 :subtree+clause)
    1 (0 a mirror to 0)
      2 (*asr-fix-tree* (1 nearer to 5)) (0 :subtree+clause)
    1 (0 hyatt 0)
      2 (*asr-fix-tree* (1 highest 3)) (0 :subtree+clause)
    1 (0 louis 0)
      2 (*asr-fix-tree* (1 lowest 3)) (0 :subtree+clause)
    1 (0 lymph nodes look 0)
      2 (*asr-fix-tree* (1 leftmost block 5)) (0 :subtree+clause)
    1 (0 rifles 0)
      2 (*asr-fix-tree* (1 rightmost 3)) (0 :subtree+clause)
    1 (0 right most 0)
      2 (*asr-fix-tree* (1 rightmost 4)) (0 :subtree+clause)
    1 (0 left most 0)
      2 (*asr-fix-tree* (1 leftmost 4)) (0 :subtree+clause)
    1 (0 front most 0)
      2 (*asr-fix-tree* (1 frontmost 4)) (0 :subtree+clause)
    1 (0 top most 0)
      2 (*asr-fix-tree* (1 topmost 4)) (0 :subtree+clause)
    1 (0 right-most 0)
      2 (*asr-fix-tree* (1 rightmost 3)) (0 :subtree+clause)
    1 (0 left-most 0)
      2 (*asr-fix-tree* (1 leftmost 3)) (0 :subtree+clause)
    1 (0 front-most 0)
      2 (*asr-fix-tree* (1 frontmost 3)) (0 :subtree+clause)
    1 (0 top-most 0)
      2 (*asr-fix-tree* (1 topmost 3)) (0 :subtree+clause)
    1 (0 metal 0)
      2 (*asr-fix-tree* (1 middle 3)) (0 :subtree+clause)
    1 (0 patch 0)
      2 (*asr-fix-tree* (1 touch 3)) (0 :subtree+clause)
    1 (0 punches 0)
      2 (*asr-fix-tree* (1 touches 3)) (0 :subtree+clause)
    1 (0 punching 0)
      2 (*asr-fix-tree* (1 touching 3)) (0 :subtree+clause)
    1 (0 patching 0)
      2 (*asr-fix-tree* (1 touching 3)) (0 :subtree+clause)
    1 (0 catching 0)
      2 (*asr-fix-tree* (1 touching 3)) (0 :subtree+clause)
    1 (0 cashing 0)
      2 (*asr-fix-tree* (1 touching 3)) (0 :subtree+clause)
    1 (0 flashing 0)
      2 (*asr-fix-tree* (1 touching 3)) (0 :subtree+clause)
    1 (0 flushing 0)
      2 (*asr-fix-tree* (1 touching 3)) (0 :subtree+clause)
    1 (0 fashion 0)
      2 (*asr-fix-tree* (1 touching 3)) (0 :subtree+clause)
    1 (0 stock 0)
      2 (*asr-fix-tree* (1 stack 3)) (0 :subtree+clause)
    1 (0 hour 0)
      2 (*asr-fix-tree* (1 tower 3)) (0 :subtree+clause)
    1 (0 power 0)
      2 (*asr-fix-tree* (1 tower 3)) (0 :subtree+clause)
    1 (0 boxer 0)
      2 (*asr-fix-tree* (1 blocks are 3)) (0 :subtree+clause)
    1 (0 gridlock 0)
      2 (*asr-fix-tree* (1 green block 3)) (0 :subtree+clause)
    1 (0 cube 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 book 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 black 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 glock 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 blog 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 bach 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 blood 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 glass 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 box 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 look 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 walk 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 wok 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 lock 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 vlog 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 blocked 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 talk 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 cook 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 clock 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 plug 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 blonde 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 lover 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 boardwalk 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 blow 0)
      2 (*asr-fix-tree* (1 block 3)) (0 :subtree+clause)
    1 (0 blockus 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 blokus 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 cubes 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 books 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 blacks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 glocks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 blogs 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 bach\'s 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 bloods 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 looks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 walks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 woks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 locks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 vlogs 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 talks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 cooks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 clocks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 plugs 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 blondes 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 lovers 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 boardwalks 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 blows 0)
      2 (*asr-fix-tree* (1 blocks 3)) (0 :subtree+clause)
    1 (0 rose 0)
      2 (*asr-fix-tree* (1 rows 3)) (0 :subtree+clause)
    1 (0 brett 0)
      2 (*asr-fix-tree* (1 red 3)) (0 :subtree+clause)
    1 (0 rim 0)
      2 (*asr-fix-tree* (1 green 3)) (0 :subtree+clause)
    1 (0 song 0)
      2 (*asr-fix-tree* (1 some 3)) (0 :subtree+clause)
    1 (0 sound 0)
      2 (*asr-fix-tree* (1 some 3)) (0 :subtree+clause)
    1 (0 sun 0)
      2 (*asr-fix-tree* (1 some 3)) (0 :subtree+clause)
    1 (0)
      2 (*grammar-fix-tree* (1)) (0 :subtree+clause)
  ))

  ; Preprocess certain common but ungrammatical queries.
  (READRULES '*grammar-fix-tree*
  '(
    1 (0 not ever 0); not ever => never
      2 (*grammar-fix-tree* (1 never 4)) (0 :subtree+clause)
    1 (wh-det noun pron verb-rel 0); e.g., what block I moved first ?
      2 (*grammar-fix-tree* (1 2 did 3 4 5)) (0 :subtree+clause)
    1 (wh-det noun-history 0 prep 0); e.g., what turn was the Twitter block on the Texaco block ?
       2 (*grammar-fix-tree* (at 1 2 3 4 5)) (0 :subtree+clause)
    1 (wh-det noun-history 0 verb-rel 0); e.g., what turn did I move the Twitter block ?
       2 (*grammar-fix-tree* (at 1 2 3 4 5)) (0 :subtree+clause)
    1 (0)
      2 (*detect-smalltalk-tree* (1)) (0 :subtree+clause)
  ))