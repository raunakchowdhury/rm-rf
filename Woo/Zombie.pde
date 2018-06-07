class Zombie extends Character {
  private int _rad;
  protected int _speed;

  public Zombie(int ycor) {
    _x = 925;
    _y = ycor;
    _rad = 25;
    _HP = 20;
    _speed = 100;
    _sprites = new PImage[10]; //both walking and eating anims
    for (int i = 0; i < _sprites.length; i++) {
      _sprites[i] = loadImage("../sprites/rzomb-walk/rzombie" + i + ".png");
    }
  }
  public void attack() {
  }
  public void display() {
    //if (no plants in front)
    super.display();
    //else, go to displayattack
  }

  public void displayAttack() {
    frame = (frame+1) % 10;
    image(_sprites[frame/2 + 5], _x, _y);
  }

  public void takeDamage() {
  }
  public Plant move(LList<Plant> plants)
  {
    _x -= _speed;
    for (int c = plants.size() - 1; c >= 0; c--)
    {
      Plant pl = (Plant) plants.get(c);
      if (pl.getX() - getX() < _rad)
    {
      return pl;
      }
    }
    return null;
  }
}
