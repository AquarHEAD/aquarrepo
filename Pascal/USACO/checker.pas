{
ID:aquarhe1
PROG:checker
LANG:PASCAL
}
Program Checker;
Var
   sum,lim : Longint;
   ns,i,n	     : Integer;
   line,ll,rr	     : Array[-100..100] Of Boolean;
   path		     : Array[1..13] Of Integer;
   
Procedure Test(row,ld,rd: Longint );
Var
   pos,p : Longint;
Begin
   If row<>lim then
   Begin
      pos:=lim And Not(row or ld or rd);
      While pos<>0 do
      Begin
	 p:=pos And -pos;
	 pos:=pos - p;
	 test(row+p,(ld+p) shl 1,(rd+p) shr 1);
      End;
   End
   Else
      Inc(sum);
End; { Test }

Procedure Search(pos,step : Integer );
Var
   i : Integer;
Begin
   path[step]:=pos;
   If step=n then
   Begin
      For i:=1 to n-1 do
	 Write(path[i],' ');
      Writeln(path[n]);
      Inc(ns);
      If ns=3 then
      Begin
	 Writeln(sum);
	 Close(input);
	 Close(output);
	 Halt;
      End;
   End;
   line[pos]:=True;
   ll[pos+step]:=True;
   rr[pos-step]:=True;   
   For i:=1 to n do
      If Not (line[i] Or ll[i+step+1] Or rr[i-step-1]) then
	 Search(i,step+1);
   line[pos]:=False;
   ll[pos+step]:=False;
   rr[pos-step]:=False;
End; { Search }

Begin
   Assign(input,'checker.in');
   Reset(input);
   Assign(output,'checker.out');
   Rewrite(output);
   Readln(n);
   lim:=(1 shl n)-1;
   sum:=0;
   test(0,0,0);
   ns:=0;
   For i:=1 to n do
    Search(i,1);
   Close(input);
   Close(output);
End.