(load "handler.lisp")
;Define Configs
(setf server "irc.freenode.net")
(setf port 6667)
(setf channel "##phoenixirc")
(setf nickName "PhoeLisp")
(setf user "PhoenixIRC")
(setf loadChars "...")
(setf run 0)
(let ((s (socket:socket-connect port server :external-format :unix))(line nil)(out nil))

(defun start (&key)
	(format t "Starting Bot")
	;(format s "NICK " nickName "~%USER" user "8 * :" user "!~%") (force-output s)
    (format s "NICK PhoeLisp~%USER PhoeLisp 8 * :PhoenixLisp!~%")(force-output s)
	(setf joinString (concatenate 'string "JOIN " channel "~%"))
	(format s joinString)(force-output s)
	(read-irc s)
	(print loadChars)
	(read s)
	(read-line s)
	(print loadChars)
	(read-irc s)
	(print loadChars)
	(read-irc s)
	(print loadChars)
	(print "Authenticated")
	(loop while (EQ (search ".QUIT" line :test #'char-equal) nil) do
		(setq line (read-line s line))
		(if (EQ (search ":" line) 0)
			(ping-pong s line)

		)
	)


)

(defun ping-pong (s line) 
	(let ((response (subseq line (search "PING" line))))
		if (EQ response nil)()(progn 
			(format s "PONG ~A~%" response)(force-output s)
		)

	)
)


(defun read-irc (server-stream)
	(let ((line "NOREAD~%"))
		(loop while (eq :input (socket:socket-status (cons server-stream :input))) do
			(setq line (read-line server-stream))
			(return-from read-irc line)
		)
	)
)
(defun start-listen (&yes) 
	(loop while (= run 0) do
		(setf line (read-irc s))
		(irc-command line s channel)
		
	)
)
	






) ;close let