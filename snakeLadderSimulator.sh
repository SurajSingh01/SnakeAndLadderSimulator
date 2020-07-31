
#!/bin/bash -x
echo "Welcome to snake Ladder Simulator"

#Intialinzing variable
position=0

echo "The intial position of the player will be $position"

function playingOption()
{
	diceRoll=$(( 1 + RANDOM % 6 ))
	echo "The number obtained is $diceRoll"
	option=$(( RANDOM % 3 ))
	case "$option" in
		1)
			echo "No play , your postion = $position"
			position=$position
			;;
		2)
			echo "Congrats You got a ladder ! move by $diceRoll forward "
			position=$(( $position + $diceRoll ))
			;;
		*)
			echo "Ohh! you got a snake move by $diceRoll backword"
			position=$(( $position - $diceRoll ))
			;;
	esac
}

playingOption
