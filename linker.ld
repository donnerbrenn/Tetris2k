OUTPUT_ARCH(i386:x86-64)
ENTRY(_start)
SEARCH_DIR("/lib"); 
SECTIONS
{
  PROVIDE (__executable_start = SEGMENT_START("text-segment", 0x10000)); . = SEGMENT_START("text-segment", 0x10000) + SIZEOF_HEADERS; . = ALIGN(1) + (. & (1-1));
  .dynamic          : {*(.dynamic*)}
  .text             : {*(.text*)}
  .dynsym           : {*(.dynsym*)}
  .rela.got         : {*(.rela.got*)}
  .rodata           : {*(.rodata*)}
  .interp           : {*(.interp*)}
  .dynstr           : {*(.dynstr*)}
  .bss              : {*(.bss*)}
  .crap             : {*(.gnu.version_r*) *(.shstrtab*) *(.data*) *(.gnu.version*) *(.got*) *(.hash*) *(.plt*) *(.eh_frame*) *(.comment*) *(.note*) } 
}
