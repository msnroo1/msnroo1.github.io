float ty=10;
float tx=10;
float dx=5;
float dy=4;
float Tx=2;
float Ty=2;
float R=20;
float rX=50;
float rY=5;
float X;
float Y;
float Xr=20;
float Yr=20;
float tei;
int St=0;
int S=0;
float ballx = 10.0;
float bally = 400.0;
float ballvx = 2.5;
float ballvy = 4.0;
int barx = 150;
int bary = 550;
int [][] block = { { 2, 1, 3, 1, 2}, {1, 2, 1, 2, 1}, {3, 2, 3, 2, 3},
                  {2, 3, 2, 3, 2}, {1, 2, 1, 2, 1} };


void setup(){
  size( 300, 600 );
  }

void draw() {
  background( 100,200,200 );
  fill( 100, 200, 0 );
  drawBlock();
  fill( 250, 200, 0 );
  barx = mouseX;
  rect( barx - 30, bary, 60, 10 );
  fill( 255,255,255 );
  ellipse( ballx, bally, R, R );
  ballx += ballvx;
  bally += ballvy;
  
  if( ballx < 0 ){
    //ballx = 0;
    ballvx = -ballvx;
  }
  if( ballx > 300 ){
    //ballx = 300;
    ballvx = -ballvx;
  }
  if( bally < 0 ){
    bally = 0;
    ballvy = -ballvy;
  }
  if( bally > bary-10 ){
    if( ballx > barx-30 && ballx < barx+30 ){
      bally = bary-10;
      ballvy = -ballvy;
      ballvx = ( ballx - barx) / 10;
    }
  }
  if( bally > bary+10 ){
    noLoop();
    fill(255,0,0);textSize(20);text("Game over",100,300);
    }
  for( int i=0; i<5; i++ ){
    for( int j=0; j<5; j++ ){
      if( block[i][j] > 0 ){
        if( ballx > j*60+10 && ballx < j*60+50 &&
            bally > i*40+150 && bally < i*40+190 ){
              ballvy = -ballvy;
              block[i][j] --;
            }
      }
    }
  }
  int k=1;
  for( int i=0; i<5; i++ ){
    for( int j=0; j<5; j++ ){
      if( block[i][j] > 0 )
        k = 0;
    }
  }
  if( k == 1 ){
    noLoop();
   fill(255,0,0);
   text("Retry,please",90,300);
  }
  if(St==0){
    tx=width/2;
    St=1;
    X=width/7+1;
    Y=height/7;
  }  
    if(S==0){
    fill(255,0,0);  
    rect(X,Y,Xr,Yr);
    X+=Tx;
    if(X<=width/7){
    Tx=-Tx;
    }else if(X>=width/7*6){
      Tx=-Tx;
    }
    }

  if(ballx>=width){
    dx=-dx;
    ballx--;
  }else if(bally>=height){

  }else if(ballx<=0){
    dx=-dx;
    ballx++;
  }else if(bally<=0){
    dy=-dy;
    bally++;
  }else if(bally+R>=height/8*7-rY && bally-R<=height/8*7+rY && ballx>=mouseX-rX && ballx<=mouseX+rX){
    tei=(ballx-mouseX)/12;
    dx+=tei;
    dy=-dy;
    bally--;
    
  }else if(bally-R+10<=Y+Yr && bally+R-10>=Y-Yr && 
  ballx<=X+Xr-10 && ballx>=X-Xr+10 && S==0){
    dy=-dy;
    bally+=dy;
    S=1;fill(255,0,0);noLoop();textSize(20);text("Great!!",120,300);
  }
}

void drawBlock() {
  int i, j;
  for( i=0; i<5; i++ ){
    for( j=0; j<5; j++ ){
      switch( block[i][j] ){
        case 3:
        stroke( 0 );
        fill( 0,0,100 );
        break;
        case 2:
        stroke( 0 );
        fill( 0,0,150 );
        break;
        case 1:
        stroke( 0 );
        fill(0,0,255 );
      }
      if( block[i][j] > 0 ){
        rect( j*60+10, i*40+150, 40, 20 );
      }
    }
  }
}

