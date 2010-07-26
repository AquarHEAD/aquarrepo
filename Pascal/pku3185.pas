Program pku3185;
Const
 mask=$FFFFF shl 1;
Var
 i,bit,bowl,a,b : Longint;

Function Count(bowl,n,nflips : Longint) : Longint;
Begin
 If bowl And mask=0 then
  Exit(nflips);
 If n=1 then
  Exit(99999);
 If bowl And (1 shl n)=1 shl n then
  Exit(Count(bowl Xor (7 shl (n-2)),n-1,nflips+1));
 Exit(Count(bowl,n-1,nflips));
End;

Begin
 For i:=1 to 20 do
 Begin
  Read(bit);
  bowl:=(bowl shl 1) Or bit;
 End;
 bowl:=bowl shl 1;
 a:=Count(bowl Xor (3 shl 19),20,1);
 b:=Count(bowl ,20,0);
 If a<b then
  Writeln(a)
 Else
  Writeln(b);
End.