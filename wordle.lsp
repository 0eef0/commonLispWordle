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

(defun enterGuess() 
    (print "Enter a guess: ")
    (setf guess (read))

    (print (string-upcase guess))
    (print "*****")

    (terpri)
)

(loop for x from 1 to 6 do(enterGuess))

(loop for x from 0 to 3 do(print (elt "test" x)))