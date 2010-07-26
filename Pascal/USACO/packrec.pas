{
ID:aquarhe1
PROG:packrec
LANG:PASCAL
}
Program Packrec;
Var
   sq				     : Array[1..4,1..2] Of Byte;
   mr				     : Word;
   re				     : Array[0..10,1..2] Of Byte;
   i,j,n,s1,s2,s3,s4,d1,d2,d3,d4,w,h : Byte;

Function Max(a,b,c,d :Byte ):Byte;
Begin
   Max:=a;
   If b>Max then
      Max:=b;
   If c>Max then
      Max:=c;
   If d>Max then
      Max:=d;
End; { Max }

Procedure Fresh;
Var
   i,s : Byte;
Begin
   If w*h>mr then
      Exit;
   If w*h<mr then
   Begin
      mr:=w*h;
      n:=0;
   End;
   If w>h then
   Begin
      s:=w;
      w:=h;
      h:=s;
   End;
   For i:=1 to n do
      If (re[i,1]=w) And (re[i,2]=h) then
	 Exit;
   Inc(n);
   re[n,1]:=w;
   re[n,2]:=h;
End; { Fresh }

Procedure Calc;
Var
   w1,w2,w3,w4,h1,h2,h3,h4 : Byte;
Begin
   w1:=sq[s1,d1];
   w2:=sq[s2,d2];
   w3:=sq[s3,d3];
   w4:=sq[s4,d4];
   h1:=sq[s1,3-d1];
   h2:=sq[s2,3-d2];
   h3:=sq[s3,3-d3];
   h4:=sq[s4,3-d4];
   w:=w1+w2+w3+w4;
   h:=Max(h1,h2,h3,h4);
   Fresh;
   w:=Max(w1+w2+w3,w4,0,0);
   h:=Max(h1,h2,h3,0)+h4;
   Fresh;
   w:=Max(w1+w2,w3,0,0)+w4;
   h:=Max(Max(h1,h2,0,0)+h3,h4,0,0);
   Fresh;
   w:=w1+w2+Max(w3,w4,0,0);
   h:=Max(h1,h2,h3+h4,0);
   Fresh;
   If h4>=h1+h3 then
      w:=Max(w2,w1+w4,w3+w4,0);
   If h3>=h2+h4 then
      w:=Max(w1,w2+w3,w3+w4,0);
   If (h3>h4) And (h3<h2+h4) then
      w:=Max(w1+w2,w2+w3,w3+w4,0);
   If (h3<h4) And (h4<h3+h1) then
      w:=Max(w1+w2,w1+w4,w3+w4,0);
   If h3=h4 then
      w:=Max(w3+w4,w1+w2,0,0);
   h:=Max(h1+h3,h2+h4,0,0);
   Fresh;
End; { Calc }

Begin
   Assign(input,'packrec.in');
   Reset(input);
   Assign(output,'packrec.out');
   Rewrite(output);
   For i:=1 to 4 do
      Readln(sq[i,1],sq[i,2]);
   n:=0;
   mr:=$FFFF;
   For s1:=1 to 4 do
      For s2:=1 to 4 do
	 If s2<>s1 then
	    For s3:=1 to 4 do
	       If (s3<>s2) And (s3<>s1) then
	       Begin
		  s4:=10-s1-s2-s3;
		  For d1:=1 to 2 do
		     For d2:=1 to 2 do
			For d3:=1 to 2 do
			   For d4:=1 to 2 do
			      Calc;
	       End;
   For i:=1 to n-1 do
      For j:=i+1 to n do
	 If re[i,1]>re[j,1] then
	 Begin
	    re[0]:=re[i];
	    re[i]:=re[j];
	    re[j]:=re[0];
	 End;
   Writeln(mr);
   For i:=1 to n do
      Writeln(re[i,1],' ',re[i,2]);
   Close(input);
   Close(output);
End.