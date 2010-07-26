{
ID:aquarhe1
PROG:money
LANG:PASCAL
}
Program Money;
Var
   f	     : Array[0..10000] Of Int64;
   p,n,i,j,x : Longint;
Begin
   Assign(input,'money.in');
   Reset(input);
   Assign(output,'money.out');
   Rewrite(output);
   Readln(p,n);
   f[0]:=1;
   For i:=1 to p do
   Begin
      Read(x);
      For j:=x to n do
	 Inc(f[j],f[j-x]);
   End;
   Writeln(f[n]);
   Close(input);
   Close(output);
End.