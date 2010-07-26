{
ID:aquarhe1
PROG:palsquare
LANG:PASCAL
}
Program Palsquare;
Var
   i,b : Integer;
   str : String;

Function i2ch(k	: Integer ) : Char;
Begin
   If k<10 then
      Exit(Chr(Ord('0')+k))
   Else
      Exit(Chr(Ord('A')+k-10));
End; { i2ch }

Function Check : Boolean;
Var
   t   : Longint;
Begin
   t:=Sqr(i);
   str:='';
   While t<>0 do
   Begin
      str:=i2ch(t mod b)+str;
      t:=t div b;
   End;
   Check:=True;
   For t:=1 to Length(str) div 2 do
      If str[t] <> str[Length(str)-t+1] then
	 Exit(False);
End; { Check }

Procedure Print;
Var
   bs : String;
   t  : Integer;
Begin
   bs:='';
   t:=i;
   While t<>0 do
   Begin
      bs:=i2ch(t mod b)+bs;
      t:=t div b;
   End;
   Writeln(bs,' ',str);
End; { Print }

Begin
   Assign(input,'palsquare.in');
   Reset(input);
   Assign(output,'palsquare.out');
   Rewrite(output);
   Readln(b);
   For i:=1 to 300 do
   Begin
      If Check then
	 Print;
   End;
   Close(input);
   Close(output);
End.