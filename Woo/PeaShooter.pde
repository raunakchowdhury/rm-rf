class PeaShooter extends Plant
{
  protected int _rechargeRate;
  protected int _damage;
  private int _x;
  private int _y;
  public PeaShooter()
  {
    super();
    _HP = 20;
    _shootRate = 20;
    for (int i = 0; i < _sprites.length; i++) {
      //_sprites[i] = loadImage("peashooter0.png");
      _sprites[i] = loadImage("../sprites/peashooter/peashooter" + i + ".png");
    }
  }
  public void takeDamage()
  {
  }

  public void display() {
    super.display();
  }
  public Projectile attack()
  {
    _ctr = _ctr % _shootRate + 1;
    if (_ctr == 1)
      return new Projectile(_location.xcenter(), _location.ycenter()-30, 10, 0, 15);
     return null;
  }
}
