class result extends AppBase {

  float t;


  float total_per;
  Minim minim_main, score_main, rank_main;         
  AudioPlayer player_main, ssp, ssg, ssb, ssm, sst, rank;

  result(PApplet _parent) {
    super(_parent);
    minim_main = new Minim(_parent);  
    score_main = new Minim(_parent);  
    rank_main = new Minim(_parent);
  }
  @Override void setup() {
    size(1376, 768);
    flag = 0;
    t=0;
    player_main = minim_main.loadFile("result_music.mp3");
    PImage photo_result = loadImage("resultback3.jpg");
    image(photo_result, 0, 0, 1736, 768);
    //PImage photo_sounddata = loadImage("soundimg.png");



    rank = rank_main.loadFile("rank2.mp3");//size(1376,768);

    fill(0, 0, 0, 30);
    rect(0, 0, width, height);

    fill(0, 0, 100, 10);
    stroke(120, 100, 100, 50);
    rect(0, 100, width, height - 200);

    noStroke();
    fill(0, 0, 0, 70);
    rect(900, 250, 1000, 60, 50);//perfect

    rect(850, 320, 1000, 60, 50);//good

    rect(800, 390, 1000, 60, 50);//bad

    rect(750, 460, 1000, 70, 50);//miss

    rect(-100, 430, 450, 237, 50);//max combo

    rect(650, 550, 1000, 100, 100);//total
    fill(0, 0, 100, 3);
    stroke(120, 100, 100, 3);
    quad(440, 350, 490, 530, 630, 410, 560, 230);

    fill(120, 100, 100, 60);

    fill(0, 100, 100, 60);
    rect(width / 2 - 100, 700, 200, 500);//exit red
    fill(180, 100, 100, 60);
    rect(width - 200, 700, 200, 500);//next blue

    fill(0, 0, 0, 100);
    textSize(30);

    text("Exit", width / 2 - 100 + 10, 735);
    text("Next", width - 200 + 10, 735);




    smooth();

    image(music, 70, 70, 300, 300);
    fill(0, 0, 0, 100);
    textSize(70);
    text("sound data", 600, 200);//sound data

    PFont mainfont = loadFont("AvenirNextforSAS-48.vlw");
    textFont(mainfont);

    fill(219, 100, 100, 100);
    textSize(30);
    text("Perfect", 930, 290);

    fill(148, 100, 100, 100);
    textSize(30);
    text("Good", 880, 360);

    fill(23, 100, 100, 100);
    textSize(30);
    text("Bad", 830, 430);

    fill(0, 100, 100, 100);
    textSize(30);
    text("Miss", 780, 505);

    fill(200, 40, 100, 100);
    textSize(60);
    text("Total", 680, 620);

    fill(200, 40, 100, 100);
    textSize(40);
    text("Max Combo", 10, 640);
  }

  @Override void draw() {

    player_main.play();


    total_per = ((perfect_score + good_score * 0.75 + bad_score * 0.3)/ (perfect_score + good_score + bad_score + miss_score) ) * 100;


    if (t == 1) {

      fill(0, 0, 100, 100);
      textSize(34);
      text(perfect_score, 1100, 292);
      //ssp.play();
    } else  if (t == 2) {

      fill(0, 0, 100, 100);
      textSize(34);
      text(good_score, 1100, 364);
      //ssg.play();
    } else  if (t == 3) {

      fill(0, 0, 100, 100);
      textSize(34);
      text(bad_score, 1100, 438);
      // ssb.play();
    } else if (t == 4) {

      fill(0, 0, 100, 100);
      textSize(34);
      text(miss_score, 1100, 510);
      // ssm.play();
    } else if (t == 5) {

      fill(0, 0, 100, 100);
      textSize(60);
      text(total_per, 900, 620);
      // sst.play();
    } else if (t == 6) {

      PFont scorefont = loadFont("CopperplateGothic-Bold-48.vlw");
      PFont mainfont = loadFont("AvenirNextforSAS-48.vlw");

      rank.play();

      fill(0, 0, 100, 100);
      textSize(70);
      textFont(mainfont);
      text(max, 180, 550);
      textFont(scorefont);



      if (total_per == 100) {

        fill(58, 100, 100, 100);
        textSize(153);
        text("EX", 380, 380);
        fill(147, 100, 100, 100);
        textSize(150);
        text("EX", 380, 380);
      } else if (total_per >= 95 && total_per < 100) {

        fill(0, 0, 100, 100);
        textSize(253);
        text("S+", 372, 447);
        fill(58, 70, 100, 100);
        textSize(250);
        text("S+", 370, 450);
      } else if (total_per >= 90 && total_per < 95) {

        fill(0, 0, 100, 100);
        textSize(254);
        text("S", 453, 447);
        fill(58, 70, 100, 100);
        textSize(250);
        text("S", 450, 450);
      } else if (total_per >= 85 && total_per < 90) {

        fill(350, 100, 100, 100);
        textSize(250);
        text("A+", 370, 450);
      } else if (total_per >= 80 && total_per < 85) {

        fill(350, 100, 100, 100);
        textSize(250);
        text("A", 450, 450);
      } else if (total_per >= 75 && total_per < 80) {

        fill(34, 80, 100, 100);
        textSize(230);
        text("B+", 370, 450);
      } else if (total_per >= 70 && total_per < 75) {

        fill(34, 80, 100, 100);
        textSize(230);
        text("B", 450, 450);
      } else if (total_per >= 65 && total_per < 70) {

        fill(206, 73, 73, 100);
        textSize(200);
        text("C", 450, 450);
      } else if (total_per >= 60 && total_per < 65) {

        fill(267, 80, 100, 100);
        textSize(200);
        text("D", 450, 450);
      }
    }
  }

  @Override void mousePressed() {
    t += 1;
    count = 0;
    if (mouseX>width / 2 - 100 && mouseX < width / 2 + 100 && mouseY>700) {
      player_main.close();
      selected = 0;
      score = 0;
      combo = 0;
      max = 0;
      perfect_score = 0;
      good_score = 0;
      bad_score = 0;
      miss_score = 0;
    }
    if (mouseX>width - 200 && mouseY >700) {
      player_main.close();
      selected = 1;
      combo = 0;
      max = 0;
      perfect_score = 0;
      good_score = 0;
      bad_score = 0;
      miss_score = 0;
    }
  }
  @Override void keyPressed() {
  }
}
