
;###############################################################
;			load_file
;_______________________________________________________________
; input:	di -- address in memory to load;
;		si -- name of file;
;###############################################################
load_file:
	pusha

	call	search_file

	shr	cx, 9			; gonna read by sectors, not by bytes
	inc	cx			; + 1 -- file can has not full last sector 

.load_sectors:
	push	di
	push	si
	push	cx

	mov	cl, 1
	call	cluster_to_sector
	call	[ptr_load_sector]

	pop	cx
	pop	si
	pop	di
.check_for_end:
	call	get_next_cluster
	cmp	si, 0x0fff
	jz	.fin

	add	di, 0x200
	loop	.load_sectors


.fin:
	popa
	ret
