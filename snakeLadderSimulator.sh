
#!/bin/bash -x
echo "Welcome to snake Ladder Simulator"

#Intialinzing variable
INITIAL_POSITION=0
END_POSITION=100
position=0
count=0
MAX_DICEROLL_VALUE=6
diceRollPosition=$(( $END_POSITION - $MAX_DICEROLL_VALUE ))

function playingOption()
{
	if [ $position -lt $diceRollPosition ]
	then
		diceRoll=$(( 1 + RANDOM % 6 ))
		option=$(( RANDOM % 3 ))
		case "$option" in
			1)
				echo "No play, your postion is $position"
				;;
			2)
				echo "Congrats You got a ladder! now move by $diceRoll forword"
				position=$(( $position + $diceRoll ))
				playingOption																		# Get one more turn in case of ladder
				;;

 			*)
				echo "Ohh! you got a snake now move by $diceRoll backword"
				position=$(( $position - $diceRoll ))
				if [ $position -le $INITIAL_POSITION ]
				then
					position=0
				fi
				;;
		esac
 #if the position is less than 100 but greater than 94 than this condition will work
	elif [ $position -ge $diceRollPosition -a $position -le $END_POSITION ]
	then
		diceRoll=$(( 1 + RANDOM % 6 ))
		if [ $(( $diceroll + $position )) -eq $END_POSITION ]
		then
			echo "You won the Game"
			position=$END_POSITION
		else
			if [ $(( $diceRoll + $position )) -gt $END_POSITION ]
			then
				echo "Unlucky, roll again"
				position=$position
			else
				echo "Move forward by $diceRoll position"
				position=$(( $position + $diceRoll ))
				echo "position = $position"
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
done
