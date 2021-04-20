//背景
size(900,900);
background(230);

//首輪
strokeWeight(4);
stroke(0,51,0);
fill(215,105,30);
ellipse(450,525,420,380);

//鈴
fill(255,255,0);
ellipse(450,705,90,88);

//鈴の穴
fill(0,0,0);
ellipse(450,722,18,18);

//鈴の穴下線
line(450,715,450,746);

//鈴の横線
line(405,697,495,697);
line(405,707,495,707);

//顔全体
strokeWeight(4);
stroke(0,51,0);
fill(74,131,197);
ellipse(450,450,500,480);

//顔の内側
strokeWeight(4);
stroke(0,51,0);
fill(255,254,253);
ellipse(450,500,430,380);

//舌
fill(255,102,0);
ellipse(490,600,170,115);

//舌筋
line(480,580,515,625);

//左目
strokeWeight(4);
stroke(0,51,0);
fill(255,244,253);
ellipse(392,310,117,145);

//左黒目
fill(0,0,0);
ellipse(414,330,30,50);

//左黒目光り
noStroke();
fill(255,255,255);
ellipse(414,330,10,15);

//右目
strokeWeight(4);
stroke(0,51,0);
fill(255,244,253);
ellipse(508,310,117,145);

//右黒目
fill(0,0,0);
ellipse(485,330,30,50);

//右黒目光り
noStroke();
fill(255,255,255);
ellipse(485,330,10,15);

//口
strokeWeight(4);
stroke(0,51,0);
fill(255,244,253);
arc(450,465,340,300,radians(0),radians(180));

//鼻筋
strokeWeight(4);
stroke(0,51,0);
line(450,400,450,610);

//鼻
strokeWeight(4);
stroke(0,51,0);
fill(237,47,47);
ellipse(450,390,73,70);

//鼻光り
noStroke();
fill(255,255,255);
ellipse(430,390,25,25);

//髭左上
stroke(0,0,0);
line(270,410,400,460);

//髭左中
line(250,490,400,500);

//髭左下
line(270,580,400,540);

//髭右上
line(500,460,630,410);

//髭右中
line(500,500,650,490);

//髭右下
line(500,540,630,580);
