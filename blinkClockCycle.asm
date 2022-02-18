; A simple program to illuminate and LED connected to RA3 of PORTA
; The LEDs are connected to PORTB
; change the program to flash the LED within 70us
list p=16f88
;Assign labels to memory addresses
status equ 0x03 ;FSR for bank1
trisa equ 0x85 ;memory location for TRISA
porta equ 0x05 ;memory location for PORTA
del_500 equ 0x2c ;memory location for Program Counter (PC) Least Significant Byte
W equ 0
f equ 1

;start the program
org 0x00
 
;Move to Bank 1
start bsf status,5 

;set all PortA pins as output pins
movlw 0x00
movwf trisa
 
;move back to bank 0
bcf status,5
 
;turn off all portA pins (turn off all LEDs)
movlw 0x00
movfw porta
 
;turn on LED 3
bsf porta,3
 
;call the delay
call delay_500

;turn off LED 3
bcf porta, 3

;go back to start of the loop
goto start

;DELAY LOOP DEFINITION
delay_500 movlw .166 ;call this process delay_500, it adds 166 to the working register
	  movwf del_500 ;move the value in the working register to del_500
loop	  decfsz del_500,1 ;start the counter from 166 and decrease by 1 per cycle
	  goto loop ;go back to the previous step and decrease by 1 (loop)
	  return ; end the delay_500 function
	  
;end the program
end