{
ID:aquarhe1
PROG:clocks
LANG:PASCAL
}
Program Clocks;
Var
   w,p				  : Array[1..9] Of Integer;
   i,j,s1,s2,s3,s4,s5,s6,s7,s8,s9 : Integer;
   
Procedure  Rotate(k		  : Integer );
Begin
   p[k]:=(p[k]+2) mod 12+1;
End; { Rotate }

Procedure Rotate_Clocks;
Var
   i : Integer;
Begin
   For i:=1 to s1 do
   Begin
      Rotate(1);
      Rotate(2);
      Rotate(4);
      Rotate(5);
   End;
   For i:=1 to s2 do
   Begin
      Rotate(1);
      Rotate(2);
      Rotate(3);
   End;
   For i:=1 to s3 do
   Begin
      Rotate(2);
      Rotate(3);
      Rotate(5);
      Rotate(6);
   End;
   For i:=1 to s4 do
   Begin
      Rotate(1);
      Rotate(4);
      Rotate(7);
   End;
   For i:=1 to s5 do
   Begin
      Rotate(2);
      Rotate(4);
      Rotate(5);
      Rotate(6);
      Rotate(8);
   End;
   For i:=1 to s6 do
   Begin
      Rotate(3);
      Rotate(6);
      Rotate(9);
   End;
   For i:=1 to s7 do
   Begin
      Rotate(4);
      Rotate(5);
      Rotate(7);
      Rotate(8);
   End;
   For i:=1 to s8 do
   Begin
      Rotate(7);
      Rotate(8);
      Rotate(9);
   End;
   For i:=1 to s9 do
   Begin
      Rotate(5);
      Rotate(6);
      Rotate(8);
      Rotate(9);
   End;
End; { Rotate_Clocks }

Function Ok:Boolean;
Var
   i : Integer;
Begin
   Ok:=True;
   For i:=1 to 9 do
      If p[i]<>12 then
	 Exit(False);
End; { Ok }

Procedure Output_Ans;
Var
   s : AnsiString;
   i : Integer;
Begin
   s:='';
   For i:=1 to s1 do
      s:=s+'1 ';
   For i:=1 to s2 do
      s:=s+'2 ';
   For i:=1 to s3 do
      s:=s+'3 ';
   For i:=1 to s4 do
      s:=s+'4 ';
   For i:=1 to s5 do
      s:=s+'5 ';
   For i:=1 to s6 do
      s:=s+'6 ';
   For i:=1 to s7 do
      s:=s+'7 ';
   For i:=1 to s8 do
      s:=s+'8 ';
   For i:=1 to s9 do
      s:=s+'9 ';
   Delete(s,Length(s),1);
   Writeln(s);
End; { Output_Ans }

Begin
   Assign(input,'clocks.in');
   Reset(input);
   Assign(output,'clocks.out');
   Rewrite(output);
   For i:=1 to 3 do
      For j:=1 to 3 do
	 Read(w[(i-1)*3+j]);
   For s1:=0 to 3 do
      For s2:=0 to 3 do
	 For s3:=0 to 3 do
	    For s4:=0 to 3 do
	       For s5:=0 to 3 do
		  For s6:=0 to 3 do
		     For s7:=0 to 3 do
			For s8:=0 to 3 do
			   For s9:=0 to 3 do
			   Begin
			      p:=w;
			      Rotate_Clocks;
			      If Ok then
			      Begin
				 Output_Ans;
				 Close(input);
				 Close(output);
				 Halt;
			      End;
			   End;
   Close(input);
   Close(output);
End.