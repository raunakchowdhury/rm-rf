public class LList<T>
{
  //instant variables
  DLLNode _head;
  DLLNode _tail;
  int _size;

  //constructor
  public LList()
  {
    _head = null;
    _tail = null;
    _size = 0;
  }

  //add node containing input T to end of list
  public boolean add( T x )
  {
    DLLNode newNode = new DLLNode(null, x, null);

    if (_size == 0)
    {
      _head = newNode;
      _tail = newNode;
    } else
    {
      newNode.setPrev(_tail);
      newNode.getPrev().setNext(newNode);
      _tail = newNode;
    }
    _size++;
    return true;
  }

  public DLLNode getNode( int index )
  {
    //if ( index < 0 || index >= size() )
    //  throw new IndexOutOfBoundsException();

    DLLNode retVal;
    DLLNode tmp = _head; //create alias to head

    //walk to desired node
    for ( int i=0; i < index; i++ )
      tmp = tmp.getNext();

    //check target node's cargo hold
    retVal = tmp;
    return retVal;
  }

  public T remove(int a)
  {
    DLLNode tmp = getNode(a);

    if (tmp == _head && tmp == _tail)
    {
      _head = null;
      _tail = null;
      _size--;
      return (T) tmp.getCargo();
    }

    if (tmp.getPrev() == null)
    {
      _head.getNext().setPrev(null);
      _head = tmp.getNext();
    } else if (tmp.getNext() == null)
    {
      tmp.getPrev().setNext(null);
      _tail = tmp.getPrev();
    } else
    {
      tmp.getPrev().setNext(tmp.getNext());
      tmp.getNext().setPrev(tmp.getPrev());
    }
    _size--;
    return (T) tmp.getCargo();
  }

  //removes the node a and returns its cargo
  public T removeNode( DLLNode a)
  {
    DLLNode tmp = a;

    if (tmp == null)
      return null;

    if (tmp == _head && tmp == _tail)
    {
      _head = null;
      _tail = null;
      _size--;
      return (T) tmp.getCargo();
    }

    if (tmp.getPrev() == null)
    {
      _head.getNext().setPrev(null);
      _head = tmp.getNext();
    } else if (tmp.getNext() == null)
    {
      tmp.getPrev().setNext(null);
      _tail = tmp.getPrev();
    } else
    {
      tmp.getPrev().setNext(tmp.getNext());
      tmp.getNext().setPrev(tmp.getPrev());
    }
    _size--;
    return (T) tmp.getCargo();
  }

  public T remove()
  {
    DLLNode<T> temp = _head;
    _head.getNext().setPrev(null);
    _head = _head.getNext();
    _size--;
    return temp.getCargo();
  }

  //return data in element at position i
  public T get( int i )
  {
    return (T) getNode(i).getCargo();
  }

  //overwrite data in element at position i
  public T set( int i, T x )
  {
    return (T) getNode(i).setCargo(x);
  }

  //return length of list
  public int size()
  {
    return _size;
  }

  public String toString()
  {
    String retStr = "HEAD->";
    DLLNode tmp = _head; //init tr
    while ( tmp != null ) {
      retStr += tmp.getCargo() + "->";
      tmp = tmp.getNext();
    }
    retStr += "NULL";
    return retStr;
  }
}
