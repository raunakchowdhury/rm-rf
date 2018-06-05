class Plot
{
  /*instance vars*/
  private int _xcenter;
  private int _ycenter;
  private int _size;
  private Plant _plant;

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
  
  public void implant(Plant plant)
  {
    _plant = plant; // add a plant to the plot
  }

  public Plant uproot()
  {
    Plant tmp = _plant;
    _plant = null;
    return tmp;
  }
  
  public Plant getPlant()
  {
    return _plant;
  }
}
