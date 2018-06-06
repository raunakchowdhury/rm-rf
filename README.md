# Team rm-rf -- T. Fabiha, Nadie Jackson
### APCS2 pd2
### HW59 -- ...and Ever Upward
### 2018-06-05

# Plants vs. Zombies - Zomboss Fight
 We are simulating the final level of Plants vs Zombies 1. The conventional PvZ games allow you to expand your garden-army of plants with sun; however, in the Zomboss boss fight (the final boss), there is no sun. Instead, plants are automatically generated for you. 
 This will include two data structures we learned this year.
## Queues
We will simulate a feeder belt with plants with a Queue. We are still unsure of how to do the animation; however, the MVP will be that the card simply appears in the Queue (ie. no sliding along; it’ll just pop into existence)
To randomly generate zombies and plants, we will be using two queues. At every attempt of generation, the relevant queue will be consulted. Each queue will store the different class types of plants and zombies that could be generated.
## Quicksort Algorithm
Sorting the times for leaderboard after completion of the game.
minHeap and maxHeap
Running time median to record average time taken to beat the game
## DoublyLinkedLists
Will store the projectiles, plants and zombies currently on the screen. Will allow for O(1) removal runtime, which increases efficiency.
Each ADT will be taken by one developer.
The placement of the plants will be determined via a matrix. 
Zombies will move in fixed lanes.
There will be two inheritance trees: Plants and Zombies.
	Plants
		Peashooter
		Wal-Nut
		Melon-Pult
	Zombies
		Regular Zombie
		Cone Zombie
		Bucket Zombie
		Gargantuar
Shovels will be used to remove plants.

# How to Run:
0. Run Woo.java
1. Click on plants in the Queue to place them on the plots, by clicking again
2. Place the plants strategically so no zombies can get past the plants to the house