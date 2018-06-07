// instance variables
private Plot[][] _patches; // each main square in the visual is a plot

private Queue<Plant> _plants; // has all the randomly generated order of plants 
private Queue<Zombie> _zombies; // has all the randomly generated order of zombies

private LList<Zombie>[] _visibleZombies; // zombies in each lane
private LList<Plant>[] _visiblePlants; // plants in each lane
private LList<Projectile>[] _projectiles; // projectiles in each lance

private boolean _clicked; // can the player place down a plant or not
private int _zombieSpawnRate; // controls spawn rate of zombie

private Plant p;
void setup() 
{ 
  size(950, 600);
  constructor(); //instantiates all the instance variables

  birthPlots(); //creates Plot elements for every place in _patches
  birthPlants(); //creates the _plants queue
}

void draw() 
{
  PImage img = loadImage("../pvz1.jpg");
  background(img);
  displayAll(); // calls display() for all visible plants, zombies, and projectiles
  moveAll(); // calls move() for all visible plants and projectiles
}

/*---------NOTES SECTION/TODO------------
 1. When are plants transferred from the plants queue into the visiblePlants array?
 2. Zombie generation?
 3. Please smooth out code, there are places where this can be improved
 4. COMMENT COMMENT COMMENT, ONLY WAY WE ARE GOING TO FINISH
 ------------------------------------*/


void mouseClicked()
{
  /*
  if (_clicked == false && mouseX - p.getX() < 100 &&
   mouseX - p.getX() > -100 && mouseY - p.getY() < 100 && mouseY - p.getY() > -100)
   _clicked = true;
   */
  if (_clicked == true) {

    p = _plants.dequeue(); //takes one out of the _plants queue to add to _visiblePlants

    for (int r = 0; r < 5; r++) // r is the row, otherwise known as lance
    {
      for (int c = 0; c < 9; c++) // c is the index number in each list
      {
        if (mouseX  > _patches[r][c].xmin() && mouseX  < _patches[r][c].xmax() // if within the width of a Plot &&
          &&  mouseY  > _patches[r][c].ymin() && mouseY  < _patches[r][c].ymax()) // if within the height of a Plot
        {
          if (_patches[r][c].getPlant() == null) //check to see if the plot is empty
          { 
            p.setPlot(_patches[r][c]);
            p.setLane(r);
            _visiblePlants[r].add(p);
            //_clicked = false;
          }
        }
      }
    }
  }
  
  //@@@@@@@@@@@@@@tester@@@@@@@@@@@@@@
  for (int i = 0; i < _visiblePlants.length; i++)
  {
    println(_visiblePlants[i].size());
  }
  println();
}

void constructor()
{
  _patches = new Plot[5][9];
  _plants = new Queue<Plant>();
  _zombies = new Queue<Zombie>();
  _visibleZombies = new LList[5];
  _visiblePlants = new LList[5];
  _projectiles = new LList[5];

  //instantiates a list at each lane for zombies, plants, and projectiles
  for (int i = 0; i < 5; i++)
  {
    _visibleZombies[i] = new LList<Zombie>();
    _visiblePlants[i] = new LList<Plant>();
    _projectiles[i] = new LList<Projectile>();
  }

  /////////////////////
  _clicked = true;
  _zombieSpawnRate = 0;
}

void birthPlots()
{
  //modularized by replacing numbers with length -R
  for (int r = 0; r < _patches.length; r++) 
  {
    for (int c = 0; c < _patches[0].length; c++)
    {
      _patches[r][c] = new Plot(214 + 80*c, 125 + 100*r, 80, 100);
    }
  }
}

void birthPlants()
{
  for (int i = 0; i < 20; i++)
  {
    p = new PeaShooter();
    _plants.enqueue(p);
  }
}

void displayAll()
{
  displayPlants();
  displayZombies();
  displayProjectiles();
}

void displayZombies()
{
  for (int r = 0; r < _visibleZombies.length; r++)
  {
    for (int c = 0; c < _visibleZombies[r].size(); c++)
    {
      Zombie z = (Zombie) _visibleZombies[r].get(c);
      z.display();
    }
  }
}

/* Displays all plants in accordance to their array.
 -R
 */
void displayPlants()
{
  for (int r = 0; r < _visiblePlants.length; r++)
  {
    for (int c = 0; c < _visiblePlants[r].size(); c++)
    {
      Plant pl = (Plant) _visiblePlants[r].get(c);
      pl.display();
    }
  }
}

void displayProjectiles()
{
  for (int r = 0; r < _projectiles.length; r++)
  {
    for (int c = 0; c < _projectiles[r].size(); c++)
    {
      Projectile pj = (Projectile) _projectiles[r].get(c);
      pj.display();
    }
  }
}



void moveAll()
{
  movePlants();
  moveProjectiles();
  //moveZombies();
}

void movePlants()
{
  for (int r = 0; r < _visiblePlants.length; r++)
  {
    for (int c = 0; c < _visiblePlants[r].size(); c++)
    { 
      //adds a projectile to _projectiles if a plant produces one
      Plant pl = (Plant) _visiblePlants[r].get(c);
      Projectile tmp = pl.attack();
      if (tmp != null) //checks to make sure that a projectile is produced
      {
        _projectiles[r].add(tmp);
      }
    }
  }
}

void moveProjectiles()
{
  for (int r = 0; r < _projectiles.length; r++)
  {
    int c = 0;
    while (c < _projectiles[r].size())
    {
      //resets the projectiles's x coordinate
      Projectile pj = (Projectile) _projectiles[r].get(c);
      pj.move();
      if (pj.getx() >= width && pj.gety() >= height) //if it's supposed to be placed out of the screen
      {
        _projectiles[r].remove(c);
        c--;
      }
      c++;
    }
  }
}
