;Logan Passi/Multiply an unsigned integer value by 40 without 
;using the MUL operation or 39 ADD operations.

INCLUDE Irvine32.inc

.data
	prompt BYTE "Enter an unsigned value: ", 0
	product BYTE "The entered value multiplied by 40 is: ", 0

.code
main PROC
	push eax ;Save the value in the eax register

	mov ecx, 4
	call getInput ;Calls the get input function
	again:
		push eax
		add eax, eax
	loop again
	mov edx, eax
	pop eax
	add edx, edx
	add eax, edx
	mov edx, OFFSET product
	call WriteString
	call WriteInt

	pop eax ;Return the value of the saved eax register
	exit

	getInput PROC ;getInput function that prompts and gets the input from the user
		mov edx, OFFSET prompt
		call WriteString
		call ReadInt
		ret
	getInput ENDP

main ENDP
END main