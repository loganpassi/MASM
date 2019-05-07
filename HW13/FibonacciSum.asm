;Logan Passi/Program that calculates the Fibonacci sequence and sums up the odd numbers

INCLUDE Irvine32.inc

.data
outputStr BYTE "The total of all odd numbers: ", 0
currentSum BYTE "Sum of odds: ", 0

.code
main PROC

mov edx, 0
mov eax, 1 ;Hardcode the first two values, 1 and three
call WriteInt
call Crlf

mov ebx, eax
add edx, ebx
mov eax, 3 ;Second hardcoded starting value
add edx, eax
call WriteInt
call Crlf

again:
	push eax
	add eax, ebx

	cmp eax, 42000000d ;Compare the current value in the eax register to make sure it is not greater than 42million
	jg done ;If it is greater, jump out of the loop

	test al, 00000001b ;Check to see if the current value is an odd number
	jz skip ;If the number is not odd, skip the addition and continue, if it is odd fall down and add the value
	add edx, eax ;edx register holding the sum of all odd numbers
	skip:
	
	pop ebx
	call WriteInt
	call Crlf
	push edx
	mov edx, OFFSET currentSum
	call WriteString
	pop edx
	push eax
	mov eax, edx
	call WriteInt
	pop eax
	call Crlf
	call Crlf
	jmp again

done:
pop eax ;Popping eax because if we have jumped out of the loop eax would not have been popped yet
push edx
mov edx, OFFSET outputStr
call WriteString
pop edx
mov eax, edx
call WriteInt
call Crlf
exit
main ENDP
END main