	org	0x0500
	bits	16



stage_2:

.load_gdt:
	call	load_gdt
.switch_A20:
	in	al, 0x92
	or	al, 0x02
	out	0x92, al
.switch_PE:
	mov	eax, cr0
	or	al, 0x01
	mov	cr0, eax
.jump_32:
	jmp	0x08:stage_3



















	bits	32
stage_3:
.preparing:
	mov	ax, 0x10
	mov	es, ax
	mov	ds, ax
	mov	ss, ax
	mov	esp, 0x90000


.main:
	mov	ah, 0xe0
	mov	byte [char_attr], ah
	call	clear_screen

	lea	esi, msg
	call	puts
























end_of_execution:
	cli
	hlt
includes:
	bits	16
%include 	"src/include/stage_2.inc"
	bits	32
%include 	"src/include/stage_3.inc"
