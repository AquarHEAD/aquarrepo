{
ID:aquarhe1
PROG:transform
LANG:PASCAL
}
Program Transform;
Var
 map,final,tmp,map2 : Array[1..10,1..10] Of Char;
 i,j,n,ans : Integer;

Function Check : Boolean;
Var
 i,j : Integer;
Begin
 Check:=True;
 For i:=1 to n do
 For j:=1 to n do
  If tmp[i,j] <> final[i,j] then
   Exit(False);
End;

Function Rotate : Boolean;
Var
 i,j : Integer;
Begin
 For i:=1 to n do
 For j:=1 to n do
  tmp[j,n-i+1]:=map[i,j];
 map:=tmp;
 Exit(Check);
End;

Function Mirror : Boolean;
Var
 i,j : Integer;
Begin
 For i:=1 to n do
 For j:=1 to n do
  tmp[i,n-j+1]:=map[i,j];
 map:=tmp;
 Exit(Check);
End;

Begin
 Assign(input,'transform.in');
 Reset(input);
 Assign(output,'transform.out');
 Rewrite(output);
 Readln(n);
 For i:=1 to n do
 Begin
  For j:=1 to n do
   Read(map[i,j]);
  Readln;
 End;
 For i:=1 to n do
 Begin
  For j:=1 to n do
   Read(final[i,j]);
  Readln;
 End;
 tmp:=map;
 map2:=map;
 ans:=7;
 If (Rotate) And (ans=7) then
  ans:=1;
 If (Rotate) And (ans=7) then
  ans:=2;
 If (Rotate) And (ans=7) then
  ans:=3;
 map:=map2;
 If (Mirror) And (ans=7) then
  ans:=4;
 If (Rotate) And (ans=7) then
  ans:=5;
 If (Rotate) And (ans=7) then
  ans:=5;
 If (Rotate) And (ans=7) then
  ans:=5;
 tmp:=map2;
 If (Check) And (ans=7) then
  ans:=6;
 Writeln(ans);
 Close(input);
 Close(output);
End.
