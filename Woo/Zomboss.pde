class Zomboss
{
  private int _HP;
  public Zomboss()
  {
    _HP = 1200;
  }

  public void takeDamage(int dmg)
  {
    _HP -= dmg;
  }

  public void display()
  {
    fill(255, 255, 255);
    rect(500, 10, 420, 30);
    if (_HP > 0) {
      fill(255, 0, 0);
      rect(510, 20, _HP / 3, 10);
    }
  }
}
