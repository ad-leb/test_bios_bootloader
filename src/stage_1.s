%include 	"src/include/general.inc"
	org	ADDR_STAGE_1
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
	mov	ss, ax					; --> registers set (and stack)
	mov	sp, 0xe000				;/

	lea	di, load_sector_ext			; hard drive load routine
	lea	si, load_sector				; floppy drive load routine
	lea	ax, error_fat_short			; error handler
	call	prepare_fat				; load tables, set variables





.work:
	lea	si, name_file				; stage_2 file's name
	mov	di, ADDR_STAGE_2			; address where load this file
	call	load_file

	jmp	ADDR_STAGE_2









bottom_of_stage_1:
	times 510 - ($-$$) db 0
		dw	0xAA55
