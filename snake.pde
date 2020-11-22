float fat;

void setup()
{
  size(600, 600);
  fat=width/20;
}

snek S=new snek();

void draw()
{
  background(0);
  grid();
  S.show();
  S.move();
  delay(300);
}

class coord
{
  float x, y;
  coord(float a, float b)
  {
    x=a;
    y=b;
  }
  coord()
  {
    x=0;
    y=0;
  }
};

class snek
{
  coord[] arr;
  int len;
  int dir; //0- down
  //1- right
  //2- up
  //3- left
  coord tail;
  coord head;
  snek()
  {
    len=5;
    arr=new coord[len];
    float tempx=300;
    float tempy=300;
    for (int i=0; i<len; i++)
    {
      arr[i]=new coord(tempx,tempy);
      tempx-=0; 
      tempy+=fat;
    }
    //tail=arr[len-1];
    head=arr[0];
    dir=0;
    show();
  }

  void show()
  {
    fill(0, 255, 0);
    for (int i=0 ;i<len; i++) {
      rect(arr[i].x, arr[i].y, fat, fat);
    }
  }

  void move()
  {
    for(int i=len-1; i>0; i--)
    {
      arr[i].x=arr[i-1].x;
      arr[i].y=arr[i-1].y;
    }
    //switch(dir)
    //{
    //  case 0: arr[0].y+=fat; break;
    //  case 1: arr[0].x+=fat; break;
    //  case 2: arr[0].y-=fat; break;
    //  case 3: arr[0].x-=fat; break;
    //}
    //head=arr[0];
    //tail=arr[len];
    arr[0].x+=fat;
  }
};


void grid()
{
  stroke(255);
  strokeWeight(0.2);
  for (int i=0; i<width; i+=fat)
  {
    line(i, 0, i, height);  
    line(0, i, width, i);
  }
}
