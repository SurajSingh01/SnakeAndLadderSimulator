
#!/bin/bash -x
echo "Welcome to snake Ladder Simulator"

#Intialinzing variable
position=0
INITIAL_POSITION=0
END_POSITION=100
#Assumed that size of ladder is 21
ladder=21
lastLadderPosition=75
#Assumed that size of snake is 18
snake=18

echo "The intial position of the player will be $position"

function playingOption()
{
	if [ $position -lt 94 ]
	then
		diceRoll=$(( 1 + RANDOM % 6 ))
		echo "The number obtained is $diceRoll"
		option=$(( RANDOM % 4 ))
		case "$option" in
			0)
				echo "No play , your postion is $position"
				position=$position
				;;
			# Assumed that the ladder size is of 21 and the last ladder is at position 78
			1)
				if [ $position -lt $lastLadderPosition ]
				then
					echo "Congrats You got a ladder ! move by $diceRoll forward "
					position=$(( $position + $diceRoll +$ladder ))
				fi
				;;
			2)
			#echo "Normal play ,move dice by $diceRoll forward"
				position=$(( $position + $diceRoll ))
				if [ $position -le $END_POSITION ]
				then
					echo "Normal play, move dice by $diceRoll forward"
				fi
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
	elif [ $position -ge 94 -a $position -le $END_POSITION ]
	then
		diceRoll=$(( 1 + RANDOM % 6 ))
		echo "The die rolled to a $diceRoll, move forward by $diceRoll"
		if [ $(( $diceroll + $position )) -eq $END_POSITION ]
		then
			echo "You won the Game"
			position=$END_POSITION
		else
			if [ $(( $diceRoll + $position )) -gt $END_POSITION ]
			then
				position=$position
			else
				position=$(( $position + $diceRoll ))
			fi
		fi
	fi
}

while (( $position <= $END_POSITION ))
do
	if [ $position -eq $END_POSITION ]
	then
		break
	fi
	playingOption
	echo "You are at $position position"
done
