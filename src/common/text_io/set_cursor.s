
;###############################################################
;			set_cursor
;_______________________________________________________________
;###############################################################
set_cursor:
	pusha

.get_position:
	call	get_text_position
	sub	edi, VIDEOMEM
	shr	di, 1
	mov	bx, di

.set_high_byte:
	mov	dx, 0x03d4
	mov	al, 0x0e
	out	dx, al

	inc	dx
	mov	al, bh
	out	dx, al
.set_low_byte:
	dec	dx
	mov	al, 0x0f
	out	dx, al

	inc	dx
	mov	al, bl
	out	dx, al

.done:
.fin:
	popa
	ret
