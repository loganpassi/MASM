;Logan Passi/Program that shifts each character of a string three places down in the alphabet

INCLUDE Irvine32.inc

.data
	key BYTE 3
	string BYTE "hello there students",  0

.code
main PROC
	
	mov edx, OFFSET string
	call WriteString
	call Crlf
	
	mov al, key

again:
	cmp BYTE PTR [edx], ' '
	je skip
	cmp BYTE PTR [edx], 0
	je done
	add [edx], al
	inc edx
	loop again

skip:
	inc edx
	jmp again

done:
	mov edx, OFFSET string
	call WriteString
	call Crlf

	exit
main ENDP
END main