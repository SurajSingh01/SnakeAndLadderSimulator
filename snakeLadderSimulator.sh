
#!/bin/bash -x
echo "Welcome to snake Ladder Simulator"

#Intialinzing variable
position=0
INITIAL_POSITION=0
END_POSITION=100
#Assumed that size of ladder is 21
ladder=21
#Assumed that size of snake is 18
snake=18

echo "The intial position of the player will be $position"

function playingOption()
{
	diceRoll=$(( 1 + RANDOM % 6 ))
	echo "The number obtained is $diceRoll"
	option=$(( RANDOM % 4 ))
	case "$option" in
		0)
			echo "No play , your postion = $position"
			position=$position
			;;
		# Assumed that the ladder size is of 21 and the last ladder is at position 78
		1) if [ $position -lt 70 ]
			then
				echo "Congrats You got a ladder ! move by $diceRoll forward "
				position=$(( $position + $diceRoll +$ladder ))
			fi
			;;
		2)
			echo "Normal play ,move dice by $diceRoll forward"
			position=$(( $position + $diceRoll ))
			;;

 		*)
			echo "Ohh! you got a snake move by $diceRoll backword"
			position=$(( $position + $diceRoll -$snake ))
			if [ $position -le $INITIAL_POSITION ]
			then
				position=0
			fi
			;;
	esac
}

while (( $position < $END_POSITION ))
do
	playingOption
	if [ $position -eq $END_POSITION ]
	then
		echo "You reached the end"
		break
	fi
	echo "You are at $position position"
done

