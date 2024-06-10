target remote localhost:1234

# Display registers
display/i $pc
display/x $rdi
display/x $rsi
display/x $rax
display/x $rbx
display/x $rcx
display/x $rdx


# Breakpoint to stage_1
b *0x7c00
# Breakpoint to stage_2
b *0x7000
# Breakpoint to kernel
b *0xf000
