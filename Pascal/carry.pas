Program Carry;
Var
 w : Array[1..1000] Of Longint;
 i,j,n,ans : Longint;

Begin
 Assign(input,'carry.in');
 Reset(input);
 Assign(output,'carry.out');
 Rewrite(output);
 Readln(n);
 For i:=1 to n do
  Read(w[i]);
 For i:=1 to n-1 do
  For j:=i+1 to n do
   If w[j]<w[i] then
    Inc(ans);
 Writeln(ans);
 Close(input);
 Close(output);
End.