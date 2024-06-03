
;###############################################################
;			load_sector
;_______________________________________________________________
; input:	di -- address in memory to load;
; 		si -- LBA addres of sector to load;
;		cx -- count of sectors;
;###############################################################
load_sector:
	pusha

.base_loop:
	push	cx

	mov	al, cl
	mov	bx, di
	call	lba_to_chs
	mov	dl, [bsDriveNumber]
	mov	ah, 0x02
	int	0x13
	jc	.error

	pop	cx
	xor	ah, ah
	sub	cx, ax
	or	cx, cx
	jnz	.base_loop




.fin:
	popa
	ret

.error:
	jmp	[ptr_fat_error]
