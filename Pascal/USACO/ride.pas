{
ID:aquarhe1
PROG:ride
LANG:PASCAL
}
Program Ride;
Var
   str	       : String;
   num1,num2,i : Longint;
Begin
   Assign(input,'ride.in');
   Reset(input);
   Assign(output,'ride.out');
   Rewrite(output);
   Readln(str);
   num1:=1;
   num2:=1;
   For i:=1 to Length(str) do
   Begin
      num1:=num1*(Ord(str[i])-Ord('A')+1);
   End;
   Readln(str);
   For i:=1 to Length(str) do
   Begin
      num2:=num2*(Ord(str[i])-Ord('A')+1);
   End;
   If num1 mod 47=num2 mod 47 then
      Writeln('GO')
   Else
      Writeln('STAY');
   Close(input);
   Close(output);
End.