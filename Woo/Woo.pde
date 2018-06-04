private Plot[][] _patches;
private Queue<Plant> _plants;
private Queue<Zombie> _zombies;
private DLinkedList<Plant>[] _nextPlants;
private DLinkedList<Projectile>[] _projectiles;
private boolean _clicked;
private int _zombieSpawnRate;



void setup() 
{
  size(1400, 600);
}

void draw() 
{
  PImage img = loadImage("garden.jpg");
  background(img);
}