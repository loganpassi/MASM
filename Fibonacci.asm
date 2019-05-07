;Logan Passi

INCLUDE Irvine32.inc

.data

.code

fibonacci PROC
	push ebp
	mov ebp, esp
	sub esp, 4
	mov DWORD PTR [ebp - 4], 0
	mov eax, [ebp + 8]

	cmp eax, 0
	jl retNegOne
	je retZero

	cmp eax, 1
	je retOne

	sub eax, 1
	push eax
	call fibonacci

	add [ebp - 4], eax

	mov eax, [ebp + 8]
	sub eax, 2
	push eax
	call fibonacci

	add [ebp - 4], eax
	mov eax, [ebp - 4]
	jmp done

	retNegOne:
	mov eax, -1
	jmp done

	retZero:
	mov eax, 0
	jmp done

	retOne:
	mov eax, 1
	jmp done

	done:
	add esp, 4
	pop ebp
	ret 4
fibonacci ENDP



main PROC

	push -2
	call fibonacci
	call WriteInt
	call Crlf

	push 0
	call fibonacci
	call WriteInt
	call Crlf

	push 1
	call fibonacci
	call WriteInt
	call Crlf

	push 7
	call fibonacci
	call WriteInt
	call Crlf

	push 31
	call fibonacci
	call WriteInt
	call Crlf

	exit
main ENDP
END main