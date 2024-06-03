
;###############################################################
;			putc
;_______________________________________________________________
; input:	al -- character to print;
;###############################################################
putc:
	call	get_text_position

.check_character:
	or	al, al
	jz	.end_of_string
	cmp	al, 0x08
	je	.backspace
	cmp	al, 0x09
	je	.char_tabulation
	cmp	al, 0x0a
	je	.line_feed
	cmp	al, 0x0b
	je	.line_tabulation
	cmp	al, 0x0d
	je	.carriage_return

.print_character:
		stosw
	inc	byte [cur_x]

.done:
	call	set_cursor
.fin:
	ret





.end_of_string:
	stc
	jmp	.fin
.backspace:
	dec	byte [cur_x]
	jmp	.done
.char_tabulation:
	mov	al, byte [cur_x]
	shr	al, 3
	inc	al
	shl	al, 3
	mov	byte [cur_x], al
	jmp	.done
.line_tabulation:
	inc	byte [cur_y]
	jmp	.done
.line_feed:
	inc	byte [cur_y]
	mov	byte [cur_x], 0
	jmp	.done
.carriage_return:
	mov	byte [cur_x], 0
	jmp	.done
