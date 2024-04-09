class firefly {
  //physical part
  PVector position;
  PVector velocity;
  
  //graphical part
  int[] firefly_color;
  
  float size_head=1;

  
  //constructor
    firefly(float x, float y, float z, int c1, int c2, int c3){
    position = new PVector(x, y, z);
    velocity = new PVector(0, 0, 0);
    int[] cl = {c1, c2, c3};
    firefly_color=cl;
    }  
    
    //methods
    void draw_firefly(int scaling){
      
      //head
      stroke(firefly_color[0], firefly_color[1], firefly_color[2]);
      strokeWeight(size_head);
      point(scaling*position.x,scaling*position.y,scaling*position.z);
      
  
  
      }
         
}

public class fireflies_group{
  ArrayList<firefly> group;
  
    
  public void add_firefly(firefly f){
    group.add(f);
  }
  
  public fireflies_group(int n, int m){
    group=new ArrayList<firefly>();
    
    for(int i=0; i<n; i++ ){
      firefly firefly;
      firefly=new firefly(random(-m,m), random(-m,m), random(-m,m), int(random(0,255)), int(random(0,255)), int(random(0,255)));
      this.add_firefly(firefly);
    }
    
  }

  public void draw_fireflies(int scaling){
    noFill();
    
    for(firefly f: group){
      f.draw_firefly(scaling);
    }
  }
}

class lorenz_dynamical_system{
  float sigma=10;
  float rho=28;
  float beta=8/3;
  
    void update_fireflies_group(fireflies_group fg, float dt, int steps){
    for (int i=0; i<steps; i++){
      for(firefly f: fg.group){
        f.velocity.x=sigma*(f.position.y-f.position.x);
        f.velocity.y=rho*f.position.x-f.position.y-f.position.x*f.position.z;
        f.velocity.z=f.position.x*f.position.y-beta*f.position.z;
        f.position=f.position.add((f.velocity).mult(dt));
  
 
        
      }
    }
  }
}

class aizawa_dynamical_system{
  
  //presets: 
  //
  //alpha=0.95, beta=0.7, gamma=0.6, delta=3.5, epsilon=0.25, zeta=0.1
  //
  
  float alpha=0.95;
  float beta=0.7;
  float gamma=0.6;
  float delta=3.5;
  float epsilon=0.25;
  float zeta=0.1;
  
    void update_fireflies_group(fireflies_group fg,float dt, int steps){
    for (int i=0; i<steps; i++){
      for(firefly f: fg.group){
        f.velocity.x=(f.position.z-beta)*f.position.x-delta*f.position.y;
        f.velocity.y=delta*f.position.x+(f.position.z-beta)*f.position.y;
        f.velocity.z=gamma+alpha*f.position.z-pow((f.position.z),3)/3-(pow((f.position.x),2)+pow((f.position.y),2))*(1+epsilon*f.position.z)+zeta*f.position.z*pow(f.position.x,3);
        f.position=f.position.add((f.velocity).mult(dt));
  
     
      }
    }
  }
}

void draw_axis(int n){
   strokeWeight(1);
  
   stroke(255,0,0);
   line(0,0,0,n,0,0);
   stroke(0,255,0);
   line(0,0,0,0,n,0);
   stroke(0,0,255);
   line(0,0,0,0,0,n);
    
    
}
