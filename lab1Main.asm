; A simple program to illuminate and LED connected to RA3 of PORTA
; The LEDs are connected to PORTB
; change the program to flash the LED within 70us
 
;Assign labels to memory addresses
status equ 0x03 ;FSR for bank1
trisb equ 0x86 ;memory location for TRISA
portb equ 0x06 ;memory location for PORTB
del_500 equ 0x2c ;memory location for Program Counter (PC) Least Significant Byte
W equ 0
f equ 1


org 0x00 ;start the program
 
start bsf status,5 ;Move to Bank 1
movlw 0x00 ;set only RB3 and RB4 pins as output pins
movwf trisb
bcf status,5 ;move back to bank 0
 
;turn off all portB pins (turn off all LEDs)
movlw 0x00
movfw portb
 
;Turn on the 2 LED's at the same time and wait for 5 seconds
bsf portb,3 ;turn ON LED 3
bsf portb,4 ;turn ON LED 4
call delay_500 ;call the delay

;Turn off both LED's
bcf portb, 3 ;turn OFF LED 3
bcf portb, 4 ;turn OFF LED 4

;Start the alternating process by turning on LED 4, waiting for 5 seconds then turning on LED 3
;Keep on looping between the ON and OFF cycles of LED 3 and 4

loop1 bsf portb,4 ;turn ON LED 4
call delay_500 ;call the delay
bsf portb, 3 ;turn ON LED 3
bcf portb, 4 ;turn OFF LED 4
call delay_500 ;call the delay
bcf portb, 3 ;turn OFF LED 3
goto loop1 ;go back to start of the loop1

;DELAY LOOP DEFINITION
delay_500 movlw .166 ;call this process delay_500, it adds 166 to the working register
	  movwf del_500 ;move the value in the working register to del_500
loop	  decfsz del_500,1 ;start the counter from 166 and decrease by 1 per cycle
	  goto loop ;go back to the previous step and decrease by 1 (loop)
	  return ; end the delay_500 function
	  
;end the program
end