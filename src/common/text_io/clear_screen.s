
;###############################################################
;			clear_screen
;_______________________________________________________________
;###############################################################
clear_screen:
	pusha

.prepare_values:
	mov	edi, VIDEOMEM			; begin of video memory

	mov	eax, COL			; |
	mov	ecx, ROW			; |
	mul	ecx				; --> get count of iteration
	mov	ecx, eax			;/

	mov	ah, byte [char_attr]		; --> get character (0) with it's attribute
	xor	al, al				;/

.fill_screen:
	rep	stosw

.done:
.fin:
	popa
	ret
