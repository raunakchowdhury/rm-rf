class Queue<Quasar>
{
  LLNode<Quasar> _front;
  LLNode<Quasar> _back;
  int _size;

  public Queue()
  {
    _front = null;
    _back = null;
    _size = 0;
  }

  //means of removing an element from collection:
  //Dequeues and returns the first element of the queue.
  public Quasar dequeue()
  {
    LLNode<Quasar> temp = _front;
    if (_size == 0)
      return null;

    if (_size == 1)
    {
      _front = null;
      _back = null;
    } else
    {
      _front = _front.getNext();
    }

    _size -= 1;
    return temp.getValue();
  }

  //means of adding an element to collection:
  //Enqueue an element onto the back of this queue.
  public void enqueue( Quasar x )
  {
    LLNode<Quasar> temp = new LLNode<Quasar>(x, null);
    if (_size == 0)
    {
      _front = temp;
      _back = temp;
    } else
    {
      _back.setNext(temp);
      _back = temp;
    }

    _size += 1;
  }

  //Returns true if this queue is empty, otherwise returns false.
  public boolean isEmpty()
  {
    return _size == 0;
  }

  //Returns the first element of the queue without dequeuing it.
  public Quasar peekFront()
  {
    return _front.getValue();
  }
  
  public int size()
  {
    return _size;
  }
}
