class Zomboss
{
  private int _HP;
  private PImage _sprite;
  public Zomboss()
  {
    _HP = 1200;
    _sprite = loadImage("../sprites/zomboss/zomboss.png");
  }

  public int getHP()
  {
    return _HP;
  }

  public void takeDamage(int dmg)
  {
    _HP -= dmg;
  }

  public void display()
  {
    fill(255, 255, 255);
    rect(400, 10, 420, 30);
    if (_HP > 0) {
      fill(255, 0, 0);
      rect(410, 20, _HP / 3, 10);
      image(_sprite, 800, 5);
    }
  }
}
