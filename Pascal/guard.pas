{
ID:aquarhead1
PROG:guard
LANG:PASCAL
}
Program Guard;
Const
 cx : Array[1..8] Of Integer=(0,0,1,1,1,-1,-1,-1);
 cy : Array[1..8] Of Integer=(1,-1,1,0,-1,1,0,-1);
Var
 map : Array[1..100,1..70] Of Integer;
 vis : Array[1..100,1..70] Of Boolean;
 x,y,n,m,ans : Integer;

Function Check_Map : Boolean;
Var
 i,j : Integer;
Begin
 For i:=1 to n do
 For j:=1 to m do
  If Not vis[i,j] then
   Exit(False);
 Check_Map:=True;
End;

Procedure Find_Max;
Var
 i,j,max : Integer;
Begin
 max:=0;
 For i:=1 to n do
 For j:=1 to m do
  If (Not vis[i,j]) And (map[i,j]>=max) then
  Begin
   max:=map[i,j];
   x:=i;
   y:=j;
  End;
End;

Procedure Flood_Fill(x,y : Integer);
Var
 k,tx,ty : Integer;
Begin
 vis[x,y]:=True;
 For k:=1 to 8 do
 Begin
  tx:=x+cx[k];
  ty:=y+cy[k];
  If (tx>=1) And (tx<=n) And (ty>=1) And (ty<=m) And (Not vis[tx,ty]) And (map[tx,ty]<=map[x,y]) then
   Flood_Fill(tx,ty);
 End;
End;

Begin
 Assign(input,'guard.in');
 Reset(input);
 Assign(output,'guard.out');
 Rewrite(output);
 Readln(n,m);
 For x:=1 to n do
 Begin
  For y:=1 to m do
   Read(map[x,y]);
  Readln;
 End;
 FillChar(vis,sizeof(vis),False);
 ans:=0;
 While Not Check_Map do
 Begin
  Inc(ans);
  Find_Max;
  Flood_Fill(x,y);
 End;
 Writeln(ans);
 Close(input);
 Close(output);
End.
