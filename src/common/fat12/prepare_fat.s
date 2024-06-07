
;###############################################################
;			prepare_fat
;_______________________________________________________________
; input:	di -- hard loading procedure;
;		si -- floppy loading procedure;
;		ax -- fat error handler;
;###############################################################
prepare_fat:
	pusha

.set_proper_procedure:
	test	byte [DRIVE_NUMBER], 0x80		; bit 7 is for hard drive:            0x80, 0x81, ...
	cmovz	di, si					; clear bit 7 is for floppy drive:    0x00, 0x01, ...
	mov	word [ptr_load_sector], di		; use proper procedure (BIOS 0x13 AH=0x02 or BIOS 0x13 AH=0x42)
.set_fat_error_handler:
	mov	word [ptr_fat_error], ax
	

.fat_offset:
	mov	ax, [RESERVED_SECTORS]
	mov	[fat_offset], ax
.fat_size:
	mov	ax, [SECTORS_PER_FAT]
	mov	[fat_size], al
.root_offset:
	shl	ax, 1
	add	ax, [fat_offset]
	mov	[root_offset], ax
.root_size:
	mov	ax, [ROOT_ENTRIES]
	shr	ax, 4
	mov	[root_size], al
.data_offset:
	add	ax, [root_offset]
	mov	[data_offset], ax

.load_fat:
	mov	di, ADDR_FAT_TABLE_16
	mov	si, [fat_offset]
	mov	cl, [fat_size]
	call	[ptr_load_sector]
.load_root:
	mov	di, ADDR_ROOT_TABLE_16
	mov	si, [root_offset]
	mov	cl, [root_size]
	call	[ptr_load_sector]

.fin:
	popa
	ret
