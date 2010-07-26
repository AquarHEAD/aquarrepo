Program Chord;
Var
 x1,x2,y1,y2,r1,r2 : Longint;

Begin
 Assign(input,'chord.in');
 Reset(input);
 Assign(output,'chord.out');
 Rewrite(output);
 Readln(x1,y1,r1);
 Readln(x2,y2,r2);
 Writeln(2*Sqrt(Sqr(x1-x2)+Sqr(y1-y2)):0:6);
 Close(input);
 Close(output);
End.