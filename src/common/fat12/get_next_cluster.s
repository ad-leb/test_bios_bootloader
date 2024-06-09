
;###############################################################
;			get_next_cluster
;_______________________________________________________________
; input:	si -- current cluster;
; output:	si -- next cluster;
;###############################################################
get_next_cluster:
	push	ax
	push	bx
	push	cx

.get_parity:
	test	si, 1
	setnz	cl

.get_cluster:
	mov	ax, si
	shr	ax, 1
	add	si, ax

	mov	si, [ADDR_FAT_TABLE_16 + si]

.modify_number:
	or	cl, cl
	jz	.even
.odd:	shr	si, 4
	jmp	.fin
.even:	and	si, 0x0fff


.fin:
	pop	cx
	pop	bx
	pop	ax
	ret
