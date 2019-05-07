;Logan Passi/Conditional Processing

INCLUDE Irvine32.inc

.data

.code
main PROC

mov eax, 64
mov ebx, 7
Call calcAndDisplay ;Will display 14

mov ebx, 2
Call calcAndDisplay ;Will display 128

mov eax, 4
Call calcAndDisplay ;Will display 16

mov eax, 3
call calcAndDisplay ;Will display 1

exit
main ENDP

calcAndDisplay PROC ;Function that determines what to output based off what eax and ebx holds

push eax ;Push the eax register to store it

test bl, 00000001b ;Checking to see if the value in ebx is an odd number
jnz doubleEBX ;If its odd, double the number

test eax, 11111111111111111111111111111000b ;Checks if the number in the eax register is a multiple of 8
jnz doubleEAX ;If its a multiple of 8, double the number

test al, 00000100b ;Checks if the number in the eax register is a multiple of 4
jnz quad ;If its a multiple of 4, quadruple it

mov eax, 1
jmp done

quad: ;Quadruple the number
add eax, eax
add eax, eax
jmp done

doubleEAX: ;Double the number in eax register
add eax, eax
jmp done

doubleEBX: ;Double the number in ebx register
add ebx, ebx
mov eax, ebx

done:
call WriteInt
call Crlf

pop eax ;Return the data that was in the eax register

ret
calcAndDisplay ENDP

END main