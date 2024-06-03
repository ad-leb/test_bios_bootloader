
;###############################################################
;			error_stage_1
;_______________________________________________________________
;###############################################################
error_stage_1:

.case_load_sector:
	jmp	.load_sector
.case_no_file:
	jmp	.no_file
.case_unknown:
	jmp	.unknown


.load_sector:
	lea	si, msg_cant_load
	jmp	.print_err
.no_file:
	lea	si, msg_no_file
	jmp	.print_err
.unknown:
	lea	si, msg_unknown
	jmp	.print_err






.print_err:
	mov	ax, 0xb800
	mov	es, ax

	xor	di, di
	mov	ah, 0x4f
.print_loop:
		lodsb
	or	al, al
	jz	.end_print
		stosw
	jmp	.print_loop
.end_print:


.end_of_execution:
	xor	ax, ax
	int	0x16
	int	0x19
