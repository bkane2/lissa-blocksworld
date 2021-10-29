;; What household chores did you work on today or yesterday?
;; gist: What household chores did you work on today ?)
;; (0 household chore 4 today 0)   ;; the household chore i did today was blah
;; householdChores-today
;; (3 what 3 household chore 4 today 3)
(MAPC 'ATTACHFEAT
'(
  (CLEANING-VERB dusting dust sweeping sweep vacuuming vacuum wipe wiping wash washing clean cleaning mop mopping)
  (CLEANING-N dishes furniture bedding car cars floors window windows PET carpet bathrooms refrigerator blind blinds curtain carpet garage oven pillow pillows quilt clothes sheets towels towel floor)
  (ARRANGE arranging)
  (PET pets cat cats dog dogs)
  (FEEDING pets)
  (DOING laundry)
  (PREPARING prepare meals cooking)
  (WATERING water plants)
  (MOWING mow the lawn)
  (WEEDING weed garden)
  (BATHING bath pets)
  (PRUNING PRUNE cut cutting trees shrubs)
))


(READRULES '*householdchores-today-input*
'(
  ; Questions
  1 (0 what 4 you 0 ?)
    2 (What household chores did I work on today ?) (0 :gist)
  1 (0 how 2 you 2 chores 0 ?)
    2 (How can I do chores ?) (0 :gist)
  1 (0 .WH_ 4 chore 2 .WORK 0 ?)
    2 (What household chores did I work on today ?) (0 :gist)
  ; Specific answers
  1 (0 .CLEANING-VERB .CLEANING-NOUN 0)
    2 ((2 3 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 .FEEDING pets 0)
    2 ((Feeding 3 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 .DOING laundry 0)
    2 ((2 3 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 .PREPARING meals 0)
    2 ((2 3 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 .WATERING plants 0)
    2 ((2 3 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 .WEEDING garden 0)
    2 ((2 3 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 .BATHING pets 0)
    2 ((2 3 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 .PRUNING trees 0)
    2 ((2 3 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 cooking 0)
    2 ((2 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 arranging 0)
    2 ((2 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 laundry 0)
    2 ((Doing 2 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0 .CLEANING-VERB 0)
    2 ((2 is the household chore that you worked on today \.) (Householdchores-today)) (0 :gist)
  1 (0)
    2 ((NIL Gist \: nothing found for household chore you did today \.) (Householdchores-today)) (0 :gist)
))


(READRULES '*reaction-to-householdchores-today-input*
'(
  1 (0 .CLEANING-VERB 1 .CLEANING-NOUN 0) ;; e.g. wash the floor
    2 (0 .CLEANING-VERB-PRES 1 .CLEANING-NOUN 0)
      3 (0 wipe 1 .CLEANING-NOUN 0)
        4 (Wiping 4 is essential for keeping my place neat \.) (100 :out)
      3 (0 dust 1 .CLEANING-NOUN 0)
        4 (Dusting 4 is essential for keeping my place neat \.) (100 :out)
      3 (0 dust 1 .CLEANING-NOUN 0)
        4 (Dusting 4 is essential for keeping my place neat \.) (100 :out)
      3 (0 sweep 1 .CLEANING-NOUN 0)
        4 (Sweeping 4 is essential for keeping my place neat \.) (100 :out)
      3 (0 vacuum 1 .CLEANING-NOUN 0)
        4 (Vacuuming 4 is essential for keeping my place neat \.) (100 :out)
      3 (0 wash 1 .CLEANING-NOUN 0)
        4 (Washing 4 is essential for keeping my place neat \.) (100 :out)
      3 (0 clean 1 .CLEANING-NOUN 0)
        4 (Cleaning 4 is essential for keeping my place neat \.) (100 :out)
      3 (0 mop 1 .CLEANING-NOUN 0)
        4 (Mopping 4 is essential for keeping my place neat \.) (100 :out)
    2 (0 .CLEANING-VERB-PROG 1 .CLEANING-NOUN 0)
      3 (2 4 is essential for keeping my place neat \.) (100 :out)
  1 (0 .FEEDING pets 0)
    2 (I just fed my british shorthair yesterday \.) (100 :out)
  1 (0 .DOING laundry 0)
    2 (I usually do my laundry every three to four days \.) (100 :out)
  1 (0 .PREPARING meals 0)
    2 (Preparing meals can be time consuming but I enjoy it \.) (100 :out)
  1 (0 .WATERING plants 0)
    2 (You remind me that I need to water and weed my plants and garden today \.) (100 :out)
  1 (0 .WEEDING garden 0)
    2 (You remind me that I need to water and weed my plants and garden today \.) (100 :out)
  1 (0 .BATHING pets 0)
    2 (My british shorthair dislikes bathing very much \.) (100 :out)
  1 (0 .PRUNING trees 0)
    2 (I haven\'t pruned my trees for sometime \. Maybe I should do that sometime \.) (100 :out)
  1 (0 cooking 0)
    2 (Preparing meals can be time consuming but I enjoy it \.) (100 :out)
  1 (0 arranging 0)
    2 (I enjoy putting things in their places regularly \. It is kind of satisfying \.) (100 :out)
  1 (0 laundry 0)
    2 (I usually do my laundry every three to four days \.) (100 :out)
  1 (0 .CLEANING-VERB 0)
    2 (0 .CLEANING-VERB-PRES 0)
      3 (0 wipe 0)
        4 (Wiping is essential for keeping my place neat \.) (100 :out)
      3 (0 dust 0)
        4 (Dusting is essential for keeping my place neat \.) (100 :out)
      3 (0 dust 0)
        4 (Dusting is essential for keeping my place neat \.) (100 :out)
      3 (0 sweep 0)
        4 (Sweeping is essential for keeping my place neat \.) (100 :out)
      3 (0 vacuum 0)
        4 (Vacuuming is essential for keeping my place neat \.) (100 :out)
      3 (0 wash 0)
        4 (Washing is essential for keeping my place neat \.) (100 :out)
      3 (0 clean 0)
        4 (Cleaning is essential for keeping my place neat \.) (100 :out)
      3 (0 mop 0)
        4 (Mopping is essential for keeping my place neat \.) (100 :out)
    2 (0 .CLEANING-VERB-PROG 0)
      3 (2 is essential for keeping my place neat \.) (100 :out)
  1 (0 NIL Gist 0)
    2 (It\'s always a good feeling to be done with chores for the day \.) (100 :out)
))