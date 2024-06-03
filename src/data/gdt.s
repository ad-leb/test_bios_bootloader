;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;||  data  ||||||||  data  ||||||||  data  ||||||||  data  |||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
gdt:
.null_descriptor:
		dd	0
		dd	0
.code_descriptor:
		dw	0xffff			; limit low
		dw	0			; base low
		db	0 			; base middle
		db	0b10011010		; access
		db 	0b11001111		; granularity
		db	0			; base high
.data_descriptor:
		dw	0xffff			; limit low
		dw	0			; base low
		db	0 			; base middle
		db	0b10010010		; access
		db 	0b11001111		; granularity
		db	0			; base high
.end:						; end of GDT

toc:		dw	gdt.end - gdt - 1	; size of GDT (limit)
		dd	gdt			; base of GDT (base)
