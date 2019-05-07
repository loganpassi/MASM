TITLE first.asm

DOSSEG

.MODEL small

.STACK 100H

.DATA
PUBLIC mymessage, printmessage
	   mymessage DB "Autumn moonlight-", 0AH, 0DH, "a worm digs silently", 0AH, 0DH, "into the chestnut."
	   printmessage EQU $ - mymessage
	   
;	   mymessage DB "a worm digs silently", 0AH, 0DH
;	   printmessage EQU $ - mymessage
	   
;	   mymessage DB "into the chestnut.", 0AH, 0DH
;	   printmessage EQU $ - mymessage
	   
.CODE
		EXTRN display: PROC
		
start:

		mov ax, @data
		mov ds, ax
		
		call display
		
		mov ax, 4C00H
		int 21h
END start