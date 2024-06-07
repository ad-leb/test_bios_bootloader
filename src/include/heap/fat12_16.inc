%define SECTORS_PER_CLUSTER		0x7c0d
%define RESERVED_SECTORS   		0x7c0e
%define ROOT_ENTRIES	   		0x7c11
%define SECTORS_PER_FAT	   		0x7c16
%define SECTORS_PER_TRACK  		0x7c18
%define HEADS_PER_CYLINDER		0x7c1a
%define DRIVE_NUMBER			0x7c24

%define ADDR_FAT_TABLE_16		0xd000
%define ADDR_ROOT_TABLE_16		0xa000


%include "src/data/fat12_16.s"
%include "src/common/fat12/cluster_to_sector.s"
%include "src/common/fat12/get_disk_address_packet.s"
%include "src/common/fat12/lba_to_chs.s"
%include "src/common/fat12/load_file.s"
%include "src/common/fat12/load_sector_ext.s"
%include "src/common/fat12/load_sector.s"
%include "src/common/fat12/prepare_fat.s"
%include "src/common/fat12/search_file.s"
