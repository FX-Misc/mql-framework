// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Object.mqh"

class Map : public Object
{
   protected :
   
      Object* _items[];

   public :
      
      /**
       */
      int length (  );
      
      /**
       */
      int extend ( int number = 1 );
      
      /** 
       */
      Object* add(  );
      
      /** 
       */
      Map* add( Object* o );
      
      /**
       */
      template < typename T >
      T* add ( T* o, bool chain );
      
      /**
       */
      virtual Object* get ( int i );
      
      /** 
       */
      virtual Object* create (  );   
};


/**
 */
int 
   Map::length 
      (  ) 
{
   return ArraySize( _items );
};

/**
 */
int 
   Map::extend 
      ( int number = 1 ) 
{
   return ArrayResize( _items, length(  ) + number );
};

/** 
 */
Object* 
   Map::add
      (  ) 
{
   return add( create(  ), true );
};

/** 
 */
Map* 
   Map::add
      ( Object* o ) 
{
   _items[ extend( 1 ) - 1 ] = o;
   return pointer(this);
};

/**
 */
template < typename T >
T* 
   Map::add
      ( T * o, bool chain ) 
{
   add( o );
   return o;
};      

/**
 */
Object* 
   Map::get
      ( int i ) 
{
   return _items[ i ];
};

/** 
 */
Object* 
   Map::create
      (  ) 
{
   return new Object(  );
};