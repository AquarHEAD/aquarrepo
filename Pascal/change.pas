Program Change;
Var
 x,q,i : Longint;
 n : Int64;
 sour,dest : Integer;
 str : String;

Function ch2i(ch : Char) : Integer;
Begin
 If ch In ['0'..'9'] then
  Exit(Ord(ch)-Ord('0'))
 Else
  Exit(Ord(ch)-Ord('A')+10);
End;

Function i2ch(k : Integer) : Char;
Begin
 If k<10 then
  Exit(Chr(Ord('0')+k))
 Else
  Exit(Chr(Ord('A')+k-10));
End;

Begin
 Assign(input,'change.in');
 Reset(input);
 Assign(output,'change.out');
 Rewrite(output);
 Readln(sour);
 Readln(str);
 q:=1;
 For i:=Length(str) downto 1 do
 Begin
  x:=ch2i(str[i]);
  Inc(n,x*q);
  q:=q*sour;;
 End;
 Readln(dest);
 str:='';
 While n<>0 do
 Begin
  str:=i2ch(n mod dest)+str;
  n:=n div dest;
 End;
 Writeln(str);
 Close(input);
 Close(output);
End.