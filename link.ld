OUTPUT_FORMAT("elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64"); SEARCH_DIR("/usr/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib");
SECTIONS {
. = 0x10000;
.interp     :{*(.interp*)}
.text       :{*(.text*) *(.rodata)}
.dynsym     :{*(.dynsym*)*(.dynstr*)*(.dynamic*)}
.gnu.hash   :{*(.gnu.hash)}
/DISCARD/ : {*(.*)}

 }