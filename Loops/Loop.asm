;Logan Passi / Short program that utilizes LOOPS

INCLUDE Irvine32.inc

.data
	prompt BYTE "Enter a value: ", 0
	sum BYTE "The sum is: ", 0

.code
main PROC
	push eax ;Push the eax, ebx and ecx onto the stack
	push ebx ;so that we can return what was there after the
	push ecx ;program has ended.

	mov ecx, 3

	again:
		call Clrscr ;Clear the screen

		mov dl, 0 ;Column
		mov dh, 10 ;Row
		call Gotoxy ;Move the cursor to row 10, column 0

		call getInput ;Call getInput function that gets input from the user
		mov ebx, eax
		call getInput ;Call getInput function that gets input from the user
		add eax, ebx ;Add the values
		mov edx, OFFSET sum
		call WriteString
		mov edx, eax
		call WriteInt
		
		mov eax, 3000
		call Delay ;Wait three seconds or 3000 milliseconds
	loop again

	pop ecx ;Return all original register values
	pop ebx
	pop ecx
	exit


	getInput PROC ;getInput function that prompts and gets the input from the user
			mov edx, OFFSET prompt
			call WriteString
			call ReadInt
			ret
	getInput ENDP


main ENDP
END main