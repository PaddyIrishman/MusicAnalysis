import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
void setup ()
{
  size(500,500);
  
  minim = new Minim(this);
  
  in = minim.getLineIn(Minim.MONO,width,44100,16);
}      

void draw()
{
  background(0);
  stroke(255);
  float mid = height/2;
  float _average=0;
  for(int i =0;i < in.bufferSize(); i ++)
  {
    line(i,mid, i,mid + in.left.get(i)*100);
    _average += abs(in.left.get(i) / in.bufferSize());
    
  }
  line(10,20,10+(_average *500),20);
}
