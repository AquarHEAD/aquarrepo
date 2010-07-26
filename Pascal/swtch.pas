{
ID:aquarhead1
PROG:swtch
LANG:PASCAL
}
Program Swtch;
Const
   maxn	= 500;
Var
   w		       : Array[1..maxn] Of Boolean;
   n,m,i,s,e,com,j,ans : Integer;
   
Begin
   Assign(input,'swtch.in');
   Reset(input);
   Assign(output,'swtch.out');
   Rewrite(output);
   FillChar(w,sizeof(w),False);
   Readln(n,m);
   For i:=1 to m do
   Begin
      Readln(com,s,e);
      If com=0 then
      Begin
	 For j:=s to e do
	    w[j]:=Not w[j];
      End
      Else
      Begin
	 ans:=0;
	 For j:=s to e do
	    If w[j] then
	       Inc(ans);
	 Writeln(ans);
      End
   End;
   Close(input);
   Close(output);
End.