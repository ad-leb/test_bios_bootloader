
;###############################################################
;			set_tables
;_______________________________________________________________
;###############################################################
set_tables:
	push	eax
	push	ecx
	push	edi


.clear_tables:
	mov	edi, ADDR_PTML4
	xor	eax, eax
	mov	ecx, 0x1000
	rep	stosd
.set_tables:
	mov	edi, ADDR_PTML4
	mov	dword [edi], 0x2003
	add	edi, 0x1000
	mov	dword [edi], 0x3003
	add	edi, 0x1000
	mov	dword [edi], 0x4003
	add	edi, 0x1000
.set_offsets_entry:
	mov	ecx, 0x200
	mov	eax, 0x00000003
.loop_set_offset_entry:
	mov	[edi], eax
	add	eax, 0x1000
	add	edi, 8
	loop	.loop_set_offset_entry


.fin:
	pop	eax
	pop	ecx
	pop	edi
	ret
