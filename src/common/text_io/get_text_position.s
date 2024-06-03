
;###############################################################
;			get_text_position
;_______________________________________________________________
; output:	edi -- current position in video memory
;###############################################################
get_text_position:
	push	eax
	push	edx

	xor	edi, edi
	xor	edx, edx
	xor	eax, eax
.get_row:
	mov	al, byte [cur_y]
	mov	edi, COL
	mul	di
.get_col:
	xor	edx, edx
	mov	dl, byte [cur_x]
	add	eax, edx
.translate_and_projection:
	mov	edi, eax
	shl	edi, 1
	add	edi, VIDEOMEM


.done:
.fin:
	pop	edx
	pop	eax
	ret
