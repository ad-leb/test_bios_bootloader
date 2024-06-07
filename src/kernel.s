%include	"src/include/general.inc"
	bits	64
	org	ADDR_KERNEL


kernel:
.preparing:
	mov	ax, 0x0010
	mov	ss, ax
	mov	es, ax
	mov	ds, ax
	mov	rsp, 0x90000


.main:
	mov	ah, 0x1f
	mov	al, 0x41
	mov	rcx, 0x600
	mov	rdi, 0xb8000
	rep 	stosw










	



end_of_execution:
	cli
	hlt
includes:
;%include 	"src/include/kernel.inc"
