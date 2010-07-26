Program Km_Practice;
Const
   max = 100;
Var
   w	 : Array[1..max,1..max] Of Longint;
   vx,vy : Array[1..max] Of Boolean;
   lx,ly : Array[1..max] Of Longint;
   link	 : Array[1..max] Of Integer;
   n,i,j : Integer;
   sum	 : Longint;

Procedure Km;
Var
   i,j,k : Integer;
   delta : Longint;

   Function Find(v :Integer ):Boolean;Inline;
   Var
      i	: Integer;
   Begin
      If vx[v] then
	 Exit(False);
      vx[v]:=True;
      For i:=1 to n do
	 If (Not vy[i]) And (lx[v]+ly[i]=w[v,i]) then
	 Begin
	    vy[i]:=True;
	    If (link[i]=0) Or (Find(link[i])) then
	    Begin
	       link[i]:=v;
	       Exit(True);
	    End;
	 End;
      Find:=False;
   End; { Find }
	     
Begin
   FillChar(link,sizeof(link),0);
   FillChar(lx,sizeof(lx),0);
   FillChar(ly,sizeof(ly),0);
   For i:=1 to n do
      For j:=1 to n do
	 If w[i,j]>lx[i] then
	    lx[i]:=w[i,j];
   For i:=1 to n do
      Repeat
	 FillChar(vx,sizeof(vx),False);
	 FillChar(vy,sizeof(vy),False);
	 If Find(i) then
	    Break;
	 delta:=MaxLongint;
	 For j:=1 to n do
	    If vx[j] then
	       For k:=1 to n do
		  If Not vy[k] then
		     If lx[j]+ly[k]-w[j,k]<delta then
			delta:=lx[j]+ly[k]-w[j,k];
	 For j:=1 to n do
	    If vx[j] then
	       Dec(lx[j],delta);
	 For j:=1 to n do
	    If vy[j] then
	       Inc(ly[j],delta);
      Until False;
End; { Km }

Begin
   Readln(n);
   For i:=1 to n do
   Begin
      For j:=1 to n do
	 Read(w[i,j]);
      Readln;
   End;
   Km;
   sum:=0;
   For i:=1 to n do
      Inc(sum,w[link[i],i]);
   Writeln(sum);
End.