;Logan Passi
;
;==========OutPut==========
;
;+1
;
;+0
;+1
;
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;
;+0
;+0
;+0
;+0
;+0
;+0
;+0
;+1
;
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;+1
;
;Press any key to continue . . .
INCLUDE Irvine32.inc

.data

.code

recursionFunc PROC
	push ebp
	mov ebp, esp

	mov eax, 0
	
	cmp BYTE PTR [ebp + 8], 0
	je done

	mov edx, 0
	mov ecx, 2
	mov eax, [ebp + 8]
	div ecx
	push eax
	mov eax, edx
	call WriteInt
	call Crlf
	pop eax
	push eax
	call recursionFunc

	done:
	pop ebp
	ret 4
recursionFunc ENDP


main PROC
	push 0
	call recursionFunc
	call Crlf

	push 1
	call recursionFunc
	call Crlf

	push 2
	call recursionFunc
	call Crlf

	push 127
	call recursionFunc
	call Crlf

	push 128
	call recursionFunc
	call Crlf

	push 65535
	call recursionFunc
	call Crlf
	exit
main ENDP
END main