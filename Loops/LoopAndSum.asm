;Logan Passi/ Program that loops and sums values

INCLUDE Irvine32.inc

.data
	sum DWORD 0

.code
main PROC
	mov ecx, 10
	mov eax, 0
	again:
		add eax, 1
		add sum, eax
		call WriteInt
	loop again
	mov eax, sum
	call WriteInt
	exit
main ENDP
END main