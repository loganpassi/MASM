;Logan Passi

; ---------------------------------------------------------------------
; NOTE!  Students only have to modify the code in the Variance function 
; ---------------------------------------------------------------------

TITLE SemiFactorials

INCLUDE Irvine32.inc

.data
	averageText  BYTE    "The average is:  ", 0
	array        DWORD   3, 7, 10, 20, 30
	valSubAvg    DWORD	 0, 0, 0, 0, 0
	varianceText BYTE    "The variance is: ", 0
	arraySize	 DWORD   0
	averageVal   DWORD	 0
	ttl			 DWORD   0

.code
; --------------------------------------------------------------------------------------------------
; TODO:  Replace this code to calculate the variance value for the array passed into the function
;
; INPUTS:  [ebp + 12] - Pointer to the UNSIGNED doubleword array
;          [ebp + 8]  - The number of elements in the doubleword array
; OUTPUT:  eax        - The CALCULATED variance value...  For this example it's 95.6 or 95 truncated
; --------------------------------------------------------------------------------------------------
Variance PROC
	push ebp
	mov ebp, esp
	mov averageVal, eax
	mov ecx, [ebp + 8] ;move array length onto ecx

	subAvg:
		mov ebx, ecx
		dec ecx
		push eax
		mov eax, 4
		mul ecx
		mov ecx, eax
		pop eax
		mov eax, array[ecx]
		sub eax, averageVal
		mov valSubAvg[ecx], eax
		mov ecx, ebx
	dec ecx
	jnz subAvg

	mov ecx, [ebp + 8] ;move array length onto ecx

	sqrNSum:
		mov ebx, ecx
		dec ecx
		push eax
		mov eax, 4
		mul ecx
		mov ecx, eax
		pop eax
		mov eax, valSubAvg[ecx]
		cdq
		imul valSubAvg[ecx]
		add ttl, eax
		mov ecx, ebx
	dec ecx
	jnz sqrNSum
		
	mov eax, ttl
	mov ebx, 5
	div ebx
	pop ebp
	ret  8							; TAKE BOTH PARAMETERS OFF THE STACK AND RETRUN
Variance ENDP

; --------------------------------------------------------------------------------------------------
; Calculates the average value for the array passed into the function
;
; INPUTS:  [ebp + 12] - Pointer to the UNSIGNED doubleword array
;          [ebp + 8]  - The number of elements in the doubleword array
; OUTPUT:  eax        - The CALCULATED average value...  For this example it's 14
; --------------------------------------------------------------------------------------------------
Average PROC
	push  ebp						; PUSH EBP ONTO STACK
	mov   ebp, esp				    ; FINISH SETTING UP STACK FRAME
	push  ecx						; PUSH USED REGISTERS
	push  edx
	mov   ecx, [ebp + 8]			; LOOP FOR EACH ELEMENT IN THE ARRAY
	mov   edx, [ebp + 12]			; POINTER TO FIRST ARRAY ELEMENT
	mov   eax, 0					; ACCUMULATOR
again:
	add   eax, [edx]				; ADD ELEMENT TO ACCUMULATOR
	add   edx, 4					; MOVE POINTER TO NEXT ELEMENT
	loop  again						; DONE YET?
	mov   edx, 0					; CLEAR EDX TO PREPARE FOR DIVISION
	div   DWORD PTR [ebp + 8]		; EAX WILL HOLD RESULT OF UNSIGNED DIVISION
	pop   edx						; POP BACK USED REGISTERS
	pop   ecx
	pop   ebp						; PUT EBP BACK
	ret   8							; TAKE BOTH PARAMETERS OFF THE STACK AND RETRUN
Average ENDP

main PROC
	mov   edx, OFFSET averageText	; WRITE THE STRING
	call  WriteString
	push  OFFSET array				; ESSENTIALLY THE SAME AS EAX = Average(array, 5)
	push  LENGTHOF array
	call  Average
	call  WriteInt					; WRITE THE AVERAGE (14)
	call  Crlf

	mov   edx, OFFSET varianceText	; WRITE THE STRING
	call  WriteString
	push  OFFSET array				; ESSENTIALLY THE SAME AS EAX = Variance(array, 5)
	push  LENGTHOF array
	call  Variance
	call  WriteInt					; WRITE THE VARIANCE (95)

	call  Crlf
	call  WaitMsg
	exit							; PROGRAM COMPLETE
main ENDP
END main