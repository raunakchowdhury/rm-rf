public class WallNut extends Plant
{
  public WallNut()
  {
    super();
    _HP = 500;
    for (int i = 0; i < _sprites.length; i++) {
      //_sprites[i] = loadImage("peashooter0.png");
      _sprites[i] = loadImage("../sprites/wallnut/wallnut" + i + ".png");
    }
    _seedPacket = loadImage("../sprites/seed-packs/wallnut-packet.png");
  }
  public Projectile attack()
  {
    return null;
  }
}
