// instance variables
private Plot[][] _patches; // each main square in the visual is a plot

private Queue<Plant> _plants; // has all the randomly generated order of plants
private Queue<Zombie> _zombies; // has all the randomly generated order of zombies
//private LList<Plant> _nextPlants; // a "queue" of items in the top of the screen

private LList<Zombie>[] _visibleZombies; // zombies in each lane
private LList<Plant>[] _visiblePlants; // plants in each lane
private LList<Projectile>[] _projectiles; // projectiles in each lance

private boolean _clicked; // can the player place down a plant or not
private int _zombieSpawnRate; // controls spawn rate of zombie

//private PeaShooter p;
private PShape testShape;
private Plant p;
void setup() 
{ 
  size(950, 600);
  constructor();

  birthPlots();
  birthPlants();
}

void draw() 
{
  PImage img = loadImage("../pvz1.jpg");
  background(img);
  displayAll();

  movePlants();
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
  if (_clicked == true)
    p = _plants.dequeue();

  for (int r = 0; r < 5; r++)
  {
    for (int c = 0; c < 9; c++)
    {
      if (mouseX  > _patches[r][c].xmin() && mouseX  < _patches[r][c].xmax()
        &&  mouseY  > _patches[r][c].ymin() && mouseY  < _patches[r][c].ymax())
      {
        if (_patches[r][c].getPlant() == null) { //check to see if the plot is empty
          p.setPlot(_patches[r][c]);
          p.setLane(r);
          p.allowToShoot();
          _visiblePlants[r].add(p);
        }
      }
    }
  }

// --------What's this? -R ------------
  /*
  for (int i = 0; i < 45; i++)
   if (mouseX < _patches[i / 9][i % 9].xmax() &&
   mouseX > _patches[i / 9][i % 9].xmin() &&
   mouseY > _patches[i / 9][i % 9].ymin() &&
   mouseY < _patches[i / 9][i % 9].ymax()) {
   p.setPlot(_patches[i / 9][i % 9]);
   p.allowToShoot();
   _visiblePlants[i/9].add(p);
   // _visiblePlants.add(p);
   //_clicked = false;
   }*/
}

void constructor()
{
  _patches = new Plot[5][9];
  _plants = new Queue<Plant>();
  _zombies = new Queue<Zombie>();
  //_nextPlants = new LList<Plant>();
  _visibleZombies = new LList[5];
  _visiblePlants = new LList[5];
  _projectiles = new LList[5];

  for (int i = 0; i < 5; i++)
  {
    _visibleZombies[i] = new LList<Zombie>();
    _visiblePlants[i] = new LList<Plant>();
    _projectiles[i] = new LList<Projectile>();
  }

  /////////////////////
  _clicked = true;
  _zombieSpawnRate = 0;
  //p = new PeaShooter();
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
  for (int i = 0; i < 50; i++)
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
  DLLNode nowNode = null;
  //modularized by replacing numbers with length -R
  for (int r = 0; r < _visibleZombies.length; r++)
  {
    nowNode = _visibleZombies[r].getNode(0);
    if (nowNode == null)
    {
      return;
    }
    while (nowNode != null)
    {
      ((Zombie) nowNode.getCargo()).display();
      nowNode = nowNode.getNext();
    }
  }
}

/* Displays all plants in accordance to their array.
   If they shoot, the projectiles will be displayed as well.
   -R
 */
void displayPlants()
{
  DLLNode nowNode = null;
  Plant plant = null;
  //modularized by replacing numbers with length -R
  for (int r = 0; r < _visiblePlants.length; r++)
  {
    nowNode = _visiblePlants[r].getNode(0);
    if (nowNode == null)
    {
      return;
    }
    while (nowNode != null)
    {
      plant = ((Plant) nowNode.getCargo());
      plant.display();
      if (plant.shoot()) {
        _projectiles[plant.lane()].add(plant.attack()); ///add a projectile to the necessary lane
      }
      nowNode = nowNode.getNext();
    }
  }
}

void displayProjectiles()
{
  DLLNode nowNode = null;
  //modularized by replacing numbers with length -R
  for (int r = 0; r < _projectiles.length; r++)
  {
    nowNode = _projectiles[r].getNode(0);
    if (nowNode == null)
    {
      return;
    }
    while (nowNode != null && nowNode.getCargo() != null)
    {
      ((Projectile) nowNode.getCargo()).display();
      nowNode = nowNode.getNext();
    }
  }
}

void movePlants()
{
  DLLNode nowNode = null;
 //modularized by replacing numbers with length -R
  for (int r = 0; r < _visiblePlants.length; r++)
  {
    nowNode = _visiblePlants[r].getNode(0);
    if (nowNode == null)
    {
      return;
    }
    while (nowNode != null)
    {
      Projectile tmp = ((Plant) nowNode.getCargo()).attack();
      if (tmp != null)
      {
        _projectiles[r].add(tmp);
      }
      nowNode = nowNode.getNext();
    }
  }
}