unit arcada;

{$mode ObjFPC}{$H+}

interface

uses
     Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, LCLType, MMSystem;

type

  { TArcadaa }

     TArcadaa = class(TForm)
     T3: TTimer;

procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
procedure T3Timer(Sender: TObject);
  private

  public

  end;

var
     Arcadaa: TArcadaa;

implementation
uses GlavnoeMenu, game, GameOver,Vin;

{$R *.lfm}

{ TArcadaa }

procedure TArcadaa.T3Timer(Sender: TObject);
var  i,j,xx,yy,q,w: integer;
                 u:Boolean;
begin
      arcadaa.Caption:='Аркада. Очки '+inttostr(score);

 //-------Проверка на врезание в хвост----------//

for i:=1 to 300 do
begin
      if ((Zmeyka[i].x>=0) and (Zmeyka[i].x=Zmeyka[0].x) and (Zmeyka[i].y=Zmeyka[0].y)) then
Begin
      //---Поражение---//

      T3.Enabled:=False;
      arcada.arcadaa.Hide;
      GameOver.Gover.show;
      Gover.Pd1.Caption:=Inttostr(Score);
  end;
end;

  //-------Врезание в вражескую змейку--------//

for i:=1 to 1 do
begin
      if Zmeykas[i,1].x>-2 then
begin
for j:=1 to 3 do
for q:=1 to 300 do
begin
      if (Zmeyka[q].x=Zmeykas[i,j].x) and (Zmeyka[q].y=Zmeykas[i,j].y) then
begin
      //---Поражение---//

      T3.Enabled:=False;
      arcada.arcadaa.Hide;
      GameOver.Gover.show;
      Gover.Pd1.Caption:=Inttostr(Score);
         end;
      end;
   end;
end;

      Buf.Canvas.Brush.Color:=clMoneyGreen;
      Buf.Canvas.Rectangle(0,0,320,320); //Rectangle - квадрат -> 0,0 координата x и y левого верхнего ула, 320 на 320 правого нижнего угла

//-------карта----------//

for i:=0 to 19 do
for j:=0 to 19 do

      if map[i,j]>0 then Buf.Canvas.Draw(i*16,j*16,IMG[map[i,j]]);

//-------Змейка враг----------//

For i:=1 to 1 do
begin
      if Zmeykas[i,1].x>-2 then
begin
For j:=1 to 3 do
Begin
      if j=1 then Buf.Canvas.Draw(Zmeykas[i,j].x*16,Zmeykas[i,j].y*16,IMG[3]) else  Buf.Canvas.Draw(Zmeykas[i,j].x*16,Zmeykas[i,j].y*16,IMG[4]);
      end;
   end;
end;

For i:=0 to 300 do
Begin
      if (Zmeyka[i].x>=0)and(i>0) then Buf.Canvas.Draw(Zmeyka[i].x*16,Zmeyka[i].y*16,IMG[2]);  // *16  каждый раз нужно отступать на 16 клеточек   -> тело
      if (Zmeyka[i].x>=0)and(i=0) then Buf.Canvas.Draw(Zmeyka[i].x*16,Zmeyka[i].y*16,IMG[1]);

  end;

      arcadaa.Canvas.Draw(0,0,Buf);    //Вывести весь граф-ий буфер

//-------запоминаем координаты головы----------//

      xx:=Zmeyka[0].x;
      yy:=Zmeyka[0].y;

//-------сдвигаем голову----------//

case Povorot of
                1:Zmeyka[0].y:=Zmeyka[0].y+1;
                2:Zmeyka[0].y:=Zmeyka[0].y-1;
                3:Zmeyka[0].x:=Zmeyka[0].x-1;
                4:Zmeyka[0].x:=Zmeyka[0].x+1;
end;

      if  Povorot>0 then // змейка стоит на месте
Begin
For i:=1 to 300 do
Begin

//-------запоминаем координаты головы----------//

      if Zmeyka[i].x>=0 then
Begin
      q:=Zmeyka[i].x;
      w:=Zmeyka[i].y;

//-------сдвигаем голову----------//

      Zmeyka[i].x:=xx;
      Zmeyka[i].y:=yy;

//---запоминаем координаты---//

      xx:=q;
      yy:=w;
   end;
  end;
end;

//---движение змейки врага---//

for i:=1 to 1 do
Begin
       if Zmeykas[i,1].x>-2 then
    begin
    //-------запоминаем координаты головы----------//

      xx:=Zmeykas[i,1].x;
      yy:=Zmeykas[i,1].y;
     //-------сдвигаем голову----------//

      case Povoroti [i] of
      1:Zmeykas[i,1].y:=Zmeykas[i,1].y+1;
      2:Zmeykas[i,1].y:=Zmeykas[i,1].y-1;
      3:Zmeykas[i,1].x:=Zmeykas[i,1].x-1;
      4:Zmeykas[i,1].x:=Zmeykas[i,1].x+1;
    end;

       if  Povoroti[i]>0 then
Begin
For j:=2 to 3 do
Begin

//---запоминаем координаты---//

       q:=Zmeykas[i,j].x;
       w:=Zmeykas[i,j].y;

//---сдвигаем часть---//

       Zmeykas[i,j].x:=xx;
       Zmeykas[i,j].y:=yy;


//---передаем координаты---//

       xx:=q;
       yy:=w;
         end;
     end;
   end;
end;




//-------проверка на съедение гриба----------//

       if map[Zmeyka[0].x,Zmeyka[0].y]=6 then
begin
       Inc(Score);

//-------появление врага змейки----------//

       if  (Score mod 2=0) then
Begin
       u:=False;
for i:=1 to 1 do
begin
       if (u=False) and (Zmeykas[i,1].x=-2) then
begin
       u:=True;

       if Zmeyka[0].x>0 then
Begin
       Zmeykas[i,1].x:=0;
       Zmeykas[i,1].y:=2;
       Zmeykas[i,2].x:=0;
       Zmeykas[i,2].y:=1;
       Zmeykas[i,3].x:=0;
       Zmeykas[i,3].y:=0;
       Povoroti[i]:=1;
end
else
Begin
       Zmeykas[i,1].x:=19;
       Zmeykas[i,1].y:=17;
       Zmeykas[i,2].x:=19;
       Zmeykas[i,2].y:=18;
       Zmeykas[i,3].x:=19;
       Zmeykas[i,3].y:=19;
       Povoroti[i]:=2;
        end;
     end;
   end;
end;

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

//-------В зависимости от поворота пробуем поставить новую часть----------//

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

//-------Проверка за въезд за пределы----------//

for i:=0 to 300 do
Begin
        if Zmeyka[i].x=-1 then Zmeyka[i].x:=19;
        if Zmeyka[i].x=20 then Zmeyka[i].x:=0;
        if Zmeyka[i].y=-1 then Zmeyka[i].y:=19;
        if Zmeyka[i].y=20 then Zmeyka[i].y:=0;
end;

//-------Проверка на пересечение игрового поля вражеской змейкой----------//

for i:=1 to 1 do
begin
        if Zmeykas[i,1].x>-2 then
Begin
for j:=1 to 3 do
Begin
        if Zmeykas[i,j].x=-1 then Zmeykas[i,j].x:=19;
        if Zmeykas[i,j].x=20 then Zmeykas[i,j].x:=0;
        if Zmeykas[i,j].y=-1 then Zmeykas[i,j].y:=19;
        if Zmeykas[i,j].y=20 then Zmeykas[i,j].y:=0;
       end;
   end;
end;


       //---поворот змейки врага---//

For i:=1 to 1 do
Begin
       If Zmeykas[i,1].x>-2 then
Begin
       Randomize;
       j:=Random(10);
       if j>6 then
Begin
case Povoroti[i] of
                    1,2: begin q:=Random(2); if q=0 then Povoroti[i]:=3 else Povoroti[i]:=4 end;
                    3,4: begin q:=Random(2); if q=0 then Povoroti[i]:=1 else Povoroti[i]:=2 end;
                end;
           end;
     end;
end;

      //----Победа----//

begin
       if Score=20 then
begin
       T3.Enabled:=False;
       PlaySound('Muzon\Victory1.wav',0,SND_ASYNC);
       arcada.arcadaa.Hide;
       Vin.Victory.show;
       Victory.Pd2.Caption:=Inttostr(Score);
       end;
    end;
end;


procedure TArcadaa.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
       if (Key=VK_RIGHT) and (Povorot<>4) then Povorot:=3;
       if (Key=VK_LEFT)  and (Povorot<>3)then Povorot:=4;
       if (Key=VK_UP) and (Povorot<>1) then Povorot:=2;
       if (Key=VK_DOWN) and (Povorot<>2) then Povorot:=1;
       if (Key=VK_P) then T3.Enabled := not T3.Enabled;
      end;
    end.
  end;
end.


