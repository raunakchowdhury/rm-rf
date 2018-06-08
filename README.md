# Team rm-rf -- T. Fabiha, Nadie Jackson, Raunak Chowdhury
### APCS2 pd2
### HW61 -- On Target
### 2018-06-07

# Plants vs. Zombies - Zomboss Fight
 We are simulating the final level of Plants vs Zombies 1. The conventional PvZ games allow you to expand your garden-army of plants with sun; however, in the Zomboss boss fight (the final boss), there is no sun. Instead, plants are automatically generated for you.
 This will include two data structures we learned this year.
## How the Game Works
  At startup, arrays of linked lists of each type (Plot, Plant, Zombie, and Projectile) will be created. Woo.pde controls all movement and display decisions (ie. when to move the zombies and projectiles, and when to display everything).

  All other classes supplement Woo with accessor methods and store essential values like coordinates and how exactly to move and display themselves (Woo calls these other functions.)

  During gameplay, zombies will be spawned by the Zomboss in random lanes. There will be a queue of Plants available to place down on each plot on the garden. After you place down one Plant from the queue, there will be a short cooldown before you can place the next plant.

  Plants, if they can shoot, will automatically shoot at either the Zomboss and incoming zombies. They cannot shoot at zombies outside of the lane that they are on. Obviously, barrier plants like the Wall-Nut cannot shoot at zombies.

  See the diagram below for further reference.
  [ADD DIAGRAM HERE]
## UI
  Upon running, the user will be presented with a classic garden level and several other features reminiscent of the Zomboss boss fight.

   The picture below displays the UI during the game:
   [ADD PICTURE HERE]
## Queues
We will simulate a feeder belt with plants with a Queue. We are still unsure of how to do the animation; however, the MVP will be that the card simply appears in the Queue (ie. no sliding along; it’ll just pop into existence)

To randomly generate zombies and plants, we will be using two queues. At every attempt of generation, the relevant queue will be consulted. Each queue will store the different class types of plants and zombies that could be generated.

## DoublyLinkedLists
Will store the projectiles, plants and zombies currently on the screen. Will allow for O(1) removal runtime, which increases efficiency.

The placement of the plants will be determined via a matrix.

Zombies will move in fixed lanes.

There will be two inheritance trees: Plants and Zombies.
	- Plants
		- Peashooter
		- Wall-Nut
	- Zombies
		- Regular Zombie

# How to Run:
0. Run Woo.pde.
  - Run the following commands in the terminal:
  ```
  cd Woo
  processing Woo.pde
  ```
  - Type the following command on the keyboard:
  `C-r`
1. You will be introduced to the game via the start screen. Click anywhere to start.
2. Click on a plot of grass to place the next plant (displayed in top left corner).
3. Place the plants strategically so no zombies can get past the plants to the house.
  - Wincon: Zomboss health is depleted
  - Losecon: Zombies reach the other side (you're a skrub if you lose)
4. If you win/lose, you will be led to the respective screen. Click anywhere to restart.
