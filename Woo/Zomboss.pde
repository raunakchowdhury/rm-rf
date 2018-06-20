class Zomboss
{
  private int _HP;
  private int _baseHP;
  private PImage _sprite;
  private int frame;
  public Zomboss()
  {
    _baseHP = 2400;
    _HP = _baseHP;
    _sprite = loadImage("../sprites/zomboss/zomboss.png");
  }

  public int getHP()
  {
    return _HP;
  }
  
  public void regen(){
    _HP += (int) (.25 * _baseHP);
  }
  
  public void passiveRegen(){
    if (frame == 50){
    _HP += (int) (.005 * _HP);
    }
    frame = (frame + 1) % 10;
  }

  public void takeDamage(int dmg)
  {
    _HP -= dmg;
  }

  public void display()
  {
    fill(255, 255, 255);
    rect(400, 10, 420, 30);
    if (_HP > 0) {
      fill(255, 0, 0);
      rect(410, 20, _HP / 6, 10);
      image(_sprite, 800, 5);
    }
  }
}