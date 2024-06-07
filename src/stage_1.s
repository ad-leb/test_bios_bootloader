	org	0x7c00
	bits	16

stage_1:
	jmp	main
.includes:
%include "src/include/stage_1.inc"



main:
.preparing:
	mov	byte [bs.DriveNumber], dl		; BIOS put drive number in DL before exec

	xor	ax, ax					; |
	mov	es, ax					; |
	mov	ds, ax					; |
	mov	ss, ax					; --> registers set
	mov	sp, 0x9000				;/

	mov	ax, 0x0003				; --> clear screen + use graphic mode
	int	0x10					;/

	lea	di, load_sector_ext			; hard drive load routine
	lea	si, load_sector				; floppy drive load routine
	lea	ax, error_fat_short			; error handler
	call	prepare_fat				; load tables, set variables





.work:
	lea	si, name_file				; stage_2 file's name
	mov	di, 0x5000				; address where load this file
	call	load_file

	jmp	0x5000









bottom_of_stage_1:
	times 510 - ($-$$) db 0
		dw	0xAA55
