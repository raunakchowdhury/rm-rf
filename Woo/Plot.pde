class Plot
{
  private int _xcenter;
  private int _ycenter;
  private int _size;
  public int xmin()
  {
    return _xcenter - _size / 2;
  }
  public int xmax()
  {
    return _xcenter + _size / 2;
  }
  public int ymin()
  {
    return _ycenter - _size / 2;
  }
  public int ymax()
  {
    return _ycenter + _size / 2;
  }
}