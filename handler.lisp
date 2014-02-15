
(defun irc-command (line s channel)
	(print line)


	(if  (EQ (search "Zimdale" line :test #'char-equal) nil) do
		(print "RUNNING") 
		(format s (concatenate 'string "PRIVMSG " channel ": YO ~%"))(force-output s)
	)




)