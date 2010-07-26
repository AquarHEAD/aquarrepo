Program Sbt;
Const
   maxn	= 2000000;
Var
   key,s,left,right,a,b	: Array[0..maxn] Of Longint;
   tt,q			: Longint;
   
Procedure Init;
Begin
   Readln(q);
   For q:=1 to q do
      Readln(a[q],b[q]);
End; { Init }

Procedure Work;
Var
   t,k : Longint;
   Procedure Right_Rotate(Var t	:Longint );Inline;
   Begin
      k:=left[t];
      left[t]:=right[k];
      right[k]:=t;
      s[k]:=s[t];
      s[t]:=s[left[t]]+s[right[t]]+1;
      t:=k;
   End; { Right_Rotate }
   Procedure Left_Rotate(Var t :Longint );Inline;
   Begin
      k:=right[t];
      right[t]:=left[k];
      left[k]:=t;
      s[k]:=s[t];
      s[t]:=s[left[t]]+s[right[t]]+1;
      t:=k;
   End; { Left_Rotate }
   Procedure Maintain(Var t : Longint;flag:Boolean );Inline;
   Begin
      If Not flag then
	 If s[left[left[t]]]>s[right[t]] then
	    Right_Rotate(t)
	 Else
	    If s[right[left[t]]]>s[right[t]] then
	    Begin
	       Left_Rotate(left[t]);
	       Right_Rotate(t);
	    End
	    Else
	       Exit;
   Else
      If s[right[right[t]]]>s[left[t]] then
	 Left_Rotate(t)
      Else
	 If s[left[rigth[t]]]>s[left[t]] then
	 Begin
	    Right_Rotate(right[t]);
	    Left_Rotate(t);
	 End
	 Else
	    Exit;
      Maintain(left[t],False);
      Maintain(right[t],True);
      Maintain(t,True);
      Maintain(t,False);
   End; { Maintain }
   Procedure Insert(Var t,v :Longint );Inline;
   Begin
      If t=0 then
      Begin
	 Inc(tt);
	 t:=tt;
	 key[t]:=v;
	 s[t]:=1;
	 left[t]:=0;
	 right[t]:=0;
      End
      Else
      Begin
	 Inc(s[t]);
	 If v<key[t] then
	    Insert(left[t],v)
	 Else
	    Insert(right[t],v);
	 Maintain(t,v>=key[t]);
      End;
   End; { Insert }
   Function Delete(Var t : Longint;v:Longint ):Longint;Inline;
   Begin
      Dec(s[t]);
      If (v)