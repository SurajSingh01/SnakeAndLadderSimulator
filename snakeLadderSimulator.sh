
#!/bin/bash -x
echo "Welcome to snake Ladder Simulator"

#Intialinzing variable
INITIAL_POSITION=0
END_POSITION=100
position=0
count=0
playerOneCount=0
playerTwoCount=0

function playingOption()
{
	echo "Position = $position"
	if [ $position -lt 94 ]
	then
		diceRoll=$(( 1 + RANDOM % 6 ))
		(( count++ ))
		echo "The number obtained is $diceRoll"
		option=$(( RANDOM % 3 ))
		case "$option" in
			1)
				echo "No play, your postion is $position"
				position=$position
				;;
			2)
				echo "Congrats You got a ladder! now move by $diceRoll forword"
				position=$(( $position + $diceRoll ))
				playingOption																		# Get one more turn in case of ladder
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
		(( count++ ))
		echo "The die rolled to a $diceRoll, move forward by $diceRoll"
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


# For player one

while (( $position <= $END_POSITION ))
do
	if [ $position -eq $END_POSITION ]
	then
		position=0
		count=0
		break
	fi
	playingOption
	playerOneCount=$count
done

#For PLayer Two

while (( $position <= $END_POSITION ))
do
	if [ $position -eq $END_POSITION ]
   then
      position=0
      count=0
      break
   fi
	playingOption
	playerTwoCount=$count
done
echo "--------------------------------------------"
echo "It took player one $playerOneCount dice roll to win the game"
echo "--------------------------------------------"
echo "It took player two $playerTwoCount dice roll to win the game "
echo "--------------------------------------------"

if [ $playerOneCount -lt $playerTwoCount ]
then
	printf "\nPlayer One Won the Game\n"
else
	printf "\nPlayer Two won the Game\n"
fi
