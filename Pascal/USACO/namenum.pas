{
ID:aquarhe1
PROG:namenum
LANG:PASCAL
}
Program Namenum;
Var
   acs,acnum : Array[1..5000] Of String;
   str	     : String;
   i,j	     : Integer;
   find	     : Boolean;

Function ch2i(ch : Char ) : Char;
Begin
   Case ch Of
     'A','B','C' : Exit('2');
     'D','E','F' : Exit('3');
     'G','H','I' : Exit('4');
     'J','K','L' : Exit('5');
     'M','N','O' : Exit('6');
     'P','R','S' : Exit('7');
     'T','U','V' : Exit('8');
     'W','X','Y' : Exit('9');
   End;
End; { ch2i }

Begin
   Assign(input,'dict.txt');
   Reset(input);
   For i:=1 to 5000 do
   Begin
      Readln(acs[i]);
      For j:=1 to Length(acs[i]) do
	 acnum[i]:=acnum[i]+ch2i(acs[i][j]);
   End;
   Close(input);
   Assign(input,'namenum.in');
   Reset(input);
   Assign(output,'namenum.out');
   Rewrite(output);
   Readln(str);
   find:=False;
   For i:=1 to 5000 do
      If str=acnum[i] then
      Begin
	 find:=True;
	 Writeln(acs[i]);
      End;
   If Not find then
      Writeln('NONE');
   Close(input);
   Close(output);
End.