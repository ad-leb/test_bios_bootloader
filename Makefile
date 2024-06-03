.SUFFIXES:
.PHONY: default    boot_1 stage_2 krnl    runf runh    testf testh    tryf tryh 


# some DIR declarations
# |
SRCDIR::= src
BINDIR::= bin

vpath %.s		$(SRCDIR)
vpath %.bin		$(BINDIR)



# some VAR declarations
# |
STG1::= stage_1.bin
STG2::= stage_2.bin
KRNL::= kernel.bin
IMG::= floppy.img



# some EXT declarations
# |
EXP_NON::= 
EXP_BIN::= .bin
EXP_S::= .s



# PHONYs 
# |
default: down $(IMG) boot_1 boot_2 krnl
down:
	@rm -f $(BINDIR)/*
	@rm -f $(IMG)

boot_1: $(STG1)
	@dd if=$(BINDIR)/$(STG1) of=$(IMG) conv=notrunc status=none bs=b count=1
boot_2: $(STG2)
	@lfe push $(IMG) $(BINDIR)/$(STG2)
krnl: $(KRNL)
	@lfe push $(IMG) $(BINDIR)/$(KRNL)

runf:																		# run in qemu as a floppy disk
	@qemu-system-i386 -drive file=$(IMG),format=raw,if=floppy &
runh:																		# run in qemu as a hard disk
	@qemu-system-i386 -drive file=$(IMG),format=raw,if=ide &
testf: 																		# run in qemu as a floppy disk, debug in gdb
	@qemu-system-i386 -drive file=$(IMG),format=raw,if=floppy -s -S &
	@gdb -ex 'target remote localhost:1234'
testh:																		# run in qemu as a hard disk, debug in gdb
	@qemu-system-i386 -drive file=$(IMG),format=raw,if=ide -s -S &
	@gdb -ex 'target remote localhost:1234'
tryf: down default runf														# reset and runf
tryh: down default runh														# reset and runh

push:
	@sudo dd if=$(IMG) of=/dev/sdb







# compilings and creations
# |
%.bin: %.s
	nasm -f bin $^ -o $(BINDIR)/$@
$(IMG):
	lfe born $@ oem=TEST
