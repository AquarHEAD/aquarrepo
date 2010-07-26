{
ID:aquarhe1
PROG:barn1
LANG:PASCAL
}
Program Barn1;
Type
   TArray = Array[1..200] Of Integer;
Var
   w,d         : Tarray;
   i,m,s,c,ans : Integer;

Procedure Sort(l,r : Integer;Var t: TArray );
Var
   i,j,k : Integer;
Begin
   For i:=l to r-1 do
      For j:=r downto i+1 do
	 If t[j]<t[j-1] then
	 Begin
	    k:=t[j];
	    t[j]:=t[j-1];
	    t[j-1]:=k;
	 End;
End; { Sort }

Begin
   Assign(input,'barn1.in');
   Reset(input);
   Assign(output,'barn1.out');
   Rewrite(output);
   Readln(m,s,c);
   For i:=1 to c do
      Readln(w[i]);
   Sort(1,c,w);
   For i:=1 to c-1 do
      d[i]:=w[i+1]-w[i]-1;
   Sort(1,c-1,d);
   ans:=w[c]-w[1]+1;
   For i:=1 to m-1 do
      Dec(ans,d[c-i]);
   Writeln(ans);
   Close(input);
   Close(output);
End.
