abstract class Plant extends Character {
  protected Plot _location;
  public abstract void attack();

  public Plant() {
    super();
  }

  public void display() {
    super.display();
  }
  public void setPlot(Plot plot)
  {
    _location = plot;
    super._x = plot.xmin();
    super._y = plot.ymin();
    plot.implant(this);
  }
  public void setXY(int x, int y)
  {
    _x = x;
    _y = y;
  }
}