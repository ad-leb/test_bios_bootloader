
;###############################################################
;			switch_A20
;_______________________________________________________________
;###############################################################
switch_A20:
	push	eax

	in	al, 0x92
	or	al, 1 << 1
	out	0x92, al
.fin:
	pop	eax
	ret
