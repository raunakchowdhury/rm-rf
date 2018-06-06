class PeaShooter extends Plant
{
  protected int _rechargeRate;
  protected int _damage;
  public PeaShooter()
  {
    super();
    _HP = 100;
    for (int i = 0; i < _sprites.length; i++) {
      //_sprites[i] = loadImage("peashooter0.png");
      _sprites[i] = loadImage("../sprites/peashooter/peashooter" + i + ".png");
    }
  }
  public void move()
  {
  }
  public void takeDamage()
  {
  }

  public void display() {
    super.display();
  }
  public void attack()
  {}
}