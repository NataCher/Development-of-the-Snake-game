unit hardcore;

{$mode ObjFPC}{$H+}

interface

uses
     Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, LCLType,MMSystem;

type

  { Thardcor }

     Thardcor = class(TForm)
     T1: TTimer;
     T2: TTimer;

procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
procedure T1Timer(Sender: TObject);
procedure T2Timer(Sender: TObject);

private

public

end;

var
     hardcor: Thardcor;

implementation

uses game,GameOver,GlavnoeMenu,vin;

{$R *.lfm}

{ Thardcor }

procedure Thardcor.T1Timer(Sender: TObject);
var i,j,xx,yy,q,w: integer;
    u:Boolean;
begin
       hardcor.Caption:='Хардкор. Очки: '+inttostr(score);

  //-------Проверка на врезание в хвост----------//

for i:=1 to 300 do
begin
       if ((Zmeyka[i].x>=0) and (Zmeyka[i].x=Zmeyka[0].x) and (Zmeyka[i].y=Zmeyka[0].y) and (Bessmertie=0)) then

       //---Поражение---//

Begin
       T1.Enabled:=False;
       GameOver.Gover.show;
       PlaySound('Muzon\failwha.wav',0,SND_ASYNC); //проигрывание музыки
       hardcore.hardcor.Hide;
       Gover.Pd1.Caption:=Inttostr(Score);
end;

     //-------Проверка на ядовитый гриб----------//

       if ((map[Zmeyka[0].x,Zmeyka[0].y]=7) and (Bessmertie=0)) or ((map[Zmeyka[0].x,Zmeyka[0].y]=5) and (Bessmertie=0)) then
Begin
      //---Поражение---//

       T1.Enabled:=False;
       T2.Enabled:=False;
       GameOver.Gover.show;
       PlaySound('Muzon\failwha.wav',0,SND_ASYNC); //проигрывание музыки
       hardcore.hardcor.Hide;
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
       hardcor.Canvas.Draw(0,0,Buf);    //Вывести весь граф-ий буфер

//-------Проверка на бессмертие----------//

       if map[Zmeyka[0].x,Zmeyka[0].y]=8 then
begin
       map [Zmeyka[0].x,Zmeyka[0].y]:=0;
       Bessmertie:=25;
       BesTime:=0;
       PlaySound('Muzon\num.wav',0,SND_ASYNC);
end;

//-------Проверка на замедление----------//

       if map[Zmeyka[0].x,Zmeyka[0].y]=9 then
begin
       map [Zmeyka[0].x,Zmeyka[0].y]:=0;
       Zamedlenie:=25;
       ZamTime:=0;
       T1.Interval:=T1.Interval+100;
       PlaySound('Muzon\bonus.wav',0,SND_ASYNC);
end;



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

       if Povorot>0 then // змейка стоит на месте
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

//-------проверка на съедение гриба----------//

       if map[Zmeyka[0].x,Zmeyka[0].y]=6 then
begin
       Inc(Score);
       map[Zmeyka[0].x,Zmeyka[0].y]:=0;
       Randomize;
       map[Random(20),Random(20)]:=6;
       PlaySound('Muzon\Num.wav',0,SND_ASYNC); //проигрывание музыки

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

//-------Проверка на  въезд за пределы----------//

for i:=0 to 300 do
Begin
        if ( ( (Zmeyka[i].x=-1) or (Zmeyka[i].x=20) or (Zmeyka[i].y=-1) or (Zmeyka[i].y=20) ) and (Bessmertie=0) ) then
begin
         //---Поражение---//

        T1.Enabled:=False;
        T2.Enabled:=False;
        GameOver.Gover.show;
        PlaySound('Muzon\failwha.wav',0,SND_ASYNC);
        hardcore.hardcor.Hide;
        Gover.Pd1.Caption:=Inttostr(Score);
end;

        if ( (  (Zmeyka[i].x=-1) or (Zmeyka[i].x=20)or (Zmeyka[i].y=-1) or (Zmeyka[i].y=20) ) and (Bessmertie>0) ) then
begin
        if Zmeyka[i].x=-1 then Zmeyka[i].x:=19;
        if Zmeyka[i].x=20 then Zmeyka[i].x:=0;
        if Zmeyka[i].y=-1 then Zmeyka[i].y:=19;
        if Zmeyka[i].y=20 then Zmeyka[i].y:=0;
     end;
end;

begin
        if Score=50 then
begin
          //---Победа---//

        T1.Enabled:=False;
        PlaySound('Muzon\Victory1.wav',0,SND_ASYNC);
        hardcore.hardcor.Hide;
        Vin.Victory.show;
        Victory.Pd2.Caption:=Inttostr(Score);
      end;
   end;
end;

procedure Thardcor.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
       if (Key=VK_LEFT) and (Povorot<>4) then Povorot:=3;
       if (Key=VK_RIGHT)  and (Povorot<>3)then Povorot:=4;
       if (Key=VK_UP) and (Povorot<>1) then Povorot:=2;
       if (Key=VK_DOWN) and (Povorot<>2) then Povorot:=1;
       if (Key=VK_P) then T1.Enabled := not T1.Enabled;
end;

procedure Thardcor.T2Timer(Sender: TObject);
var i,j: integer;
    u:Boolean;
 begin
       if Povorot>0 then Inc(Vremya);

//-------Если замедление----------//

       if Zamedlenie>0 then
begin
       Dec(Zamedlenie);
       if Zamedlenie=0 then T1.Interval:=T1.Interval-100;
end;

//-------Если бессмертие----------//

       if Bessmertie>0 then Dec(Bessmertie);

       if BesTime>0 then inc(BesTime);
       if ZamTime>0 then Inc(ZamTime);

       if BesTime=10 then
begin

for i:=0 to 19  do
for j:=0 to 19 do

       if map[i,j]=8 then map[i,j]:=0;

       BesTime:=0;
end;

      if ZamTime=10 then
begin

for i:=0 to 19  do
for j:=0 to 19 do

      if map[i,j]=9 then map[i,j]:=0;

      ZamTime:=0;

end;

//-------проверка съедобного гриба в случайном месте----------//

if(Vremya mod 10=0) then

Begin

for  i:=0 to 19 do
for  j:=0 to 19 do

      if map[i,j]=6 then map[i,j]:=0;

      Randomize;
      u:=False;

while(u=False) do
Begin
      i:=Random(20);
      j:=Random(20);
      if  map[i,j]=0 then
begin
      map[i,j]:=6;
      u:=True;
    end;
  end;
end;

//-------проверка ядовитого гриба в случайном месте----------//

If(Vremya mod 10=0) then

Begin

for  i:=0 to 19 do
for  j:=0 to 19 do

      if map[i,j]=7 then map[i,j]:=0;

      Randomize;
      u:=False;

while(u=False) do
Begin
      i:=Random(20);
      j:=Random(20);

if  map[i,j]=0 then
begin
       map[i,j]:=7;
       u:=True;
     end;
   end;
end;


//-------проверка голубой капли в случайном месте----------//

If(Vremya mod 10=0) then
Begin

for  i:=0 to 19 do
for  j:=0 to 19 do

      if map[i,j]=9 then map[i,j]:=0;

      Randomize;
      u:=False;

while(u=False) do
Begin
      i:=Random(20);
      j:=Random(20);

      if  map[i,j]=0 then
begin
      map[i,j]:=9;
      ZamTime:=1;
      u:=True;
    end;
  end;
end;

//-------проверка золотого гриба в случайном месте----------//

If(Vremya mod 20=0) then
Begin

for  i:=0 to 19 do
for  j:=0 to 19 do

      if map[i,j]=8 then map[i,j]:=0;

      Randomize;
      u:=False;

while(u=False) do
Begin
      i:=Random(20);
      j:=Random(20);

      if  map[i,j]=0 then
begin
      map[i,j]:=8;
      BesTime:=1;
      u:=True;
    end;
  end;
end;

//-----------Проверка на увеличение скорости---------//

begin
case Vremya of
                15:T1.Interval:=200;
                30:T1.Interval:=180;
                45:T1.Interval:=170;
                60:T1.Interval:=150;
                75:T1.Interval:=140;
                90:T1.Interval:=120;
               105:T1.Interval:=110;
               120:T1.Interval:=110;
               135:T1.Interval:=110;
               160:T1.Interval:=110;
               175:T1.Interval:=110;
               190:T1.Interval:=110;
               205:T1.Interval:=100;
               220:T1.Interval:=100;
               235:T1.Interval:=100;
               240:T1.Interval:=100;
               250:T1.Interval:=100;
               280:T1.Interval:=100;
               300:T1.Interval:=100;
             end;
         end;
     end;
end.





