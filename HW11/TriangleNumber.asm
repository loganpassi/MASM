;Logan Passi/Program calculates the larges triangle number that can be held in an unsigned doubleword

INCLUDE Irvine32.inc

.data

.code
main PROC

mov eax, 0
mov edx, 1

again:
	mov ebx, eax
	add eax, edx
	inc edx
	jc done ;If the carry flag holds a value of 1 then the largest value had been overwritten
			;so I take the previous value and that will be the largest value 
	loop again

done:
	mov eax, ebx
	call WriteDec ;Output in a positive integer
	call Crlf
	call WriteHex ;Output in a hex
	call Crlf

	exit
main ENDP
END main