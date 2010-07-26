{
ID:aquarhe1
PROG:concom
LANG:PASCAL
}
Program Concom;
Const
   max = 100;
Var
   map	     : Array[1..max,1..max] Of Integer;
   con,done  : Array[1..max] Of Boolean;
   gf	     : Array[1..max] Of Longint;
   i,n,x,y,p : Longint;

Procedure Extend(p :Integer );
Var
   i : Integer;
Begin
   For i:=1 to max do
      Inc(gf[i],map[p,i]);
   done[p]:=True;
   For i:=1 to max do
      If gf[i]>50 then
	 con[i]:=True;
End; { Extend }

Procedure Calc(p :Integer );
Var
   i	: Integer;
   find	: Boolean;
Begin
   FillChar(con,sizeof(con),False);
   FillChar(done,sizeof(done),False);
   FillChar(gf,sizeof(gf),0);
   con[p]:=True;
   find:=True;
   While find do
   Begin
      find:=False;
      For i:=1 to max do
	 If (con[i]) And (Not done[i]) then
	 Begin
	    find:=True;
	    Extend(i);
	 End;
   End;
   For i:=1 to max do
      If (i<>p) And (con[i]) then
	 Writeln(p,' ',i);
End; { Calc }

Begin
   Assign(input,'concom.in');
   Reset(input);
   Assign(output,'concom.out');
   Rewrite(output);
   Readln(n);
   For i:=1 to n do
   Begin
      Readln(x,y,p);
      map[x,y]:=p;
   End;
   For i:=1 to max do
      Calc(i);
   Close(input);
   Close(output);
End.