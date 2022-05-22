unit arcada;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, LCLType;

type

  { TArcadaa }

  TArcadaa = class(TForm)
    Timer3: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer3Timer(Sender: TObject);
  private

  public

  end;

var
  Arcadaa: TArcadaa;

implementation
uses Unit1, game, GameOver;

{$R *.lfm}

{ TArcadaa }

procedure TArcadaa.Timer3Timer(Sender: TObject);
  var i,j,xx,yy,q,w: integer;
  u:Boolean;
  begin
  arcadaa.Caption:='Аркада. Очки '+inttostr(score);
  //-------Проверка на врезание в хвост----------//
  for i:=1 to 300 do
  begin
   if ((Zmeyka[i].x>=0) and (Zmeyka[i].x=Zmeyka[0].x) and (Zmeyka[i].y=Zmeyka[0].y)) then
  Begin
  Timer3.Enabled:=False;
  GameOver.Form1.show;
  Form1.Pd1.Caption:=Inttostr(Score);
  end;
  end;
    Buf.Canvas.Brush.Color:=clWhite;
    Buf.Canvas.Rectangle(0,0,320,320); //Rectangle - квадрат -> 0,0 координата x и y левого верхнего ула, 320 на 320 правого нижнего угла
      //-------карта----------//
    for i:=0 to 19 do
    for j:=0 to 19 do
    if map[i,j]>0 then Buf.Canvas.Draw(i*16,j*16,IMG[map[i,j]]);

      //-------Змейки----------//
       For i:=1 to 10 do
       begin
        if Zmeyki[i,1].x>-2 then
        begin
        if j=1 then Buf.Canvas.Draw(Zmeyki[i,j].x*16,Zmeyki[i,j].y*16,IMG[3])
        else  Buf.Canvas.Draw(Zmeyki[i,j].x*16,Zmeyki[i,j].y*16,IMG[4]);
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
    1:Zmeyka[0].y:=Zmeyka[0].y+1;  // голова
    2:Zmeyka[0].y:=Zmeyka[0].y-1;
    3:Zmeyka[0].x:=Zmeyka[0].x-1;  // будет двигаться вниз
    4:Zmeyka[0].x:=Zmeyka[0].x+1;
    end;

    if  Povorot>0 then // змейка стоит на месте
    Begin
    For i:=1 to 300 do
    Begin
    //запоминаем координаты
    if Zmeyka[i].x>0 then
    Begin
    q:=Zmeyka[i].x;
    w:=Zmeyka[i].y;
    //сдвигаем часть
    Zmeyka[i].x:=xx;
    Zmeyka[i].y:=yy;
    //передаем координаты
    xx:=q;
    yy:=w;
  end;
    end;
    end;

    //движение змееек
    for i:=1 to 10 do
    Begin
    if Zmeyki[i,1].x>-2 then
    begin
    //-------запоминаем координаты головы----------//

      xx:=Zmeyki[i,1].x;
      yy:=Zmeyki[i,1].y;
     //-------сдвигаем голову----------//

      case Povoroti [i] of
      1:Zmeyki[i,1].y:=Zmeyki[i,1].y+1;  // голова
      2:Zmeyki[i,1].y:=Zmeyki[i,1].y-1;
      3:Zmeyki[i,1].x:=Zmeyki[i,1].x-1;  // будет двигаться вниз
      4:Zmeyki[i,1].x:=Zmeyki[i,1].x+1;
    end;

    if  Povoroti[i]>0 then // змейка стоит на месте
    Begin
    For j:=2 to 3 do
    Begin
    //запоминаем координаты
    Begin
    q:=Zmeyki[i,j].x;
    w:=Zmeyki[i,j].y;
    //сдвигаем часть
    Zmeyki[i,j].x:=xx;
    Zmeyki[i,j].y:=yy;
    //передаем координаты
    xx:=q;
    yy:=w;
  end;
    end;
    end;
    end;
    end;

    //-------проверка на съедение яблока----------//
    if map[Zmeyka[0].x,Zmeyka[0].y]=6 then
    begin
    Inc(Score);  //  увеличение на единицу

     //-------появление змеек----------//
     if  (Score mod 2=0) then
     Begin
     u:=False;
     for i:=1 to 10 do
     begin
     if (u=False) and (Zmeyki[i,0].x=-2) then
     begin
     u:=True;

     if Zmeyka[0].x>0 then
     Begin
     Zmeyki[i,1].x:=0;
     Zmeyki[i,1].y:=2;
     Zmeyki[i,2].x:=0;
     Zmeyki[i,2].y:=1;
     Zmeyki[i,3].x:=0;
     Zmeyki[i,3].y:=0;
     Povoroti[i]:=1;
     end
     else
      Begin
     Zmeyki[i,1].x:=19;
     Zmeyki[i,1].y:=17;
     Zmeyki[i,2].x:=19;
     Zmeyki[i,2].y:=18;
     Zmeyki[i,3].x:=19;
     Zmeyki[i,3].y:=19;
     Povoroti[i]:=2;
     end;
     end;
     end;
     end;

    map[Zmeyka[0].x,Zmeyka[0].y]:=0;
    Randomize;
    map[Random(20),Random(20)]:=6;
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
          //-------Проверка за въезд за пределы----------//
     for i:=0 to 300 do
     Begin
     if Zmeyka[i].x=-1 then Zmeyka[i].x:=19;
     if Zmeyka[i].x=20 then Zmeyka[i].x:=0;
     if Zmeyka[i].y=-1 then Zmeyka[i].y:=19;
     if Zmeyka[i].y=20 then Zmeyka[i].y:=0;
           end;
         //-------Проверка за въезд за пределы змеек----------//
     for i:=1 to 10 do
     begin
      if Zmeyki[i,1].x>-2 then
     Begin
     for j:=1 to 3 do
     Begin
     if Zmeyki[i,j].x=-1 then Zmeyki[i,j].x:=19;
     if Zmeyki[i,j].x=20 then Zmeyki[i,j].x:=0;
     if Zmeyki[i,j].y=-1 then Zmeyki[i,j].y:=19;
     if Zmeyki[i,j].y=20 then Zmeyki[i,j].y:=0;
           end;
      end;
      end;
      end;
    //-------Поворот змеек----------//
    for i:=1 to 10 do
    begin
      if Zmeyki[i,1].x>-2 then
      begin
      Ranomize;
      j:=Random(10);
      if j>6 then
      Begin
      1,2:begin q:=Random


procedure TArcadaa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_LEFT) and (Povorot<>4) then Povorot:=3;
 if (Key=VK_RIGHT)  and (Povorot<>3)then Povorot:=4;
 if (Key=VK_UP) and (Povorot<>1) then Povorot:=2;
 if (Key=VK_DOWN) and (Povorot<>2) then Povorot:=1;
end;

    end.


end;

end.

