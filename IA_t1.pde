// ID: 11131019
// Name: Tomas Siqueira

import java.util.Arrays;

Map env = new Map(12,12,100);
int t = 0;


void setup() {

  Robot r1 = new Robot(1,1,1,0,"active",null,env);
  Robot r2 = new Robot(2,1,3,0,"active",null,env);
  Robot r3 = new Robot(3,1,5,0,"active",null,env);
  Robot r4 = new Robot(4,1,7,0,"active",null,env);
  Robot r5 = new Robot(5,1,9,0,"active",null,env);
  Robot r6 = new Robot(6,1,2,0,"active",null,env);
  Robot r7 = new Robot(7,1,8,0,"active",null,env);
  r1.insertPath(env.map,8,1);
  r2.insertPath(env.map,8,4);
  r3.insertPath(env.map,2,9);
  r4.insertPath(env.map,5,7);
  r5.insertPath(env.map,9,1);
  r6.insertPath(env.map,10,1);
  r7.insertPath(env.map,5,7);
  
  env.printMap(0);
  
  // Configs
  colorMode(RGB);
  size(200,200);   
}

void draw(){
  background(255);
  env.drawMap(t);  
  if (frameCount % 60 == 0){
    t++;  
  }
}

void mouseClicked(){
  println(mouseX);
  println(mouseY);
  }