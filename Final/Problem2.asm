;Logan Passi/ Final Exam Problem 2

INCLUDE Irvine32.inc

.data
	enterValue BYTE "Enter a value: ", 0
	valueIs BYTE "The square root is: ", 0

	value DWORD ?

.code
main PROC

	mov edx, OFFSET enterValue
	call WriteString

	mov eax, 0
	call ReadInt

	mov edx, OFFSET valueIs
	call WriteString

	push eax
	call IntegerSquareRoot
	call WriteInt

	call Crlf
	call WaitMsg

	
	exit
main ENDP


IntegerSquareRoot PROC
	push ebp
	mov ebp, esp
	sub esp, 8
	mov DWORD PTR [ebp - 4], 0 ;Subtractions local variable
	mov DWORD PTR [ebp - 8], 1 ;Subtractant local variable

	mov eax, [ebp + 8]

	again:
	cmp eax, [ebp - 8]
	jl done
	sub eax, [ebp - 8]
	inc DWORD PTR [ebp - 4]
	add DWORD PTR [ebp - 8], 2
	jmp again

	done:
	mov eax, DWORD PTR [ebp - 4]

	add esp, 8
	pop ebp
	ret 4
IntegerSquareRoot ENDP
END main