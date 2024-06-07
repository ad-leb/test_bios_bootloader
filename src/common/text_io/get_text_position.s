
;###############################################################
;			get_text_position
;_______________________________________________________________
; output:	rdi -- current position in video memory
;###############################################################
get_text_position:
	push	rax
	push	rdx

	xor	rdi, rdi
	xor	rdx, rdx
	xor	rax, rax
.get_row:
	mov	al, byte [cur_y]
	mov	rdi, COL
	mul	di
.get_col:
	xor	rdx, rdx
	mov	dl, byte [cur_x]
	add	rax, rdx
.translate_and_projection:
	mov	rdi, rax
	shl	rdi, 1
	add	rdi, VIDEOMEM


.done:
.fin:
	pop	rdx
	pop	rax
	ret
