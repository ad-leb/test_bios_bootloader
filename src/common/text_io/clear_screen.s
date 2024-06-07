
;###############################################################
;			clear_screen
;_______________________________________________________________
;###############################################################
clear_screen:
	push	rdi
	push	rax
	push	rcx

.prepare_values:
	mov	rdi, VIDEOMEM			; begin of video memory

	mov	rax, COL			; |
	mov	rcx, ROW			; |
	mul	rcx				; --> get count of iteration
	mov	rcx, rax			;/

	mov	ah, byte [char_attr]		; --> get character (0) with it's attribute
	xor	al, al				;/

.fill_screen:
	rep	stosw

.done:
.fin:
	pop	rcx
	pop	rax
	pop	rdi
	ret
