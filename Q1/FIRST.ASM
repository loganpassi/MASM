TITLE first.asm

DOSSEG

.MODEL small

.STACK 100H

.DATA
PUBLIC mymessage, printmessage
	   mymessage DB "Hello, world!", 0AH, 0DH
	   printmessage EQU $ - mymessage
	   
.CODE
		EXTRN display: PROC
		
start:

		mov ax, @data
		mov ds, ax
		
		call display
		
		mov ax, 4C00H
		int 21h
END start