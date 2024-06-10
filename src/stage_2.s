%include	"src/include/general.inc"
	org	ADDR_STAGE_2
	bits	16



stage_2:

.set_video_mode:
	mov	ax, 0x0003
	int	0x10

.load_krnl:
	lea	di, load_sector_ext
	lea	si, load_sector
	lea	ax, error_fat_short
	call	prepare_fat

	lea	si, name_krnl
	mov	di, ADDR_KERNEL
	call	load_file

.switch_long_mode:
	call	switch_A20
	call	set_tables
	call	prepare_regs_for_long_mode
	call	load_gdt






.jump_64:
	jmp	DESCRIPTOR_CODE:ADDR_KERNEL









end_of_execution:
	cli
	hlt
includes:
%include 	"src/include/stage_2.inc"
