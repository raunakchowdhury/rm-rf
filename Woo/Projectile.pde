class Projectile
{
  /*instance vars*/
  private int _damage;
  private int _dx;
  private int _dy;
  private int _x;
  private int _y;
  private int _radius;

  /*constructor*/
  public Projectile(int x, int y, int dx, int dy, int rad)
  {
    _x = x;
    _y = y;
    _dx = dx;
    _dy = dy;
    _radius = rad;
  }

  public int getx() {
    return _x;
  }
  public int gety() {
    return _y;
  }
  public void move()
  {
    _x += _dx;
    _y += _dy;
  }
  public void display()
  {
    fill(111, 139, 0);
    ellipse(_x, _y, _radius, _radius);
    noStroke();
    fill(111, 220, 0);
    ellipse(_x, _y, _radius-2, _radius-2);
  }
}
