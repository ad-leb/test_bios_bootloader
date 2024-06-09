
;###############################################################
;		cluster_to_sector
;_______________________________________________________________
; input:	si -- cluster's number;
; output:	si -- LBA address of sector;
;###############################################################
cluster_to_sector:
	push	ax

	dec	si
	dec	si

	xor	ax, ax
	mov	al, byte [SECTORS_PER_CLUSTER]
	mul	si
	add	ax, word [data_offset]

.done:
	mov	si, ax
.fin:
	pop	ax
	ret
