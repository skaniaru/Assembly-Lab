;The idea is to add two number let's say 5 and 3
;First identify the storage locations of first value, second value and the sum
    
num1 equ 0x0C ;store num1 in that memory location
num2 equ 0x0D ;store num2 in that memory location
sum equ 0x0E ;store sum in that memory location

;start the program
org 0x00

;move the first number into the working register and store it in the appropriate address
start movlw .5
movwf num1
 
;move the second number into the working register and store it in the appropriate address
movlw .3
movwf num2

;move the first number back to working register
movf num1,w

;add the number in the working register with the second number
addwf num2,w
 
;store the number in the working register to sum
movwf sum

;clear values in the memory addresses
clrf num1
clrf num2
clrf sum

;start the loop again
goto start

;end the program
end
 

