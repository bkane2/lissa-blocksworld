; The rules defined in this file are used to generate a specific response for a topic, in the context of the
; user's previous gist-clause (the specific rule tree is initially chosen based on the gist-clause of Eta's response).
;
; All trees defined in this file should be named using format *response-tree-<topic>*.
(READRULES '*response-tree-treatment-options*
; (What are my options for treatment 1)
; (Do you think experimental therapies will help 1)
'(
  1 (0 maintaining .GOOD quality of life is a .TREATMENT .OPTION 0)
    2 (Keeping a high quality of life for the rest of my time is the most important thing to me right now \. What\'s the best option for making sure this is possible ?) (0 :out)
  1 (0 .DO I .WANT to .TRY to .FIGHT the cancer 0)
    2 (My main priority is just to be comfortable for the time I have left \, but i\'m willing to try to fight the cancer if you think it will help \.) (100 :out)
    2 (I want to try to fight it if you think it would be best \, but my main priority is just being comfortable \.) (0 :out)
  1 (0 what are my .TREATMENT goals 0)
    2 (I think my priority is to be comfortable for the time I have left \, and to be able to enjoy my remaining years with my family \. However \, i\'m open to try fighting the cancer if you think I have a chance \.) (100 :out)
    2 (I really just want to be as comfortable as possible for the time I have left \.) (0 :out)
  1 (0 you need more tests .BEFORE .TALKING about .TREATMENT options 0)
    2 (I understand that some more tests might be necessary before deciding on treatment \. I still want to hear about my potential options \, though \.) (0 :out)
  1 (0 what .DO I .UNDERSTAND about my .TREATMENT options 0)
    2 (I don\'t really understand my treatment options very well \. Could you explain them a bit more ?) (100 :out)
    2 (Could you explain the options that I have \, again ?) (0 :out)
  1 (0 I was given a prior prognosis of .TWO years 0)
    2 (I was told I probably had about two more years \, but that the prognosis was only an average \. It still feels very uncertain \. And I know i\'d really appreciate having better knowledge of what my future may look like at this point \. What are the kinds treatment options you\'d recommend in a case like mine ?) (0 :out)
  1 (0 what is the prognosis that was given to me previously 0)
    2 ([SAD] my prior doctor said I only had about two years \. Though it doesn\'t feel like a lot of time \, i\'m still hoping to make the most of it \. Do you know what treatment options are left for me ?) (0 :out)
  1 (0 NIL Gist 0 .TREATMENT .OPTION 0)
    2 (Sorry \, I didn\'t really understand \. Could you please repeat my treatment options one more time ?) (0 :out)
  1 (0)
    2 (First \, i\'d like to know a bit about my treatment options \. What are my choices at this point ?) (0 :out)
    2 (What are the treatment options for a prognosis like mine ?) (0 :out)
)) ; END *response-tree-treatment-options*


(READRULES '*response-tree-experimental-therapies*
'(
  ; (Do you think experimental therapies will help 1)
  1 (0 .DO I .HAVE a .QUESTION about my .TREATMENT options 0)
    2 (Before I was diagnosed \, I used to hear about experimental treatments on the news \. Some of them sounded promising \. Do you know of any treatments that would be right for me ?) (0 :out)
  1 (0 the prognosis is that I cannot .BE cured 0)
    2 (That\'s hard to hear \. But are you certain there\'s no cure ? Sometimes I hear about experimental treatments and such \. Do you think any of those would be right for me ?) (0 :out)
  1 (0)
    2 (Do you know if there\'s any experimental therapy out there that could help me ?) (0 :out)
))


(READRULES '*response-tree-comfort-care*
; (How does comfort care work 1)
'(
  1 (0 what are my .TREATMENT goals 0)
    2 (At this point \, i\'d just like to keep my pain under control and spend time with my family \. Is there any treatment that can allow me to do that ?) (0 :out)
  1 (0 you .DO not think I need .CHEMOTHERAPY .BECAUSE I .SHOULD get comfort .CARE instead 0)
    2 (I think holding off on chemotherapy for now makes sense \, given that my priority is just to be comfortable \. So you think I should get comfort care \, then ?) (0 :out)
  1 (0 comfort .CARE is a .TREATMENT .OPTION 0)
    2 (Comfort care sounds good to me \. What I want is to try to get my life back to normal as much as possible \. You know \, spend time with my family \. Comfort care is the best choice for that \, right ?) (0 :out)
  1 (0 .HAVE I considered comfort .CARE 0)
    2 (I haven\'t thought about it \, but it sounds like what I really need \. A way to maintain quality of life during the time I have left \. Can you tell me about it ?) (0 :out)
  1 (0 .DO I .UNDERSTAND how comfort .CARE works 0)
    2 (I\'ve heard of hospice before \, but I don\'t really understand what comfort care means \. Can you explain it ?) (100 :out)
    2 (I don\'t really have a good idea of what comfort care means \. What is it ?) (0 :out)
  1 (0 .DO I .HAVE a .QUESTION about comfort .CARE 0)
    2 (Comfort care is very new to me \, so I still don\'t really have a lot of specific questions \. I\'d just like to know the basics of how i\'d be treated \.) (100 :out)
    2 (I don\'t know enough about comfort care still to have too many specific questions \. Could you just tell me more about how it works ?) (0 :out)
  1 (0 comfort .CARE .SHOULD alleviate my .PAIN 0)
    2 ([HAPPY] i\'m happy to hear that \. To be honest \, my priorities right now are just to remain free of pain and spend time with my family \. In that case \, do you think comfort care would be the best option for me ?) (0 :out)
  1 (0 comfort .CARE allows me to .SPEND time with my .FAMILY 0)
    2 ([HAPPY] that\'s all very good to hear \. Honestly \, at this point \, I think my main goal is to make the most of the time I have left with my family \. Would you say \, then \, that comfort care is my best option ?) (0 :out)
  1 (0 receiving comfort .CARE .IN a dedicated facility is an .OPTION 0)
    2 (That\'s all very good to know \. My family and I will have to set aside a time to look at the various places nearby \. So you do think comfort care is the best choice for me \, then ?) (0 :out)
    2 (Thank you \. I think my family and I will have to look more into our options \. You do think I should get comfort care \, though ?) (0 :out)
  1 (0 receiving comfort .CARE from a specialized service is an .OPTION 0)
    2 (That\'s all very good to know \. My family and I will have to set aside a time to look at the various companies nearby \. So you do think comfort care is the best choice for me \, then ?) (0 :out)
    2 (Thank you \. I think my family and I will have to look more into our options \. You do think I should get comfort care \, though ?) (0 :out)
  1 (0 receiving comfort .CARE .IN my own .HOME is an .OPTION 0)
    2 (Oh \, that\'s great to hear \. At this point in my life \, i\'m glad I have the option to remain somewhere familiar \. But you do think comfort care is the best choice for me \, then ?) (0 :out)
    2 (Thank you \. I think my family and I will have to look more into our options \. You do think I should get comfort care \, though ?) (0 :out)
  1 (0 receiving comfort .CARE from a .NURSE is an .OPTION 0)
    2 (That\'s all very good to know \. My family and I will have to set aside a time to look at the various nursing services nearby \. So you do think comfort care is the best choice for me \, then ?) (0 :out)
    2 (Thank you \. I think my family and I will have to look more into our options \. You do think I should get comfort care \, though ?) (0 :out)
  1 (I would need a .REFERRAL to start comfort .CARE \.)
    2 (That\'s good to know \. I\'ll start to look into the details of that later with my daughter \. But \, for now \, do you think that comfort care would be the right choice for me ?) (0 :out)
  1 (0)
    2 (You know \, my main priority is to be comfortable at this point \. What would be the best way to accomplish that ?) (100 :out)
    2 (One thing that i\'ve heard about before is comfort care \. Do you think that\'s an option for me ?) (0 :out)
)) ; END *response-tree-comfort-care*


(READRULES '*response-tree-pain-medication-not-working*
; (Why isn\'t the pain medication working anymore 1)
'(
  1 (0 how is the .PAIN medication working 0)
    2 ([SAD] my pain is a little better under the lortab \, but it\'s not really helping as much as it used to \.) (0 :out)
  1 (0 is the .PAIN medication working at all 0)
    2 (The lortab is working a little bit \, but not much \.) (0 :out)
  1 (0 is the .PAIN medication working 0)
    2 ([SAD] no \, it\'s not really working anymore \. So I have been taking the pills every three hours instead of every four \.) (0 :out)
  1 (0 .DO I .HAVE a .QUESTION about my .MEDICINE 0)
    2 ([SAD] i\'m just so frustrated \. The pain medication was working very well a while ago but it\'s not doing half as much now \.) (0 :out)
  1 (0)
    2 ([SAD] could you tell me why the pain medication isn\'t working anymore ?) (0 :out)
)) ; END *response-tree-pain-medication-not-working*


(READRULES '*response-tree-lortab-frequency*
; (I am taking Lortab every three hours 1)
'(
  1 (0 how often am I taking medication 0)
    2 ([SAD] I am taking two pills of lortab every three hours now for the past couple of weeks \, since this pain has come back \.) (0 :out)
  1 (0 does taking medication more .FREQUENTLY .HELP 0)
    2 ([SAD] taking the lortab more often seems to help a little \. I am already taking it every three hours \.) (0 :out)
)) ; END *response-tree-lortab-frequency*


(READRULES '*response-tree-sleep*
; (I have not been sleeping well 1)
; (Why have I not been sleeping well 1)
'(
  1 (0 you are sorry that I am sleeping poorly 0)
    2 ([SAD] thanks \, I appreciate the sympathy \. Do you know why this is happening \, though ?) (0 :out)
  1 (0 .CAN I .TELL you about my .SLEEP instead of test results 0)
    2 ([SAD] I can give a bit more information about what happens when I try to sleep \. Sometimes I wake up in the middle of the night and notice an ache in my back and near my chest \. That\'s when I have to take pain medication to fall back asleep \.) (100 :out)
  1 (0 .HAVE I been sleeping .OKAY 0)
    2 ([SAD] I have been having a bit of trouble \. I keep waking up at night \. Most nights I have to take my pain medication before falling back to sleep again \.) (0 :out)
  1 (0 how often am I waking up at night 0)
    2 (I haven\'t really been keeping track \. Maybe about four or five times in a night \.) (0 :out)
  1 (0 what is on my mind when I .TRY to .SLEEP 0)
    2 ([SAD] when I actually sleep \, I don\'t really have anything on my mind \. When I have trouble sleeping I usually can\'t think of anything except for the pain \.) (0 :out)
  1 (0 what happens when I .TRY to .SLEEP 0)
    2 ([SAD] I usually have trouble staying asleep \. Sometimes I wake up in the middle of the night and notice an ache in my back and near my chest \. That\'s when I have to take pain medication to fall back asleep \.) (100 :out)
    2 ([SAD] whenever I wake up \, I usually feel an ache in my back and near my chest \. I usually try to take pain medication to help fall back asleep \.) (0 :out)
  1 (0 is your mental health keeping you awake 0)
    2 ([SAD] I have been feeling a bit of anxiety \, which can sometimes make it difficult to fall asleep \, but usually it\'s my pain that keeps me awake \.) (0 :out)
  1 (0 is .COFFEE keeping you awake 0)
    2 (I only drink two cups of decaf coffee a day \. So \, it might be more likely that my pain is keeping me awake \.) (0 :out)
  ; OPPORTUNITY for Open-Ended Questions: "Were you nervous about this meeting?", "Can you elaborate?"
  1 (0)
    2 ([SAD] [OPPORTUNITY] one thing i\'ve noticed in the last few weeks is that I haven\'t been sleeping very well \. Most nights I have to take medication for my pain \. I\'m not sure if it\'s only the pain \, but I keep waking up at night \. Do you know why I keep waking up like this ?) (100 :out)
    2 (Do you know what the specific cause of my poor sleep is ?) (0 :out)
)) ; END *response-tree-sleep*


(READRULES '*response-tree-test-results*
; (What do my test results mean 1)
'(
  1 (0 what test results am I referring to 0)
    2 ([SAD] oh \, sorry \, I assumed you were sent the results \. I had a second ct scan a couple weeks after radiation \. I was told that the tumor is still there \, but I wasn\'t sure how to interpret that \. They mentioned something about possible metastasis \.) (0 :out)
  1 (0 .DO I .KNOW what the tests say 0)
    2 ([SAD] I don\'t really understand the test results \. I was just told that the tumor is still there and something about possible metastasis \, but I wasn\'t sure how to interpret that \. Can you explain them ?) (0 :out)
  1 (0 you are not sure what my test results mean 0)
    2 ([SAD] oh \, sorry \, I assumed you were sent the test results \, from when I had my second ct scan a couple weeks after radiation \. I was told that the tumor is still there \, but I wasn\'t sure how to interpret that \. They mentioned something about possible metastasis \. Could you explain what that means in simple terms ?) (100 :out)
    2 (Could you try your best to explain the test results to me ?) (0 :out)
  1 (0 .CAN I .TELL you about my .PAIN instead of test results 0)
    2 (I\'ll think more about my pain medication and talk to you about it another time \. I\'d like to move onto my test results now \, though \. Could you explain what they mean ?) (0 :out)
  1 (0 .CAN I .TELL you about my .SLEEP instead of test results 0)
    2 (I\'ll think more about my sleep problems and talk to you about it another time \. I\'d like to move onto my test results now \, though \. Could you explain what they mean ?) (0 :out)
  1 (0 how .DO I feel about my test results 0)
    2 ([SAD] I could tell something was off even before today because i\'ve been having some difficult sleeping and pain during the day \. But i\'m still not quite sure how worried I should be \. Could you try your best to explain the test results to me ?) (0 :out)
    2 ([SAD] I had a feeling because of my pain that my test results would not be pleasant \. But i\'m still not sure whether I understand them \. Could you please explain in the simplest terms you can ?) (0 :out)
  1 (0 .DO I .HAVE any questions about my test results 0)
    2 ([SAD] the test results mentioned something about possible metastasis but i\'m still not exactly what that word means \. Could you explain it to me in simple terms ?) (0 :out)
    2 ([SAD] i\'m still a little foggy on what metastasis means \. Would you mind explaining it to me again ?) (0 :out)
  1 (0 how .MUCH information .DO I .WANT about my test results 0)
    2 (Don\'t hold anything back \. I\'m ready to hear it \. Oh \! But do try to avoid using too many technical terms \. I want to be sure I understand what\'s going to happen to me \.) (100 :out)
    2 (Please tell me all that you can \. Even if it\'s scary \, I prefer to know instead of being left in the dark \.) (0 :out)
  1 (0)
    2 (Truth be told \, i\'ve already scanned the results \, but don\'t understand what they are telling me \. It all seems very complicated \. Could you explain to me what they mean ?) (100 :out)
    2 ([SAD] I still don\'t quite understand the test results \. Could you please explain in simple terms ?) (100 :out)
    2 (I still am not sure I understand the results \. Do you mind explaining it to me again ?) (0 :out)
)) ; END *response-tree-test-results*


(READRULES '*response-tree-weight*
; (I have lost weight 1)
'(
  1 (0 .HAVE I changed weight 0)
    2 (I have lost some weight \.) (0 :out)
  1 (0 how .MUCH weight .HAVE I lost 0)
    2 (I have lost about twenty five pounds since they started \. I gained seven back in radiation \, but I am still down a bit \.) (0 :out)
)) ; END *response-tree-weight*


(READRULES '*response-tree-pain*
; (My pain has recently been getting worse 1)
'(
  1 (0 .CAN I .TELL you about my .PAIN instead of test results 0)
    2 (I can give a bit more information about my pain \. I used to just feel it in my back and chest \, but it seems to have spread \. Now it\'s in my shoulder blade too \, and on the other side from where it started \.) (0 :out)
  1 (0 .CAN I .TELL you about my .PAIN 0)
    2 ([SAD] the pain was pretty much under control for a while \, but in the past week it has been more difficult \. It used to be in my back and left side of my chest \, but now it\'s in my shoulder blade too \, and on the other side from where it started \.) (2 :out)
    2 ([SAD] the pain doesn\'t really go into other areas \. It\'s dull and constant \, and aches a lot \. It usually hurts to take deep breathes \.) (0 :out)
  1 (0 how .DO I rate my .PAIN 0)
    2 (The pain is about a seven out of ten \. With medication \, it goes down to about a five \.) (0 :out)
  1 (0 where is the .PAIN located 0)
    2 (The pain is primarily in the left side of my chest \, and in the middle of my back \. Recently \, it also moved to the right side of my chest \.) (0 :out)
  1 (0 does it hurt to 0)
    2 (It hurts whenever I take a deep breath \. It used to hurt to swallow during radiation \, but that isn\'t as bad now \.) (0 :out)
  1 (0 did my .PAIN .COME back 0)
    2 ([SAD] my pain came back a couple weeks after I finished radiation \. It\'s been getting worse recently \.) (0 :out)
  1 (0 has the .PAIN .BECOME worse 0)
    2 ([SAD] the pain seems to have become worse recently \.) (0 :out)
  1 (0 .DO you .HAVE the .PAIN .FREQUENTLY 0)
    2 ([SAD] I seem to have the pain most of the time \, though sometimes it\'s worse than others \.) (0 :out)
)) ; END *response-tree-pain*


(READRULES '*response-tree-medication*
; (What are the side effects of stronger pain medication 1)
; (I am only taking Lortab to treat my pain 1)
'(
  1 (0 a stronger .PAIN medication will .HELP me .SLEEP 0)
    2 (It would be nice to be able to sleep soundly again \. What would the side effects of a stronger pain medication be \, though ?) (0 :out)
  1 (0 I .SHOULD .TAKE stronger .PAIN medication 0)
    2 (Yeah \, I think I should take a stronger pain medication \. The current one isn\'t working well \. What are the side effects ?) (100 :out)
    2 (Yeah \, a stronger pain medication would be good \. What would the side effects be ?) (0 :out)
  1 (0 .DO I .WANT stronger .PAIN medication 0)
    2 (I think I could use a stronger pain medication \. Something to help make me more comfortable \. What are the side effects ?) (100 :out)
    2 (I think having the stronger pain medication would help \.) (0 :out)
  1 (0 I .SHOULD .TAKE something different 0)
    2 (I think something stronger for the pain would be good \. What would the side effects be for a different pain medication ?) (0 :out)
  1 (0 what .MEDICINE am I taking 0)
    2 (I am just taking the lortab for pain right now \.) (0 :out)
  1 (0 how were you prescribed your current .PAIN medication 0)
    2 (I was prescribed the lortab by my previous doctor \, a couple weeks after radiation \.) (0 :out)
  1 (0 what dosage of .PAIN medication am I taking 0)
    2 (I\'ve been taking a pill of the lortab every three hours \. About five pills each day \. I\'m not sure what the exact dosage is \.) (0 :out)
  1 (0 am I taking .PAIN-MED 0)
    2 (I think so \. I am taking lortab for pain right now \.) (0 :out)
  1 (0 am I taking .PAIN-MED-OTHER 0)
    2 (No \, I am not taking any of those \. Just the lortab \.) (0 :out)
  1 (0 what is my .HISTORY with .MED-NARCOTIC 0)
    2 (I took some pain medication for a fractured ankle about fifteen or so years ago \, but I don\'t believe it was a narcotic \. Besides that \, my doctor prescribed me lortab about three weeks ago \.) (0 :out)
  1 (0 am I taking .MED-NARCOTIC 0)
    2 (No \, I am not taking any of those \. Just the lortab \.) (0 :out)
)) ; END *response-tree-medication*


(READRULES '*response-tree-medication-stronger-request*
; (Can I have a stronger pain medication 1)
'(
  1 (0 addiction is not a side .EFFECT of the medication 0)
    2 (It\'s good to know that stronger pain medication is an option without risking addiction \. Would you be able to prescribe me some stronger medication \, then ?) (0 :out)
  1 (0 a side .EFFECT of the medication .BE 2 .SIDE-EFFECTS-MODERATE 2 \. 0)
    2 (I think I should try the medicine and see if I have problems with 9 10 11 \. Could you prescribe me some ?) (0 :out)
  1 (0 a side .EFFECT of the medication .BE 2 .SIDE-EFFECTS-INSIGNIFICANT 2 \. 0)
    2 (I already have 9 10 11 \, so I think the new medicine is worth a try \. Could you prescribe me some ?) (0 :out)
  1 (0 NIL Gist 0 side effects 3 medication 0)
    2 (I think it\'s worth giving it a try \. Could you prescribe me some stronger pain medication ?) (0 :out)
  1 (0)
    2 ([SAD] you know \, i\'m in a lot of pain \, and the lortab just isn\'t working \. I think maybe I need something stronger for my pain \.) (100 :out)
    2 (I think it would be worth trying a new pain medication \. Do you think that would be possible ?) (0 :out)
)) ; END *response-tree-medication-stronger-request*


(READRULES '*response-tree-treatment-chemotherapy*
'(
  1 (0 .CHEMOTHERAPY is a .TREATMENT .OPTION 0)
    2 ([SAD] do you think chemotherapy is really going to help ?) (0 :out)
  1 (0)
    2 (What about chemotherapy ?) (0 :out)
)) ; END *response-tree-treatment-chemotherapy*


(READRULES '*response-tree-chemotherapy-explanation*
; (How does chemotherapy work 1)
; (Do I have any questions about chemotherapy ?)
'(
  1 (0 a side .EFFECT of .CHEMOTHERAPY is 0)
    2 (0 .LOW blood 0)
      3 (I think I will have to do some more research on those side effects before choosing \. How does chemotherapy usually work ?) (0 :out)
    2 (0 neuropathy 0)
      3 (I think I will have to do some more research on those side effects before choosing \. How does chemotherapy usually work ?) (0 :out)
    2 (0 hair loss 0)
      3 (Hair loss sounds unpleasant \, but I would be willing to put up with it if it gives me a chance of improving \. How does chemotherapy usually work ?) (0 :out)
    2 (0 diarrhea 0)
      3 (Diarrhea sounds unpleasant \, but I would be willing to put up with it if it gives me a chance of improving \. How does chemotherapy usually work ?) (0 :out)
    2 (0 nausea 0)
      3 (I already have nausea \, so I think chemotherapy might be worth it if it helps improve my condition \. How does chemotherapy usually work ?) (0 :out)
    2 (0 fatigue 0)
      3 (I already have fatigue \, so I think chemotherapy might be worth it if it helps improve my condition \. How does chemotherapy usually work ?) (0 :out)
    2 (0 loss of appetite 0)
      3 (My appetite is already pretty poor \, so I think chemotherapy might be worth it if it helps improve my condition \. How does chemotherapy usually work ?) (0 :out)
    2 (Okay \. How does chemotherapy usually work ?) (0 :out)
  1 (0 what .CHEMOTHERAPY details are you .ASKING about 0)
    2 (I\'m just wondering how the process of chemotherapy works \, and what i\'d have to do for it \.) (0 :out)
  1 (0 .DO I .UNDERSTAND how .CHEMOTHERAPY works 0)
    2 (I\'ve heard of chemotherapy before \, but I don\'t really understand what it means \. Could you explain it more ?) (100 :out)
    2 (I don\'t really understand chemotherapy \. Can you explain it ?) (0 :out)
  1 (0)
    2 (How does chemotherapy usually work ?) (0 :out)
)) ; END *response-tree-chemotherapy-explanation*


(READRULES '*response-tree-chemotherapy*
; (Do I need chemotherapy 1)
'(
  1 (0 did my doctor .MENTION .CHEMOTHERAPY 0)
    2 (My doctor mentioned something about chemotherapy \, but said that I should wait to see how things go after the radiation is done \. Why \? Do you think I need chemotherapy ?) (0 :out)
  1 (0 what are my feelings about .CHEMOTHERAPY 0)
    2 (I don\'t really know if i\'d want chemotherapy at this point \. My radiation treatment was already so exhausting \, and I want to have time and energy to spend with my family \. But if you think I need chemotherapy \, then I would be willing to give it a shot \. What do you think ?) (0 :out)
  1 (0)
    2 (My previous doctor mentioned something about chemotherapy \, but he said to wait to see how things go after the radiation \. Do you think I need chemotherapy ?) (100 :out)
    2 (Thanks \, though i\'m still a bit confused at this point \. Should I get chemotherapy ?) (100 :out)
    2 (Do you think I need chemotherapy ?) (0 :out)
)) ; END *response-tree-chemotherapy*


(READRULES '*response-tree-chemotherapy-side-effects*
; (What are the side effects of chemotherapy 1)
'(
  1 (0 you think we .SHOULD talk to my oncologist about .CHEMOTHERAPY 0)
    2 (I think it would be best to revisit chemotherapy after talking to my oncologist \. However \, I still want to learn a bit more about it \. What are some of the side effects ?) (0 :out)
  1 (0 .DO I .HAVE any questions about .CHEMOTHERAPY 0)
    2 (When I hear about chemotherapy \, people always seem to mention the side effects \. Are there any side effects of chemotherapy I should know about ?) (0 :out)
  1 (0)
    2 (I hear about people getting sick and losing hair during chemotherapy \. What are some of the side effects ?) (100 :out)
    2 (What are some of the side effects of chemotherapy ?) (0 :out)
)) ; END *response-tree-chemotherapy-side-effects*


(READRULES '*response-tree-tell-family*
; (What should I tell my family 1)
'(
  1 (0 .DO my .FAMILY .KNOW about my cancer 0)
    2 ([SAD] my family knows about my cancer already \, but they don\'t really know how bad it is \, or what it means for me \. How should I discuss these with them ?) (0 :out)
  1 (0 who .IN my .FAMILY .DO I .WANT to .TELL about the prognosis 0)
    2 ([SAD] I imagine my son and daughter should both know \. Especially my daughter \, since i\'ve been staying with her and her grandson \. But how do I break such hard news to them \? They were all hoping things would turn out maybe not amazing but \, better than this \.) (0 :gist)
  1 (0 .DO I .WANT you to .BE present when I .TELL my .FAMILY about the prognosis 0)
    2 (Thank you \, but with everyone\'s schedules I think it would be hard to find time for us all to meet with you \. I can tell them myself \. I just want to know if you have any advice on breaking such hard news \.) (0 :out)
  1 (0 how .MUCH .DO I .WANT my .FAMILY to .KNOW about the prognosis 0)
    2 (I don\'t really know \. I certainly don\'t want to burden my family with the knowledge of a prognosis they can\'t do much about \, but I also think they\'d want to hear the whole truth \. And \, I may need their help more and more as the cancer progresses \. What do you think I should do ?) (0 :out)
  1 (0 you will .BE .AVAILABLE to .HELP me and my .FAMILY during my cancer .TREATMENT 0)
    2 (That\'s such a relief to hear \. I\'m happy that \, between you and my family \, I won\'t be alone in all this \. I\'m still a little nervous about telling them though \. Is there any suggestions you have for delivering bad news ?) (0 :out)
  1 (0)
    2 ([SAD] I haven\'t told my family everything yet \. I wanted to wait to talk to you first \. What should I say to them ?) (0 :out)
)) ; END *response-tree-tell-family*


(READRULES '*response-tree-prognosis*
; (what is 1 prognosis 1)
'(
  1 (0 my cancer has gotten worse 0)
    2 ([SAD] what does that mean for me ?) (100 :out)
    2 ([SAD] how long do you think I have left ?) (0 :out)
  1 (0 the prognosis is that I cannot .BE cured 0)
    2 ([SAD] I feared as much \, though it\'s still pretty upsetting \. How long do you think I have ?) (100 :out)
    2 ([SAD] how long specifically do you think I have left ?) (0 :out)
  1 (0 the prognosis is that my cancer .SHOULD .BE treated with .CHEMOTHERAPY 0)
    2 ([SAD] I can talk about my options in a moment \, but first I just want to know how bad it really is \. How long do you think I have ?) (100 :out)
    2 ([SAD] before I talk about treatment \, I just want to know how bad it really is \. How long do you think I have ?) (0 :out)
  1 (0 the prognosis is that my cancer .SHOULD .BE treated with comfort .CARE 0)
    2 ([SAD] comfort care does sound appealing \. But before we get too far into treatment options \, i\'d just like to know how bad it is \. How much time do you think I still have ?) (0 :out)
    2 ([SAD] before we get into the treatment options \, i\'d just like to know how bad it really is \. How much time do you think I still have ?) (100 :out)
  1 (0 the prognosis is hard to .PREDICT 0)
    2 (My last doctor also just said it would be hard to predict \. I think I am ready to hear though \. Could you please try to tell me what the worst case looks like ?) (100 :out)
    2 ([SAD] I want you to be honest with me \. How long do you think I have ?) (0 :out)
  1 (0 the test results show that the cancer hasn\'t .SPREAD 0)
    2 (My previous doctor didn\'t seem very optimistic \. So what do you think this all means for me ?) (100 :out)
    2 (What do you think my future will look like \, then ?) (0 :out)
  1 (0 the test results show that me cannot .BE cured 0)
    2 ([SAD] that\'s distressing \. I was fearing the worst \, but in the back of my mind I didn\'t think it would all happen so quickly \. My family will be distraught \. What I am wondering at this point is \, how much time do I have left ?) (100 :out)
    2 ([SAD] I want you to be honest with me \. How long do you think I have left ?) (0 :out)
  1 (0 the test results show that the radiation is not working 0)
    2 ([SAD] i\'m not surprised to hear the radiation did not help \, as my pain has gotten worse in these past couple of weeks \. But what does this mean for my future ? How long do I have left ?) (100 :out)
    2 ([SAD] if the radiation couldn\'t stop my cancer \, then what does that mean for my future ? How much time do I have left ?) (0 :out)
  1 (0 the test results show that my cancer has .SPREAD 0)
    ; OPPORTUNITY for open-ended questions: "Do you understand your prognosis?", "What concerns you the most for your future?", "What are your treatment goals?"
    2 ([SAD] [OPPORTUNITY] those are not the words I wanted to hear \. I mean \, I was bracing for the worst \, since I could tell by the pain that it\'s bad \. But to hear that the cancer has spread is quite depressing \. What does it all mean for me ?) (100 :out)
    2 ([SAD] I want you to be honest with me \. How long do you think I have left ?) (0 :out)
  1 (0 the prognosis is that I may live for several .ELAPSED-TIME 0)
    2 (I\'m not sure whether that\'s a good thing or bad thing \. Could you be more specific about how long you think I have left ?) (100 :out)
    2 ([SAD] I want you to be honest with me \. How long do you think I have left ?) (0 :out)
  1 (0 the prognosis is that I .DO not .HAVE .LONG .LEFT to live 0)
    2 ([SAD] I know i\'ve been getting worse recently \, but I don\'t feel that bad yet \. How long do you think I really have left ?) (100 :out)
    2 ([SAD] I don\'t really understand \. Could you tell me specifically how long I have left ?) (0 :out)
  1 (0 .DO I .UNDERSTAND my prognosis 0)
    2 ([SAD] I don\'t really understand my prognosis \, i\'m just bracing myself for the worst \. Can you tell me how long you think I have ?) (0 :out)
  1 (0 what scares me about my prognosis 0)
    2 ([SAD] what worries me the most is just how uncertain my future is \. Some days I believe my condition will get better and others I brace myself for the worst \. Is there any way you can let me know what I should expect ?) (0 :out)
  1 (0 how .DO I feel about my prognosis 0)
    2 ([SAD] I feel very anxious about my condition \. I feel like it\'s gotten worse \. I want to know what this means for my future \.) (0 :out)
  1 (0 .DO I .HAVE any questions about my prognosis 0)
    2 (I was wondering whether I could get a second opinion on my prognosis ? I\'m going to be facing a lot of important decisions soon about my future and I want to be as prepared as I can \.) (100 :out)
    2 (Do you think it would be beneficial to get a second opinion on my prognosis ?) (0 :out)
  1 (0 the test results .DO not appear conclusive 0)
    2 ([SAD] that\'s unfortunate \. I was hoping to get some answers today about what my future would look like \. I\'m wondering \, is there any way you could still tell me how much time I can expect ?) (0 :out)
  1 (0 how .MUCH information .DO I .WANT about my prognosis 0)
    2 (Please give me all the information you have \. It scares me more to be left in the dark than to know what my prognosis may be \.) (100 :gist)
    2 (Don\'t hold anything back \. I think I can take it and I want to know how much time I still have \.) (0 :gist)
  1 (0 am I ready to start discussing .TREATMENT options 0)
    2 (Hold on a moment \. Before we start talking about my options for treatment \, I need to know what these test results might mean for my future \. How long do you think I might have left ?) (0 :out)
  1 (0)
    ; OPPORTUNITY for open-ended questions: "What are your treatment goals?", "Do you understand your diagnosis?", "How do you feel about your future?"
    2 ([OPPORTUNITY] what do you think this means for me in the future ?) (100 :out)
    2 (How long do you think I have left at this point ?) (100 :out)
    2 (I want you to be honest with me \. How long do you think I have ?) (0 :out)
)) ; END *response-tree-prognosis*


(READRULES '*response-tree-prognosis-denial*
; (Can I trust your prognosis ?)
'(
  1 (0 the prognosis is that I may live for .NUMBER-PLUR .ELAPSED-TIME-PLUR 0)
    2 (That\'s difficult to hear \. Are you certain I don\'t have any more time than 10 11 ? I had an uncle fred who was told he had two or three months to live \, but he held on for a year and a half \.) (0 :out)
  1 (0 the prognosis is that I may live for .NUMBER-TOTAL .ELAPSED-TIME 0)
    2 (That\'s difficult to hear \. Are you certain I don\'t have any more time than 10 11 ? I had an uncle fred who was told he had two or three months to live \, but he held on for a year and a half \.) (0 :out)
  1 (0 the prognosis is that I may live for several .ELAPSED-TIME 0)
    2 (That\'s difficult to hear \. Are you certain I don\'t have any more time than that ? I had an uncle fred who was told he had two or three months to live \, but he held on for a year and a half \.) (0 :out)
  1 (0 the prognosis is that I .DO not .HAVE .LONG .LEFT to live 0)
    2 (That\'s difficult to hear \. Are you certain I don\'t have any more time ? I had an uncle fred who was told he had two or three months to live \, but he held on for a year and a half \.) (0 :out)
  1 (0 the prognosis is that I may live for a .ELAPSED-TIME 0)
    2 (That\'s difficult to hear \. Are you certain I don\'t have any more time than a 11 ? I had an uncle fred who was told he had two or three months to live \, but he held on for a year and a half \.) (0 :out)
  1 (0 .DO I .UNDERSTAND my prognosis 0)
    2 (My test results seem to say that I don\'t have a lot of time left \. But I know how hard these things are to predict \. Are you sure that my chances aren\'t somewhat better than that ?) (0 :out)
  1 (0)
    2 (I know how hard it is to predict someone\'s chances \. Are you sure that my prognosis is exactly right ?) (0 :out)
    2 (Are you sure my prognosis is correct ?) (0 :out)
)) ; END *response-tree-prognosis-denial*


(READRULES '*response-tree-bargaining-habits*
; (Can I outlive your prognosis if I have healthy habits?)
'(
  1 (0 the majority of people .HAVE an accurate prognosis 0)
    2 (I guess you\'re right \. But maybe there\'s a reason some people can beat their prognoses and others can\'t ? When my uncle fred was battling his cancer \, he swore by healthy eating and taking a daily walk \. If I keep in good shape \, will that improve my chances ?) (0 :out)
  1 (0 the majority of people .DO not .HAVE an accurate prognosis 0)
    2 (Well \, it\'s nice to hear that I might have a bit more time than I thought \. When my uncle fred was battling his cancer \, he swore by healthy eating and taking a daily walk \. If I keep in good shape \, will that improve my chances ?) (0 :out)
)) ; END *response-tree-bargaining-habits*


(READRULES '*response-tree-bargaining-now*
; (Can I outlive your prognosis if I am healthy now?)
'(
  1 (0 .DO I .UNDERSTAND my prognosis 0)
    2 (I know my test results say that I don\'t have a lot of time \. But I still feel pretty good right now \.) (0 :out)
    2 (The tests say one thing \, but I feel okay right now \. Is there a chance I may be able to beat this ?) (0 :out)
  1 (0 my understanding of my prognosis may .BE correct 0)
    2 (I\'ve heard how challenging it is to predict these things \. All the same \, for someone with such a bleak prognosis \, i\'m actually feeling pretty great \. Is there a chance I may be able to beat this ?) (0 :out)
  1 (0 my understanding of my prognosis is .INCORRECT 0)
    2 (Oh \, that\'s too bad \. All the same \, for someone with such a bleak prognosis \, i\'m actually feeling pretty great \. Is there a chance I may be able to beat this ?) (0 :out)
  1 (0 my understanding of my prognosis is correct 0)
    2 (Oh \, that\'s great to hear \. I have to say \, for someone with such a bleak prognosis \, i\'m actually feeling pretty great \. Is there a chance I may be able to beat this ?) (0 :out)
  1 (0)
    2 (Do you think I could turn around ? Maybe i\'ll feel different in a few months \.) (100 :out)
    2 (I\'ve always been healthy my entire life \. Does that improve my chances ?) (100 :out)
)) ; END *response-tree-bargaining-now*


(READRULES '*response-tree-bargaining-quit-smoking*
;Can I outlive your prognosis if I quit smoking 1)
'(
  1 (0 my cancer is the .RESULT of my smoking 0)
    2 ([SAD] I only wish I had known that when I was younger \. Then I would have forced myself to stop smoking years ago \. And maybe now I would have more time to spend with my grandson \. Tell me \, it help at all that I stopped smoking now ?) (0 :out)
  1 (0)
    2 (I quit smoking as soon as I heard my diagnosis \. Does that help at all ?) (0 :out)
)) ; END  *response-tree-bargaining-quit-smoking*


(READRULES '*response-tree-bargaining-graduation*
; (Can I outlive your prognosis until the graduation of my grandson?)
'(
  1 (0 quitting smoking will not make my prognosis better 0)
    2 ([SAD] oh \. That\'s too bad \. I\'m glad that I quit though \. After all \, I have my grandson to think about \. Speaking of my grandson \, I know the test results say one thing \, but do you think I \'ll live to see his graduation ? He\'s in middle school right now \.) (0 :out)
  1 (0 quitting smoking .MIGHT make my prognosis better 0)
    2 (Either way \, i\'m glad I quit \. After all \, I have my grandson to think about \. I know the test results say one thing \, but do you think I \'ll live to see his graduation ? He\'s in middle school right now \.) (0 :out)
  1 (0 quitting smoking will make my prognosis better 0)
    2 (Either way \, i\'m glad I quit \. After all \, I have my grandson to think about \. I know the test results say one thing \, but do you think I \'ll live to see his graduation ? He\'s in middle school right now \.) (0 :out)
  1 (0 .HEALTHY habits will .HELP me outlive my prognosis 0)
    2 (Well \, either way \, I figure there\'s no harm in trying \. After all \, I have my grandson to think about \. I know the test results say one thing \, but do you think I \'ll live to see his graduation ? He\'s in middle school right now \.) (0 :out)
  1 (0 .HEALTHY habits may .HELP me outlive my prognosis 0)
    2 (Well \, either way \, I figure there\'s no harm in trying \. After all \, I have my grandson to think about \. I know the test results say one thing \, but do you think I \'ll live to see his graduation ? He\'s in middle school right now \.) (0 :out)
)) ; END *response-tree-bargaining-grandson*


(READRULES '*response-tree-mental-health*
; (I feel mildly depressed 1)
'(
  1 (0 I am sleeping poorly .BECAUSE of my mental health 0)
    2 (I have been feeling a bit down recently \, though I think my pain is the main cause of my sleep problems \.) (0 :out)
  1 (0)
    2 ([SAD] well \, I do try to keep carrying on \, but sometimes I just feel down \.) (0 :out)
)) ; END *response-tree-mental-health*


(READRULES '*response-tree-anxiety*
; (I feel nervous about my future 1)
'(
  1 (0 was I nervous about this .APPOINTMENT 0)
    2 (I was a bit nervous about the appointment because I knew i\'d finally learn about what my test results mean \. But what worries me most is my future \.) (0 :out)
  1 (0 is something harming your mental health 0)
    2 (Well \. Sometimes I start to worry about my future \, and I find it difficult to stop \.) (0 :out)
  1 (0 I am sorry you .HAVE been .FEELING down .RECENTLY 0)
    2 (Thank you \. I appreciate the thoughtfulness \. I think i\'m just worried about what my future will hold \. Everything is an unknown right now \, and I feel so out of control \.) (0 :out)
  1 (0 cancer .CAN affect the human .BODY suddenly 0)
    2 ([SAD] it\'s as though in a matter of months \, my entire life has been turned upside down \! So many things that I took for granted about my future are now unknown \. It scares me a lot \.) (0 :out)
  1 (0 cancer .CAN affect anyone 0)
    2 (That\'s true \. Cancer is such a horrible illness \. It comes into your life without warning and completely takes it over \. It scares me a great deal how little I know now about my future \.) (0 :out)
  1 (0 I am sorry you .HAVE been .FEELING down .RECENTLY 0)
    2 (I appreciate the kind words \. Truth be told \, I spend a lot of time worried about the future \. Everything is out of my control right now \, and it feels like there so little I can do about it \.) (0 :out)
  1 (0)
    2 (It\'s easy for my mind to immediately jump to the worst possible conclusions \. I guess i\'m pretty worried about what the future will hold \.) (0 :out)
)) ; END *response-tree-anxiety*


(READRULES '*response-tree-understanding-of-condition*
; (I know that my cancer has gotten worse\, but I\'m not sure how bad it is 1)
'(
  1 (0 what .DO I .UNDERSTAND 0)
    2 ([SAD] I don\'t really understand it very well \. It feels like my cancer has gotten worse \, but i\'m not sure how bad it is \.) (100 :out)
    2 ([SAD] it feels like my condition has gotten worse recently \, but I don\'t really know what this means for my future \.) (0 :out)
  1 (0 how am I .FEELING about my condition 0)
    2 ([SAD] it feels like my condition has gotten worse \. But i\'m not yet sure how bad it really is \.) (100 :out)
    2 ([SAD] I don\'t feel good about my condition at all \. It seems like it\'s gotten worse \.) (0 :out)
  1 (0 what scares me about my condition 0)
    2 ([SAD] what scares me most is that my condition is becoming harder and harder to live with \, but I have no idea how much worse it\'s going to get \.) (100 :out)
    2 ([SAD] the uncertainty is the scariest part \. If I knew what was coming \, at least I could brace myself for it \. But these days \, I can\'t tell if i\'m getting worse or just having a bad day \.) (0 :out)
)) ; END *response-tree-understanding-of-condition*


(READRULES '*response-tree-reason-for-cancer*
; (Why do I have cancer ?)
'(
  1 (0 my cancer is caused by a mutation that .SPREAD through my cells 0)
    2 (I still don\'t know if I understand \. How did the cancer get into my body ? Was there something I could have done differently to prevent it ?) (100 :out)
    2 (I\'m sorry \, I still don\'t think I understand all the terminology \. I know the cancer got worse \, but was there anything I could have done to prevent it ?) (0 :out)
  1 (0 the .CAUSE of my cancer is unclear 0)
    2 (I know that it\'s hard to say anything for certain \. I just wish I could know how the cancer started \. Or if there was anything that I could have done to prevent it ?) (0 :out)
  1 (0)
    2 (I still don\'t understand how this happened \! Just three months ago I didn\'t even know I had cancer \.) (0 :out)
)) ; END *response-tree-reason-for-cancer*


(READRULES '*response-tree-questions*
; (What are your questions 1)
'(
  1 (0 how .DO I think this .CONVERSATION is going 0)
    2 (I think our conversation is going fine \. It\'s just a lot to take in \, though \. Do you have any questions for me at this point ?) (0 :out)
  1 (0 how .MUCH information .DO I .WANT 0)
    2 (Please give me as much information as you can \, but try to avoid getting too technical \. Don\'t hold anything back \, I think i\'m prepared to hear it \.) (20 :out)
    2 (Try to give me as much information as you think is appropriate \. I probably won\'t understand technical terms \, so try to explain in basic language \.) (20 :out)
    2 (Please don\'t hold any information back from me \. Try to explain in simple terms \, though \.) (0 :out)
  1 (0 am I following what you say 0)
    2 (I think i\'m following \. It\'s just very difficult to take in \. Do you have any specific questions for me at this point ?) (0 :out)
    2 (This is a lot of difficult information for me to handle \, but i\'m trying my best to understand \.) (0 :out)
  1 (0)
    2 (What questions do you have for me ?) (20 :out)
    2 (What are your questions ?) (20 :out)
    2 (What questions do you want to ask ?) (0 :out)
)) ; END *response-tree-questions*


(READRULES '*response-tree-rephrase*
; (can 1 rephrase 1 question 1)
'(
  1 (0)
    2 (I am sorry \, I didn\'t quite understand \. Can you say it again ?) (3 :out)
    2 (Would you mind rephrasing ?) (3 :out)
    2 (Could you repeat that one more time using a different phrasing ?) (0 :out)
)) ; END *response-tree-rephrase*