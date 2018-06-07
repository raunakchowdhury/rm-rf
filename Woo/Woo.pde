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
  size(960, 600);
  constructor();

  birthPlots();
  birthPlants();
}

void draw() 
{
  PImage img = loadImage("../garden.jpg");
  background(img);
  displayAll();

  movePlants();
}

void mouseClicked()
{
  /*
  if (_clicked == false && mouseX - p.getX() < 100 &&
    mouseX - p.getX() > -100 && mouseY - p.getY() < 100 && mouseY - p.getY() > -100)
    _clicked = true;
    */
  if (_clicked == true)
    p = _plants.dequeue();

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
    }
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
  for (int r = 0; r < 5; r++)
  {
    for (int c = 0; c < 9; c++)
    {
      _patches[r][c] = new Plot(295 + 80*c, 125 + 100*r, 80, 100);
    }
  }
}

void birthPlants()
{
  for (int i = 0; i < 15; i++)
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

  for (int r = 0; r < 5; r++)
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

void displayPlants()
{
  DLLNode nowNode = null;

  for (int r = 0; r < 5; r++)
  {
    nowNode = _visiblePlants[r].getNode(0);
    if (nowNode == null)
    {
      return;
    }
    while (nowNode != null)
    {
      ((Plant) nowNode.getCargo()).display();
      nowNode = nowNode.getNext();
    }
  }
}

void displayProjectiles()
{
  DLLNode nowNode = null;

  for (int r = 0; r < 5; r++)
  {
    nowNode = _projectiles[r].getNode(0);
    if (nowNode == null)
    {
      return;
    }
    while (nowNode != null)
    {
      ((Projectile) nowNode.getCargo()).display();
      nowNode = nowNode.getNext();
    }
  }
}

void movePlants()
{
  DLLNode nowNode = null;

  for (int r = 0; r < 5; r++)
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
