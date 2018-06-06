// instance variables
private Plot[][] _patches; // each main square in the visual is a plot

private Queue<Plant> _plants; // has all the randomly generated order of plants
private Queue<Zombie> _zombies; // has all the randomly generated order of zombies
private LList<Plant> _nextPlants; // a "queue" of items in the top of the screen

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
  size(1400, 600);
  constructor();

  birthPlots();
  p = new PeaShooter();
}

void draw() 
{
  PImage img = loadImage("../garden.jpg");
  background(img);
  //image(sh, width/2, height/2);
  p.display(); //was trying to test Char -R
  //background(img);
}
void mouseClicked()
{
  //if (clicked == false)
}

void constructor()
{
  _patches = new Plot[5][9];
  _plants = new Queue<Plant>();
  _zombies = new Queue<Zombie>();
  _nextPlants = new LList<Plant>();
  _visibleZombies = new LList[5];
  _visiblePlants = new LList[5];
  _projectiles = new LList[5];

  /////////////////////
  _clicked = false;
  _zombieSpawnRate = 0;
  //p = new PeaShooter();
}

void birthPlots()
{
  for (int r = 0; r < 5; r++)
  {
    for (int c = 0; c < 9; c++)
    {
      _patches[r][c] = new Plot(295 + 2*c*40, 125 + 2*r*50, 80, 100);
    }
  }
}