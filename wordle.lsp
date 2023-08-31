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
                                        
                            Do not guess words with repeat letters, they are still buggy 

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

(defun concatString (list)
  "A non-recursive function that concatenates a list of strings."
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
    (print "Enter a guess: ")
    (setf guess (write-to-string (read)))

    (if (/= 5 (length guess))
        (print "Invalid Guess")
        (setf attempts (- attempts 1))
    )

    (if (= 5 (length guess))
        (checkGuess)
    )
)

(defun checkGuess()
    (loop for x from 0 to 4 do
        (loop for y from 0 to 4 do(
            if (equal (elt currWord x) (elt guess y))
                (setf (nth y hint) "+")
        ))
    )

    (loop for x from 0 to 4 do (
        if (equal (elt currWord x) (elt guess x))
            (setf (nth x hint) "*")
    ))

    (print (string-upcase guess))
    (print (concatString hint))

    (if (equal (concatString hint) "*****")
        (print "YOU GOT IT!!!")
        (return-from checkGuess nil)
    )
)

(setf attempts 1)
(loop for attempts from 1 to 6 do(enterGuess))