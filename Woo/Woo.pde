// instance variables
private Plot[][] _patches; // each main square in the visual is a plot

private Queue<Plant> _plants; // has all the randomly generated order of plants 
private Queue<Zombie> _zombies; // has all the randomly generated order of zombies

private LList<Zombie>[] _visibleZombies; // zombies in each lane
private LList<Plant>[] _visiblePlants; // plants in each lane
private LList<Projectile>[] _projectiles; // projectiles in each lance
private PImage _screen;

private int _zombieSpawnRate; // controls spawn rate of zombie
private int _cooldown;
private final int _CDRATE = 10;
private int _section;
private int _ctr;
private boolean _rage;

private Zomboss _zb;
private int _hp;


/*---------NOTES SECTION/TODO------------
 1. When are plants transferred from the plants queue into the visiblePlants array?
 2. Zombie generation?
 3. Please smooth out code, there are places where this can be improved
 4. COMMENT COMMENT COMMENT, ONLY WAY WE ARE GOING TO FINISH
 ------------------------------------*/

void setup() 
{ 
  size(950, 600);
  constructor(); //instantiates all the instance variables

  birthPlots(); //creates Plot elements for every place in _patches
  birthPlants(); //creates the _plants queue
}

void draw()
{
  if (_section == 0)
  {
    startScreen();
  } else if (_section == 1)
  { 
    play();
  } else if (_section == 2)
  {
    win();
  } else {
    lose();
  }
}

//=============SCREEN METHODS====================
void startScreen()
{
  _screen = loadImage("../sprites/screen/start-screen.jpg");
  background(_screen);
}

void play() 
{
  _screen = loadImage("../sprites/screen/play-screen.jpg");
  background(_screen);
  displayAll(); // calls display() for all visible plants, zombies, and projectiles
  moveAll(); // calls move() for all visible plants and projectiles

  _cooldown++;
  if (_zb.getHP() <= 0)
    _section = 2;
  rageMode();
  if (_ctr % _zombieSpawnRate == 0 && _ctr >= 0)
  {
    spawnZombie();
    _ctr = 0;
  }
  _ctr++;
  if (_plants.size() < 5)
  {
    birthPlants();
  }
}

void win()
{
  _screen = loadImage("../sprites/screen/win-screen.jpg");
  background(_screen);
  textSize(50);
  text("You win!!!!! :)", 300, 300);
}

void lose()
{
  _screen = loadImage("../sprites/screen/lose-screen.jpg");
  background(_screen);
}
//==============================================


void mouseClicked()
{
  if (_section == 0) {
    _section = 1;
  } else if (_section == 1) {
    if ( _cooldown > _CDRATE) {

      Plant p = _plants.dequeue(); //takes one out of the _plants queue to add to _visiblePlants

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
            }
          }
        }
      }
      _cooldown = 0;
    }
  } else
  {
    constructor();//adding options later
    birthPlots(); //creates Plot elements for every place in _patches
    birthPlants(); //creates the _plants queue
  }
}

void spawnZombie() {
  int lane = (int) random(0, 5);
  int ycor = (int) random(_patches[lane][0].ymin() + 40, _patches[lane][0].ymax() - 40);
  Zombie z = new Zombie(ycor);
  _visibleZombies[lane].add(z);
}

void constructor()
{
  _cooldown = _CDRATE + 1;
  _patches = new Plot[5][9];
  _plants = new Queue<Plant>();
  _zombies = new Queue<Zombie>();
  _visibleZombies = new LList[5];
  _visiblePlants = new LList[5];
  _projectiles = new LList[5];
  _zb = new Zomboss();
  _section = 0;
  _ctr = -50;
  _zombieSpawnRate = 25;
  _hp = _zb.getHP();
  //instantiates a list at each lane for zombies, plants, and projectiles
  for (int i = 0; i < 5; i++)
  {
    _visibleZombies[i] = new LList<Zombie>();
    _visiblePlants[i] = new LList<Plant>();
    _projectiles[i] = new LList<Projectile>();
  }
}

//=============BIRTH METHODS====================
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
  Plant p = null;
  for (int i = 0; i < 50; i++)
  {
    int rand = (int) random(0, 5);
    if (rand < 2)
    {
      p = new WallNut();
    } else {
      p = new PeaShooter();
    }
    _plants.enqueue(p);
  }
}
//==============================================

//===============DISPLAY METHODS===================
void displayAll()
{
  displayPlants();
  displayZombies();
  displayProjectiles();
  displayNext(); //next plant
  _zb.display();
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
void displayNext()
{
  if (_cooldown > _CDRATE)
    fill(0, 255, 0);
  else {
    fill(255, 0, 0);
  }
  rect(10, 10, 140, 150, 10);
  fill(0, 0, 0);
  textSize(15);
  text("Next Plant:", 20, 50);

  PImage p = _plants.peekFront().getSP();
  image(p, 20, 80, p.width / 2, p.height / 2);
}
//==============================================


//==================MOVE METHODS================
void moveAll()
{
  movePlants();
  moveZombies();
  moveProjectiles();
}

void movePlants()
{
  for (int r = 0; r < _visiblePlants.length; r++)
  {
    int c = 0;  
    while (c < _visiblePlants[r].size())
    { 
      //adds a projectile to _projectiles if a plant produces one
      Plant pl = (Plant) _visiblePlants[r].get(c);
      if (pl.getHP() <= 0)
      {
        pl.getPlot().uproot();
        _visiblePlants[r].remove(c);
      } else 
      {
        Projectile tmp = pl.attack();
        if (tmp != null) //checks to make sure that a projectile is produced
        {
          _projectiles[r].add(tmp);
        }
        c++;
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
      DLLNode dl = pj.move(_visibleZombies[r]);
      if (pj.getX() > 900)
      {
        _zb.takeDamage(pj.getDmg());
        _projectiles[r].remove(c);
        c--;
      } else if (dl != null)
      {
        ((Character)dl.getCargo()).takeDamage(pj.getDmg());
        _projectiles[r].remove(c);
        c--;
      }
      c++;
    }
  }
}

void moveZombies()
{
  for (int r = 0; r < _visibleZombies.length; r++)
  {
    int c = 0;
    while (c < _visibleZombies[r].size())
    {
      //resets the projectiles's x coordinate
      Zombie z = (Zombie) (_visibleZombies[r].get(c));
      if (z.getHP() <= 0)
      {
        _visibleZombies[r].remove(c);
      } else {
        DLLNode dl = z.move(_visiblePlants[r]);
        if (dl != null) //if it's supposed to be placed out of the screen
        {
          ((Character)dl.getCargo()).takeDamage(z.getDmg());
          //_visiblePlants[r].removeNode(dl);
        }
        if (z.getX() < 100)
        {
          _section = 3;
        }
        c++;
      }
    }
  }
}

void rageMode(){
  if ( _zb.getHP() <= (int) (_hp * .75) && _zombieSpawnRate == 25){
    _zombieSpawnRate -= 5;
    _zb.regen();
  }
  else if ( _zb.getHP() <= (int) (_hp * .50) && _zombieSpawnRate == 20){
    _zombieSpawnRate -= 5;
    _zb.regen();
  }
  else if ( _zb.getHP() <= (int) (_hp * .25) && _zombieSpawnRate == 15){
    _zombieSpawnRate -= 10;
    _zb.regen();
  }
  //_zb.passiveRegen();
}
//==============================================