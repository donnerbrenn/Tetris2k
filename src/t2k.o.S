	.file	"t2k.c"
# GNU C11 (GCC) version 8.3.0 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 8.3.0, GMP version 6.1.2, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.21-GMP

# warning: GMP header version 6.1.2 differs from library version 6.2.0.
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
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
# src/t2k.c:65:     for (int i = 0; i < byte_stream_length>>1; ++i)
	movl	%edx, %edi	# byte_stream_length, byte_stream_length
	sarl	%edi	# byte_stream_length
	movl	song_clock.36300(%rip), %ebx	# song_clock, song_clock_lsm.57
# src/t2k.c:65:     for (int i = 0; i < byte_stream_length>>1; ++i)
	xorl	%r8d, %r8d	# ivtmp.83
	xorl	%eax, %eax	# song_clock_lsm.58
# src/t2k.c:67:         pos=song_clock/(SAMPLERATE/SPEED);
	movl	$4900, %ebp	#, tmp193
# src/t2k.c:46:         freq*=1.05946f;
	movss	.LC1(%rip), %xmm1	#, tmp194
# src/t2k.c:86:                 freq=SAMPLERATE/hertz[j];
	movss	.LC2(%rip), %xmm2	#, tmp196
.L2:
	leal	(%rbx,%r8), %r11d	#, _47
# src/t2k.c:65:     for (int i = 0; i < byte_stream_length>>1; ++i)
	cmpl	%r8d, %edi	# ivtmp.83, _33
	jle	.L25	#,
# src/t2k.c:67:         pos=song_clock/(SAMPLERATE/SPEED);
	movl	%r11d, %eax	# _47, tmp137
	cltd
	idivl	%ebp	# tmp193
# src/t2k.c:70:         byte_stream[i]=0;
	movw	$0, (%rsi,%r8,2)	#, MEM[base: byte_stream_48(D), index: ivtmp.83_55, step: 2, offset: 0B]
# src/t2k.c:68:         current_pattern=(pos>>6)&7;
	movl	%eax, %edx	# tmp137, tmp141
	sarl	$6, %edx	#, tmp141
# src/t2k.c:73:             note=cpatterns[j][order[current_pattern]][current_note];
	andl	$7, %edx	#, tmp143
	movsbq	order(%rdx), %rdx	# order, tmp144
	salq	$6, %rdx	#, tmp145
	movl	%eax, %ecx	# tmp137, tmp147
	andl	$63, %ecx	#, tmp147
	leaq	cpatterns(%rdx,%rcx), %r12	#, _45
	xorl	%ecx, %ecx	# ivtmp.71
# src/t2k.c:80:             if((song_clock&6)==0)
	andl	$6, %r11d	#, tmp159
.L11:
# src/t2k.c:73:             note=cpatterns[j][order[current_pattern]][current_note];
	movq	%rcx, %rdx	# ivtmp.71, tmp149
	salq	$8, %rdx	#, tmp149
	movsbl	(%r12,%rdx), %edx	# MEM[base: _45, index: _50, offset: 0B], note
# src/t2k.c:74:             if((previous[j]!=pos)&&(note))
	cmpl	%eax, previous.36302(,%rcx,4)	# tmp137, MEM[symbol: previous, index: ivtmp.71_79, step: 4, offset: 0B]
	je	.L5	#,
	testl	%edx, %edx	# note
	je	.L5	#,
# src/t2k.c:43:     float freq=61.7337f;
	movss	.LC0(%rip), %xmm0	#, freq
.L3:
# src/t2k.c:44:     while(--note)
	decl	%edx	# note
	je	.L26	#,
# src/t2k.c:46:         freq*=1.05946f;
	mulss	%xmm1, %xmm0	# tmp194, freq
	jmp	.L3	#
.L26:
# src/t2k.c:76:                 hertz[j]=getFrq(note);
	movss	%xmm0, hertz.36298(,%rcx,4)	# freq, MEM[symbol: hertz, index: ivtmp.71_79, step: 4, offset: 0B]
# src/t2k.c:77:                 previous[j]=pos;
	movl	%eax, previous.36302(,%rcx,4)	# tmp137, MEM[symbol: previous, index: ivtmp.71_79, step: 4, offset: 0B]
# src/t2k.c:78:                 vol[j]=8192;
	movw	$8192, vol.36299(%rcx,%rcx)	#, MEM[symbol: vol, index: ivtmp.71_79, step: 2, offset: 0B]
.L5:
# src/t2k.c:80:             if((song_clock&6)==0)
	testl	%r11d, %r11d	# tmp159
	jne	.L7	#,
# src/t2k.c:82:                 vol[j]--;
	decw	vol.36299(%rcx,%rcx)	# MEM[symbol: vol, index: ivtmp.71_79, step: 2, offset: 0B]
.L7:
# src/t2k.c:84:             if(vol[j]>0)
	movw	vol.36299(%rcx,%rcx), %r9w	# MEM[symbol: vol, index: ivtmp.71_79, step: 2, offset: 0B], _20
# src/t2k.c:84:             if(vol[j]>0)
	testw	%r9w, %r9w	# _20
	jle	.L8	#,
# src/t2k.c:86:                 freq=SAMPLERATE/hertz[j];
	movaps	%xmm2, %xmm0	# tmp196, tmp168
	divss	hertz.36298(,%rcx,4), %xmm0	# MEM[symbol: hertz, index: ivtmp.71_79, step: 4, offset: 0B], tmp168
# src/t2k.c:86:                 freq=SAMPLERATE/hertz[j];
	cvttss2si	%xmm0, %r10d	# tmp168, _23
# src/t2k.c:87:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	movl	counter.36301(,%rcx,4), %edx	# MEM[symbol: counter, index: ivtmp.71_79, step: 4, offset: 0B], _24
# src/t2k.c:87:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	cmpl	%edx, %r10d	# _24, _23
	jg	.L9	#,
	xorl	%edx, %edx	# _24
.L9:
# src/t2k.c:89:                 byte_stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	movw	(%rsi,%r8,2), %r13w	# MEM[base: byte_stream_48(D), index: ivtmp.83_55, step: 2, offset: 0B], _27
# src/t2k.c:88:                 freq>>=2;
	sarl	$2, %r10d	#, tmp171
# src/t2k.c:89:                 byte_stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	cmpl	%edx, %r10d	# _24, tmp171
	jge	.L10	#,
# src/t2k.c:89:                 byte_stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	negl	%r9d	# iftmp.21_37
.L10:
# src/t2k.c:89:                 byte_stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	addl	%r13d, %r9d	# _27, tmp172
	movw	%r9w, (%rsi,%r8,2)	# tmp172, MEM[base: byte_stream_48(D), index: ivtmp.83_55, step: 2, offset: 0B]
# src/t2k.c:90:                 counter[j]++;
	incl	%edx	# tmp174
	movl	%edx, counter.36301(,%rcx,4)	# tmp174, MEM[symbol: counter, index: ivtmp.71_79, step: 4, offset: 0B]
.L8:
	incq	%rcx	# ivtmp.71
# src/t2k.c:71:         for(int j=0;j<VOICES;j++)
	cmpq	$3, %rcx	#, ivtmp.71
	jne	.L11	#,
	incq	%r8	# ivtmp.83
	movb	$1, %al	#, song_clock_lsm.58
	jmp	.L2	#
.L25:
	testl	%edi, %edi	# _33
	movl	$0, %edx	#, tmp176
	cmovs	%edx, %edi	# _33,, tmp176, tmp175
	addl	%ebx, %edi	# song_clock_lsm.57, song_clock_lsm.57
	testb	%al, %al	# song_clock_lsm.58
	je	.L1	#,
	movl	%edi, song_clock.36300(%rip)	# song_clock_lsm.57, song_clock
.L1:
# src/t2k.c:95: }
	popq	%rbx	#
	popq	%rbp	#
	popq	%r12	#
	popq	%r13	#
	ret	
	.size	audio_callback, .-audio_callback
	.section	.text.initStone,"ax",@progbits
	.type	initStone, @function
initStone:
	pushq	%rdx	#
.L32:
# src/t2k.c:30:         result=SDL_GetTicks()&7;
	call	*SDL_GetTicks@GOTPCREL(%rip)	#
# src/t2k.c:30:         result=SDL_GetTicks()&7;
	andl	$7, %eax	#, result
# src/t2k.c:28:     while(result==7||result==nCurrentPiece)
	cmpl	$7, %eax	#, result
	je	.L32	#,
# src/t2k.c:28:     while(result==7||result==nCurrentPiece)
	cmpl	nCurrentPiece(%rip), %eax	# nCurrentPiece, result
	je	.L32	#,
# src/t2k.c:32:     nCurrentPiece=result;
	movl	%eax, nCurrentPiece(%rip)	# result, nCurrentPiece
# src/t2k.c:267:         nCurrentRotation=0;
	movb	$0, nCurrentRotation(%rip)	#, nCurrentRotation
# src/t2k.c:268:         nCurrentY= 0;
	movb	$0, nCurrentY(%rip)	#, nCurrentY
# src/t2k.c:269:         nCurrentX = (FIELDWIDTH>>2)+1;
	movb	$4, nCurrentX(%rip)	#, nCurrentX
# src/t2k.c:270:         runtime=0;
	movl	$0, runtime(%rip)	#, runtime
	xorl	%eax, %eax	# ivtmp.89
.L29:
# src/t2k.c:14:         ((char*)dest)[i]=((char*)src)[i];
	movb	pBackBuffer(%rax), %dl	# MEM[symbol: pBackBuffer, index: ivtmp.89_11, offset: 0B], MEM[symbol: pBackBuffer, index: ivtmp.89_11, offset: 0B]
	movb	%dl, pBuffer(%rax)	# MEM[symbol: pBackBuffer, index: ivtmp.89_11, offset: 0B], MEM[symbol: pBuffer, index: ivtmp.89_11, offset: 0B]
	incq	%rax	# ivtmp.89
# src/t2k.c:12: 	for(int i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, ivtmp.89
	jne	.L29	#,
# src/t2k.c:272: }
	popq	%rax	#
	ret	
	.size	initStone, .-initStone
	.section	.text.initGame,"ax",@progbits
	.type	initGame, @function
initGame:
# src/t2k.c:277:     score=0;
	movl	$0, score(%rip)	#, score
	xorl	%eax, %eax	# ivtmp.112
.L36:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movb	$9, pBackBuffer(%rax)	#, MEM[symbol: pBackBuffer, index: ivtmp.112_21, offset: 0B]
	incq	%rax	# ivtmp.112
# src/t2k.c:4:     for(int i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, ivtmp.112
	jne	.L36	#,
	xorl	%eax, %eax	# ivtmp.110
.L38:
# src/t2k.c:4:     for(int i=0;i<numbytes;i++)
	movl	$1, %edx	#, ivtmp.98
.L37:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movb	$0, pBackBuffer(%rax,%rdx)	#, MEM[symbol: pBackBuffer, base: ivtmp.110_6, index: ivtmp.98_32, offset: 0B]
	incq	%rdx	# ivtmp.98
# src/t2k.c:4:     for(int i=0;i<numbytes;i++)
	cmpq	$11, %rdx	#, ivtmp.98
	jne	.L37	#,
	addq	$12, %rax	#, ivtmp.110
# src/t2k.c:280:     for(int y=0;y<FIELDHEIGHT-1;y++)
	cmpq	$204, %rax	#, ivtmp.110
	jne	.L38	#,
# src/t2k.c:284:     initStone();
	xorl	%eax, %eax	#
	jmp	initStone	#
	.size	initGame, .-initGame
	.section	.text.Rotate,"ax",@progbits
	.globl	Rotate
	.type	Rotate, @function
Rotate:
.L43:
# src/t2k.c:129:     while(r)
	testb	%dl, %dl	# r
	je	.L45	#,
# src/t2k.c:131:         x=12+py-(px<<2);
	addl	$12, %esi	#, tmp104
# src/t2k.c:131:         x=12+py-(px<<2);
	leal	0(,%rdi,4), %eax	#, tmp105
# src/t2k.c:131:         x=12+py-(px<<2);
	subl	%eax, %esi	# tmp105, x
# src/t2k.c:132:         px=x&3;
	movl	%esi, %edi	# x, px
	andl	$3, %edi	#, px
# src/t2k.c:133:         py=x>>2;
	sarb	$2, %sil	#, py
	decl	%edx	# r
	jmp	.L43	#
.L45:
# src/t2k.c:136:     return (py<<2)+px;
	leal	(%rdi,%rsi,4), %eax	#, tmp106
# src/t2k.c:137: }
	ret	
	.size	Rotate, .-Rotate
	.section	.text.DoesPieceFit,"ax",@progbits
	.globl	DoesPieceFit
	.type	DoesPieceFit, @function
DoesPieceFit:
# src/t2k.c:149:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	movslq	%edi, %rdi	# nTetromino, nTetromino
	movswl	characters(%rdi,%rdi), %r11d	# characters, _12
	imull	$12, %ecx, %ecx	#, nPosY, tmp113
	addl	%edx, %ecx	# nPosX, ivtmp.141
# src/t2k.c:141:     for(int px=0;px<4;++px)
	xorl	%r9d, %r9d	# px
# src/t2k.c:146:             int pi = (Rotate((px),(py),(nRotation)));
	movsbl	%sil, %r10d	# nRotation, nRotation
.L47:
# src/t2k.c:143:         for(int py=0;py<4;++py)
	xorl	%r8d, %r8d	# py
.L50:
# src/t2k.c:146:             int pi = (Rotate((px),(py),(nRotation)));
	movl	%r10d, %edx	# nRotation,
	movl	%r8d, %esi	# py,
	movl	%r9d, %edi	# px,
	call	Rotate	#
# src/t2k.c:149:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	btl	%eax, %r11d	# _7, _12
	jnc	.L48	#,
# src/t2k.c:149:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	imull	$12, %r8d, %eax	#, py, tmp119
	addl	%ecx, %eax	# ivtmp.141, tmp120
	cltq
# src/t2k.c:149:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	cmpb	$0, pBuffer(%rax)	#, pBuffer
	jne	.L51	#,
.L48:
# src/t2k.c:143:         for(int py=0;py<4;++py)
	incl	%r8d	# py
# src/t2k.c:143:         for(int py=0;py<4;++py)
	cmpl	$4, %r8d	#, py
	jne	.L50	#,
# src/t2k.c:141:     for(int px=0;px<4;++px)
	incl	%r9d	# px
	incl	%ecx	# ivtmp.141
# src/t2k.c:141:     for(int px=0;px<4;++px)
	cmpl	$4, %r9d	#, px
	jne	.L47	#,
# src/t2k.c:155:     return true;
	movb	$1, %al	#, <retval>
# src/t2k.c:156: }
	ret	
.L51:
# src/t2k.c:151:                 return(false);
	xorl	%eax, %eax	# <retval>
	ret	
	.size	DoesPieceFit, .-DoesPieceFit
	.section	.text._start,"ax",@progbits
	.globl	_start
	.type	_start, @function
_start:
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	subq	$88, %rsp	#,
# src/t2k.c:342:     asm volatile("sub $8, %rsp");
#APP
# 342 "src/t2k.c" 1
	sub $8, %rsp
# 0 "" 2
# src/t2k.c:343:     initGame();
#NO_APP
	xorl	%eax, %eax	#
	call	initGame	#
# src/t2k.c:325:     want.freq = SAMPLERATE;
	movl	$44100, 24(%rsp)	#, want.freq
# src/t2k.c:326:     want.format = AUDIO_S16SYS;
	movw	$-32752, 28(%rsp)	#, want.format
# src/t2k.c:327:     want.channels=1;
	movb	$1, 30(%rsp)	#, want.channels
# src/t2k.c:328:     want.samples = BUFFERSIZE;
	movw	$512, 32(%rsp)	#, want.samples
# src/t2k.c:329:     want.callback = audio_callback;    
	movq	$audio_callback, 40(%rsp)	#, want.callback
# src/t2k.c:330:     SDL_OpenAudio((&want), NULL);
	xorl	%esi, %esi	#
	leaq	24(%rsp), %rdi	#, tmp297
	call	*SDL_OpenAudio@GOTPCREL(%rip)	#
# src/t2k.c:331:     SDL_PauseAudio(0);             
	xorl	%edi, %edi	#
	call	*SDL_PauseAudio@GOTPCREL(%rip)	#
# src/t2k.c:336:     window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
	xorl	%r9d, %r9d	#
	movl	$960, %r8d	#,
	movl	$620, %ecx	#,
	xorl	%edx, %edx	#
	xorl	%esi, %esi	#
	xorl	%edi, %edi	#
	call	*SDL_CreateWindow@GOTPCREL(%rip)	#
# src/t2k.c:336:     window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
	movq	%rax, window(%rip)	# _19, window
# src/t2k.c:337:     screenSurface = SDL_GetWindowSurface(window);
	movq	%rax, %rdi	# _19,
	call	*SDL_GetWindowSurface@GOTPCREL(%rip)	#
# src/t2k.c:337:     screenSurface = SDL_GetWindowSurface(window);
	movq	%rax, screenSurface(%rip)	# _20, screenSurface
# src/t2k.c:20:     rect=(SDL_Rect){x,y,w,w};
	movabsq	$34359738376, %rbx	#, tmp294
.L89:
# src/t2k.c:341: {
	xorl	%eax, %eax	# ivtmp.231
.L58:
# src/t2k.c:14:         ((char*)dest)[i]=((char*)src)[i];
	movb	pBuffer(%rax), %dl	# MEM[symbol: pBuffer, index: ivtmp.231_304, offset: 0B], MEM[symbol: pBuffer, index: ivtmp.231_304, offset: 0B]
	movb	%dl, pBackBuffer(%rax)	# MEM[symbol: pBuffer, index: ivtmp.231_304, offset: 0B], MEM[symbol: pBackBuffer, index: ivtmp.231_304, offset: 0B]
	incq	%rax	# ivtmp.231
# src/t2k.c:12: 	for(int i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, ivtmp.231
	jne	.L58	#,
	xorl	%ebp, %ebp	# ivtmp.228
# src/t2k.c:303:     int multi=0;
	xorl	%r12d, %r12d	# multi
.L59:
# src/t2k.c:341: {
	xorl	%eax, %eax	# ivtmp.216
.L61:
# src/t2k.c:291:         if(!pBackBuffer[line*FIELDWIDTH+px])
	cmpb	$0, pBackBuffer(%rbp,%rax)	#, MEM[symbol: pBackBuffer, base: ivtmp.228_301, index: ivtmp.216_298, offset: 0B]
	je	.L60	#,
	incq	%rax	# ivtmp.216
# src/t2k.c:289:     for(int px=0;px<FIELDWIDTH;++px)
	cmpq	$12, %rax	#, ivtmp.216
	jne	.L61	#,
# src/t2k.c:311:             multi+=25;
	addl	$25, %r12d	#, multi
# src/t2k.c:312:             score+=multi;
	addl	%r12d, score(%rip)	# multi, score
	leaq	12(%rbp), %rax	#, ivtmp.202
.L90:
# src/t2k.c:256:     for(line=(++line)*FIELDWIDTH;line>12;--line)
	cmpl	$12, %eax	#, ivtmp.202
	je	.L107	#,
# src/t2k.c:258:         pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
	movb	pBackBuffer-12(%rax), %dl	# MEM[symbol: pBackBuffer, index: ivtmp.202_294, offset: -12B], _70
# src/t2k.c:258:         pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
	movb	%dl, pBackBuffer(%rax)	# _70, MEM[symbol: pBackBuffer, index: ivtmp.202_294, offset: 0B]
	decq	%rax	# ivtmp.202
	jmp	.L90	#
.L107:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movq	$0, pBackBuffer+1(%rip)	#, MEM[(char *)&pBackBuffer + 1B]
	movb	$0, pBackBuffer+9(%rip)	#, MEM[(char *)&pBackBuffer + 9B]
# src/t2k.c:261:     initStone();
	xorl	%eax, %eax	#
	call	initStone	#
.L60:
	addq	$12, %rbp	#, ivtmp.228
# src/t2k.c:306:     for(int py=0;py<FIELDHEIGHT-1;++py)
	cmpq	$204, %rbp	#, ivtmp.228
	jne	.L59	#,
# src/t2k.c:317:     placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
	movsbl	nCurrentRotation(%rip), %r11d	# nCurrentRotation, _47
	movslq	nCurrentPiece(%rip), %rdx	# nCurrentPiece,
	movq	%rdx, %rax	#,
# src/t2k.c:245:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	movswl	characters(%rdx,%rdx), %ebp	# characters, _77
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY, nCurrentY
	imull	$12, %ecx, %ecx	#, nCurrentY, tmp231
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	addl	%edx, %ecx	# nCurrentX, ivtmp.196
# src/t2k.c:241:     for(int py=0;py<4;++py)
	xorl	%r9d, %r9d	# py
# src/t2k.c:248:                 pBackBuffer[i]=(piece+1);
	leal	1(%rax), %r10d	#, tmp292
.L65:
# src/t2k.c:243:         for(int px=0;px<4;++px)
	xorl	%r8d, %r8d	# px
.L67:
# src/t2k.c:245:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	movl	%r11d, %edx	# _47,
	movl	%r9d, %esi	# py,
	movl	%r8d, %edi	# px,
	call	Rotate	#
# src/t2k.c:245:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	btl	%eax, %ebp	# _86, _77
	jnc	.L66	#,
# src/t2k.c:248:                 pBackBuffer[i]=(piece+1);
	leal	(%r8,%rcx), %eax	#, tmp237
	cltq
# src/t2k.c:248:                 pBackBuffer[i]=(piece+1);
	movb	%r10b, pBackBuffer(%rax)	# tmp292, pBackBuffer
.L66:
# src/t2k.c:243:         for(int px=0;px<4;++px)
	incl	%r8d	# px
# src/t2k.c:243:         for(int px=0;px<4;++px)
	cmpl	$4, %r8d	#, px
	jne	.L67	#,
# src/t2k.c:241:     for(int py=0;py<4;++py)
	incl	%r9d	# py
	addl	$12, %ecx	#, ivtmp.196
# src/t2k.c:241:     for(int py=0;py<4;++py)
	cmpl	$4, %r9d	#, py
	jne	.L65	#,
# src/t2k.c:318:     SDL_Delay(15);
	movl	$15, %edi	#,
	call	*SDL_Delay@GOTPCREL(%rip)	#
# src/t2k.c:216:     SDL_FillRect(screenSurface,NULL,0x12121212);
	movl	$303174162, %edx	#,
	xorl	%esi, %esi	#
	movq	screenSurface(%rip), %rdi	# screenSurface,
	call	*SDL_FillRect@GOTPCREL(%rip)	#
# src/t2k.c:103:     SDL_itoa(value,buffer,10);
	movl	$10, %edx	#,
	movl	$buffer.36320, %esi	#,
	movl	score(%rip), %edi	# score,
	call	*SDL_itoa@GOTPCREL(%rip)	#
	movl	$buffer.36320, %r13d	#, ivtmp.181
	xorl	%r14d, %r14d	# ivtmp.182
.L69:
# src/t2k.c:104:     for(int i=0;buffer[i];i++)
	movsbl	0(%r13), %eax	# MEM[base: _74, offset: 0B],
# src/t2k.c:104:     for(int i=0;buffer[i];i++)
	testb	%al, %al	# _102
	je	.L108	#,
# src/t2k.c:106:         drawcharacter((buffer[i]-48),((FONTSIZE<<2)*i)+x,SCREEN_HEIGHT-45);
	subl	$48, %eax	#, _104
	xorl	%r15d, %r15d	# ivtmp.177
	movl	$915, %r12d	#, ivtmp.175
# src/t2k.c:117:             if(16384 >> (i) & characters2[num])
	cltq
	movswl	characters2(%rax,%rax), %eax	# characters2, tmp246
	movl	%eax, 12(%rsp)	# tmp246, %sfp
.L70:
# src/t2k.c:114:         for(int x=0;x<3;++x)
	xorl	%ebp, %ebp	# x
.L72:
# src/t2k.c:117:             if(16384 >> (i) & characters2[num])
	leal	(%r15,%rbp), %ecx	#, tmp241
	movl	$16384, %eax	#, tmp243
	sarl	%cl, %eax	# tmp241, tmp242
# src/t2k.c:117:             if(16384 >> (i) & characters2[num])
	testl	%eax, 12(%rsp)	# tmp242, %sfp
	je	.L71	#,
# src/t2k.c:20:     rect=(SDL_Rect){x,y,w,w};
	leal	10(%r14,%rbp,8), %eax	#, tmp251
	movl	%eax, rect(%rip)	# tmp251, rect.x
	movl	%r12d, rect+4(%rip)	# ivtmp.175, rect.y
	movq	%rbx, rect+8(%rip)	# tmp294, MEM[(int *)&rect + 8B]
# src/t2k.c:21:     SDL_FillRect(screenSurface,&rect,col);
	movl	$16777215, %edx	#,
	movl	$rect, %esi	#,
	movq	screenSurface(%rip), %rdi	# screenSurface,
	call	*SDL_FillRect@GOTPCREL(%rip)	#
.L71:
# src/t2k.c:114:         for(int x=0;x<3;++x)
	incl	%ebp	# x
# src/t2k.c:114:         for(int x=0;x<3;++x)
	cmpl	$3, %ebp	#, x
	jne	.L72	#,
	addl	$8, %r12d	#, ivtmp.175
	addl	$3, %r15d	#, ivtmp.177
# src/t2k.c:113:     for(int y=0;y<5;++y)
	cmpl	$955, %r12d	#, ivtmp.175
	jne	.L70	#,
	incq	%r13	# ivtmp.181
	addl	$32, %r14d	#, ivtmp.182
	jmp	.L69	#
.L108:
	movl	$pBackBuffer, %r14d	#, ivtmp.157
# src/t2k.c:104:     for(int i=0;buffer[i];i++)
	movl	$10, %r12d	#, ivtmp.158
# src/t2k.c:20:     rect=(SDL_Rect){x,y,w,w};
	movabsq	$206158430256, %r15	#, tmp261
.L75:
# src/t2k.c:230:             drawRect(x*50+10,y*50+10,48,(int)(colors[(int)(pBackBuffer[i])]));
	movq	%r14, %r13	# ivtmp.157, ivtmp.148
	movl	$10, %ebp	#, ivtmp.149
.L76:
# src/t2k.c:230:             drawRect(x*50+10,y*50+10,48,(int)(colors[(int)(pBackBuffer[i])]));
	movsbq	0(%r13), %rax	# MEM[base: _248, offset: 0B], MEM[base: _248, offset: 0B]
	movl	colors(,%rax,4), %edx	# colors, _30
# src/t2k.c:20:     rect=(SDL_Rect){x,y,w,w};
	movl	%ebp, rect(%rip)	# ivtmp.149, rect.x
	movl	%r12d, rect+4(%rip)	# ivtmp.158, rect.y
	movq	%r15, rect+8(%rip)	# tmp261, MEM[(int *)&rect + 8B]
# src/t2k.c:21:     SDL_FillRect(screenSurface,&rect,col);
	movl	$rect, %esi	#,
	movq	screenSurface(%rip), %rdi	# screenSurface,
	call	*SDL_FillRect@GOTPCREL(%rip)	#
	incq	%r13	# ivtmp.148
	addl	$50, %ebp	#, ivtmp.149
# src/t2k.c:227:         for(int x=0;x<FIELDWIDTH;++x)
	cmpl	$610, %ebp	#, ivtmp.149
	jne	.L76	#,
	addq	$12, %r14	#, ivtmp.157
	addl	$50, %r12d	#, ivtmp.158
# src/t2k.c:225:     for(int y=0;y<FIELDHEIGHT;++y)
	cmpl	$910, %r12d	#, ivtmp.158
	jne	.L75	#,
# src/t2k.c:236:     SDL_UpdateWindowSurface(window);
	movq	window(%rip), %rdi	# window,
	call	*SDL_UpdateWindowSurface@GOTPCREL(%rip)	#
# src/t2k.c:349:         if((runtime&15)==0)
	testb	$15, runtime(%rip)	#, runtime
	jne	.L79	#,
# src/t2k.c:160:     if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY,
	movl	%ecx, %ebp	#,
	incl	%ecx	# tmp265
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	movsbl	nCurrentRotation(%rip), %esi	# nCurrentRotation, nCurrentRotation
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:160:     if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
	testb	%al, %al	# _132
	je	.L80	#,
# src/t2k.c:162:         ++nCurrentY;
	incl	%ebp	# tmp268
	movb	%bpl, nCurrentY(%rip)	# tmp268, nCurrentY
	jmp	.L79	#
.L80:
# src/t2k.c:167:         initStone();
	xorl	%eax, %eax	#
	call	initStone	#
# src/t2k.c:168:         return (!DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY));
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY, nCurrentY
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	movsbl	nCurrentRotation(%rip), %esi	# nCurrentRotation, nCurrentRotation
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:351:             if(FallDown())
	testb	%al, %al	# _143
	jne	.L79	#,
# src/t2k.c:353:                 initGame();
	call	initGame	#
# src/t2k.c:354:                 SDL_Delay(2000);
	movl	$2000, %edi	#,
	call	*SDL_Delay@GOTPCREL(%rip)	#
.L79:
# src/t2k.c:357:         runtime++;
	incl	runtime(%rip)	# runtime
# src/t2k.c:175:     handlekeys=true;
	movb	$1, handlekeys(%rip)	#, handlekeys
.L82:
# src/t2k.c:176:     while(SDL_PollEvent(&e))
	leaq	24(%rsp), %rdi	#, tmp300
	call	*SDL_PollEvent@GOTPCREL(%rip)	#
# src/t2k.c:176:     while(SDL_PollEvent(&e))
	testl	%eax, %eax	# _178
	je	.L89	#,
# src/t2k.c:178:         if (e.type==SDL_QUIT)
	movl	24(%rsp), %eax	# e.type, _146
# src/t2k.c:178:         if (e.type==SDL_QUIT)
	cmpl	$256, %eax	#, _146
	jne	.L83	#,
# src/t2k.c:181:             asm volatile("push $231;pop %rax;xorl %edi,%edi;syscall");
#APP
# 181 "src/t2k.c" 1
	push $231;pop %rax;xorl %edi,%edi;syscall
# 0 "" 2
#NO_APP
.L83:
# src/t2k.c:189:         if(e.type==SDL_KEYDOWN&&handlekeys)
	cmpl	$768, %eax	#, _146
	jne	.L82	#,
# src/t2k.c:189:         if(e.type==SDL_KEYDOWN&&handlekeys)
	cmpb	$0, handlekeys(%rip)	#, handlekeys
	je	.L82	#,
# src/t2k.c:191:             handlekeys=false;
	movb	$0, handlekeys(%rip)	#, handlekeys
# src/t2k.c:192:             char key=(e.key.keysym.sym);
	movl	44(%rsp), %eax	# e.key.keysym.sym, e.key.keysym.sym
# src/t2k.c:193:             char newRot=nCurrentRotation+(key=='w');
	cmpb	$119, %al	#, e.key.keysym.sym
	sete	%r13b	#, tmp274
# src/t2k.c:193:             char newRot=nCurrentRotation+(key=='w');
	addb	nCurrentRotation(%rip), %r13b	# nCurrentRotation, newRot
# src/t2k.c:194:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	cmpb	$100, %al	#, e.key.keysym.sym
	sete	%bpl	#, tmp277
# src/t2k.c:194:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	addb	nCurrentX(%rip), %bpl	# nCurrentX, tmp278
# src/t2k.c:194:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	cmpb	$97, %al	#, e.key.keysym.sym
	sete	%dl	#, tmp281
# src/t2k.c:194:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	subl	%edx, %ebp	# tmp281, newX
# src/t2k.c:195:             char newY=(nCurrentY)+(key=='s');
	movb	nCurrentY(%rip), %r14b	# nCurrentY, nCurrentY.52_167
# src/t2k.c:195:             char newY=(nCurrentY)+(key=='s');
	cmpb	$115, %al	#, e.key.keysym.sym
	sete	%r12b	#, tmp283
# src/t2k.c:195:             char newY=(nCurrentY)+(key=='s');
	addl	%r14d, %r12d	# nCurrentY.52_167, newY
# src/t2k.c:197:             if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
	movsbl	%r12b, %ecx	# newY, newY
	movsbl	%bpl, %edx	# newX, newX
	movsbl	%r13b, %esi	# newRot, newRot
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:197:             if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
	testb	%al, %al	# _175
	je	.L82	#,
# src/t2k.c:200:                 if(newY!=nCurrentY)
	cmpb	%r12b, %r14b	# newY, nCurrentY.52_167
	je	.L87	#,
# src/t2k.c:202:                     score++;
	incl	score(%rip)	# score
.L87:
# src/t2k.c:205:                 nCurrentRotation=newRot;
	movb	%r13b, nCurrentRotation(%rip)	# newRot, nCurrentRotation
# src/t2k.c:206:                 nCurrentX=newX;
	movb	%bpl, nCurrentX(%rip)	# newX, nCurrentX
# src/t2k.c:207:                 nCurrentY=newY;
	movb	%r12b, nCurrentY(%rip)	# newY, nCurrentY
	jmp	.L82	#
	.size	_start, .-_start
	.section	.bss.buffer.36320,"aw",@nobits
	.type	buffer.36320, @object
	.size	buffer.36320, 15
buffer.36320:
	.zero	15
	.section	.bss.counter.36301,"aw",@nobits
	.align 4
	.type	counter.36301, @object
	.size	counter.36301, 12
counter.36301:
	.zero	12
	.section	.bss.vol.36299,"aw",@nobits
	.align 2
	.type	vol.36299, @object
	.size	vol.36299, 6
vol.36299:
	.zero	6
	.section	.bss.hertz.36298,"aw",@nobits
	.align 4
	.type	hertz.36298, @object
	.size	hertz.36298, 12
hertz.36298:
	.zero	12
	.section	.bss.previous.36302,"aw",@nobits
	.align 4
	.type	previous.36302, @object
	.size	previous.36302, 12
previous.36302:
	.zero	12
	.section	.bss.song_clock.36300,"aw",@nobits
	.align 4
	.type	song_clock.36300, @object
	.size	song_clock.36300, 4
song_clock.36300:
	.zero	4
	.section	.bss.handlekeys,"aw",@nobits
	.type	handlekeys, @object
	.size	handlekeys, 1
handlekeys:
	.zero	1
	.section	.bss.runtime,"aw",@nobits
	.align 4
	.type	runtime, @object
	.size	runtime, 4
runtime:
	.zero	4
	.section	.bss.rect,"aw",@nobits
	.align 16
	.type	rect, @object
	.size	rect, 16
rect:
	.zero	16
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
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	35
	.byte	0
	.byte	37
	.byte	0
	.byte	39
	.byte	37
	.byte	35
	.byte	0
	.byte	34
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	35
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	37
	.byte	0
	.byte	35
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	35
	.byte	0
	.byte	37
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	37
	.byte	0
	.byte	0
	.byte	0
	.byte	40
	.byte	0
	.byte	44
	.byte	0
	.byte	0
	.byte	0
	.byte	42
	.byte	0
	.byte	40
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	39
	.byte	0
	.byte	40
	.byte	39
	.byte	37
	.byte	0
	.byte	35
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	35
	.byte	0
	.byte	37
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	37
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	37
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	44
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	43
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
	.byte	3
	.byte	0
	.byte	15
	.byte	0
	.byte	3
	.byte	0
	.byte	15
	.byte	0
	.byte	3
	.byte	0
	.byte	15
	.byte	0
	.byte	3
	.byte	0
	.byte	15
	.byte	0
	.byte	8
	.byte	0
	.byte	20
	.byte	0
	.byte	8
	.byte	0
	.byte	20
	.byte	0
	.byte	8
	.byte	0
	.byte	20
	.byte	0
	.byte	8
	.byte	0
	.byte	20
	.byte	0
	.byte	7
	.byte	0
	.byte	19
	.byte	0
	.byte	7
	.byte	0
	.byte	19
	.byte	0
	.byte	3
	.byte	0
	.byte	15
	.byte	0
	.byte	3
	.byte	0
	.byte	15
	.byte	0
	.byte	8
	.byte	0
	.byte	20
	.byte	0
	.byte	8
	.byte	0
	.byte	20
	.byte	0
	.byte	8
	.byte	0
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	0
	.byte	13
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	8
	.byte	0
	.byte	1
	.byte	0
	.byte	11
	.byte	0
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	0
	.byte	11
	.byte	0
	.byte	6
	.byte	0
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	0
	.byte	22
	.byte	0
	.byte	0
	.byte	0
	.byte	22
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	19
	.byte	0
	.byte	8
	.byte	0
	.byte	15
	.byte	0
	.byte	8
	.byte	0
	.byte	15
	.byte	0
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	20
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	27
	.byte	0
	.byte	19
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.byte	0
	.byte	32
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	31
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	32
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	32
	.byte	0
	.byte	31
	.byte	0
	.byte	27
	.byte	0
	.byte	31
	.byte	0
	.byte	32
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	28
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	35
	.byte	0
	.byte	35
	.byte	35
	.byte	34
	.byte	0
	.byte	32
	.byte	0
	.byte	30
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	30
	.byte	0
	.byte	32
	.byte	30
	.byte	28
	.byte	0
	.byte	27
	.byte	0
	.byte	31
	.byte	0
	.byte	27
	.byte	0
	.byte	31
	.byte	0
	.byte	32
	.byte	0
	.byte	34
	.byte	0
	.byte	31
	.byte	0
	.byte	35
	.byte	0
	.byte	31
	.byte	0
	.byte	32
	.byte	0
	.byte	27
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	31
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	35
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	37
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
	.size	characters2, 20
characters2:
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
	.long	1115090767
	.align 4
.LC1:
	.long	1065852003
	.align 4
.LC2:
	.long	1194083328
