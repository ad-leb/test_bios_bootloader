;###############################################################
;			load_gdt
;_______________________________________________________________
;###############################################################
load_gdt:
	cli
	pusha
	lgdt	[gdt.pointer]
	popa
	sti
.fin:
	ret
