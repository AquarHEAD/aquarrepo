code segment
assume cs:code, ds:code
main:
	jmp begin
	old1h dw 0, 0
	poslog dw 0, 0
begin:
	push cs
	pop ds
	
	call encode ; embed encode prog here
	
	xor ax, ax
	mov es, ax
	mov bx, 4
	push es:[bx]
	pop old1h[0]
	push es:[bx+2]
	pop old1h[2] ; backup old int1h vector address
	mov word ptr es:[bx], offset int1h
	mov word ptr es:[bx+2], cs ; write my own int1h prog address
	
	pushf
	pop ax
	or ax, 0100h
	push ax
	popf ; set TF=1, single-step mode
	
	nop ;do not encode this
encode_begin:
	mov cx, 5
next:
	mov ah, 2
	mov dl, 'A'
	int 21h
	loop next
	pushf
	pop ax
	and ax, 0FEFFh
	push ax
	popf
encode_end:
	nop
	
	push old1h[0]
	pop es:[bx]
	push old1h[2]
	pop es:[bx+2]
	mov ah, 2
	mov dl, 'd' ; if all of above is ok, output 'd' for done
	int 21h
	mov ah, 4ch
	int 21h ; return to dos
	
	
int1h:
	push bp
	mov bp,sp
	push bx
	push es
	push cx ; backup registers going to use
	cmp poslog[0], 0 ; check if this is the first time of int1h
	je decode_first ; if true then decode it
	
	mov bx, poslog[0] ; else re-encode previously decoded code first
	mov es, poslog[2]
	mov cx, 7
recode:
	inc byte ptr es:[bx]
	inc bx
	loop recode
	
decode_first:
	mov bx, [bp+2] ; then begin decode proc
	mov es, [bp+4]
	mov poslog[0], bx
	mov poslog[2], es
	mov cx, 7 ; decode 7 bytes to avoid the problem of no interrupt after int21
decode:
	dec byte ptr es:[bx]
	inc bx
	loop decode
skip:
	pop cx
	pop es
	pop bx
	pop bp
	iret ; restore all registers and return

encode:
	push bx
	push cx
	mov bx, offset encode_begin
	mov cx, offset encode_end
	sub cx, bx
	
encode_proc:
	inc byte ptr ds:[bx]
	inc bx
	loop encode_proc
	pop cx
	pop bp
	ret
	
code ends
end main