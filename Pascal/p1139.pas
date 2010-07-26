Program p1139;
Var
   w	   : Array[1..100,1..500] Of Integer;
   ans	   : Array[0..100,1..500] Of Longint;
   path	   : Array[0..100,1..500] Of Integer;
   i,j,m,n : Integer;
   f	   : Longint;

Procedure Print_Path(x,y :Integer );
Begin
   If path[x,y]=0 then
      Exit;
   Case path[x,y] Of
     1 : Print_Path(x-1,y);
     2 : Print_Path(x,y-1);
     3 : Print_Path(x,y+1);
   End; { case }
   Writeln(y);
End; { Print_Path }

Begin
   Readln(m,n);
   For i:=1 to m do
      For j:=1 to n do
	 Read(w[i,j]);
   For i:=1 to m do
   Begin
      For j:=1 to n do
      Begin
	 path[i,j]:=1;
	 ans[i,j]:=w[i,j]+ans[i-1,j];
      End;
      For j:=n downto 2 do
	 If ans[i,j-1]+w[i,j]<ans[i,j] then
	 Begin
	    ans[i,j]:=ans[i,j-1]+w[i,j];
	    path[i,j]:=2;
	 End;
      For j:=1 to n-1 do
	 If ans[i,j+1]+w[i,j]<ans[i,j] then
	 Begin
	    ans[i,j]:=ans[i,j-1]+w[i,j];
	    path[i,j]:=3;
	 End;
   End;
   f:=MaxLongint;
   For i:=1 to n do
      If ans[m,i]<f then
      Begin
	 j:=i;
	 f:=ans[m,i];
      End;
   Print_Path(m,j);
End.
