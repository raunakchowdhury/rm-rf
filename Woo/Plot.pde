class Plot
{
  /*instance vars*/
  private int _xcenter;
  private int _ycenter;
  private int _xsize;
  private int _ysize;
  private Plant _plant;

  public Plot(int xcenter, int ycenter, int xsize, int ysize)
  {
    _xcenter = xcenter;
    _ycenter = ycenter;
    _xsize = xsize;
    _ysize = ysize;
  }

  public int xmin()
  {
    return _xcenter - _xsize / 2;
  }
  public int xmax()
  {
    return _xcenter + _xsize / 2;
  }
  public int ymin()
  {
    return _ycenter - _ysize / 2;
  }
  
  public int ymax()
  {
    return _ycenter + _ysize / 2;
  }
  
  public int getxcenter()
  {
    return _xcenter;
  }
  
  public int getycenter()
  {
    return _ycenter;
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
