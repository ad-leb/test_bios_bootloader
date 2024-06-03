
;###############################################################
;			puts
;_______________________________________________________________
; input:	esi -- string to print;
;###############################################################
puts:
	pusha

.print_loop:
		lodsb
	call	putc
	jc	.done
	jmp	.print_loop

.done:
	clc
.fin:
	popa
	ret
