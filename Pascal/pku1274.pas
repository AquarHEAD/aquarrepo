Program pku1274;
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
   While Not Eof do
   Begin
    Readln(n,m);
    FillChar(g,sizeof(g),False);
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
    FillChar(link,sizeof(link),0);
    ans:=0;
    For i:=1 to n do
    Begin
       FillChar(y,sizeof(y),False);
       If find(i) then Inc(ans);
    End;
    Writeln(ans);
   End;
End.