;Logan Passi/ Program that sums the first 10 values of a modified
; Fibonacci sequence

INCLUDE Irvine32.inc

.data
temp DWORD ?

.code
main PROC
	mov ecx, 8
	mov edx, 0
	mov eax, edx
	call WriteInt
	mov ebx, 2
	mov eax, ebx
	call WriteInt

	again:
		mov temp, ebx
		add ebx, ebx
		add ebx, edx
		mov edx, temp
		mov eax, ebx
		call WriteInt

	loop again
	exit
main ENDP
END main