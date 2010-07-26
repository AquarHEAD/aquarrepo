Program Kmp_Practice;
Const
   maxlen = 1000;
Var
   p,t	: AnsiString;
   link	: Array[1..maxlen] Of Longint;
   
Procedure Compute_Prefix_Function;
Var
   m,q,k : Longint;
Begin
   m:=Length(p);
   link[1]:=0;
   k:=0;
   For q:=2 to m do
   Begin
      While (k>0) And (p[k+1]<>p[q]) do
	 k:=link[k];
      If p[k+1]=p[q] then
	 Inc(k);
      link[q]:=k;
   End;
End; {  }


Procedure Kmp_Matcher;
Var
   n,m,q,i : Longint;
Begin
   n:=Length(t);
   m:=Length(p);
   q:=0;
   For i:=1 to n do
   Begin
      While (q>0) And (p[q+1]<>t[i]) do
	 q:=link[q];
      If p[q+1]=t[i] then
	 Inc(q);
      If q=m then
      Begin
	 Writeln('Pattern Occurs With Shift ',i-m);
	 q:=link[q];
      End;
   End;
End; { Kmp_Matcher }

Begin
   //Init Your Input Here.
   Readln(p);
   Readln(t);
   Compute_Prefix_Function;
   Kmp_Matcher;
End.