class Plot
{
  /*instance vars*/
  private int _xcenter;
  private int _ycenter;
  private int _size;

  public Plot(int xcenter, int ycenter, int size)
  {
    _xcenter = xcenter;
    _ycenter = ycenter;
    _size = size;
  }

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