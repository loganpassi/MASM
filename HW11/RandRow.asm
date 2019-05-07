;Logan Passi/Program that generates a random row and outputs a zero on that row and continues to do this 25 times

INCLUDE Irvine32.inc

.data

.code
main PROC

	mov dl, 2 ;Column
	mov dh, 0 ;Row

	call Clrscr

	mov ecx, 25 ;loop 25 times

	again:

	call Random32 ;Generate a random number and puts it into eax
	mov dh, al

	call Gotoxy

	mov eax, 0 ;Output the 0 integer
	call WriteInt

	mov eax, 150 ;Wait 150 milliseconds
	call Delay
	loop again
	exit
main ENDP
END main