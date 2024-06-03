
;###############################################################
;		cluster_to_sector
;_______________________________________________________________
; input:	si -- cluster's number;
; output:	si -- LBA address of sector;
;###############################################################
cluster_to_sector:
	push	ax
	push	dx

	mov	ax, si
	dec	ax
	dec	ax

	xor	dx, dx
	mov	dl, byte [bpbSectorsPerCluster]
	mov	si, dx
	mul	si

	add	ax, word [data_offset]

	mov	si, ax

.fin:
	pop	dx
	pop	ax
	ret
