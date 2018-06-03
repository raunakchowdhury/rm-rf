abstract class Character {
  protected PShape[] _sprites;
  protected int _HP;
  protected int _lane;
  protected int _x;
  protected int _y;
  
  public abstract void takeDamage();
  public int lane()
  {
    return _lane;
  }
}