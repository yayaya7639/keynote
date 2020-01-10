class game extends AppBase {

  Minim minim;  
  float[][] hanteix = new float[12][3];
  float[] hanteiy = new float[3];
  char[][] moji = new char[12][3];
  float s = 0;
  int y = 0;
  int t =300;
  int m = 3000;


  int mm=0;
  int hantei;
  int i = 0;
  float yy = 0;
  int k = 100;
  int[] x;
  int number = 0;
  int n = 0;
  int[] note;
  int delay=5000;
  boolean flag =true;

  game(PApplet _parent) {
    super(_parent);
    minim = new Minim(_parent);
  }
  @Override void setup() {
    frameRate(150);
    size(1376, 768);
    colorMode(HSB, 360, 100, 100, 100);
    background(0, 0, 0, 0);
    
    moji[0][0]='Q';
    moji[0][1]='A';
    moji[0][2]='Z';
    moji[1][0]='W';
    moji[1][1]='S';
    moji[1][2]='X';
    moji[2][0]='E';
    moji[2][1]='D';
    moji[2][2]='C';
    moji[3][0]='R';
    moji[3][1]='F';
    moji[3][2]='V';
    moji[4][0]='T';
    moji[4][1]='G';
    moji[4][2]='B';
    moji[5][0]='Y';
    moji[5][1]='H';
    moji[5][2]='N';
    moji[6][0]='U';
    moji[6][1]='J';
    moji[6][2]='M';
    moji[7][0]='I';
    moji[7][1]='K';
    moji[7][2]=',';
    moji[8][0]='O';
    moji[8][1]='L';
    moji[8][2]='.';
    moji[9][0]='P';
    moji[9][1]=';';
    moji[9][2]='/';


    x = new int[12];
    for (i=0; i<12; i++) {
      x[i] = 515 + 60 * i;
    }
    i=0;
    yy=0;
  }

  @Override void draw() {
    if (millis()>3000) {
      player.play();  
      //println("sound");
    }
    if ((keyPressed == true) &&(key == '1')) {
      player.pause();
      delay(delay);
    }

    mm=moji[number][n];

    background(0, 0, 0, 100);
    stroke(100);
    line(500, 300, 1220, 300);
    for (i=0; i<=12; i++) {
      line(500 + 60 * i, 0, 500 + 60 * i, 400);
    }
    stroke(255);
    textSize(20);


    textSize(30);
    text("perfect: ", 50, 350);
    text("great: ", 50, 400);
    text("good: ", 50, 450);
    text("miss: ", 50, 500);

    text("Stop(5sec) :  1", 50, 600);
    text("Combo", 250, 350);
    text("MAX", 250, 400);
    textSize(50);

    text(combo, 400, 350);
    text(max, 400, 400);
    textSize(40);
    text(perfect_score, 170, 350);
    text(good_score, 170, 400);
    text(bad_score, 170, 450);
    text(miss_score, 170, 500);

    if (player.isPlaying()==true) {
      //println("true");
      for (i=0; i<12; i++) {
        fill(127);
        ellipse(x[i]+15, t, 50, 50);
      }
      if (yy<450) {
        
        fill(255);
        stroke(100);
        ellipse(x[number]+15, yy, 50, 50);
        yy+=2.5;
        text(moji[number][n], x[number], 500);
      } else {

        yy=0.0;

        number = int(random(10));
        n = int(random(3));
      }
    }
    if (player.isPlaying()==false) {
      println("yes");
      selected = 3;
      apps.get(selected).setup();
    }   


    for (int i = 0; i < 12; i++) {

      for (int u = 0; u < 3; u++) {

        smooth();
        strokeWeight(2); 


        rect(515 + 60 * i + 10 * (u - 1), 515 + 60 * u, 55, 55, 10);
        hanteix[i][u] = 515 + 60 * i + 10 * (u - 1);
        hanteiy[u] = 515 + 60 * u;
      }
    }




    stroke(180, 100, 0, 50);
    strokeWeight(5);
    rect(hanteix[11][2], hanteiy[2], 55, 55, 10);

    if (max<combo) {
      max=combo;
    }
    image(music, 0,0, 300,300);
  }
  @Override void mousePressed() {
  }
  @Override void keyPressed() {
    if ((keyPressed == true) && (key == 'a')) {
      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[0][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='A') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='A') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='A') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;

        break;
      case 1:
        good_score=good_score+1;
        combo++;

        break;
      case 2:
        bad_score=bad_score+1;
        combo++;

        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;

        break;
      }
    } else if ((keyPressed == false) && (key == 'a')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[0][1], hanteiy[1], 55, 55, 10);
    }




    if ((keyPressed == true) && (key == 'q')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[0][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='Q') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='Q') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='Q') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'q')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[0][0], hanteiy[0], 55, 55, 10);
    }

    if ((keyPressed == true) && (key == 'w')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[1][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='W') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='W') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='W') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'w')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[1][0], hanteiy[0], 55, 55, 10);
    }//w

    if ((keyPressed == true) && (key == 'e')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[2][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='E') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='E') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='E') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'e')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[2][0], hanteiy[0], 55, 55, 10);
    }

    if ((keyPressed == true) && (key == 'r')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[3][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='R') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='R') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='R') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'r')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[3][0], hanteiy[0], 55, 55, 10);
    }

    if ((keyPressed == true) && (key == 't')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[4][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='T') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='T') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='T') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 't')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[4][0], hanteiy[0], 55, 55, 10);
    }//t

    if ((keyPressed == true) && (key == 'y')) {

      stroke(180, 100, 100, 50);
      strokeWeight(2);
      rect(hanteix[5][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='Y') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='Y') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='Y') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'y')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[5][0], hanteiy[0], 55, 55, 10);
    }//y

    if ((keyPressed == true) && (key == 'u')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[6][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='U') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='U') {
        score=1;
      } else if (Math.abs(yy-300)<70 && moji[number][n]=='U') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'u')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[6][0], hanteiy[0], 55, 55, 10);
    }//u

    if ((keyPressed == true) && (key == 'i')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[7][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='I') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='I') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='I') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'i')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[7][0], hanteiy[0], 55, 55, 10);
    }//i

    if ((keyPressed == true) && (key == 'o')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[8][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='O') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='O') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='O') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'o')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[8][0], hanteiy[0], 55, 55, 10);
    }//o

    if ((keyPressed == true) && (key == 'p')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[9][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='P') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='P') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='P') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else  if ((keyPressed == false) && (key == 'p')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[9][0], hanteiy[0], 55, 55, 10);
    }//p

    if ((keyPressed == true) && (key == '@')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[10][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='@') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='@') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='@') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == '@')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[10][0], hanteiy[0], 55, 55, 10);
    }//@

    if ((keyPressed == true) && (key == '[')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[11][0], hanteiy[0], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='[') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='[') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='[') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == '[')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[11][0], hanteiy[0], 55, 55, 10);
    }



    if ((keyPressed == true) && (key == 's')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[1][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='S') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='S') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='S') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 's')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[1][1], hanteiy[1], 55, 55, 10);
    }//s

    if ((keyPressed == true) && (key == 'd')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[2][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='D') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='D') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='D') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'd')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[2][1], hanteiy[1], 55, 55, 10);
    }//d

    if ((keyPressed == true) && (key == 'f')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[3][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='F') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='F') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='F') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'f')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[3][1], hanteiy[1], 55, 55, 10);
    }//f

    if ((keyPressed == true) && (key == 'g')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[4][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='G') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='G') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='G') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'g')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[4][1], hanteiy[1], 55, 55, 10);
    }//g

    if ((keyPressed == true) && (key == 'h')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[5][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='H') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='H') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='H') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'h')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[5][1], hanteiy[1], 55, 55, 10);
    }//h

    if ((keyPressed == true) && (key == 'j')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[6][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='J') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='J') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='J') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'j')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[6][1], hanteiy[1], 55, 55, 10);
    }//j

    if ((keyPressed == true) && (key == 'k')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[7][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='K') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='K') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='K') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'k')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[7][1], hanteiy[1], 55, 55, 10);
    }//k

    if ((keyPressed == true) && (key == 'l')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[8][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='L') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='L') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='L') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else  if ((keyPressed == false) && (key == 'l')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[8][1], hanteiy[1], 55, 55, 10);
    }//l

    if ((keyPressed == true) && (key == ';')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[9][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]==';') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]==';') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]==';') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == ';')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[9][1], hanteiy[1], 55, 55, 10);
    }//;

    if ((keyPressed == true) && (key == ':')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[10][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]==':') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]==':') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='A') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == ':')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[10][1], hanteiy[1], 55, 55, 10);
    }//:

    if ((keyPressed == true) && (key == ']')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[11][1], hanteiy[1], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]==']') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]==']') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]==']') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == ']')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[11][1], hanteiy[1], 55, 55, 10);
    }//]



    if ((keyPressed == true) && (key == 'z')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[0][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='Z') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='Z') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='Z') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'z')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[0][2], hanteiy[2], 55, 55, 10);
    }//z

    if ((keyPressed == true) && (key == 'x')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[1][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='X') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='X') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='X') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'x')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[1][2], hanteiy[2], 55, 55, 10);
    }//x

    if ((keyPressed == true) && (key == 'c')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[2][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='C') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='C') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='C') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else  if ((keyPressed == false) && (key == 'c')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[2][2], hanteiy[2], 55, 55, 10);
    }//c

    if ((keyPressed == true) && (key == 'v')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[3][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='V') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='V') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='V') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'v')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[3][2], hanteiy[2], 55, 55, 10);
    }//v

    if ((keyPressed == true) && (key == 'b')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[4][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='B') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='B') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='B') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'b')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[4][2], hanteiy[2], 55, 55, 10);
    }//b

    if ((keyPressed == true) && (key == 'n')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[5][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='N') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='N') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='N') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'n')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[5][2], hanteiy[2], 55, 55, 10);
    }//n

    if ((keyPressed == true) && (key == 'm')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[6][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='M') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='M') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='M') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == 'm')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[6][2], hanteiy[2], 55, 55, 10);
    }//m

    if ((keyPressed == true) && (key == ',')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[7][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]==',') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]==',') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]==',') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == ',')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[7][2], hanteiy[2], 55, 55, 10);
    }//,

    if ((keyPressed == true) && (key == '.')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[8][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='.') {
        score=0;
      } else if (Math.abs(yy-300)<40&& moji[number][n]=='.') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='.') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else if ((keyPressed == false) && (key == '.')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[8][2], hanteiy[2], 55, 55, 10);
    }//.

    if ((keyPressed == true) && (key == '/')) {

      stroke(180, 100, 100, 50);
      strokeWeight(5);
      rect(hanteix[9][2], hanteiy[2], 55, 55, 10);
      if (Math.abs(yy-300)<10 && moji[number][n]=='/') {
        score=0;
      } else if (Math.abs(yy-300)<40 && moji[number][n]=='/') {
        score=1;
      } else if (Math.abs(yy-300)<75 && moji[number][n]=='/') {
        score=2;
      } else {
        score=3;
      }
      switch(score) {
      case 0:
        perfect_score=perfect_score+1;
        combo++;
        break;
      case 1:
        good_score=good_score+1;
        combo++;
        break;
      case 2:
        bad_score=bad_score+1;
        combo++;
        break;
      case 3:
        miss_score=miss_score+1;
        combo=0;
        break;
      }
    } else  if ((keyPressed == false) && (key == '/')) {

      stroke(0, 0, 100, 10);
      strokeWeight(5);
      rect(hanteix[9][2], hanteiy[2], 55, 55, 10);
    }
  }
}
