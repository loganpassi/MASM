;Logan Passi/Playing Card Compression 04/18/19

INCLUDE Irvine32.inc

.data
	hand DWORD 00001000101001110010110111111000b ;variable that holds the hand of cards

	error BYTE "Error ", 0
	two BYTE "2 OF ", 0
	three BYTE "3 OF ", 0
	four BYTE "4 OF ", 0
	five BYTE "5 OF ", 0
	six BYTE "6 OF ", 0
	seven BYTE "7 OF ", 0
	eight BYTE "8 OF ", 0
	nine BYTE "9 OF ", 0
	ten BYTE "10 OF ", 0
	jack BYTE "JACK OF ", 0
	queen BYTE "QUEEN OF ", 0
	king BYTE "KING OF ", 0
	ace BYTE "ACE OF ", 0

	hearts BYTE "HEARTS", 0
	diamonds BYTE "DIAMONDS", 0
	clubs BYTE "CLUBS", 0
	spades BYTE "SPADES", 0

	;array to hold all the ranks
	rank DWORD OFFSET error, OFFSET error, OFFSET two, OFFSET three, OFFSET four, OFFSET five, OFFSET six, OFFSET seven, 
	OFFSET eight, OFFSET nine, OFFSET ten, OFFSET jack, OFFSET queen, OFFSET king, OFFSET ace

	;array to hold all the suits
	suit DWORD OFFSET hearts, OFFSET diamonds, OFFSET clubs, OFFSET spades


.code
main PROC

	mov eax, 0
	mov edx, 0
	mov ecx, 5

	rol hand, 8 ;Rotate to the left 8 bits
	again:

	mov eax, hand
	and eax, 60 ;00111100b Check to see if bits 3, 4, 5 and 6 are set or not. These bits will determine the rank of the card
	mov edx, rank[eax]
	call WriteString

	mov eax, hand
	and eax, 3 ;00000011b Check to see if bits 0 and 1 are set or not. These bits will determine the rank of the card
	shl eax, 2 ;Multiple eax by 2^2 or 4 or the length of one dword in bytes
	mov edx, suit[eax]
	call WriteString

	call Crlf

	rol hand, 6 ;Rotate to the left 6 bits

	dec ecx
	jnz again

	exit
main ENDP
END main