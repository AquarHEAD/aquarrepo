Program Sudoku;
Const
 xx : Array[1..9] Of Integer=(1,1,1,4,4,4,7,7,7);
 yy : Array[1..9] Of Integer=(1,1,1,4,4,4,7,7,7);
Var
 map : Array[1..9,1..9] Of Char;
 xp,yp,i,j : Integer;
 ch : Char;

Function Find_Next : Boolean;
Begin
 For xp:=1 to 9 do
 For yp:=1 to 9 do
  If map[xp,yp]='?' then
   Exit(True);
 Find_Next:=False;
End;

Procedure Search(x,y:Integer;ch : Char);
Var
 i,j : Integer;
 t : Char;
Begin
 For i:=xx[x] to xx[x]+2 do
 For j:=yy[y] to yy[y]+2 do
  If map[i,j]=ch then
   Exit;
 For i:=1 to 9 do
  If (map[x,i]=ch) Or (map[i,y]=ch) then
   Exit;
 map[x,y]:=ch;
 If Find_Next then
 Begin
  i:=xp;
  j:=yp;
  For t:='1' to '9' do
   Search(i,j,t);
 End
 Else
 Begin
  For i:=1 to 9 do
  Begin
   For j:=1 to 9 do
    Write(map[i,j]);
   Writeln;
  End;
  Close(input);
  Close(output);
  Halt;
 End;
 map[x,y]:='?';
End;

Begin
 Assign(input,'sudoku.in');
 Reset(input);
 Assign(output,'sudoku.out');
 Rewrite(output);
 For i:=1 to 9 do
 Begin
  For j:=1 to 9 do
   Read(map[i,j]);
  Readln;
 End;
 If Find_Next then
 Begin
  i:=xp;
  j:=yp;
  For ch:='1' to '9' do
   Search(i,j,ch);
 End;
 Close(input);
 Close(output);
End.