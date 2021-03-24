(let ((in (open "testfile" :if-does-not-exist nil))
      (storage (list)))
  (when in
    (progn
      (loop for line = (read-line in nil)
            while line do (if (not (member line storage :test #'string=))
                            (push line storage)))
      (with-open-file (str "output"
                           :direction :output
                           :if-exists :supersede
                           :if-does-not-exist :create)
        (loop for unique-line in (nreverse storage) do (format str (concatenate 'string unique-line "~%")))
        ))
    (close in))
  )
