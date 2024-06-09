
;###############################################################
;			error_fat_short
;_______________________________________________________________
;###############################################################
error_fat_short:

	nop
	nop

.print_err:
	lea	si, msg_error
	mov	bx, 0x07
	mov	ah, 0x0e
.print_loop:
		lodsb
	or	al, al
	jz	.end_print
	int	0x10
	jmp	.print_loop
.end_print:


.end_of_execution:
	xor	ax, ax
	int	0x16
	int	0x19
