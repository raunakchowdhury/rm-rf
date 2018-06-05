abstract class Character {
  protected PShape[] _sprites;
  protected int _HP;
  protected int _lane;
  protected int _x;
  protected int _y;

  public Character() {
    _sprites = new PShape[5];
  }

  public abstract void takeDamage();

  public int lane()
  {
    return _lane;
  }

  public abstract void move();

  public void display()
  {
    PImage img = loadImage("../garden.jpg");
    background(img);
    for (PShape sprite : _sprites) {
      shape(sprite, 10, 10, 10, 10);
      //print(sprite.isVisible());
    }
  }
}