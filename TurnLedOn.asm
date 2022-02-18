; ----------------------------------------------------------------------
; A simple program to illuminate the LED
; LED which is connected to RA3 need to be illuminate
; pin RA0 configur as an input.
; RA0 will be turn ON/OFF the LED
; ----------------------------------------------------------------------
;
; -------------------- Select the project target -----------------------
;
list p=16f88
;
; -------------------- Program Equates ---------------------------------
;
status equ 0x03
trisa equ 0x85
porta equ 0x05
ansel equ 0x9B
W equ 0
f equ 1
;
; --------------------- Main Program -----------------------------------
;
org 0x00
;
Start bsf status,5 ; Select Bank1
movlw 0x01 ; Set RA0 pin as an input and all other as output
movwf trisa
clrf ansel ; set all portA as digital ports
bcf status,5 ; Select Bank0

;bit test file register and skip the next instruction if bit is set.
test btfss porta,0 ; check if switch ON 
goto test
bsf porta,3 ; Turn on LED
 
;bit test file register and skip the next instruction if bit is clear.
test2 btfsc porta,0 ; check if switch OFF
goto test2
bcf porta,3 ; turn off LED

goto test ; check the switch again
end
