(let ((in (open "testfile" :if-does-not-exist nil)))
  (when in
    (let ((storage (list)))
      (progn
        (loop for line = (read-line in nil)
              while line do (push line storage))
        (format t "~a~%" (cdr (cdr (cdr storage))))))
    (close in)
    )
  )
