# ofxGUI



1. ヘッダファイルに`#include "ofxGui.h"`を記述して変数を宣言
2. guiの変数を作り
3. setupとdrawに追加する

```
//ofApp.h
#pragma once

#include "ofMain.h"
#include "ofxGui.h" // インクルード

class ofApp : public ofBaseApp{
	public:
		void setup();
		void draw();
		  
		// guiの追加
		ofxPanel gui;
		ofxFloatSlider circleSize;
		ofxColorSlider circleColor;
};

```

```
// ofApp.cpp
#include "ofApp.h"

void ofApp::setup(){
	// GUIを設定
   gui.setup(); 
   // FloatSliderの設定
   gui.add(circleSize.setup("label", 200, 0, 400));
   
   // ColorSliderの設定
	ofColor initColor = ofColor(0,127,255,255);
	ofColor minColor = ofColor(0,0,0,0);
	ofColor maxColor = ofColor(255,255,255,255);
	gui.add(circleColor.setup("circleColor", initColor, minColor, maxColor));
}


void ofApp::draw(){
	//パラメータから円を描画
   ofSetColor(circleColor);
	ofCircle(ofGetWidth()/2, ofGetHeight()/2, circleSize);
	gui.draw();
}
```