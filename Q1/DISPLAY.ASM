TITLE display.asm

EXTRN printmessage: ABS

.MODEL small

.DATA

		EXTRN mymessage: BYTE
		
.CODE
PUBLIC display

display PROC
		mov ax, 4000H
		mov bx, 1
		mov cx, printmessage
		mov dx, OFFSET mymessage
		int 21h
		ret
display ENDP
END