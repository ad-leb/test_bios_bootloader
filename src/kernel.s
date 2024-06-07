	bits	32
	org	0x6000


kernel:
.preparing:
	mov	ax, 0x10
	mov	es, ax
	mov	ds, ax
	mov	ss, ax
	mov	esp, 0x90000


.main:
	mov	ah, 0x1f
	mov	byte [char_attr], ah
	call	clear_screen

	lea	esi, msg
	call	puts










	



end_of_execution:
	cli
	hlt
includes:
%include 	"src/include/kernel.inc"
