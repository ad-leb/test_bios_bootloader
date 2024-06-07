%include	"src/include/general.inc"
	bits	64
	org	ADDR_KERNEL


kernel:
.preparing:
	mov	ax, 0x0010
	mov	es, ax
	mov	ds, ax
	mov	ss, ax
	mov	rsp, 0xf0000


.main:
	mov	ah, 0x1f
	mov	byte [char_attr], ah

	call	clear_screen

	lea	rsi, msg
	call	puts










	



end_of_execution:
	cli
	hlt
includes:
%include 	"src/include/kernel.inc"
