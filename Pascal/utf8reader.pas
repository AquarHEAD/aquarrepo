Program Utf8Reader;
Var
 s : utf8String;
 x : Byte;
 c : Char;

Begin
 Assign(input,'utf8.txt');
 Reset(input);
 Assign(output,'story.txt');
 Rewrite(output);
 While Not Eof do
 Begin
  s:='';
  While Not Eoln do
  Begin
   Read(x,c);
   s:=s+Chr(x);
  End;
  Writeln(s);
  Readln;
 End;
 Close(input);
 Close(output);
End.
