	org	0x5000
	bits	16

stage_2:
	jmp	main
.includes:
%include 	"src/include/stage_2.inc"



main:
.load_krnl:
	lea	di, load_sector_ext
	lea	si, load_sector
	lea	ax, error_fat_short
	call	prepare_fat

	lea	si, name_krnl
	mov	di, ADDR_KRNL
	call	load_file


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
	jmp	0x08:ADDR_KRNL









end_of_execution:
	cli
	hlt
