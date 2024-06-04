
;###############################################################
;			lba_to_chs
;_______________________________________________________________
; input:	si -- LBA address;
; output:	ch -- cylinders;
;		cl -- sectors;
;		dh -- heads;
;###############################################################
lba_to_chs:
	push	ax
	mov	ax, si

.sector:
	xor	dx, dx
	div	word [SECTORS_PER_TRACK]
	mov	cl, dl
	inc	cl
.head:
	xor	dx, dx
	div	word [HEADS_PER_CYLINDER]
	shl	dx, 8
.cylinder:
	mov	ch, al

.fin:
	pop	ax
	ret

