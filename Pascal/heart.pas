Program Heart;

Type
 TCard = Record
          num : Integer;
          c : Array[0..100] Of String;
          havered,haves,haved : Boolean;
          score : Longint;
         End;
Var
 rednum : Integer;
 w : Array[1..4] Of TCard;

Function Reading : Boolean;
Var
 i,j : Integer;
 str : String;
Begin
 rednum:=0;
 Reading:=False;
 For i:=1 to 4 do
 Begin
  Read(w[i].num);
  w[i].havered:=False;
  w[i].haves:=False;
  w[i].haved:=False;
  w[i].score:=0;
  If w[i].num<>0 then
  Begin
   Reading:=True;
   Readln(str);

  For j:=1 to w[i].num-1 do
  Begin
   While str[1]=' ' do
    Delete(str,1,1);
   w[i].c[j]:=Copy(str,1,Pos(' ',str)-1);
   If w[i].c[j][1]='H' then
    w[i].havered:=True;
   If w[i].c[j]='S12' then
    w[i].haves:=True;
   If w[i].c[j]='D11' then
    w[i].haved:=True;
   Delete(str,1,Pos(' ',str));
  End;
  While str[1]=' ' do
   Delete(str,1,1);
  w[i].c[w[i].num]:=str;
  If w[i].c[w[i].num][1]='H' then
   w[i].havered:=True;
  If w[i].c[w[i].num]='S12' then
   w[i].haves:=True;
  If w[i].c[w[i].num]='D11' then
   w[i].haved:=True;
  If w[i].havered then
   Inc(rednum);
   End;
 End;
End;

Function Sco(s : String) : Longint;
Begin
 Sco:=0;
 If s='S12' then
  Exit(-100);
 If s='D11' then
  Exit(100);
 If s='H1' then
  Exit(-50);
 If s='H2' then
  Exit(-2);
 If s='H3' then
  Exit(-3);
 If s='H4' then
  Exit(-4);
 If s='H5' then
  Exit(-5);
 If s='H6' then
  Exit(-6);
 If s='H7' then
  Exit(-7);
 If s='H8' then
  Exit(-8);
 If s='H9' then
  Exit(-9);
 If s='H10' then
  Exit(-10);
 If s='H11' then
  Exit(-20);
 If s='H12' then
  Exit(-30);
 If s='H13' then
  Exit(-40);
End;

Procedure Doing;
Var
 i,j : Integer;
Begin
 If rednum>1 then
 Begin
  For i:=1 to 4 do
  Begin
   For j:=1 to w[i].num do
    Inc(w[i].score,Sco(w[i].c[j]));
  End;
  For i:=1 to 4 do
   For j:=1 to w[i].num do
   Begin
    If w[i].c[j]='C10' then
     w[i].score:=w[i].score*2;
    If (w[i].c[j]='C10') And (w[i].num=1) then
     w[i].score:=50;
   End;
 End
 Else
 Begin
  For i:=1 to 4 do
   If w[i].havered then
   Begin
    If w[i].haves And w[i].haved then
     w[i].score:=500
    Else
     w[i].score:=200;
   End;
  For i:=1 to 4 do
  If Not (w[i].havered And w[i].haves And w[i].haved) then
   Begin
    If w[i].haves then
     Dec(w[i].score,100);
    If w[i].haved then
     Inc(w[i].score,100);
   End;
  For i:=1 to 4 do
   For j:=1 to w[i].num do
   Begin
    If w[i].c[j]='C10' then
     w[i].score:=w[i].score*2;
    If (w[i].c[j]='C10') And (w[i].num=1) then
     w[i].score:=50;
   End;
 End;
 For i:=1 to 3 do
  If w[i].score>0 then
   Write('+',w[i].score,' ')
  Else
   Write(w[i].score,' ');
 If w[4].score>0 then
  Writeln('+',w[4].score)
 Else
  Writeln(w[4].score);
End;

Begin
 Assign(input,'heart.in');
 Reset(input);
 Assign(output,'heart.out');
 Rewrite(output);
 While Reading do
  Doing;
 Close(input);
 Close(output);
End.
