{
ID:aquarhe1
PROG:ttwo
LANG:PASCAL
}
Program Ttwo;
Const
   cx: Array[0..3] Of Integer = (-1,0,1,0);
   cy: Array[0..3] Of Integer = (0,1,0,-1);
Var
   map					: Array[1..10,1..10] Of Char;
   cowx,cowy,farx,fary,i,j,step,cow,far	: Integer;

Procedure Walk;
Var
   tx,ty : Integer;
Begin
   tx:=cowx+cx[cow];
   ty:=cowy+cy[cow];
   If (tx<1) Or (tx>10) Or (ty<1) Or (ty>10) Or (map[tx,ty]='*') then
      cow:=(cow+1) mod 4
   Else
   Begin
      cowx:=tx;
      cowy:=ty;
   End;
   tx:=farx+cx[far];
   ty:=fary+cy[far];
   If (tx<1) Or (tx>10) Or (ty<1) Or (ty>10) Or (map[tx,ty]='*') then
      far:=(far+1) mod 4
   Else
   Begin
      farx:=tx;
      fary:=ty;
   End;
End; { Walk }

Begin
   Assign(input,'ttwo.in');
   Reset(input);
   Assign(output,'ttwo.out');
   Rewrite(output);
   For i:=1 to 10 do
   Begin
      For j:=1 to 10 do
      Begin
	 Read(map[i,j]);
	 If map[i,j]='C' then
	 Begin
	    cowx:=i;
	    cowy:=j;
	 End;
	 If map[i,j]='F' then
	 Begin
	    farx:=i;
	    fary:=j;
	 End;
      End;
      Readln;
   End;
   step:=0;
   cow:=0;
   far:=0;
   Repeat
      Inc(step);
      Walk;
   Until ((farx=cowx) And (fary=cowy)) Or (step=10000);
   If step=10000 then
      Writeln(0)
   Else
      Writeln(step);
   Close(input);
   Close(output);
End.