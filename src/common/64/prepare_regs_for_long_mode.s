
;###############################################################
;		prepare_regs_for_long_mode
;_______________________________________________________________
;###############################################################
prepare_regs_for_long_mode:
	push	edi
	push	eax
	push	ecx


.set_cr3:
	mov	edi, ADDR_PTML4
	mov	cr3, edi
.set_PAE:
	mov	eax, cr4
	or	eax, 1 << 5
	mov	cr4, eax
.switch_LM:
	mov	ecx, 0xC0000080
	rdmsr
	or	eax, 1 << 8
	wrmsr
.switch_PM_and_PG:
	mov	eax, cr0
	or	eax, 1 << 0 | 1 << 31
	mov	cr0, eax


.fin:
	pop	ecx
	pop	eax
	pop	edi
	ret
