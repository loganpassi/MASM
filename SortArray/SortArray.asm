;Logan Passi/Short program to test if an array is sorted

INCLUDE Irvine32.inc

.data
	sortArr SDWORD -5, -2, 0, 2, 5
	unsortArr SDWORD -5, -2, 0, 5, 2

.code
main PROC
	
	push ecx
	push eax
	push edx
	
	mov ecx, LENGTHOF sortArr ;ecx register holds the number of elements in each array is held in ecx

	mov edi, OFFSET sortArr ;edi register is the pointer to the sortArr
	call isSorted ;Call the isSorted function to see if the current array is sorted

	call WriteInt
	call Crlf

	mov edi, OFFSET unsortArr ;edi register is the pointer to the sortArr
	call isSorted ;Call the isSorted function to see if the current array is sorted

	call WriteInt
	call Crlf

	pop edx
	pop eax
	pop ecx


	exit
	main ENDP

	isSorted PROC ;isSorted function that checks if an array is numerically sorted
	push edi
		mov eax, 1
		again:
			mov edx, [edi + 4]
			cmp edx, [edi]
			jl done
			inc DWORD PTR [edi]
			loop again
		mov eax, 0
		done:
		pop edi
		ret
	isSorted ENDP
END main