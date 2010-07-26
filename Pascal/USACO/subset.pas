{
ID:aquarhe1
PROG:subset
LANG:PASCAL
}
Program Subset;
Var
   n,sum,i,j : Longint;
   f	     : Array[0..1000] Of Int64;
Begin
   Assign(input,'subset.in');
   Reset(input);
   Assign(output,'subset.out');
   Rewrite(output);
   Readln(n);
   sum:=(1+n)*n div 2;
   f[0]:=1;
   For i:=1 to n do
      For j:=sum downto i do
	 Inc(f[j],f[j-i]);
   If sum and 1=1 then
      Writeln(0)
   Else
      Writeln(f[sum div 2] div 2);
   Close(input);
   Close(output);
End.
