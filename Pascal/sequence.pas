Program Sequence;
Var
 m : Array[1..100000] Of Longint;
 i,n : Longint;
 sum,max,min : Int64;

Function Maxx(a,b : Int64) : Int64;
Begin
 If a>b then
  Exit(a)
 Else
  Exit(b)
End;

Function Minx(a,b : Int64) : Int64;
Begin
 If a<b then
  Exit(a)
 Else
  Exit(b)
End;

Begin
 Assign(input,'sequence.in');
 Reset(input);
 Assign(output,'sequence.out');
 Rewrite(output);
 Readln(n);
 For i:=1 to n do
  Readln(m[i]);
 sum:=0;
 max:=MaxLongint;
 min:=-MaxLongint;
 For i:=1 to n do
  If Odd(i) then
  Begin
   max:=Minx(max,sum+m[i]);
   sum:=sum+2*m[i];
  End
  Else
  Begin
   min:=Maxx(min,sum-m[i]);
   sum:=sum-2*m[i];
  End;
 If min>max then
  Writeln(0)
 Else
  Writeln(max-min+1);
 Close(input);
 Close(output);
End.