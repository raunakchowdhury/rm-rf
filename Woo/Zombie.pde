class Zombie extends Character {
  private int _rad;
  protected int _speed;
  private int _dmg;
  public Zombie(int ycor) {
    _x = 850;
    _y = ycor;
    _rad = 25;
    _HP = 80;
    if (random(10) > 9)
    {
      _HP += 80;
    }
    if (random(2) > 1)
    {
      _HP += 80;
    }
    _speed =  3;
    _dmg = 5;
    _sprites = new PImage[10]; //both walking and eating anims
    for (int i = 0; i < _sprites.length/2; i++) {
      _sprites[i] = loadImage("../sprites/rzomb-walk/rzombie" + i + ".png");
    }
    for (int i = 5; i < _sprites.length; i++) {
      _sprites[i] = loadImage("../sprites/rzomb-attack/rzombie" + (i-5) + ".png");
    }
  }
  public int getDmg()
  {
    return _dmg;
  }
  public void display() {
    //if (no plants in front)
    if (_speed == 0)
    {
      displayAttack();
    } else {
      frame = (frame+1) % 10;
      image(_sprites[frame/2], _x, _y - 80);
    }
    //else, go to displayattack
  }

  public void displayAttack() {
    frame = (frame+1) % 10;
    image(_sprites[frame/2 + 5], _x, _y - 80);
  }

  public DLLNode<Plant> move(LList<Plant> plants)
  {
    _x -= _speed;
    for (int c = plants.size() - 1; c >= 0; c--)
    {
      DLLNode dl = plants.getNode(c);
      Plant pl = (Plant) dl.getCargo();
      if (pl != null && getX() - pl.getX() < _rad && getX() - pl.getX() > -1 * _rad)
      {
        _speed = 0;
        return dl;
      }
    }
    _speed = 3;
    return null;
  }
}