size(500,500);
background(255);

stroke(0);
// 顔
fill(0,159,232);
ellipse(250,250,280,250);

fill(255,255,255);
ellipse(250,280,250,200);

//　目
fill(255,255,255);
ellipse(220,180,60,90);

fill(255,255,255);
ellipse(280,180,60,90);

fill(0);
ellipse(240,190,20,30);

fill(0);
ellipse(260,190,20,30);

noStroke();
fill(255,255,255);
ellipse(242,190,6,10);

fill(255,255,255);
ellipse(258,190,6,10);

// ひげ
stroke(0);
line(140,200,180,220);
line(130,230,180,235);
line(135,260,180,250);

line(360,200,320,220);
line(370,230,320,235);
line(365,260,320,250);

// 鼻
line(250,230,250,300);

fill(230,0,18);
ellipse(250,230,40,40);

noStroke();
fill(255);
ellipse(245,225,10,10); 

stroke(0);
// 口
fill(230,0,18);
arc(250,270,180,170,radians(0),radians(180));

noStroke();
// 舌
fill(237,109,31);
ellipse(250,322,120,65);

// 首輪
fill(230,0,18);
noStroke();
rect(180,365,140,20);
stroke(0);
arc(180,375,10,20,radians(90),radians(270));
arc(320,375,10,20,radians(-90),radians(90));
line(180,365,320,365);
line(180,385,320,385);

// 鈴
fill(253,208,0);
ellipse(250,385,35,35);
fill(0);
ellipse(250,390,10,10);
line(235,375,265,375);
line(233,380,267,380);
line(250,390,250,401);
  
