Program Altitude;
Var
 map : Array[1..100,1..100] Of Longint;
 n,s,k,x,y,i,j,p,q,max,min : Longint;

Begin
 Assign(input,'altitude.in');
 Reset(input);
 Assign(output,'altitude.out');
 Rewrite(output);
 Readln(n,s,k);
 For i:=1 to n do
 Begin
  For j:=1 to n do
   Read(map[i,j]);
  Readln;
 End;
 For i:=1 to k do
 Begin
  Readln(x,y);
  max:=0;
  min:=MaxLongint;
  For p:=x to x+s-1 do
   For q:=y to y+s-1 do
   Begin
    If map[p,q]>max then
     max:=map[p,q];
    If map[p,q]<min then
     min:=map[p,q];
   End;
  Writeln(max-min);
 End;
 Close(input);
 Close(output);
End.
