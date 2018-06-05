class PeaShooter extends Character
{
  protected int _rechargeRate;
  protected int _damage;
  public PeaShooter()
  {
    super();
    _HP = 100;
    for (int i = 0; i < _sprites.length; i++) {
      _sprites[i] = loadShape("../sprites/peashooter/peashooter" + i + ".svg");
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
}