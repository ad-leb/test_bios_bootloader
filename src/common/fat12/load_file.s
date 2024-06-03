
;###############################################################
;			load_file
;_______________________________________________________________
; input:	di -- address in memory to load;
;		si -- name of file;
;###############################################################
load_file:
	pusha

	call	search_file
	call	cluster_to_sector

	shr	cx, 9			; gonna read by sectors, not bytes
	inc	cx
	call	[ptr_load_sector]
.fin:
	popa
	ret
