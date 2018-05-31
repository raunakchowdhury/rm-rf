class Projectile
{
  private int _damage;
  private int _dx;
  private int _dy;
  private int _x;
  private int _y;
  private int _radius;
  public void move()
  {
    _x += _dx;
    _y += _dy;
  }
  public void display()
  {
    ellipse(_x, _y, _radius, _radius);
  }
}