;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;||  data  ||||||||  data  ||||||||  data  ||||||||  data  |||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

; Access bits
PRESENT				equ 	1 << 7
NON_SYS				equ	1 << 4
EXEC				equ	1 << 3
DC				equ	1 << 2
RW				equ	1 << 1
ACCESSED			equ	1 << 0

; Flags bits
GRAN_4K				equ	1 << 7
SZ_32				equ	1 << 6
LONG_MODE			equ	1 << 5



gdt:
.null_descriptor:
		dd	0
		dd	0
.code_descriptor:
		dw	0xffff					; limit low
		dw	0x0000					; base low
		db	0 					; base middle
		db	PRESENT | NON_SYS | EXEC | RW		; access
		db 	GRAN_4K | LONG_MODE | 0xf		; granularity
		db	0					; base high
.data_descriptor:
		dw	0xffff					; limit low
		dw	0x0000					; base low
		db	0 					; base middle
		db	PRESENT | NON_SYS | RW			; access
		db 	GRAN_4K | SZ_32 | 0xf			; granularity
		db	0					; base high



.pointer:	dw	$ - gdt - 1				; size of GDT (limit)
		dd	gdt					; base of GDT (base)
