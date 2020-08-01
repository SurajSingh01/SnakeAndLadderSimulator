
#!/bin/bash -x
echo "Welcome to snake Ladder Simulator"

#Intialinzing variable
position=0
INITIAL_POSITION=0
END_POSITION=100


function playingOption()
{
	if [ $position -lt 94 ]
	then
		diceRoll=$(( 1 + RANDOM % 6 ))
		#echo "The number obtained is $diceRoll"
		option=$(( RANDOM % 3 ))
		case "$option" in
			1)
				echo "No play, your postion is $position"
				position=$position
				;;
			2)
				echo "Congrats You got a ladder! now move by $diceRoll forword"
				position=$(( $position + $diceRoll ))
				;;

 			*)
				echo "Ohh! you got a snake now move by $diceRoll backword"
				position=$(( $position + $diceRoll ))
				if [ $position -le $INITIAL_POSITION ]
				then
					position=0
				fi
				;;
		esac
	elif [ $position -ge 94 -a $position -le $END_POSITION ]
	then
		diceRoll=$(( 1 + RANDOM % 6 ))
		#echo "The die rolled to a $diceRoll, move forward by $diceRoll"
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
