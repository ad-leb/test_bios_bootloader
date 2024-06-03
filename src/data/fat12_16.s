;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;||  data  ||||||||  data  ||||||||  data  ||||||||  data  |||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
fat_offset:	dw	0x00		; |
root_offset:	dw	0x00		; --> sector on disk
data_offset:	dw	0x00		;/

fat_size:	db	0x00		; --> sectors on disk
root_size:	db	0x00		;/




fat_table:	dw	0xd000		; --> address in memory
root_table:	dw	0xa000		;/

ptr_load_sector:dw	0x0000		; --> choosing by drive_number routine
ptr_fat_error:	dw	0x0000		; --> setting error handler




disk_address_packet:
.packet_size:	db	0x10
.reserved:	db	0x00
.sector_count:	dw	0x0000
.mem_address:	dd	0x00000000
.sector_lba:	dq	0x0000000000000000
