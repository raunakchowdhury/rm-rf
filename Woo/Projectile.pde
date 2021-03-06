class Projectile
{
  /*instance vars*/
  private int _dmg;
  private int _dx;
  private int _dy;
  private int _x;
  private int _y;
  private int _radius;

  /*constructor*/
  public Projectile(int x, int y, int dx, int dy, int rad)
  {
    _dmg = 20;
    _x = x;
    _y = y;
    _dx = dx;
    _dy = dy;
    _radius = rad;
  }

  public int getX() {
    return _x;
  }
  public int getY() {
    return _y;
  }
  public int getDmg()
  {
    return _dmg;
  }
  public DLLNode<Zombie> move(LList<Zombie> zombies)
  {
    _x += _dx;
    for (int c = zombies.size() - 1; c >= 0; c--)
    {
      DLLNode dl = zombies.getNode(c);
      Zombie z = (Zombie) dl.getCargo();
      if (z != null && z.getX() - getX() <= _radius && z.getX() - getX() > -1 * _radius)
      {
        return dl;
      }
    }
    return null;
  }
  public void display()
  {
    fill(111, 139, 0);
    ellipse(_x, _y, _radius, _radius);
    noStroke();
    fill(111, 255, 0);
    ellipse(_x, _y, _radius-2, _radius-2);
  }
}
