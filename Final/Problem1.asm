;Logan Passi/ Final Exam Problem 1

INCLUDE Irvine32.inc

.data
	enterValue BYTE "Enter a value: ", 0
	smurfBerries BYTE "SmurfBerries", 0
	smurf BYTE "Smurf", 0
	berries BYTE "Berries", 0
	ohGargamel BYTE "Oh Gargamel!", 0

	value DWORD ?

.code
main PROC
	mov eax, 0
	
	mov edx, OFFSET enterValue	;Prompt the user for input
	call WriteString
	call ReadInt				;Get the input from the user and it goes into eax register
	mov value, eax				;Move the value into the value variable to keep it
	mov edx, 0

	mov ecx, 15
	div ecx						;Divide the entered value by 15

	cmp edx, 0					;Compare the remainder of the division to zero
	je smrfB

	mov eax, value
	mov edx, 0

	mov ecx, 5
	div ecx						;Divide the entered value by 5

	cmp edx, 0					;Compare the remainder of the division to zero
	je smrf

	mov eax, value
	mov edx, 0

	mov ecx, 3					;Divide the entered value by 3
	div ecx

	cmp edx, 0					;Compare the remainder of the division to 0
	je b

	mov edx, OFFSET ohGargamel	;Else statement
	call WriteString
	jmp done

	smrfB:
	mov edx, OFFSET smurfBerries
	call WriteString
	jmp done

	smrf:
	mov edx, OFFSET smurf
	call WriteString
	jmp done

	b:
	mov edx, OFFSET berries
	call WriteString

	done:
	call Crlf
	call WaitMsg

	exit
main ENDP
END main