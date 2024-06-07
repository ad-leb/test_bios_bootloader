
;###############################################################
;			search_file
;_______________________________________________________________
; input:	si -- FAT name of file;
; output:	si -- number of cluster;
;		cx -- pointer to count of clusters;
;###############################################################
search_file:
	push	di

	mov	di, ADDR_ROOT_TABLE_16
	mov	cx, [ROOT_ENTRIES]

.loop:
	push	si
	push	di
	push	cx

	mov	cx, 11
	repe	cmpsb

	pop	cx
	pop	di
	pop	si

	jz	.found
.next_entery:
	add	di, 0x20
	loop	.loop


.not_found:
	mov	di, [ptr_fat_error]
	add	di, 2
	jmp	di
.found:
	add	di, 0x001a
	mov	si, word [di]
	add	di, 0x0002
	mov	cx, word [di]


.fin:
	pop	di
	ret
