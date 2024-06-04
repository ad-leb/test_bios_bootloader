;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;||  data  ||||||||  data  ||||||||  data  ||||||||  data  |||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


;***************************************************************
;			OEM name
;_______________________________________________________________
;***************************************************************
OEM:				db	"NEW PACK"
;***************************************************************
;		BIOS Parameter Block
;_______________________________________________________________
;***************************************************************
bpb:
.BytesPerSector:  		dw 	512
.SectorsPerCluster: 		db	1			; SECTORS_PER_CLUSTER	0x7c0d
.ReservedSectors:   		dw	1			; RESERVED_SECTORS	0x7c0e
.NumberOfFATs:      		db	2
.RootEntries:       		dw	224			; ROOT_ENTRIES		0x7c11
.TotalSectors:      		dw	2880
.Media: 	      		db	0xf8
.SectorsPerFAT:     		dw	9			; SECTORS_PER_FAT	0x7c16
.SectorsPerTrack:   		dw	18			; SECTORS_PER_TRACK	0x7c18
.HeadsPerCylinder:  		dw	2			; HEADS_PER_CYLINDER	0x7c1a
.HiddenSectors:     		dd	0
.TotalSectorsBig:   		dd	0
;***************************************************************
;		Extended Record
;_______________________________________________________________
;***************************************************************
bs:
.DriveNumber: 	      		db	0x80			; DRIVE_NUMBER 		0x7c24
.Unused: 	      		db	0
.ExtbootSignature:   		db	0x29
.SerialNumber:	      		dd	0x000ad1eb
.VolumeLabel: 	      		db	"MOS FLOPPY "
.FileSystem: 	      		db	"FAT12   "
