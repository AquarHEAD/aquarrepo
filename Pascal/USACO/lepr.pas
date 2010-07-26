{
ID:aquarhead1
PROG:lepr
LANG:PASCAL
}
Program Lepr;
Var
   n,i,j,Max : Longint;
   Seq	     : Array[1..400] Of Longint;
   Map	     : Array[1..200,1..200] Of Longint;

Procedure Calc;
Var
   i,j,tmp,tMax : Longint;
Begin
   For i:=1 to n do
      Seq[n+i]:=Seq[i];
   For j:=1 to n do
   Begin
      tmp:=0;
      tMax:=0;
      For i:=j to j+n-1 do
	 If tmp+Seq[i]>=0 then
	 Begin
	    Inc(tmp,Seq[i]);
	    If tmp>tMax then
	       tMax:=tmp;
	 End
	 Else
	    tmp:=0;
      If (tMax>Max) And (tMax <> 0) then
	 Max:=tMax;
   End;
End; { Calc }

Procedure MakeSeq1;
Var
   i,j,Flag : Longint;
Begin
   For i:=1 to n do
   Begin
      Flag:=0;
      FillChar(Seq,Sizeof(Seq),0);
      For j:=1 to n do
      Begin
	 Inc(Flag);
	 Seq[Flag]:=Map[i,j];
      End;
      Calc;
   End;
End; { MakeSeq1 }

Procedure MakeSeq2;
Var
   i,j,Flag : Longint;
Begin
   For j:=1 to n do
   Begin
      Flag:=0;
      FillChar(Seq,Sizeof(Seq),0);
      For i:=1 to n do
      Begin
	 Inc(Flag);
	 Seq[Flag]:=Map[i,j];
      End;
      Calc;
   End;
End; { MakeSeq2 }

Procedure MakeSeq3;
Var
   i,j,Flag : Longint;
Begin
   For i:=1 to n do
   Begin
      Flag:=0;
      FillChar(Seq,Sizeof(Seq),0);
      For j:=0 to n-1 do
      Begin
	 Inc(Flag);
	 Seq[Flag]:=Map[(j+n) mod n+1,(i+j+n-1) mod n+1];
      End;
      Calc;
   End;
End; { MakeSeq3 }

Procedure MakeSeq4;
Var
   i,j,Flag : Longint;
Begin
   For i:=n downto 1 do
   Begin
      Flag:=0;
      FillChar(Seq,Sizeof(Seq),0);
      For j:=0 to n-1 do
      Begin
	 Inc(Flag);
	 Seq[Flag]:=Map[(j+n) mod n+1,(i-j+n-1) mod n+1];
      End;
      Calc;
   End;
End; { MakeSeq4 }

Begin
   Assign(Input,'lepr.in');
   Reset(Input);
   Assign(Output,'lepr.out');
   Rewrite(Output);
   
   Readln(n);
   For i:=1 to n do
   Begin
      For j:=1 to n do
	 Read(Map[i,j]);
      Readln;
   End;
   Max:=Map[1,1];
   For i:=1 to n do
      For j:=1 to n do
	 If Map[i,j]>Max then
	    Max:=Map[i,j];
   
   MakeSeq1;
   MakeSeq2;
   MakeSeq3;
   MakeSeq4;
   
   Writeln(Max);
   
   Close(input);
   Close(output);
End.