
;###############################################################
;			puts
;_______________________________________________________________
; input:	esi -- string to print;
;###############################################################
puts:
	push	rdi
	push	rsi
	push	rax

.print_loop:
		lodsb
	call	putc
	jc	.done
	jmp	.print_loop

.done:
	clc
.fin:
	pop	rax
	pop	rsi
	pop	rdi
	ret
