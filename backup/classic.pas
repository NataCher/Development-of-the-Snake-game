unit classic;

{$mode ObjFPC}{$H+}

interface

uses
     Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, LCLType,
     StdCtrls, MMSystem;

type

  { Tclassica }

    Tclassica = class(TForm)
    Timer1: TTimer;

procedure FormCreate(Sender: TObject);
procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
procedure Timer1Timer(Sender: TObject);


private

public

end;

var
    classica: Tclassica;

implementation
uses GlavnoeMenu,game,GameOver,vin;

{$R *.lfm}

{ Tclassica }

procedure Tclassica.FormCreate(Sender: TObject);
begin
end;

procedure Tclassica.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
       if (Key=VK_LEFT) and (Povorot<>4) then Povorot:=3;
       if (Key=VK_RIGHT)  and (Povorot<>3)then Povorot:=4;
       if (Key=VK_UP) and (Povorot<>1) then Povorot:=2;
       if (Key=VK_DOWN) and (Povorot<>2) then Povorot:=1;
       if (Key=VK_P) then Timer1.Enabled := not Timer1.Enabled;
end;

procedure Tclassica.Timer1Timer(Sender: TObject);
var i,j,xx,yy,q,w: integer;
    u:Boolean;
begin
       classica.Caption:='Классика. Очки '+inttostr(score);

//-------Проверка на врезание в хвост----------//

for i:=1 to 300 do
begin
       if ((Zmeyka[i].x>=0) and (Zmeyka[i].x=Zmeyka[0].x) and (Zmeyka[i].y=Zmeyka[0].y)) then
Begin
       //----Поражение----//

       Timer1.Enabled:=False;
       GameOver.Gover.show;
       PlaySound('Muzon\failwha',0,SND_ASYNC); //проигрывание музыки
       classic.classica.Hide;  // Скрыть первоначальную форму
       Gover.Pd1.Caption:=Inttostr(Score);
     end;
 end;
       Buf.Canvas.Brush.Color:=clMoneyGreen;
       Buf.Canvas.Rectangle(0,0,320,320); //Rectangle - квадрат -> 0,0 координата x и y левого верхнего ула, 320 на 320 правого нижнего угла

//-------карта----------//

for i:=0 to 19 do
for j:=0 to 19 do
      if map[i,j]>0 then Buf.Canvas.Draw(i*16,j*16,IMG[map[i,j]]);

For i:=0 to 300 do
Begin
      if (Zmeyka[i].x>=0)and(i>0) then Buf.Canvas.Draw(Zmeyka[i].x*16,Zmeyka[i].y*16,IMG[2]);  // *16  каждый раз нужно отступать на 16 клеточек   -> тело
      if (Zmeyka[i].x>=0)and(i=0) then Buf.Canvas.Draw(Zmeyka[i].x*16,Zmeyka[i].y*16,IMG[1]);
end;
      classica.Canvas.Draw(0,0,Buf);    //Вывести весь граф-ий буфер

//-------запоминаем координаты головы----------//

      xx:=Zmeyka[0].x;
      yy:=Zmeyka[0].y;

//-------сдвигаем голову----------//

case Povorot of
                 1:Zmeyka[0].y:=Zmeyka[0].y+1;  // голова
                 2:Zmeyka[0].y:=Zmeyka[0].y-1;
                 3:Zmeyka[0].x:=Zmeyka[0].x-1;  // будет двигаться вниз
                 4:Zmeyka[0].x:=Zmeyka[0].x+1;
end;

if  Povorot>0 then // змейка стоит на месте
Begin
For i:=1 to 300 do
Begin

//---запоминаем координаты---//

if Zmeyka[i].x>=0 then
Begin
      q:=Zmeyka[i].x;
      w:=Zmeyka[i].y;

//---сдвигаем часть---//

      Zmeyka[i].x:=xx;
      Zmeyka[i].y:=yy;

//---передаем координаты---//

      xx:=q;
      yy:=w;
      end;
   end;
end;

//-------проверка на съедение яблока----------//

if map[Zmeyka[0].x,Zmeyka[0].y]=6 then
begin
       Inc(Score);
       map[Zmeyka[0].x,Zmeyka[0].y]:=0;
       Randomize;
       map[Random(20),Random(20)]:=6;
       PlaySound('Muzon\Num.wav',0,SND_ASYNC);

//-------получаем координаты полезной части змейки----------//

for i:=1 to 300 do
Begin
if Zmeyka[i].x>=0 then
Begin
       xx:=Zmeyka[i].x;
       yy:=Zmeyka[i].y;
    end;
end;
       u:=False;


//------------------------------------------------------//
//------------------------------------------------------//

//-------в зависимости от поворота пробуем поставить новую часть----------//

case Povorot of
1: Begin

//-------Ищем номер свободной части----------//

for i:=1 to 300 do
Begin
       if(u=false) and (Zmeyka[i].x=-2)and (yy-1>=0) and (map[xx,yy-1]=0) then
Begin
       Zmeyka[i].x:=xx;
       Zmeyka[i].y:=yy-1;
       u:=True;
    end;
end;
       if (u=false) and (xx-1>=0) and (map[xx-1,yy]=0) then
Begin
       Zmeyka[i].x:=xx-1;
       Zmeyka[i].y:=yy;
       u:=True;
end;
       if (u=false) and (xx+1>=19) and (map[xx+1,yy]=0) then
begin
        Zmeyka[i].x:=xx+1;
        Zmeyka[i].y:=yy;
        u:=True;
    end;
end;

//------------------------------------------------------//

2:Begin

//-------Ищем номер свободной части----------//
for i:=1 to 300 do
Begin
       if (u=false) and (Zmeyka[i].x=-2) and (yy+1<=19) and (map[xx,yy+1]=0) then
begin
       Zmeyka[i].x:=xx;
       Zmeyka[i].y:=yy+1;
       u:=True;
    end;
end;
      if (u=false) and (xx-1>=0) and (map[xx-1,yy]=0) then
Begin
      Zmeyka[i].x:=xx-1;
      Zmeyka[i].y:=yy;
      u:=True;
end;
      if (u=false) and (xx+1>=19) and (map[xx+1,yy]=0) then
begin
      Zmeyka[i].x:=xx+1;
      Zmeyka[i].y:=yy;
      u:=True;
   end;
end;

//------------------------------------------------------//

3:Begin

//-------Ищем номер свободной части----------//

for i:=1 to 300 do
Begin
      if (u=false) and (Zmeyka[i].x=-2) and (xx+1<=19) and (map[xx+1,yy]=0) then
Begin
      Zmeyka[i].x:=xx+1;
      Zmeyka[i].y:=yy;
      u:=True;
    end;
end;
      if (u=false) and (yy-1>=0) and (map[xx,yy+1]=0) then
Begin
      Zmeyka[i].x:=xx;
      Zmeyka[i].y:=yy-1;
      u:=True;
end;
      if (u=false) and (yy+1<=19) and (map[xx-1,yy]=0) then
begin
      Zmeyka[i].x:=xx;
      Zmeyka[i].y:=yy+1;
      u:=True;
    end;
end;

//------------------------------------------------------//

4:Begin

//-------Ищем номер свободной части----------//

for i:=1 to 300 do
Begin
      if (u=false) and (Zmeyka[i].x=-2) and (xx-1>=0) and (map[xx-1,yy]=0) then
Begin
      Zmeyka[i].x:=xx-1;
      Zmeyka[i].y:=yy;
      u:=True;
   end;
end;
      if (u=false) and (yy-1>=0)and (map[xx,yy-1]=0) then
Begin
      Zmeyka[i].x:=xx;
      Zmeyka[i].y:=yy-1;
      u:=True;
end;
      if (u=false) and (yy+1>=19) and (map[xx,yy+1]=0) then
begin
      Zmeyka[i].x:=xx;
      Zmeyka[i].y:=yy+1;
      u:=True;
        end;
      end;
   end;
end;

//------------------------------------------------------//
//------------------------------------------------------//

//------Проверка за въезд за пределы----------//

for i:=0 to 300 do
Begin
      if Zmeyka[i].x=-1 then Zmeyka[i].x:=19;
      if Zmeyka[i].x=20 then Zmeyka[i].x:=0;
      if Zmeyka[i].y=-1 then Zmeyka[i].y:=19;
      if Zmeyka[i].y=20 then Zmeyka[i].y:=0;
end;

      //----Победа----//

begin
      if Score=100 then
begin
      Timer1.Enabled:=False;
      PlaySound('Muzon\Victory1.wav',0,SND_ASYNC);
      classic.classica.Hide;
      Vin.Victory.show;
      Victory.Pd2.Caption:=Inttostr(Score);
        end;
     end;
   end;
end.



