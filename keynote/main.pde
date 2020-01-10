
import ddf.minim.*;
ArrayList<AppBase>apps;
int selected;
int player_select;
int count=0;
AudioPlayer player;

int score = 0;
int combo = 0;
int max = 0;
int perfect_score = 0;
int good_score = 0;
int bad_score = 0;
int miss_score = 0;
int flag;
PImage music;

void setup() {
  size(1376, 768);
  colorMode(HSB, 360, 100, 100, 100);


  apps = new ArrayList<AppBase>();

  apps.add(new starting(this));
  apps.add(new select(this));
  apps.add(new game(this));
  apps.add(new result(this));


  selected = 0;
}

void draw() {
  if (selected==0) {
    if (flag==0) {
      apps.get(selected).setup();
      flag = 1;
    }
  }
  if (selected==1) {
    apps.get(selected).draw();
  }
  if (selected==1&&mousePressed==true) {
    apps.get(selected).mousePressed();
  }
  if (selected==2) {
    if (count==0) {
      apps.get(selected).setup();
      count=1;
    }
    //sound.play();
    apps.get(selected).draw();
  }
  if (selected==3) {
    if (count==1) {
      apps.get(selected).setup();
      count=2;
    }
    apps.get(selected).draw();
  }
  if (selected==3&&mousePressed==true) {
    apps.get(selected).mousePressed();
  }
}

void keyPressed() {

  if (key == 'a'&&selected==0) {
    apps.get(selected).keyPressed();
    selected = 1;
    apps.get(selected).setup();
  }
  if (selected==2 ) {
    apps.get(selected).keyPressed();
  }
}
