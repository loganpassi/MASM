;Logan Passi/Playing Card Compression

INCLUDE Irvine32.inc

.data
	hand DWORD 00001000101001110010110111111000b

	spades BYTE "SPADES", 0
	clubs BYTE "CLUBS", 0
	diamonds BYTE "DIAMONDS", 0
	hearts BYTE "HEARTS", 0

	ace BYTE "A OF ", 0
	king BYTE "K OF ", 0
	queen BYTE "Q OF ", 0
	joker BYTE "J OF ", 0
	ten BYTE "10 OF ", 0
	nine BYTE "9 OF ", 0
	eight BYTE "8 OF ", 0
	seven BYTE "7 OF ", 0
	six BYTE "6 OF ", 0
	five BYTE "5 OF ", 0
	four BYTE "4 OF ", 0
	three BYTE "3 OF ", 0
	two BYTE "2 OF ", 0

.code
main PROC
	mov ecx, 5
	rol hand, 8

	again:
	mov eax, hand
	shl al, 2
	shr al, 2
	mov bl, al
	shl bl, 6
	shr bl, 6

	cmp bl, 0
	je heartsSuit

	cmp bl, 1
	je diamondsSuit

	cmp bl, 2
	je clubsSuit

	mov edx, OFFSET spades
	jmp ranks

	clubsSuit:
	mov edx, OFFSET clubs
	jmp ranks

	diamondsSuit:
	mov edx, OFFSET diamonds
	jmp ranks

	heartsSuit:
	mov edx, OFFSET hearts

	ranks:
	push edx
	shr al, 2

	cmp al, 2
	je twoRank

	cmp al, 3
	je threeRank

	cmp al, 4
	je fourRank

	cmp al, 5
	je fiveRank

	cmp al, 6
	je sixRank

	cmp al, 7
	je sevenRank

	cmp al, 8
	je eightRank

	cmp al, 9
	je nineRank

	cmp al, 10
	je tenRank

	cmp al, 11
	je jokerRank

	cmp al, 12
	je queenRank

	cmp al, 13
	je kingRank

	cmp al, 14
	je aceRank
	

	aceRank:
	mov edx, OFFSET ace
	jmp done

	kingRank:
	mov edx, OFFSET king
	jmp done

	queenRank:
	mov edx, OFFSET queen
	jmp done

	jokerRank:
	mov edx, OFFSET joker
	jmp done

	tenRank:
	mov edx, OFFSET ten
	jmp done

	nineRank:
	mov edx, OFFSET nine
	jmp done

	eightRank:
	mov edx, OFFSET eight
	jmp done

	sevenRank:
	mov edx, OFFSET seven
	jmp done

	sixRank:
	mov edx, OFFSET six
	jmp done

	fiveRank:
	mov edx, OFFSET five
	jmp done

	fourRank:
	mov edx, OFFSET four
	jmp done

	threeRank:
	mov edx, OFFSET three
	jmp done

	twoRank:
	mov edx, OFFSET two
	jmp done

	done:
	call WriteString
	pop edx
	call WriteString
	call Crlf

	rol hand, 6
	
	dec ecx
	jnz again


	exit
main ENDP
END main