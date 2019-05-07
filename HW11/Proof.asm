;Logan Passi/Program that prooves that addition and subtraction changes the Zero and Signed Flag

INCLUDE Irvine32.inc

.data
	var1 BYTE 5

.code
main PROC

	sub var1, 6 ;The Zero Flag will be 0 because the operation underflowed and the product is not 0 and the Signed Flag will be 1 because
				;the most significant bit is 1
	call DumpRegs

	add var1, 1 ;The Zero Flag will be 1 because the operation overflowed and ended up with a value of 0 and the Signed Flag will be 0 because
				;the most significant bit is 0
	call DumpRegs


	mov al, 5
	sub al, 6 ;The Zero Flag will be 0 because the operation underflowed and the product is not 0 and the Signed Flag will be 1 because
			  ;the most significant bit is 1
	call DumpRegs

	add al, 1 ;The Zero Flag will be 1 because the operation overflowed and ended up with a value of 0 and the Signed Flag will be 0 because
			  ;the most significant bit is 0
	call DumpRegs

	exit
main ENDP
END main