;Logan Passi

INCLUDE Irvine32.inc

.data
	prompt1 BYTE "Enter a number: ", 0
	prompt2 BYTE "Double Factorial: ", 0

.code
main PROC
	mov edx, 0
	mov eax, 0

	mov edx, OFFSET prompt1
	call WriteString
	call ReadInt
	push eax
	call semiFactorial
	exit
main ENDP

semiFactorial PROC
	push  ebp
	mov   ebp, esp
	sub esp, 4

	mov ebx, 0
	mov DWORD PTR [ebp - 4], 1 ;Initialize  local variable to 1
	mov eax, [ebp + 8]

	mov edx, OFFSET prompt2
	call WriteString

	again:
	cmp eax, [ebp - 4]
	jbe done

	mov edx, [ebp - 4]
	mul edx
	mov [ebp - 4], eax
	sub eax, 2
	add ebx, eax


	jmp again
	done:
	mov eax, ebx
	call WriteInt
	pop ebp
	ret
semiFactorial ENDP

END main