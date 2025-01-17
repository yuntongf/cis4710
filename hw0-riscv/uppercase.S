        .section .data
input_string:   .asciz "Hello world!"

        # tohost/fromhost are data locations used by Spike
        .align 8
tohost: .byte 0
        .align 8
fromhost: .byte 0

        
        .section .text
        .globl _start
_start:
        # Load the address of the input string into a0
        la a0, input_string
        lb x5, 0(a0)
_loop:
        beq	x5, x0, end_program
        li	x6, 122 # 'z'
        bgt	x5, x6, _advance
        li	x6, 97 # 'a'
        blt	x5, x6, _advance
        addi	x5, x5, -32 # turn to upper case
        sb	x5, 0(a0)
_advance:
	addi	a0, a0, 1
        lb	x5, 0(a0)
        j	_loop      
end_program:
        # jump here when you're done
        j end_program

