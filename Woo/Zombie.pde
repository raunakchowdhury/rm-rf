class Zombie extends Character {
  protected int _speed;
  private Plot _currPlot; //zombie's current plot

  public Zombie() {
    _HP = 20;
    _speed = 5;
    _sprites = new PImage[10]; //both walking and eating anims
    for (int i = 0; i < _sprites.length; i++) {
      _sprites[i] = loadImage("../sprites/rzomb-walk/rzombie" + i + ".png");
    }
  }
  public void attack() {
  }
  public void display() {
    //if (no plants in front)
    _x -=5;
    super.display();
    //else, go to displayattack
  }

  public void displayAttack() {
    frame = (frame+1) % 10;
    image(_sprites[frame/2 + 5], _x, _y);
  }

  public void takeDamage() {
  }
  
  
}