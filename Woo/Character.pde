abstract class Character {
  protected PImage[] _sprites;
  protected int _HP;
  protected int _lane;
  protected int _x;
  protected int _y;

  public Character() {
    _sprites = new PImage[5];
  }

  public abstract void takeDamage();

  public int lane()
  {
    return _lane;
  }

  public abstract void move();

  public void display()
  {
    image(_sprites[0], 10, 10);
    /*
    for (PImage sprite : _sprites) {
      image(sprite, 10, 10, 10, 10);
      //print(sprite.isVisible());
    }
    */
  }
}
