abstract class Plant extends Character {
  protected Plot _location;
  protected boolean _shoot;
  protected int _shootRate;
  protected int _ctr;
  public Plant() {
    super();
  }
  public void allowToShoot()
  {
    _shoot = true;
  }

  //accessor for shoot
  public boolean shoot() {
    return _shoot;
  }

  public void display() {
    //print(_shoot);
    super.display();
  }
  public void setPlot(Plot plot)
  {
    _location = plot;
    super._x = plot.xmin();
    super._y = plot.ymin();
    plot.implant(this);
  }
  public abstract Projectile attack();
  public void setXY(int x, int y)
  {
    _x = x;
    _y = y;
  }
 
}
