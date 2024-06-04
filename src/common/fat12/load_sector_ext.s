
;###############################################################
;			load_sector_ext
;_______________________________________________________________
; input:	di -- address in memory to load;
; 		si -- LBA addres of sector to load;
;		cx -- count of sectors;
;###############################################################
load_sector_ext:
	pusha
	
	xor	ax, ax				; paranoic
	int	0x13

	call	get_disk_address_packet
	mov	dl, byte [DRIVE_NUMBER]
	mov	ah, 0x42
	int	0x13
	jc	.error


.fin:
	popa
	ret

.error:
	jmp	[ptr_fat_error]
