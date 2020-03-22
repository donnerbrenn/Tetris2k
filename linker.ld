OUTPUT_ARCH(i386:x86-64)
ENTRY(_start)
SEARCH_DIR("/lib"); 
SECTIONS
{
  PROVIDE (__executable_start = SEGMENT_START("text-segment", 0x10000)); . = SEGMENT_START("text-segment", 0x10000) + SIZEOF_HEADERS; . = ALIGN(1) + (. & (1-1));
  .interp : {*(.interp*) }
  .dynstr : {*(.dynstr*)}
  .text : { *(.text*)}
  .rela.got : {*(.rela.got*)}
  .rodata : { *(.rodata*) }
  .dynsym : {*(.dynsym*)}
  .hash : {*(.hash*)}
  .got : {*(.got*)}

  . = DATA_SEGMENT_ALIGN (CONSTANT (MAXPAGESIZE), CONSTANT (COMMONPAGESIZE));
  .dynamic : { *(.dynamic*) }
  .bss : { *(.bss*)}
  . = DATA_SEGMENT_END (.);
}