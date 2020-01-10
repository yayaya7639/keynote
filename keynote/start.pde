class starting extends AppBase {

  Minim minim_main, botann1;         
  AudioPlayer player_main, botann;

  int count_down = 3;

  int timeLimit = 3;
  int countDown;

  float gain;
  int bo = 0;

  starting(PApplet _parent) {
    super(_parent);
    minim_main = new Minim(_parent);  

    botann1 = new Minim(_parent);
  }
  @Override void setup() {
    //size(1376,768);
    colorMode(HSB, 360, 100, 100, 100);

    PImage photo_start = loadImage("back.jpg");
    photo_start.resize(width, height);
    image(photo_start, 0, 0);
    player_main = minim_main.loadFile("2483.mp3");
    botann = botann1.loadFile("start.mp3"); 
    player_main.play();  



    smooth();
    noStroke();
    fill(0, 0, 100, 20);
    ellipse(688, 384, 1800, 1800);
    fill(0, 0, 100, 50);
    ellipse(688, 384, 500, 500);
    fill(180, 100, 100, 30);
    ellipse(688, 384, 400, 400);



    PFont myFont = loadFont("CopperplateGothic-Light-48.vlw");
    textFont(myFont);
    fill(0, 0, 100, 100);
    textSize(70);
    text("Start", 525, 403);
    fill(180, 100, 100, 70);
    textSize(70);
    text("Start", 530, 400);

    fill(0, 0, 100, 100);
    textSize(40);
    text("press : A", 668, 462);
    fill(180, 100, 100, 70);
    textSize(40);
    text("press : A", 670, 460);

    fill(0, 0, 100, 90);
    textSize(70);
    text("Key-Note", 1000, 100);

    rect(950, 102, 500, 2);
    rect(950, 105, 500, 2);
  }

  @Override void draw() {
  }

  @Override void mousePressed() {
  }

  @Override void keyPressed() {
    println("yes");
    gain = player_main.getGain();
    botann.play();

    player_main.shiftGain( gain, -80, 10000 );
  }
}
