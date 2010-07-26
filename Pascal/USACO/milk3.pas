{
ID:aquarhe1
PROG:milk3
LANG:PASCAL
}
Program Milk3;
Const
   max = 20;
Var
   f	   : Array[0..max,0..max] Of Boolean;
   a,b,c,i : Integer;
   flag	   : Boolean;

Function Min(a,b :Integer ):Integer;
Begin
   If a<b then
      Exit(a)
   Else
      Exit(b);
End; { Min }

Procedure Search(x,z :Integer );
Var
   y : Integer;
Begin
   If f[x,z] then
      Exit;
   f[x,z]:=True;
   y:=c-x-z;
   Search(x-Min(x,b-y),z);
   Search(x-Min(x,c-z),z+Min(x,c-z));
   Search(x+Min(y,a-x),z);
   Search(x,z+Min(y,c-z));
   Search(x+Min(z,a-x),z-Min(z,a-x));
   Search(x,z-Min(z,b-y));
End; { Search }

Begin
   Assign(input,'milk3.in');
   Reset(input);
   Assign(output,'milk3.out');
   Rewrite(output);
   Readln(a,b,c);
   flag:=False;
   Search(0,c);
   For i:=0 to c do
      If f[0,i] then
      Begin
	 If flag then
	    Write(' ');
	 flag:=True;
	 Write(i);
      End;
   Writeln;
   Close(input);
   Close(output);
End.