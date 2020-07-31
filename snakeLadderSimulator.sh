
#!/bin/bash -x
echo "Welcome to snake Ladder Simulator"

#Intialinzing variable
position=0

echo "The intial position of the player will be $position"

dieRoll=$(( 1 + RANDOM % 6)) 
echo "The number obtained is $dieRoll"
