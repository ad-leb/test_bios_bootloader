%include	"src/include/general.inc"
	org	ADDR_STAGE_2
	bits	16



stage_2:
.load_krnl:
	lea	di, load_sector_ext
	lea	si, load_sector
	lea	ax, error_fat_short
	call	prepare_fat

	lea	si, name_krnl
	mov	di, ADDR_KERNEL
	call	load_file

.switch_A20:
	in	al, 0x92
	or	al, 1 << 1
	out	0x92, al



.set_cr3:
	mov	edi, ADDR_PTML4
	mov	cr3, edi
.clear_tables:
	xor	eax, eax
	mov	ecx, 0x1000
	rep	stosd
.set_tables:
	mov	edi, ADDR_PTML4
	mov	dword [edi], 0x2003
	add	edi, 0x1000
	mov	dword [edi], 0x3003
	add	edi, 0x1000
	mov	dword [edi], 0x4003
	add	edi, 0x1000
.set_offsets_entry:
	mov	ecx, 0x200
	mov	eax, 0x00000003
.loop_set_offset_entry:
	mov	[edi], eax
	add	eax, 0x1000
	add	edi, 8
	loop	.loop_set_offset_entry
.set_PAE:
	mov	eax, cr4
	or	eax, 1 << 5
	mov	cr4, eax
.switch_LM:
	mov	ecx, 0xC0000080
	rdmsr
	or	eax, 1 << 8
	wrmsr


.switch_PM_and_PG:
	mov	eax, cr0
	or	eax, 1 << 0 | 1 << 31
	mov	cr0, eax


.load_gdt:
	call	load_gdt
.jump_32:
	jmp	0x08:ADDR_KERNEL









end_of_execution:
	cli
	hlt
includes:
%include 	"src/include/stage_2.inc"
