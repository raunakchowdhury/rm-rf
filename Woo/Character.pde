abstract class Character {
  protected PImage[] _sprites;
  protected int _HP;
  protected int _lane;
  protected int _x;
  protected int _y;
  protected int frame;

  public Character() {
    _sprites = new PImage[5];
  }
  public int getX()
  {
    return _x;
  }
  public int getY()
  {
    return _y;
  }
  public abstract void takeDamage();

  public int lane()
  {
    return _lane;
  }
  public void setXY(int x, int y)
  {
    _x = x;
    _y = y;
  }
  public abstract void move();

  //animate based on frame
  public void display()
  {
    //image(_sprites[0], 10, 10);
    frame = (frame+1) % 10;
    image(_sprites[frame/2], _x, _y);
  }
}