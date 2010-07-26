Program pku1546;
Var
 str,nums : String;
 base,dest,i : Integer;
 tmp,num : Int64;

Function ch2i(ch : Char) : Integer;
Begin
 If ch<='9' then
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
 While Not Eof do
 Begin
  Readln(str);
  While str[1]=' ' do
   Delete(str,1,1);
  nums:=Copy(str,1,Pos(' ',str)-1);
  Delete(str,1,Pos(' ',str));
  While str[1]=' ' do
   Delete(str,1,1);
  Val(Copy(str,1,Pos(' ',str)-1),base);
  Delete(str,1,Pos(' ',str));
  Val(str,dest);
  tmp:=1;
  num:=0;
  For i:=Length(nums) downto 1 do
  Begin
   Inc(num,ch2i(nums[i])*tmp);
   tmp:=tmp*base;
  End;
  nums:='';
  Repeat
   nums:=i2ch(num mod dest)+nums;
   num:=num div dest;
  Until num=0;
  While Length(nums)<7 do
   nums:=' '+nums;
  If Length(nums)>7 then
   Writeln('  ERROR')
  Else
   Writeln(nums);
 End;
End.