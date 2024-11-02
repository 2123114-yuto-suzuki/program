PFont font;

PImage src1,src2,src3,src4;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample player1;
AudioSample player2;
AudioSample player3;


int s=60;//制限時間
int c=0;//初期点数
float x=450;
float y=650;
int timeCount = 0;

float bx1 =480;//バナナ(1)のｘ座標
int by1=200;//バナナ(1)のｙ座標
float px1=300;//ピコピコハンマー(1)のｘ座標
int py1=40;//ピコピコハンマー(1)のｙ座標

float bx2 =130;//バナナ(2)のｘ座標
int by2=200;//バナナ(2)のｙ座標
float px2=600;//ピコピコハンマー(2)のｘ座標
int py2=30;//ピコピコハンマー(2)のｙ座標

float bx3 =800;//バナナ(3)のｘ座標
int by3=400;//バナナ(3)のｙ座標
float px3=50;//ピコピコハンマー(3)のｘ座標
int py3=100;//ピコピコハンマー(3)のｙ座標

float bx4 =700;//バナナ(4)のｘ座標
int by4=850;//バナナ(4)のｙ座標
float px4=50;//ピコピコハンマー(4)のｘ座標
int py4=850;//ピコピコハンマー(4)のｙ座標

int dy=5;//バナナ、ピコピコハンマーが落ちるスピード

void setup(){
  size(1000,800);
  font=loadFont("UDDigiKyokashoNP-B-48.vlw");
  PFont font = createFont("MS Gothic",50);
  textFont (font);
  src1=loadImage("Banana-Tree.jpg");//
  src2=loadImage("gorilla.png");//
  src3=loadImage("banana.png");//
  src4=loadImage("pikopiko_hummer.png");//
  
  
  minim =new Minim(this);
  player1 = minim.loadSample("appear03.wav");//ゴリラの動きの効果音
  player2 = minim.loadSample("score.wav");//バナナ取得時の効果音
  player3 = minim.loadSample("totaled.wav");//ピコピコハンマー接触時の効果音
  
}

void draw(){
  background(255);
  image(src1,0,0,width,height);
  fill(255);
  rect(0,0,width,60);
  fill(0);
  text("ポイント:"+c+"点",0,50);//現在のポイント表示
  text("残り"+s+"秒",width-250,50);//現在の残り秒数表示
  timeCount+=1;
  if(timeCount%30==0){
    s-=1;
  }
  if(s<=0){//制限時間が0秒になったら
    s=0;//秒数を0で固定
    //バナナ、ピコピコハンマーを画面外表示にする
    by1=850;
    py1=850;
    by2=850;
    py2=850;
    by3=850;
    py3=850;
    by4=850;
    py4=850;
    //ゴリラの位置を初期位置に戻す
    x=450;
    y=650;
    
    //最終点数によるリザルト分岐
    if (c>=0 && c<=30){
      fill(0);
      rect(220,350,600,160);
      fill(255,0,0);
      text("ゲーム終了！",350,400);//ゲーム終了のテキスト表示
      text(""+c+"点！",420,450);//最終点数の表示
      text("評価C！もっと頑張ろう！",250,500);//C評価のメッセージ
    }else if(c>=31 && c<=70){
      fill(0);
      rect(270,350,480,160);
      fill(255,0,0);
      text("ゲーム終了！",370,400);//ゲーム終了のテキスト表示
      text(""+c+"点！",440,450);//最終点数の表示
       text("評価B！頑張ったね！",280,500);//B評価のメッセージ
    }else if(c>=71 && c<=90){
      fill(0);
      rect(330,350,330,160);
      fill(255,0,0);
      text("ゲーム終了！",350,400);//ゲーム終了のテキスト表示
      text(""+c+"点！",420,450);//最終点数の表示
      text("評価A！上手！",340,500);//A評価のメッセージ
    }else if(c>=91){
      fill(0);
      rect(270,350,480,160);
      fill(255,0,0);
      text("ゲーム終了！",350,400);//ゲーム終了のテキスト表示
      text(""+c+"点！",420,450);//最終点数の表示
         text("評価S！素晴らしい！",280,500);//S評価のメッセージ
       }
    }
  image(src2,x,y,175,150);
  if(x<=50){
    x=50;//ゴリラが右側の指定された場所まで行くと、それ以上は先に進めなくなっている。
  }else if(x>=825){
    x=825;//ゴリラが左側の指定された場所まで行くと、それ以上は先に進めなくなっている。
  }
  

    
  
  //バナナ(1)
  image(src3,bx1,by1,150,150);
  by1=by1+dy;
   if (by1<=60) {
    dy=5;//再度上から振ってくる時の落下速度
  }
  
  if(by1==y-25 && bx1>=x-15 && bx1<=x+140){//ゴリラとバナナが触れた時
    c=c+10;//点数10点追加
    by1=60;
    bx1=random(50,825);
    player2.trigger();
  }
  
  if(by1>=height){
    by1=60;//上に戻す
    bx1=random(50,825);
  }
  
  
  //ピコピコハンマー(1)
  image(src4,px1,py1,150,150);
  py1=py1+dy;
   if (py1<=60) {
    dy=5;//再度上から振ってくる時の落下速度
  }
  
  if(py1==y-25 && px1>=x-15 && px1<=x+140){
    c=c-10;//点数10点減点
    py1=60;
    px1=random(50,825);
    player3.trigger();
  }
  
  if(py1>=height){
    py1=60;//上に戻す
    px1=random(50,825);
    
  }
  
  //バナナ(2)
  image(src3,bx2,by2,150,150);
  by2=by2+dy;
   if (by2<=60) {
    dy=5;//再度上から振ってくる時の落下速度
  }
  
  if(by2==y-25 && bx2>=x-15 && bx2<=x+140){
    c=c+10;//点数10点追加
    by2=60;
    bx2=random(50,825);
    player2.trigger();
  }
  
  if(by2>=height){
    by2=60;//上に戻す
    bx2=random(50,825);
  }
  
  //ピコピコハンマー(2)
  image(src4,px2,py2,150,150);
  py2=py2+dy;
   if (py2<=60) {
    dy=5;//再度上から振ってくる時の落下速度
  }
  
  if(py2==y-25 && px2>=x-15 && px2<=x+140){
    c=c-10;//点数10点減点
    py2=60;
    px2=random(50,825);
    player3.trigger();
  }
  
  if(py2>=height){
    py2=60;//上に戻す
    px2=random(50,825);
    
  }
  
  //バナナ(3)
  image(src3,bx3,by3,150,150);
  by3=by3+dy;
   if (by3<=60) {
    dy=5;//再度上から振ってくる時の落下速度
  }
  
  if(by3==y-25 && bx3>=x-15 && bx3<=x+140){
    c=c+10;//点数10点追加
    by3=60;
    bx3=random(50,825);
    player2.trigger();
  }
  
  if(by3>=height){
    by3=60;//上に戻す
    bx3=random(50,825);
  }
  
  //ピコピコハンマー(3)
  image(src4,px3,py3,150,150);
  py3=py3+dy;
   if (py3<=60) {
    dy=5;//再度上から振ってくる時の落下速度
  }
  
  if(py3==y-25 && px3>=x-15 && px3<=x+140){
    c=c-10;//点数10点減点
    py3=60;
    px3=random(50,825);
    player3.trigger();
  }
  
    //バナナ(4)
  image(src3,bx4,by4,150,150);
  by4=by4+dy;
   if (by4<=60) {
    dy=5;//再度上から振ってくる時の落下速度
  }
  
  if(by4==y-25 && bx4>=x-15 && bx4<=x+140){
    c=c+10;//点数10点追加
    by4=60;
    bx4=random(50,825);
    player2.trigger();
  }
  
  if(by4>=height){
    by4=60;//上に戻す
    bx4=random(50,825);
  }
  
  //ピコピコハンマー(3)
  image(src4,px4,py4,150,150);
  py4=py4+dy;
   if (py4<=60) {
    dy=5;//再度上から振ってくる時の落下速度
  }
  
  if(py4==y-25 && px4>=x-15 && px4<=x+140){
    c=c-10;//点数10点減点
    py4=60;
    px4=random(50,825);
    player3.trigger();
  }
  
  if(py4>=height){
    py4=60;//上に戻す
    px4=random(50,825);
    
  }
  
  if(c<0){
    c=0;
  }
}

void keyPressed(){
  if(key=='a' || key=='A'){//ゴリラを右に動かす
    x=x-10;
    player1.trigger();
  }else if(key=='d' || key=='D'){//ゴリラを左に動かす。
    x=x+10;
    player1.trigger();
  }
}

void stop(){
  player1.close();
  player2.close();
  player3.close();
  minim.stop();
  super.stop();
}
