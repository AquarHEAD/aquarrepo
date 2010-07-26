{
ID:aquarhe1
PROG:calfflac
LANG:PASCAL
}
Program Calfflac;
Var
   s : AnsiString;
   str				 : String;
   i,mid,l,r,len,ans,now,ansl,ansr,sum,totl : Longint;
   ll : Array[1..1000000] Of Longint;

Procedure ExtendLeft;
Begin
 Repeat
  Dec(l);
 Until (l<=1) Or (s[l] In ['A'..'Z','a'..'z']);
End; { ExtendLeft }

Procedure ExtendRight;
Begin
 Repeat
  Inc(r);
 Until (r>=len) Or (s[r] In ['A'..'Z','a'..'z']);
End; { ExtendRight }

Function Lower(ch : Char) : Char;
Begin
 Lower:=ch;
 If ch In ['A'..'Z'] then
  Lower:=Chr(Ord(Lower)+$20);
End;

Begin
   Assign(input,'calfflac.in');
   Reset(input);
   Assign(output,'calfflac.out');
   Rewrite(output);
   s:='';
   totl:=0;
   While Not Eof do
   Begin
      Readln(str);
      Inc(totl);
      ll[totl]:=Length(str);
      s:=s+str;
   End;
   len:=Length(s);
   ans:=0;
   For mid:=2 to len-1 do
   Begin
      l:=mid;
      r:=mid;
      now:=1;
      While True do
      Begin
      If (l=1) Or (r=len) then
	    Break;


	 ExtendLeft;
	 ExtendRight;
         If Lower(s[l])<>Lower(s[r]) then
	    Break
	 Else
	 Begin
	    Inc(now,2);
	    If now>ans then
	    Begin
	       ansl:=l;
	       ansr:=r;
	       ans:=now;
	    End;
	 End;
      End;
      If Lower(s[mid])=Lower(s[mid+1]) then
      Begin
      l:=mid;
      r:=mid+1;
      now:=2;
      While True do
      Begin
      If (l=1) Or (r=len) then
	    Break;


	 ExtendLeft;
	 ExtendRight;
         If Lower(s[l])<>Lower(s[r]) then
	    Break
	 Else
	 Begin
	    Inc(now,2);
	    If now>ans then
	    Begin
	       ansl:=l;
	       ansr:=r;
	       ans:=now;
	    End;
	 End;
      End;
    End;
   End;
   Writeln(ans);
   sum:=0;
   For i:=1 to totl do
   Begin
    Inc(sum,ll[i]);
    If sum>=ansl then
     Break;
   End;
   r:=i+1;
   For i:=ansl to ansr-1 do
   Begin
    Write(s[i]);
    If i=sum then
    Begin
     Writeln;
     sum:=sum+ll[r];
     Inc(r);
    End;
   End;
   Writeln(s[ansr]);
   Close(input);
   Close(output);
End.