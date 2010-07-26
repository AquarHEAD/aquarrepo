{
ID:aquarhe1
PROG:stall4
LANG:PASCAL
}
Program Stall4;
Const
   max = 200;
Var
   g		   : Array[1..max,1..max] Of Boolean;
   y		   : Array[1..max] Of Boolean;
   link		   : Array[1..max] Of Integer;
   i,j,x,p,n,m,ans :  Integer;

Function Find(v	: Integer ): Boolean;
Var
   i : Integer;
Begin
   For i:=1 to m do
      If g[v,i] And (Not y[i]) then
      Begin
	 y[i]:=True;
	 If (link[i]=0) Or Find(link[i]) then
	 Begin
	    link[i]:=v;
	    Exit(True);
	 End;
      End;
   Find:=False;
End; { Find }

Begin
   Assign(input,'stall4.in');
   Reset(input);
   Assign(output,'stall4.out');
   Rewrite(output);
   Readln(n,m);
   For i:=1 to n do
   Begin
      Read(x);
      For j:=1 to x do
      Begin
	 Read(p);
	 g[i,p]:=True;
      End;
      Readln;
   End;
   ans:=0;
   For i:=1 to n do
   Begin
      FillChar(y,sizeof(y),False);
      If find(i) then Inc(ans);
   End;
   Writeln(ans);
   Close(input);
   Close(output);
End.