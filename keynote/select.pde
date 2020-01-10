class select extends AppBase {
  Minim main;         

  AudioPlayer sound;
  int page = 1;

  int sound_select = 0;

  PImage soundimgmain;
  select(PApplet _parent) {
    super(_parent);
    main = new Minim(_parent);  
    sound = main.loadFile("PerituneMaterial_Sakuya3.mp3");
    sound = main.loadFile("result_music.mp3");
  }
  @Override void setup() {

    colorMode(HSB, 360, 100, 100, 100);
  }

  @Override void draw() {
    PImage photo_select = loadImage("selectback2.jpg");
    image(photo_select, 0, 0, 1736, 768);

    fill(0, 0, 0, 60);
    rect(0, 0, 1736, 768);//effect

    stroke(158, 100, 100, 50);
    rect(500, 0, 5, 768);
    rect(0, 500, 500, 5);//境界

    rect(505, 0, 1000, 100);
    fill(158, 20, 100, 80);
    textSize(70);
    text("Select", 1150, 80);//select

    fill(360, 100, 10, 60);
    stroke(360, 100, 100, 50);
    rect(505, 697, 250, 70);
    fill(360, 100, 100, 80);
    textSize(50);
    text("Back", 640, 760);//back

    fill(229, 100, 10, 60);
    stroke(229, 100, 100, 50);
    rect(1126, 697, 250, 70);
    fill(230, 70, 100, 80);
    textSize(50);
    text("Next", 1130, 760);//next

    fill(158, 100, 10, 60);
    stroke(158, 100, 100, 70);
    rect(250, 630, 250, 200);
    fill(158, 100, 100, 80);
    textSize(50);
    text("Play", 260, 760);//Play

    fill(0, 0, 100, 70);
    textSize(40);
    text("(    /  2 )", 870, 750);
    text(page, 890, 750);//page

    text(sound_select, 0, 750);//確かめ

    for (int i = 0; i < 5; i++) {

      fill(0, 0, 100, 30);

      rect(505, 102 + 115 * i + 5 * i, 1000, 115);
    }//select sound

    PImage soundimg1 = loadImage("music1img.jpg");
    PImage soundimg2 = loadImage("music2img.jpg");
    PImage soundimg3 = loadImage("music3img.jpg");
    PImage soundimg4 = loadImage("music4img.png");
    PImage soundimg5 = loadImage("music5img.png");
    PImage soundimg6 = loadImage("music6img.jpg");
    PImage soundimg7 = loadImage("music7img.jpg");
    PImage soundimg8 = loadImage("music8img.png");
    PImage soundimg9 = loadImage("music9img.png");
    PImage soundimg10 = loadImage("music10img.png");
    PFont japfont = createFont("MS PMincho", 48, true);
    textFont(japfont);



    if (page == 1) {


      image(soundimg1, 506, 102, 115, 115);
      textSize(30);
      text("「Fate GrandOrder」より", 625, 132);
      textSize(55);
      text("ガラスの鏡　-Mirror Metal Ver-", 625, 200);
      textSize(40);
      text("新時あさ美", 1155, 139);//music1

      image(soundimg2, 506, 222, 115, 115);
      textSize(30);
      text("「Fate GrandOrder」より", 625, 252);
      textSize(55);
      text(" - ＲＥＤＯＲＤＥＲ -", 625, 320);
      textSize(40);
      text("謎の人物K", 1155, 259);//music2

      image(soundimg3, 506, 342, 115, 115);
      textSize(30);
      text("「Fate GrandOrder」より", 625, 372);
      textSize(55);
      text(" - 夜明けの薔薇 -", 625, 440);
      textSize(40);
      text("冬乃桜", 1155, 379);//music3

      image(soundimg4, 506, 462, 115, 115);
      textSize(30);
      text("「Fate GrandOrder」より", 625, 492);
      textSize(55);
      text(" - ＧＯＡＬ -", 625, 560);
      textSize(40);
      text("No credit", 1155, 499);//music4

      image(soundimg5, 506, 582, 115, 115);
      textSize(30);
      text("「Fate GrandOrder」より", 625, 612);
      textSize(55);
      text(" - ＣＯＬＤ　ＧＲＡＮＤＩＡ -", 625, 680);
      textSize(40);
      text("No credit", 1155, 619);//music5
    } else if (page == 2) {

      image(soundimg6, 506, 102, 115, 115);
      textSize(55);
      text(" - シャイニングスター -", 625, 200);
      textSize(40);
      text("詩歩", 1155, 139);//music6

      image(soundimg7, 506, 222, 115, 115);
      textSize(55);
      text(" - ムラサキのアネモネ -", 625, 320);
      textSize(40);
      text("No credit", 1155, 259);//music7

      image(soundimg8, 506, 342, 115, 115);
      textSize(55);
      text(" - 世界が僕らに揺れるまで -", 625, 440);
      textSize(40);
      text("桑原祐介", 1155, 379);//music8

      image(soundimg9, 506, 462, 115, 115);
      textSize(55);
      text(" - where are you -", 625, 560);
      textSize(40);
      text("KEI", 1155, 499);//music9

      image(soundimg10, 506, 582, 115, 115);
      textSize(55);
      text(" - Burning Heart -", 625, 680);
      textSize(40);
      text("KEI", 1155, 619);//music5
    }

    if (sound_select == 1) {

      music = soundimg1;
      image(soundimg1, 0, 0, 500, 500);
      textSize(30);
      text("「Fate GrandOrder」より", 5, 537);
      textSize(37);
      text("ガラスの鏡　-Mirror Metal Ver-", 5, 575);
      textSize(30);
      text("新時あさ美", 350, 615);//music1
    } else if (sound_select == 2) {

      music = soundimg2;
      image(soundimg2, 0, 0, 500, 500);
      textSize(30);
      text("「Fate GrandOrder」より", 5, 537);
      textSize(37);
      text(" - ＲＥＤＯＲＤＥＲ -", 5, 575);
      textSize(30);
      text("謎の人物K", 350, 615);
    } else if (sound_select == 3) {
      music = soundimg3;
      image(soundimg3, 0, 0, 500, 500);
      textSize(30);
      text("「Fate GrandOrder」より", 5, 537);
      textSize(37);
      text(" - 夜明けの薔薇 -", 5, 575);
      textSize(30);
      text("冬乃桜", 350, 615);
    } else if (sound_select == 4) {
      music = soundimg4;
      image(soundimg4, 0, 0, 500, 500);
      textSize(30);
      text("「Fate GrandOrder」より", 5, 537);
      textSize(37);
      text(" - ＧＯＡＬ -", 5, 575);
      textSize(30);
      text("No credit", 350, 615);
    } else if (sound_select == 5) {
      music = soundimg5;
      image(soundimg5, 0, 0, 500, 500);
      textSize(30);
      text("「Fate GrandOrder」より", 5, 537);
      textSize(37);
      text(" - ＣＯＬＤ　ＧＲＡＮＤＩＡ -", 5, 575);
      textSize(30);
      text("No credit", 350, 615);
    } else if (sound_select == 6) {
      music = soundimg6;
      image(soundimg6, 0, 0, 500, 500);
      textSize(37);
      text(" - シャイニングスター -", 5, 575);
      textSize(30);
      text("詩歩", 350, 615);
    } else if (sound_select == 7) {
      music = soundimg7;
      image(soundimg7, 0, 0, 500, 500);
      textSize(37);
      text(" - ムラサキのアネモネ -", 5, 575);
      textSize(30);
      text("No credit", 350, 615);
    } else if (sound_select == 8) {
      music = soundimg8;
      image(soundimg8, 0, 0, 500, 500);
      textSize(37);
      text(" - 世界が僕らに揺れるまで -", 5, 575);
      textSize(30);
      text("桑原祐介", 350, 615);
    } else if (sound_select == 9) {
      music = soundimg9;
      image(soundimg9, 0, 0, 500, 500);
      textSize(37);
      text(" - where are you -", 5, 575);
      textSize(30);
      text("KEI", 350, 615);
    } else if (sound_select == 10) {
      music = soundimg10;
      image(soundimg10, 0, 0, 500, 500);
      textSize(37);
      text(" - Burning Heart -", 5, 575);
      textSize(30);
      text("KEI", 350, 615);
    }
  }
  @Override void mousePressed() {

    if ((mouseX > 1126 && mouseX < 1376) || (mouseX > 505 && mouseX < 756) && mouseY > 697) {

      if (page == 1) {

        page = 2;
      } else if (page == 2) {

        page = 1;
      }
    }//page判定

    if (mouseX > 505 && mouseY > 102 && mouseY < 217 && page == 1) {

      sound.close();
      sound_select = 1;
      sound = main.loadFile("Fate-Grand-Order_Track10 music1.mp3");
      player = main.loadFile("Fate-Grand-Order_Track10 music1.mp3");
      sound.play();
    }

    if (mouseX > 505 && mouseY > 222 && mouseY < 337 && page == 1) {

      sound.close();
      sound_select = 2;
      sound = main.loadFile("Fate-Grand-Order_Track00 music2.mp3");
      player = main.loadFile("Fate-Grand-Order_Track00 music2.mp3");
      sound.play();
    }

    if (mouseX > 505 && mouseY > 342 && mouseY < 457 && page == 1) {

      sound.close();
      sound_select = 3;
      sound = main.loadFile("Fate-Grand-Order_Track02 music3.mp3");
      player = main.loadFile("Fate-Grand-Order_Track02 music3.mp3");
      sound.play();
    }

    if (mouseX > 505 && mouseY > 462 && mouseY < 577 && page == 1) {

      sound.close();
      sound_select = 4;
      sound = main.loadFile("Fate-Grand-Order_Track04 music4.mp3");
      player = main.loadFile("Fate-Grand-Order_Track04 music4.mp3");
      sound.play();
    }

    if (mouseX > 505 && mouseY > 582 && mouseY < 697 && page == 1) {

      sound.close();
      sound_select = 5;
      sound = main.loadFile("Fate-Grand-Order_Track13 music5.mp3");
      player = main.loadFile("Fate-Grand-Order_Track13 music5.mp3");
      sound.play();
    }

    if (mouseX > 505 && mouseY > 102 && mouseY < 217 && page == 2) {

      sound.close();
      sound_select = 6;
      sound = main.loadFile("song_shiho_shining_star music6.mp3");
      player = main.loadFile("song_shiho_shining_star music6.mp3");
      sound.play();
    }

    if (mouseX > 505 && mouseY > 222 && mouseY < 337 && page == 2) {

      sound.close();
      sound_select = 7;
      sound = main.loadFile("song_kouichi_murasaki_no_anemone music7.mp3");
      player = main.loadFile("song_kouichi_murasaki_no_anemone music7.mp3");
      sound.play();
    }

    if (mouseX > 505 && mouseY > 342 && mouseY < 457 && page == 2) {

      sound.close();
      sound_select = 8;
      sound = main.loadFile("song_kuwabara_sekaiga_bokurani_yurerumade music8.mp3");
      player = main.loadFile("song_kuwabara_sekaiga_bokurani_yurerumade music8.mp3");
      sound.play();
    }

    if (mouseX > 505 && mouseY > 462 && mouseY < 577 && page == 2) {

      sound.close();
      sound_select = 9;
      sound = main.loadFile("song_kei_where_you_are music9.mp3");
      player = main.loadFile("song_kei_where_you_are music9.mp3");
      sound.play();
    }

    if (mouseX > 505 && mouseY > 582 && mouseY < 697 && page == 2) {

      sound.close();
      sound_select = 10;
      sound = main.loadFile("song_kei_burning_heart music10.mp3");
      player = main.loadFile("song_kei_burning_heart music10.mp3");
      sound.play();
    }
    if (mouseX > 250 && mouseX < 500 && mouseY >630) {
      sound.close();
      selected = 2;
      player_select = sound_select;
      println("ps", player_select);
    }
    println( mouseX, mouseY);
  }
  @Override void keyPressed() {
  }
}
