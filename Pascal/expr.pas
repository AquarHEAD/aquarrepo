Program Expr;
Const
 max = 100;
Type
 TNext = Record
          inum : Boolean;
          num : Longint;
          opch : Char;
         End;
Var
 op : Array[1..max] Of Char;
 on : Array[1..max] Of Longint;
 ontop,optop,i : Integer;
 s : String;
 t : TNext;

Procedure Read_Next;
Var
 x : Integer;
Begin
 If (s[i] In ['+','-']) And (i<Length(s)) And (s[i+1]='(') then
 Begin
  Inc(ontop);
  on[ontop]:=0;
  t.inum:=False;
  t.opch:=s[i];
  If op[optop]<>'(' then
  Begin
   Inc(optop);
   op[optop]:='+';
  End;
  Exit;
 End;
 If (s[i] In ['+','-']) And ((i=1) Or (s[i-1] In ['+','-','*','('])) then
 Begin
  x:=i;
  Inc(i);
  t.inum:=True;
  t.num:=Ord(s[i])-Ord('0');
  While (i<Length(s)) And (s[i+1] In ['0'..'9']) do
  Begin
   Inc(i);
   t.num:=t.num*10+Ord(s[i])-Ord('0');
  End;
  If s[x]='-' then
   t.num:=-t.num;
  Exit;
 End;
 If s[i] In ['0'..'9'] then
 Begin
  t.inum:=True;
  t.num:=Ord(s[i])-Ord('0');
  While (i<Length(s)) And (s[i+1] In ['0'..'9']) do
  Begin
   Inc(i);
   t.num:=t.num*10+Ord(s[i])-Ord('0');
  End;
 End
 Else
 Begin
  t.inum:=False;
  t.opch:=s[i];
 End;
End;

Function Need_Pop(opch : Char) : Boolean;
Begin
 If (opch=')') And (op[optop]='(') then
 Begin
  Dec(optop);
  Exit(False);
 End;
 If opch=')' then
  Exit(True);
 If opch In ['+','-'] then
 Begin
  If op[optop]='*' then
   Exit(True);
  Exit(False);
 End;
 Exit(False);
End;

Procedure Calc_On;
Var
 a,b : Longint;
Begin
 If ontop>1 then
 Begin
  a:=on[ontop-1];
  b:=on[ontop];
  Dec(ontop);
 End
 Else
 Begin
  a:=0;
  b:=on[ontop];
 End;
 Case op[optop] Of
  '+' : on[ontop]:=a+b;
  '-' : on[ontop]:=a-b;
  '*' : on[ontop]:=a*b;
 End;
 Dec(optop);
End;

Begin
 Assign(input,'expr.in');
 Reset(input);
 Assign(output,'expr.out');
 Rewrite(output);
 Readln(s);
 ontop:=0;
 optop:=0;
 i:=1;
 Repeat
  Read_Next;
  If t.inum then
  Begin
   Inc(ontop);
   on[ontop]:=t.num;
  End
  Else
  Begin
    While (optop>0) And (Need_Pop(t.opch)) do
     Calc_On;
   If t.opch<>')' then
   Begin
    Inc(optop);
    op[optop]:=t.opch;
   End;
  End;
  Inc(i);
 Until i>Length(s);
 While optop>0 do
  Calc_On;
 Writeln(on[1]);
 Close(input);
 Close(output);
End.