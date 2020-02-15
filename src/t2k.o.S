	.file	"t2k.c"
# GNU C11 (GCC) version 8.3.0 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 8.3.0, GMP version 6.1.2, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.21-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# angegebene Optionen:  src/t2k.c -march=nocona -malign-data=cacheline
# -mno-fancy-math-387 -mno-ieee-fp -auxbase-strip src/t2k.o.S -Os
# -std=gnu11 -fverbose-asm -fno-plt -fno-stack-protector -fstack-check=no
# -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions
# -funsafe-math-optimizations -ffast-math -fomit-frame-pointer
# -ffunction-sections -fdata-sections -fmerge-all-constants -fno-PIE
# eingeschaltete Optionen:  -faggressive-loop-optimizations
# -falign-functions -falign-jumps -falign-labels -falign-loops
# -fassociative-math -fauto-inc-dec -fbranch-count-reg -fcaller-saves
# -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
# -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
# -fchkp-store-bounds -fchkp-use-static-bounds
# -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcode-hoisting
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fcx-limited-range -fdata-sections
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
# -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -ffinite-math-only -fforward-propagate -ffp-int-builtin-inexact
# -ffunction-cse -ffunction-sections -fgcse -fgcse-lm -fgnu-runtime
# -fgnu-unique -fguess-branch-probability -fhoist-adjacent-loads -fident
# -fif-conversion -fif-conversion2 -findirect-inlining -finline
# -finline-atomics -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-bit-cp -fipa-cp -fipa-icf
# -fipa-icf-functions -fipa-icf-variables -fipa-profile -fipa-pure-const
# -fipa-ra -fipa-reference -fipa-sra -fipa-vrp -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmerge-all-constants -fmerge-debug-strings -fmove-loop-invariants
# -fomit-frame-pointer -foptimize-sibling-calls -fpartial-inlining
# -fpeephole -fpeephole2 -fprefetch-loop-arrays -freciprocal-math -free
# -freg-struct-return -freorder-blocks -freorder-blocks-and-partition
# -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
# -fshow-column -fshrink-wrap -fshrink-wrap-separate
# -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-backprop -fssa-phiopt
# -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp
# -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim -ftree-dce
# -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
# -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vrp -funit-at-a-time -funsafe-math-optimizations -fverbose-asm
# -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -maccumulate-outgoing-args -malign-stringops -mcx16 -mfancy-math-387
# -mfp-ret-in-387 -mfxsr -mglibc -mlong-double-80 -mmmx -mno-sse4
# -mpush-args -mred-zone -msse -msse2 -msse3 -mstv -mtls-direct-seg-refs
# -mvzeroupper

	.text
	.section	.text.audio_callback,"ax",@progbits
	.type	audio_callback, @function
audio_callback:
	pushq	%rbp	#
	pushq	%rbx	#
# src/t2k.c:57:     for (int i = 0; i < byte_stream_length>>1; ++i)
	movl	%edx, %ecx	# byte_stream_length, byte_stream_length
	sarl	%ecx	# byte_stream_length
	movl	song_clock(%rip), %r11d	# song_clock, song_clock_lsm.59
	movl	noteCnt(%rip), %r9d	# noteCnt, noteCnt_lsm.57
# src/t2k.c:57:     for (int i = 0; i < byte_stream_length>>1; ++i)
	xorl	%edi, %edi	# ivtmp.92
	xorl	%r8d, %r8d	# song_clock_lsm.60
	xorl	%r10d, %r10d	# noteCnt_lsm.58
# src/t2k.c:59:         if((song_clock)-(song_clock/SPEED*SPEED)==0)
	movl	$10850, %ebx	#, tmp194
# src/t2k.c:46:         freq*=1.05946f;
	movss	.LC1(%rip), %xmm1	#, tmp195
# src/t2k.c:83:                 freq=SAMPLERATE/hertz[j]; 
	movss	.LC2(%rip), %xmm2	#, tmp199
.L2:
	leal	(%r11,%rdi), %eax	#, _84
# src/t2k.c:57:     for (int i = 0; i < byte_stream_length>>1; ++i)
	cmpl	%edi, %ecx	# ivtmp.92, _36
	jle	.L34	#,
# src/t2k.c:59:         if((song_clock)-(song_clock/SPEED*SPEED)==0)
	cltd
	idivl	%ebx	# tmp194
# src/t2k.c:59:         if((song_clock)-(song_clock/SPEED*SPEED)==0)
	testl	%edx, %edx	# tmp142
	jne	.L3	#,
# src/t2k.c:63:                 notes[channel]=cpatterns[channel][order[(noteCnt>>6)&7]][noteCnt&63];
	movl	%r9d, %eax	# noteCnt_lsm.57, tmp146
	sarl	$6, %eax	#, tmp146
# src/t2k.c:63:                 notes[channel]=cpatterns[channel][order[(noteCnt>>6)&7]][noteCnt&63];
	andl	$7, %eax	#, tmp148
	movsbq	order(%rax), %rax	# order, tmp149
	salq	$6, %rax	#, tmp150
	movl	%r9d, %edx	# noteCnt_lsm.57, tmp152
	andl	$63, %edx	#, tmp152
	leaq	cpatterns(%rax,%rdx), %r10	#, _76
# src/t2k.c:63:                 notes[channel]=cpatterns[channel][order[(noteCnt>>6)&7]][noteCnt&63];
	xorl	%eax, %eax	# ivtmp.81
.L8:
# src/t2k.c:63:                 notes[channel]=cpatterns[channel][order[(noteCnt>>6)&7]][noteCnt&63];
	movq	%rax, %rdx	# ivtmp.81, tmp154
	salq	$8, %rdx	#, tmp154
	movsbl	(%r10,%rdx), %edx	# MEM[base: _76, index: _74, offset: 0B], _10
# src/t2k.c:64:                 if(notes[channel]!=previous[channel]&&notes[channel])
	cmpl	%edx, previous(,%rax,4)	# _10, MEM[symbol: previous, index: ivtmp.81_96, step: 4, offset: 0B]
	je	.L4	#,
	testl	%edx, %edx	# _10
	je	.L4	#,
# src/t2k.c:66:                     vol[channel]=1024;
	movw	$1024, vol(%rax,%rax)	#, MEM[symbol: vol, index: ivtmp.81_96, step: 2, offset: 0B]
# src/t2k.c:67:                     previous[channel]=notes[channel];
	movl	%edx, previous(,%rax,4)	# _10, MEM[symbol: previous, index: ivtmp.81_96, step: 4, offset: 0B]
.L4:
# src/t2k.c:69:                 vol[channel]-=100;
	subw	$100, vol(%rax,%rax)	#, MEM[symbol: vol, index: ivtmp.81_96, step: 2, offset: 0B]
# src/t2k.c:71:                 if(notes[channel])
	testl	%edx, %edx	# _10
	je	.L6	#,
# src/t2k.c:44:     for(int i=1;i<note;++i)
	movl	$1, %r8d	#, i
# src/t2k.c:43:     float freq=16.3516f;
	movss	.LC0(%rip), %xmm0	#, freq
.L5:
# src/t2k.c:44:     for(int i=1;i<note;++i)
	cmpl	%r8d, %edx	# i, _10
	jle	.L35	#,
# src/t2k.c:46:         freq*=1.05946f;
	mulss	%xmm1, %xmm0	# tmp195, freq
# src/t2k.c:44:     for(int i=1;i<note;++i)
	incl	%r8d	# i
	jmp	.L5	#
.L35:
# src/t2k.c:73:                     hertz[channel]=getFrq(notes[channel]);
	movss	%xmm0, hertz(,%rax,4)	# freq, MEM[symbol: hertz, index: ivtmp.81_96, step: 4, offset: 0B]
.L6:
	incq	%rax	# ivtmp.81
# src/t2k.c:61:             for(int channel=0;channel<VOICES;++channel)
	cmpq	$3, %rax	#, ivtmp.81
	jne	.L8	#,
# src/t2k.c:76:             noteCnt++;
	incl	%r9d	# noteCnt_lsm.57
	movb	$1, %r10b	#, noteCnt_lsm.58
.L3:
# src/t2k.c:78:         stream[i]=0;
	movw	$0, (%rsi,%rdi,2)	#, MEM[base: byte_stream_50(D), index: ivtmp.92_61, step: 2, offset: 0B]
	xorl	%eax, %eax	# ivtmp.62
.L12:
# src/t2k.c:81:             if(vol[j]>0)
	movswl	vol(%rax,%rax), %edx	# MEM[symbol: vol, index: ivtmp.62_98, step: 2, offset: 0B],
# src/t2k.c:81:             if(vol[j]>0)
	testw	%dx, %dx	# _22
	jle	.L9	#,
# src/t2k.c:83:                 freq=SAMPLERATE/hertz[j]; 
	movaps	%xmm2, %xmm0	# tmp199, tmp172
	divss	hertz(,%rax,4), %xmm0	# MEM[symbol: hertz, index: ivtmp.62_98, step: 4, offset: 0B], tmp172
# src/t2k.c:83:                 freq=SAMPLERATE/hertz[j]; 
	cvttss2si	%xmm0, %ebp	# tmp172, _25
# src/t2k.c:84:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	movl	counter(,%rax,4), %r8d	# MEM[symbol: counter, index: ivtmp.62_98, step: 4, offset: 0B], _26
# src/t2k.c:84:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	cmpl	%r8d, %ebp	# _26, _25
	jg	.L10	#,
	xorl	%r8d, %r8d	# _26
.L10:
# src/t2k.c:88:                 stream[i]+=(++counter[j]<=freq)?vol[j]:-vol[j];
	incl	%r8d	# _28
# src/t2k.c:88:                 stream[i]+=(++counter[j]<=freq)?vol[j]:-vol[j];
	movl	%r8d, counter(,%rax,4)	# _28, MEM[symbol: counter, index: ivtmp.62_98, step: 4, offset: 0B]
# src/t2k.c:87:                 freq>>=2;
	sarl	$2, %ebp	#, tmp176
# src/t2k.c:88:                 stream[i]+=(++counter[j]<=freq)?vol[j]:-vol[j];
	cmpl	%r8d, %ebp	# _28, tmp176
	jge	.L11	#,
# src/t2k.c:88:                 stream[i]+=(++counter[j]<=freq)?vol[j]:-vol[j];
	negl	%edx	# iftmp.17_41
.L11:
# src/t2k.c:88:                 stream[i]+=(++counter[j]<=freq)?vol[j]:-vol[j];
	addw	%dx, (%rsi,%rdi,2)	# iftmp.17_41, MEM[base: byte_stream_50(D), index: ivtmp.92_61, step: 2, offset: 0B]
.L9:
	incq	%rax	# ivtmp.62
# src/t2k.c:79:         for(int j=0;j<VOICES;++j)
	cmpq	$3, %rax	#, ivtmp.62
	jne	.L12	#,
	incq	%rdi	# ivtmp.92
	movb	$1, %r8b	#, song_clock_lsm.60
	jmp	.L2	#
.L34:
	testl	%ecx, %ecx	# _36
	movl	$0, %edx	#, tmp178
	cmovs	%edx, %ecx	# _36,, tmp178, tmp177
	addl	%r11d, %ecx	# song_clock_lsm.59, song_clock_lsm.59
	testb	%r10b, %r10b	# noteCnt_lsm.58
	je	.L14	#,
	movl	%r9d, noteCnt(%rip)	# noteCnt_lsm.57, noteCnt
.L14:
	testb	%r8b, %r8b	# song_clock_lsm.60
	je	.L1	#,
	movl	%ecx, song_clock(%rip)	# song_clock_lsm.59, song_clock
.L1:
# src/t2k.c:93: }
	popq	%rbx	#
	popq	%rbp	#
	ret	
	.size	audio_callback, .-audio_callback
	.section	.text.shuffle,"ax",@progbits
	.type	shuffle, @function
shuffle:
	pushq	%rdx	#
.L39:
# src/t2k.c:30:         result=SDL_GetTicks()&7;
	call	*SDL_GetTicks@GOTPCREL(%rip)	#
# src/t2k.c:30:         result=SDL_GetTicks()&7;
	andl	$7, %eax	#, result
# src/t2k.c:28:     while(result==7||result==nCurrentPiece)
	cmpl	$7, %eax	#, result
	je	.L39	#,
# src/t2k.c:28:     while(result==7||result==nCurrentPiece)
	cmpl	%eax, nCurrentPiece(%rip)	# result, nCurrentPiece
	je	.L39	#,
# src/t2k.c:32:     nCurrentPiece=result;
	movl	%eax, nCurrentPiece(%rip)	# result, nCurrentPiece
# src/t2k.c:33: }
	popq	%rax	#
	ret	
	.size	shuffle, .-shuffle
	.section	.text.drawScore,"ax",@progbits
	.type	drawScore, @function
drawScore:
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	subq	$40, %rsp	#,
	movl	%esi, %ebx	# x, x
# src/t2k.c:198:     SDL_itoa(value,buffer,10);
	movl	$10, %edx	#,
	movl	$buffer.10904, %esi	#,
	call	*SDL_itoa@GOTPCREL(%rip)	#
	movl	$buffer.10904, %r13d	#, ivtmp.117
# src/t2k.c:20:     SDL_Rect rect=(SDL_Rect){x,y,w,w};
	movabsq	$34359738376, %r14	#, tmp122
.L43:
# src/t2k.c:200:     while(buffer[i])
	movsbl	0(%r13), %eax	# MEM[base: _62, offset: 0B],
# src/t2k.c:200:     while(buffer[i])
	testb	%al, %al	# _5
	je	.L54	#,
# src/t2k.c:202:         drawcharacter(buffer[i++]-'0'+1,((FONTSIZE<<2)*i)+x,SCREEN_HEIGHT-45);
	subl	$47, %eax	#, _4
	xorl	%r15d, %r15d	# ivtmp.113
	movl	$915, %r12d	#, ivtmp.111
# src/t2k.c:188:             if(16384 >> (i) & characters2[num])
	cltq
	movswl	characters2(%rax,%rax), %eax	# characters2, tmp116
	movl	%eax, 12(%rsp)	# tmp116, %sfp
.L44:
# src/t2k.c:185:         for(int x=0;x<3;++x)
	xorl	%ebp, %ebp	# x
.L46:
# src/t2k.c:188:             if(16384 >> (i) & characters2[num])
	leal	0(%rbp,%r15), %ecx	#, tmp111
	movl	$16384, %eax	#, tmp113
	sarl	%cl, %eax	# tmp111, tmp112
# src/t2k.c:188:             if(16384 >> (i) & characters2[num])
	testl	%eax, 12(%rsp)	# tmp112, %sfp
	je	.L45	#,
# src/t2k.c:20:     SDL_Rect rect=(SDL_Rect){x,y,w,w};
	leal	(%rbx,%rbp,8), %eax	#, tmp119
	movl	%eax, 16(%rsp)	# tmp119, rect.x
	movl	%r12d, 20(%rsp)	# ivtmp.111, rect.y
	movq	%r14, 24(%rsp)	# tmp122, MEM[(int *)&rect + 8B]
# src/t2k.c:21:     SDL_FillRect(screenSurface,&rect,col);
	movl	$16777215, %edx	#,
	leaq	16(%rsp), %rsi	#,
	movq	screenSurface(%rip), %rdi	# screenSurface,
	call	*SDL_FillRect@GOTPCREL(%rip)	#
.L45:
# src/t2k.c:185:         for(int x=0;x<3;++x)
	incl	%ebp	# x
# src/t2k.c:185:         for(int x=0;x<3;++x)
	cmpl	$3, %ebp	#, x
	jne	.L46	#,
	addl	$8, %r12d	#, ivtmp.111
	addl	$3, %r15d	#, ivtmp.113
# src/t2k.c:184:     for(int y=0;y<5;++y)
	cmpl	$955, %r12d	#, ivtmp.111
	jne	.L44	#,
	incq	%r13	# ivtmp.117
	addl	$32, %ebx	#, ivtmp.118
	jmp	.L43	#
.L54:
# src/t2k.c:204: }
	addq	$40, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	ret	
	.size	drawScore, .-drawScore
	.section	.text.updateBuffer,"ax",@progbits
	.type	updateBuffer, @function
updateBuffer:
# src/t2k.c:12: 	for(size_t i=0;i<numbytes;i++)
	xorl	%eax, %eax	# i
.L56:
# src/t2k.c:14:         ((char*)dest)[i]=((char*)src)[i];
	movb	pBackBuffer(%rax), %dl	# MEM[symbol: pBackBuffer, index: i_12, offset: 0B], MEM[symbol: pBackBuffer, index: i_12, offset: 0B]
	movb	%dl, pBuffer(%rax)	# MEM[symbol: pBackBuffer, index: i_12, offset: 0B], MEM[symbol: pBuffer, index: i_12, offset: 0B]
# src/t2k.c:12: 	for(size_t i=0;i<numbytes;i++)
	incq	%rax	# i
# src/t2k.c:12: 	for(size_t i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, i
	jne	.L56	#,
# src/t2k.c:39: }
	ret	
	.size	updateBuffer, .-updateBuffer
	.section	.text.Rotate,"ax",@progbits
	.globl	Rotate
	.type	Rotate, @function
Rotate:
.L59:
# src/t2k.c:99:     while(r)
	testb	%dl, %dl	# r
	je	.L61	#,
# src/t2k.c:101:         x=12+py-(px<<2);
	addl	$12, %esi	#, tmp104
# src/t2k.c:101:         x=12+py-(px<<2);
	leal	0(,%rdi,4), %eax	#, tmp105
# src/t2k.c:101:         x=12+py-(px<<2);
	subl	%eax, %esi	# tmp105, x
# src/t2k.c:102:         px=x&3;
	movl	%esi, %edi	# x, px
	andl	$3, %edi	#, px
# src/t2k.c:103:         py=x>>2;
	sarb	$2, %sil	#, py
	decl	%edx	# r
	jmp	.L59	#
.L61:
# src/t2k.c:106:     return (py<<2)+px;
	leal	(%rdi,%rsi,4), %eax	#, tmp106
# src/t2k.c:107: }
	ret	
	.size	Rotate, .-Rotate
	.section	.text.DoesPieceFit,"ax",@progbits
	.globl	DoesPieceFit
	.type	DoesPieceFit, @function
DoesPieceFit:
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	movl	%edx, %ebp	# nPosX, nPosX
# src/t2k.c:111:     for(int px=0;px<4;++px)
	xorl	%r8d, %r8d	# px
# src/t2k.c:116:             short pi = (Rotate((px),(py),(nRotation)));
	movsbl	%sil, %r11d	# nRotation, nRotation
# src/t2k.c:119:             if(nPosX + py >=0 && nPosY + py <FIELDHEIGHT && characters[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
	movslq	%edi, %rbx	# nTetromino, nTetromino
.L63:
	movl	%ecx, %r10d	# nPosY, ivtmp.143
# src/t2k.c:113:         for(int py=0;py<4;++py)
	xorl	%r9d, %r9d	# py
# src/t2k.c:119:             if(nPosX + py >=0 && nPosY + py <FIELDHEIGHT && characters[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
	leal	0(%rbp,%r8), %r12d	#, tmp143
.L66:
# src/t2k.c:119:             if(nPosX + py >=0 && nPosY + py <FIELDHEIGHT && characters[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
	movl	%r9d, %eax	# py, tmp146
	addl	%ebp, %eax	# nPosX, tmp146
	js	.L64	#,
	cmpl	$17, %r10d	#, ivtmp.143
	jg	.L64	#,
# src/t2k.c:116:             short pi = (Rotate((px),(py),(nRotation)));
	movl	%r11d, %edx	# nRotation,
	movl	%r9d, %esi	# py,
	movl	%r8d, %edi	# px,
	call	Rotate	#
# src/t2k.c:119:             if(nPosX + py >=0 && nPosY + py <FIELDHEIGHT && characters[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
	movswl	characters(%rbx,%rbx), %edx	# characters, tmp130
# src/t2k.c:119:             if(nPosX + py >=0 && nPosY + py <FIELDHEIGHT && characters[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
	btl	%eax, %edx	# _7, tmp130
	jnc	.L64	#,
# src/t2k.c:119:             if(nPosX + py >=0 && nPosY + py <FIELDHEIGHT && characters[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
	imull	$12, %r10d, %eax	#, ivtmp.143, tmp135
	addl	%r12d, %eax	# tmp143, tmp137
	movswq	%ax, %rax	# tmp137, tmp139
# src/t2k.c:119:             if(nPosX + py >=0 && nPosY + py <FIELDHEIGHT && characters[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
	cmpb	$0, pBuffer(%rax)	#, pBuffer
	jne	.L67	#,
.L64:
# src/t2k.c:113:         for(int py=0;py<4;++py)
	incl	%r9d	# py
	incl	%r10d	# ivtmp.143
# src/t2k.c:113:         for(int py=0;py<4;++py)
	cmpl	$4, %r9d	#, py
	jne	.L66	#,
# src/t2k.c:111:     for(int px=0;px<4;++px)
	incl	%r8d	# px
# src/t2k.c:111:     for(int px=0;px<4;++px)
	cmpl	$4, %r8d	#, px
	jne	.L63	#,
# src/t2k.c:128:     return true;
	movb	$1, %al	#, <retval>
	jmp	.L62	#
.L67:
# src/t2k.c:123:                     return(false);
	xorl	%eax, %eax	# <retval>
.L62:
# src/t2k.c:129: }
	popq	%rbx	#
	popq	%rbp	#
	popq	%r12	#
	ret	
	.size	DoesPieceFit, .-DoesPieceFit
	.section	.text.initGame,"ax",@progbits
	.globl	initGame
	.type	initGame, @function
initGame:
	pushq	%rcx	#
# src/t2k.c:255:     score=0;
	movl	$0, score(%rip)	#, score
# src/t2k.c:257:     shuffle();
	xorl	%eax, %eax	#
	call	shuffle	#
# src/t2k.c:258:     nCurrentX=(FIELDWIDTH>>2)+1;
	movb	$4, nCurrentX(%rip)	#, nCurrentX
# src/t2k.c:4:     for(size_t i=0;i<numbytes;i++)
	xorl	%eax, %eax	# i
.L78:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movb	$9, pBackBuffer(%rax)	#, MEM[symbol: pBackBuffer, index: i_35, offset: 0B]
# src/t2k.c:4:     for(size_t i=0;i<numbytes;i++)
	incq	%rax	# i
# src/t2k.c:4:     for(size_t i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, i
	jne	.L78	#,
	xorl	%eax, %eax	# ivtmp.167
.L80:
# src/t2k.c:4:     for(size_t i=0;i<numbytes;i++)
	xorl	%edx, %edx	# i
.L79:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movb	$0, pBackBuffer+1(%rax,%rdx)	#, MEM[symbol: pBackBuffer, base: ivtmp.167_30, index: i_36, offset: 1B]
# src/t2k.c:4:     for(size_t i=0;i<numbytes;i++)
	incq	%rdx	# i
# src/t2k.c:4:     for(size_t i=0;i<numbytes;i++)
	cmpq	$10, %rdx	#, i
	jne	.L79	#,
	addq	$12, %rax	#, ivtmp.167
# src/t2k.c:260:     for(int y=0;y<FIELDHEIGHT-1;y++)
	cmpq	$204, %rax	#, ivtmp.167
	jne	.L80	#,
# src/t2k.c:264:     updateBuffer();
	xorl	%eax, %eax	#
# src/t2k.c:265: }
	popq	%rdx	#
# src/t2k.c:264:     updateBuffer();
	jmp	updateBuffer	#
	.size	initGame, .-initGame
	.section	.text._start,"ax",@progbits
	.globl	_start
	.type	_start, @function
_start:
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	subq	$64, %rsp	#,
# src/t2k.c:320:     asm ("sub $8, %rsp\n");
#APP
# 320 "src/t2k.c" 1
	sub $8, %rsp

# 0 "" 2
# src/t2k.c:321:     initGame();
#NO_APP
	xorl	%eax, %eax	#
	call	initGame	#
# src/t2k.c:299:     SDL_Init(SDL_INIT_EVERYTHING);
	movl	$62001, %edi	#,
	call	*SDL_Init@GOTPCREL(%rip)	#
# src/t2k.c:301:     want.freq = SAMPLERATE;
	movl	$96000, 8(%rsp)	#, want.freq
# src/t2k.c:302:     want.format = AUDIO_S16SYS;
	movw	$-32752, 12(%rsp)	#, want.format
# src/t2k.c:303:     want.channels=1;
	movb	$1, 14(%rsp)	#, want.channels
# src/t2k.c:304:     want.samples = BUFFERSIZE;
	movw	$4096, 16(%rsp)	#, want.samples
# src/t2k.c:305:     want.callback = audio_callback;    
	movq	$audio_callback, 24(%rsp)	#, want.callback
# src/t2k.c:306:     SDL_OpenAudio((&want), NULL);
	xorl	%esi, %esi	#
	leaq	8(%rsp), %rdi	#, tmp252
	call	*SDL_OpenAudio@GOTPCREL(%rip)	#
# src/t2k.c:307:     SDL_PauseAudio(0);
	xorl	%edi, %edi	#
	call	*SDL_PauseAudio@GOTPCREL(%rip)	#
# src/t2k.c:309:     window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
	xorl	%r9d, %r9d	#
	movl	$960, %r8d	#,
	movl	$620, %ecx	#,
	xorl	%edx, %edx	#
	xorl	%esi, %esi	#
	xorl	%edi, %edi	#
	call	*SDL_CreateWindow@GOTPCREL(%rip)	#
# src/t2k.c:309:     window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
	movq	%rax, window(%rip)	# _19, window
# src/t2k.c:310:     screenSurface = SDL_GetWindowSurface(window);
	movq	%rax, %rdi	# _19,
	call	*SDL_GetWindowSurface@GOTPCREL(%rip)	#
# src/t2k.c:310:     screenSurface = SDL_GetWindowSurface(window);
	movq	%rax, screenSurface(%rip)	# _20, screenSurface
# src/t2k.c:20:     SDL_Rect rect=(SDL_Rect){x,y,w,w};
	movabsq	$206158430256, %rbp	#, tmp249
.L109:
# src/t2k.c:12: 	for(size_t i=0;i<numbytes;i++)
	xorl	%eax, %eax	# i
.L86:
# src/t2k.c:14:         ((char*)dest)[i]=((char*)src)[i];
	movb	pBuffer(%rax), %dl	# MEM[symbol: pBuffer, index: i_248, offset: 0B], MEM[symbol: pBuffer, index: i_248, offset: 0B]
	movb	%dl, pBackBuffer(%rax)	# MEM[symbol: pBuffer, index: i_248, offset: 0B], MEM[symbol: pBackBuffer, index: i_248, offset: 0B]
# src/t2k.c:12: 	for(size_t i=0;i<numbytes;i++)
	incq	%rax	# i
# src/t2k.c:12: 	for(size_t i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, i
	jne	.L86	#,
	xorl	%ecx, %ecx	# ivtmp.238
# src/t2k.c:281:     int multi=0;
	xorl	%esi, %esi	# multi
.L87:
# src/t2k.c:12: 	for(size_t i=0;i<numbytes;i++)
	xorl	%eax, %eax	# ivtmp.226
.L89:
# src/t2k.c:271:         if(!pBackBuffer[line*FIELDWIDTH+px])
	cmpb	$0, pBackBuffer(%rcx,%rax)	#, MEM[symbol: pBackBuffer, base: ivtmp.238_79, index: ivtmp.226_251, offset: 0B]
	je	.L88	#,
	incq	%rax	# ivtmp.226
# src/t2k.c:269:     for(int px=0;px<FIELDWIDTH;++px)
	cmpq	$12, %rax	#, ivtmp.226
	jne	.L89	#,
# src/t2k.c:287:             multi+=25;
	addl	$25, %esi	#, multi
# src/t2k.c:288:             score+=multi;
	addl	%esi, score(%rip)	# multi, score
	leaq	12(%rcx), %rax	#, ivtmp.212
.L110:
# src/t2k.c:245:     for(line=(++line)*FIELDWIDTH;line>12;--line)
	cmpl	$12, %eax	#, ivtmp.212
	je	.L123	#,
# src/t2k.c:247:         pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
	movb	pBackBuffer-12(%rax), %dl	# MEM[symbol: pBackBuffer, index: ivtmp.212_3, offset: -12B], _71
# src/t2k.c:247:         pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
	movb	%dl, pBackBuffer(%rax)	# _71, MEM[symbol: pBackBuffer, index: ivtmp.212_3, offset: 0B]
	decq	%rax	# ivtmp.212
	jmp	.L110	#
.L123:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movq	$0, pBackBuffer+1(%rip)	#, MEM[(char *)&pBackBuffer + 1B]
	movb	$0, pBackBuffer+9(%rip)	#, MEM[(char *)&pBackBuffer + 9B]
# src/t2k.c:250:     updateBuffer();
	xorl	%eax, %eax	#
	call	updateBuffer	#
.L88:
	addq	$12, %rcx	#, ivtmp.238
# src/t2k.c:283:     for(int py=0;py<FIELDHEIGHT-1;++py)
	cmpq	$204, %rcx	#, ivtmp.238
	jne	.L87	#,
# src/t2k.c:292:     hiscore=score>hiscore?score:hiscore;
	movl	score(%rip), %eax	# score, score
	cmpl	%eax, hiscore(%rip)	# score, hiscore
	cmovge	hiscore(%rip), %eax	# hiscore,, tmp202
# src/t2k.c:292:     hiscore=score>hiscore?score:hiscore;
	movl	%eax, hiscore(%rip)	# tmp202, hiscore
# src/t2k.c:293:     placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
	movsbl	nCurrentRotation(%rip), %r11d	# nCurrentRotation, _49
	movslq	nCurrentPiece(%rip), %rdx	# nCurrentPiece,
	movq	%rdx, %rax	#,
# src/t2k.c:234:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	movswl	characters(%rdx,%rdx), %ebx	# characters, _77
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY, nCurrentY
	imull	$12, %ecx, %ecx	#, nCurrentY, tmp207
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	addl	%edx, %ecx	# nCurrentX, ivtmp.206
# src/t2k.c:230:     for(int py=0;py<4;++py)
	xorl	%r9d, %r9d	# py
# src/t2k.c:237:                 pBackBuffer[i]=(piece+1);
	leal	1(%rax), %r10d	#, tmp247
.L93:
# src/t2k.c:232:         for(int px=0;px<4;++px)
	xorl	%r8d, %r8d	# px
.L95:
# src/t2k.c:234:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	movl	%r11d, %edx	# _49,
	movl	%r9d, %esi	# py,
	movl	%r8d, %edi	# px,
	call	Rotate	#
# src/t2k.c:234:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	btl	%eax, %ebx	# _86, _77
	jnc	.L94	#,
# src/t2k.c:237:                 pBackBuffer[i]=(piece+1);
	leal	(%r8,%rcx), %eax	#, tmp213
	cltq
# src/t2k.c:237:                 pBackBuffer[i]=(piece+1);
	movb	%r10b, pBackBuffer(%rax)	# tmp247, pBackBuffer
.L94:
# src/t2k.c:232:         for(int px=0;px<4;++px)
	incl	%r8d	# px
# src/t2k.c:232:         for(int px=0;px<4;++px)
	cmpl	$4, %r8d	#, px
	jne	.L95	#,
# src/t2k.c:230:     for(int py=0;py<4;++py)
	incl	%r9d	# py
	addl	$12, %ecx	#, ivtmp.206
# src/t2k.c:230:     for(int py=0;py<4;++py)
	cmpl	$4, %r9d	#, py
	jne	.L93	#,
# src/t2k.c:294:     SDL_Delay(15);
	movl	$15, %edi	#,
	call	*SDL_Delay@GOTPCREL(%rip)	#
# src/t2k.c:208:     SDL_FillRect(screenSurface,NULL,0x12121212);
	movl	$303174162, %edx	#,
	xorl	%esi, %esi	#
	movq	screenSurface(%rip), %rdi	# screenSurface,
	call	*SDL_FillRect@GOTPCREL(%rip)	#
# src/t2k.c:210:      drawScore(score,10);
	movl	$10, %esi	#,
	movl	score(%rip), %edi	# score,
	call	drawScore	#
# src/t2k.c:211:      drawScore(hiscore,400);
	movl	$400, %esi	#,
	movl	hiscore(%rip), %edi	# hiscore,
	call	drawScore	#
	movl	$pBackBuffer, %r14d	#, ivtmp.190
	movl	$10, %r12d	#, ivtmp.191
.L97:
# src/t2k.c:219:             drawRect(x*50+10,y*50+10,48,(int)(colors[(int)(pBackBuffer[i])]));
	movq	%r14, %r13	# ivtmp.190, ivtmp.181
	movl	$10, %ebx	#, ivtmp.182
.L98:
# src/t2k.c:219:             drawRect(x*50+10,y*50+10,48,(int)(colors[(int)(pBackBuffer[i])]));
	movsbq	0(%r13), %rax	# MEM[base: _122, offset: 0B], MEM[base: _122, offset: 0B]
	movl	colors(,%rax,4), %edx	# colors, _30
# src/t2k.c:20:     SDL_Rect rect=(SDL_Rect){x,y,w,w};
	movl	%ebx, 8(%rsp)	# ivtmp.182, rect.x
	movl	%r12d, 12(%rsp)	# ivtmp.191, rect.y
	movq	%rbp, 16(%rsp)	# tmp249, MEM[(int *)&rect + 8B]
# src/t2k.c:21:     SDL_FillRect(screenSurface,&rect,col);
	leaq	8(%rsp), %rsi	#, tmp253
	movq	screenSurface(%rip), %rdi	# screenSurface,
	call	*SDL_FillRect@GOTPCREL(%rip)	#
	incq	%r13	# ivtmp.181
	addl	$50, %ebx	#, ivtmp.182
# src/t2k.c:215:         for(int x=0;x<FIELDWIDTH;++x)
	cmpl	$610, %ebx	#, ivtmp.182
	jne	.L98	#,
	addq	$12, %r14	#, ivtmp.190
	addl	$50, %r12d	#, ivtmp.191
# src/t2k.c:213:     for(int y=0;y<FIELDHEIGHT;++y)
	cmpl	$910, %r12d	#, ivtmp.191
	jne	.L97	#,
# src/t2k.c:225:     SDL_UpdateWindowSurface(window);
	movq	window(%rip), %rdi	# window,
	call	*SDL_UpdateWindowSurface@GOTPCREL(%rip)	#
# src/t2k.c:327:         if((runtime&15)==0)
	testb	$15, runtime(%rip)	#, runtime
	jne	.L101	#,
# src/t2k.c:133:     if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY,
	movl	%ecx, %ebx	#,
	incl	%ecx	# tmp224
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	movsbl	nCurrentRotation(%rip), %esi	# nCurrentRotation, nCurrentRotation
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:133:     if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
	testb	%al, %al	# _109
	je	.L102	#,
# src/t2k.c:135:         ++nCurrentY;
	incl	%ebx	# tmp227
	movb	%bl, nCurrentY(%rip)	# tmp227, nCurrentY
	jmp	.L101	#
.L102:
# src/t2k.c:140:         shuffle();
	xorl	%eax, %eax	#
	call	shuffle	#
# src/t2k.c:141:         nCurrentRotation=0;
	movb	$0, nCurrentRotation(%rip)	#, nCurrentRotation
# src/t2k.c:142:         nCurrentY= 0;
	movb	$0, nCurrentY(%rip)	#, nCurrentY
# src/t2k.c:143:         nCurrentX = (FIELDWIDTH>>1)-2;
	movb	$4, nCurrentX(%rip)	#, nCurrentX
# src/t2k.c:144:         updateBuffer();
	xorl	%eax, %eax	#
	call	updateBuffer	#
# src/t2k.c:145:         return (!DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY));
	xorl	%ecx, %ecx	#
	movl	$4, %edx	#,
	xorl	%esi, %esi	#
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:329:             if(FallDown())
	testb	%al, %al	# _120
	jne	.L101	#,
# src/t2k.c:331:                 initGame();
	call	initGame	#
# src/t2k.c:332:                 SDL_Delay(2000);
	movl	$2000, %edi	#,
	call	*SDL_Delay@GOTPCREL(%rip)	#
.L101:
# src/t2k.c:335:         runtime++;
	incl	runtime(%rip)	# runtime
.L104:
# src/t2k.c:152:     while(SDL_PollEvent(&e))
	leaq	8(%rsp), %rdi	#, tmp254
	call	*SDL_PollEvent@GOTPCREL(%rip)	#
# src/t2k.c:152:     while(SDL_PollEvent(&e))
	testl	%eax, %eax	# _155
	je	.L109	#,
# src/t2k.c:154:         if (e.type==SDL_QUIT)
	movl	8(%rsp), %eax	# e.type, _123
# src/t2k.c:154:         if (e.type==SDL_QUIT)
	cmpl	$256, %eax	#, _123
	jne	.L105	#,
# src/t2k.c:156:             SDL_DestroyWindow(window);
	movq	window(%rip), %rdi	# window,
	call	*SDL_DestroyWindow@GOTPCREL(%rip)	#
# src/t2k.c:157:             asm volatile(".intel_syntax noprefix;push 231;pop rax;xor edi, edi;syscall;.att_syntax prefix");
#APP
# 157 "src/t2k.c" 1
	.intel_syntax noprefix;push 231;pop rax;xor edi, edi;syscall;.att_syntax prefix
# 0 "" 2
#NO_APP
.L105:
# src/t2k.c:160:         if(e.type==SDL_KEYDOWN)
	cmpl	$768, %eax	#, _123
	jne	.L104	#,
# src/t2k.c:162:             char key=(e.key.keysym.sym);
	movl	28(%rsp), %eax	# e.key.keysym.sym, e.key.keysym.sym
# src/t2k.c:163:             char newRot=nCurrentRotation+(key=='w');
	cmpb	$119, %al	#, e.key.keysym.sym
	sete	%r13b	#, tmp230
# src/t2k.c:163:             char newRot=nCurrentRotation+(key=='w');
	addb	nCurrentRotation(%rip), %r13b	# nCurrentRotation, newRot
# src/t2k.c:164:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	cmpb	$100, %al	#, e.key.keysym.sym
	sete	%bl	#, tmp233
# src/t2k.c:164:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	addb	nCurrentX(%rip), %bl	# nCurrentX, tmp234
# src/t2k.c:164:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	cmpb	$97, %al	#, e.key.keysym.sym
	sete	%dl	#, tmp237
# src/t2k.c:164:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	subl	%edx, %ebx	# tmp237, newX
# src/t2k.c:165:             char newY=(nCurrentY)+(key=='s');
	movb	nCurrentY(%rip), %r14b	# nCurrentY, nCurrentY.52_144
# src/t2k.c:165:             char newY=(nCurrentY)+(key=='s');
	cmpb	$115, %al	#, e.key.keysym.sym
	sete	%r12b	#, tmp239
# src/t2k.c:165:             char newY=(nCurrentY)+(key=='s');
	addl	%r14d, %r12d	# nCurrentY.52_144, newY
# src/t2k.c:167:             if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
	movsbl	%r12b, %ecx	# newY, newY
	movsbl	%bl, %edx	# newX, newX
	movsbl	%r13b, %esi	# newRot, newRot
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:167:             if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
	testb	%al, %al	# _152
	je	.L104	#,
# src/t2k.c:169:                 if(newY!=nCurrentY)
	cmpb	%r12b, %r14b	# newY, nCurrentY.52_144
	je	.L107	#,
# src/t2k.c:171:                     score++;
	incl	score(%rip)	# score
.L107:
# src/t2k.c:173:                 nCurrentRotation=newRot;
	movb	%r13b, nCurrentRotation(%rip)	# newRot, nCurrentRotation
# src/t2k.c:174:                 nCurrentX=newX;
	movb	%bl, nCurrentX(%rip)	# newX, nCurrentX
# src/t2k.c:175:                 nCurrentY=newY;
	movb	%r12b, nCurrentY(%rip)	# newY, nCurrentY
	jmp	.L104	#
	.size	_start, .-_start
	.section	.bss.buffer.10904,"aw",@nobits
	.type	buffer.10904, @object
	.size	buffer.10904, 15
buffer.10904:
	.zero	15
	.section	.bss.runtime,"aw",@nobits
	.align 4
	.type	runtime, @object
	.size	runtime, 4
runtime:
	.zero	4
	.section	.bss.hertz,"aw",@nobits
	.align 4
	.type	hertz, @object
	.size	hertz, 12
hertz:
	.zero	12
	.section	.bss.vol,"aw",@nobits
	.align 2
	.type	vol, @object
	.size	vol, 6
vol:
	.zero	6
	.section	.bss.previous,"aw",@nobits
	.align 4
	.type	previous, @object
	.size	previous, 12
previous:
	.zero	12
	.section	.bss.counter,"aw",@nobits
	.align 4
	.type	counter, @object
	.size	counter, 12
counter:
	.zero	12
	.section	.bss.noteCnt,"aw",@nobits
	.align 4
	.type	noteCnt, @object
	.size	noteCnt, 4
noteCnt:
	.zero	4
	.section	.bss.song_clock,"aw",@nobits
	.align 4
	.type	song_clock, @object
	.size	song_clock, 4
song_clock:
	.zero	4
	.section	.bss.screenSurface,"aw",@nobits
	.align 8
	.type	screenSurface, @object
	.size	screenSurface, 8
screenSurface:
	.zero	8
	.section	.bss.window,"aw",@nobits
	.align 8
	.type	window, @object
	.size	window, 8
window:
	.zero	8
	.section	.bss.nCurrentPiece,"aw",@nobits
	.align 4
	.type	nCurrentPiece, @object
	.size	nCurrentPiece, 4
nCurrentPiece:
	.zero	4
	.section	.bss.hiscore,"aw",@nobits
	.align 4
	.type	hiscore, @object
	.size	hiscore, 4
hiscore:
	.zero	4
	.section	.bss.score,"aw",@nobits
	.align 4
	.type	score, @object
	.size	score, 4
score:
	.zero	4
	.section	.bss.nCurrentY,"aw",@nobits
	.type	nCurrentY, @object
	.size	nCurrentY, 1
nCurrentY:
	.zero	1
	.section	.bss.nCurrentX,"aw",@nobits
	.type	nCurrentX, @object
	.size	nCurrentX, 1
nCurrentX:
	.zero	1
	.section	.bss.nCurrentRotation,"aw",@nobits
	.type	nCurrentRotation, @object
	.size	nCurrentRotation, 1
nCurrentRotation:
	.zero	1
	.section	.bss.pBackBuffer,"aw",@nobits
	.align 64
	.type	pBackBuffer, @object
	.size	pBackBuffer, 216
pBackBuffer:
	.zero	216
	.section	.bss.pBuffer,"aw",@nobits
	.align 64
	.type	pBuffer, @object
	.size	pBuffer, 216
pBuffer:
	.zero	216
	.globl	cpatterns
	.section	.rodata.cpatterns,"a"
	.align 64
	.type	cpatterns, @object
	.size	cpatterns, 768
cpatterns:
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	58
	.byte	0
	.byte	60
	.byte	0
	.byte	62
	.byte	60
	.byte	58
	.byte	0
	.byte	57
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	58
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	60
	.byte	0
	.byte	58
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	58
	.byte	0
	.byte	60
	.byte	0
	.byte	0
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	60
	.byte	0
	.byte	0
	.byte	0
	.byte	63
	.byte	0
	.byte	67
	.byte	0
	.byte	0
	.byte	0
	.byte	65
	.byte	0
	.byte	63
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	62
	.byte	0
	.byte	63
	.byte	62
	.byte	60
	.byte	0
	.byte	58
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	58
	.byte	0
	.byte	60
	.byte	0
	.byte	0
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	60
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	60
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	67
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	66
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	26
	.byte	0
	.byte	38
	.byte	0
	.byte	26
	.byte	0
	.byte	38
	.byte	0
	.byte	26
	.byte	0
	.byte	38
	.byte	0
	.byte	26
	.byte	0
	.byte	38
	.byte	0
	.byte	31
	.byte	0
	.byte	43
	.byte	0
	.byte	31
	.byte	0
	.byte	43
	.byte	0
	.byte	31
	.byte	0
	.byte	43
	.byte	0
	.byte	31
	.byte	0
	.byte	43
	.byte	0
	.byte	30
	.byte	0
	.byte	42
	.byte	0
	.byte	30
	.byte	0
	.byte	42
	.byte	0
	.byte	26
	.byte	0
	.byte	38
	.byte	0
	.byte	26
	.byte	0
	.byte	38
	.byte	0
	.byte	31
	.byte	0
	.byte	43
	.byte	0
	.byte	31
	.byte	0
	.byte	43
	.byte	0
	.byte	31
	.byte	0
	.byte	33
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	36
	.byte	0
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	24
	.byte	0
	.byte	31
	.byte	0
	.byte	24
	.byte	0
	.byte	22
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	22
	.byte	0
	.byte	29
	.byte	0
	.byte	29
	.byte	0
	.byte	0
	.byte	0
	.byte	33
	.byte	0
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	38
	.byte	0
	.byte	0
	.byte	0
	.byte	42
	.byte	0
	.byte	31
	.byte	0
	.byte	38
	.byte	0
	.byte	31
	.byte	0
	.byte	38
	.byte	0
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	43
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	50
	.byte	0
	.byte	42
	.byte	0
	.byte	0
	.byte	0
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	54
	.byte	0
	.byte	55
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	54
	.byte	0
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	50
	.byte	0
	.byte	55
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	55
	.byte	0
	.byte	54
	.byte	0
	.byte	50
	.byte	0
	.byte	54
	.byte	0
	.byte	55
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	51
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	58
	.byte	0
	.byte	58
	.byte	58
	.byte	57
	.byte	0
	.byte	55
	.byte	0
	.byte	53
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	50
	.byte	0
	.byte	53
	.byte	0
	.byte	55
	.byte	53
	.byte	51
	.byte	0
	.byte	50
	.byte	0
	.byte	54
	.byte	0
	.byte	50
	.byte	0
	.byte	54
	.byte	0
	.byte	55
	.byte	0
	.byte	57
	.byte	0
	.byte	54
	.byte	0
	.byte	58
	.byte	0
	.byte	54
	.byte	0
	.byte	55
	.byte	0
	.byte	50
	.byte	0
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	60
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.globl	order
	.section	.rodata.order,"a"
	.type	order, @object
	.size	order, 8
order:
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.globl	characters2
	.section	.rodata.characters2,"a"
	.align 16
	.type	characters2, @object
	.size	characters2, 22
characters2:
	.value	0
	.value	31599
	.value	11415
	.value	29671
	.value	29391
	.value	23497
	.value	31183
	.value	31215
	.value	29330
	.value	31727
	.value	31695
	.globl	characters
	.section	.rodata.characters,"a"
	.align 2
	.type	characters, @object
	.size	characters, 14
characters:
	.value	1632
	.value	1570
	.value	1604
	.value	8738
	.value	9792
	.value	9760
	.value	17952
	.globl	colors
	.section	.rodata.colors,"a"
	.align 32
	.type	colors, @object
	.size	colors, 40
colors:
	.long	0
	.long	16711680
	.long	65280
	.long	255
	.long	65535
	.long	16776960
	.long	16711935
	.long	16744448
	.long	16777215
	.long	8421504
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1099091988
	.align 4
.LC1:
	.long	1065852003
	.align 4
.LC2:
	.long	1203470336
