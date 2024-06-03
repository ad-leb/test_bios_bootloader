
;###############################################################
;		get_disk_address_packet
;_______________________________________________________________
; input:	di -- address in memory to load;
; 		si -- LBA addres of sector to load;
;		cx -- count of sectors;
;###############################################################
get_disk_address_packet:
	mov	word [disk_address_packet.sector_lba], si
	mov	word [disk_address_packet.sector_count], cx
	mov	word [disk_address_packet.mem_address], di

	lea	si, disk_address_packet
	ret
