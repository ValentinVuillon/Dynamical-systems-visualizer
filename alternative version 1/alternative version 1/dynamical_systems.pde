import peasy.*;
PeasyCam cam;

firefly firefly_1;
firefly firefly_2;
firefly firefly_3;
fireflies_group fg;
lorenz_dynamical_system lds;
aizawa_dynamical_system ads;
halvorsen_dynamical_system hds;

void setup() {
  size(800, 600, P3D);
  cam=new PeasyCam(this, 500);
  
  // for lorenz dynamical system
  //firefly_1=new firefly(20, 0, 0, 255, 0, 0);
  //firefly_2=new firefly(0, 10, 0, 0, 255, 0);
  //firefly_3=new firefly(1, 0, 5, 0, 0, 255);
  // for aizawa dynamical system
  //firefly_1=new firefly(0.5, 0, 0, 255, 0, 0);
  //firefly_2=new firefly(0, 0.5, 0, 0, 255, 0);
  //firefly_3=new firefly(0.5, 0, 0.5, 0, 0, 255);
  //for halvorsen dynamical system
  firefly_1=new firefly(0, 0, -1, 255, 0, 0);
  firefly_2=new firefly(0, 0, -2, 0, 255, 0);
  firefly_3=new firefly(0, 0, -3, 0, 0, 255);
  
  fg= new fireflies_group();
  fg.add_firefly(firefly_1);
  fg.add_firefly(firefly_2);
  fg.add_firefly(firefly_3);
  lds=new lorenz_dynamical_system();
  ads=new aizawa_dynamical_system();
  hds=new halvorsen_dynamical_system();
  
  
}


float dt=0.005;
  
void draw(){

hds.update_fireflies_group(fg, dt, 5);

//for lorenz: fg.draw_fireflies(5);, translate(0,0,-150);
//for aizawa: fg.draw_fireflies(100); translate(0,0,-70);
//for halvorsen: fg.draw_fireflies(5); translate(50,50,50);

background(0);
draw_axis(100);
translate(50,50,50);
fg.draw_fireflies(5);




}
