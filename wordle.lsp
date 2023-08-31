; Screen Clear
(format t "~A[H~@*~A[J" #\escape)
(print (format t "


        O))        O))           O))))            O)))))))           O)))))           O))             O))))))))
        O))        O))         O))    O))         O))    O))         O))   O))        O))             O))      
        O))   O)   O))       O))        O))       O))    O))         O))    O))       O))             O))      
        O))  O))   O))       O))        O))       O) O))             O))    O))       O))             O))))))  
        O)) O) O)) O))       O))        O))       O))  O))           O))    O))       O))             O))      
        O) O)    O))))         O))     O))        O))    O))         O))   O))        O))             O))      
        O))        O))           O))))            O))      O))       O)))))           O))))))))       O))))))))
                                                                                                       
                                        Common Lisp Version by Ethan Roldan             

                                        * : Correct Letter Correct Position
                                        + : Correct Letter Incorrect Positon
                                        - : Incorrect Letter                                                                              
                                        
                        If you find a bug please let me know so I can cry and then fix it 

"))

; Global Variables and Functions
(setf allWords (list
    ""
    "AUDIO" 
    "WHALE"
    "THREE"
))
(setf numWords 0)
(loop for x in allWords 
    do(setf numWords (+ numWords 1)))

(setf currWord "")
(defun setWord () 
    (setf tempWords allWords)
    (loop for x from 0 to (random (- numWords 1))
        do 
            (setf tempWords 
                (cdr tempWords)
            )
    )
    (setf currWord (car tempWords))
)
(setWord)


; Gameplay Time :D

; concatString is from stack overflow, concatinates a given list into a single string
(defun concatString (list)
  (if (listp list)
      (let ((result ""))
        (dolist (item list)
          (if (stringp item)
              (setq result (concatenate 'string result item))))
        result)))

(setf guess "")
(defun enterGuess() 
    (setf hint (list "-" "-" "-" "-" "-"))

    (terpri)
    (print (concatString (list "Attempts: " (write-to-string attempts))))
    (print "Enter a guess: ")
    
    (setf guess (write-to-string (read)))

    (if (/= 5 (length guess))
        (print "Invalid Guess")
    )

    (if (= 5 (length guess))
        (checkGuess)
    )
)

(defun checkGuess()
    (setf attempts (- attempts 1))

    (setf currWordCopy (list "" "" "" "" ""))
    (setf guessCopy (list "" "" "" "" ""))
    (loop for x from 0 to 4 do
        (setf (nth x currWordCopy) (elt currWord x))
        (setf (nth x guessCopy) (elt guess x))
    )

    (loop for x from 0 to 4 do
        (loop for y from 0 to 4 do(
            if (equal (elt currWordCopy x) (elt guessCopy y))
                (progn
                    (setf (nth y hint) "+")
                    (setf (nth x currWordCopy) "!")
                    (setf (nth y guessCopy) "?")
                )
        ))
    )

    (loop for x from 0 to 4 do (
        if (equal (elt currWord x) (elt guess x))
            (setf (nth x hint) "*")
    ))

    (print (string-upcase guess))
    (print (concatString hint))

    (if (equal (concatString hint) "*****")
        (win)
    )
)

(defun win()
    (print "YOU GOT IT!!!")
    (setf attempts -1)
)

(setf attempts 6)
(loop while (> attempts 0) do(enterGuess))