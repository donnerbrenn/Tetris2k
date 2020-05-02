	.file	"t2k.c"
# GNU C11 (GCC) version 8.4.0 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 8.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.21-GMP

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
# src/t2k.c:58:     for (int i = 0; i < byte_stream_length>>1; ++i)
	movl	%edx, %edi	# byte_stream_length, byte_stream_length
	sarl	%edi	# byte_stream_length
	movl	song_clock.60493(%rip), %r10d	# song_clock, song_clock_lsm.58
# src/t2k.c:58:     for (int i = 0; i < byte_stream_length>>1; ++i)
	xorl	%r8d, %r8d	# ivtmp.79
	xorl	%eax, %eax	# song_clock_lsm.59
# src/t2k.c:40:         freq*=1.05946f;
	movss	.LC3(%rip), %xmm3	#, tmp220
# src/t2k.c:79:                 float freq=SAMPLERATE/hertz[j];
	movss	.LC4(%rip), %xmm4	#, tmp221
# src/t2k.c:80:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	xorl	%r11d, %r11d	# tmp222
.L2:
	leal	(%r10,%r8), %ebp	#, _70
# src/t2k.c:58:     for (int i = 0; i < byte_stream_length>>1; ++i)
	cmpl	%r8d, %edi	# ivtmp.79, _33
	jle	.L33	#,
# src/t2k.c:60:         pos=song_clock/(SAMPLERATE/SPEED);
	movl	$4900, %ecx	#, tmp140
	movl	%ebp, %eax	# _70, tmp138
	xorl	%edx, %edx	# tmp139
	divl	%ecx	# tmp140
# src/t2k.c:63:         stream[i]=0;
	movw	$0, (%rsi,%r8,2)	#, MEM[base: byte_stream_44(D), index: ivtmp.79_17, step: 2, offset: 0B]
# src/t2k.c:61:         current_pattern=(pos>>6)&7;
	movl	%eax, %edx	# tmp138, tmp142
	shrl	$6, %edx	#, tmp142
# src/t2k.c:66:             note=cpatterns[j][order[current_pattern]][current_note];
	andl	$7, %edx	#, tmp144
	movsbq	order(%rdx), %rdx	# order, tmp145
	salq	$6, %rdx	#, tmp146
	movl	%eax, %ecx	# tmp138, tmp148
	andl	$63, %ecx	#, tmp148
	leaq	cpatterns(%rdx,%rcx), %rbx	#, _77
	xorl	%ecx, %ecx	# ivtmp.67
# src/t2k.c:73:             if((song_clock&7)==0)
	andl	$7, %ebp	#, tmp160
.L15:
# src/t2k.c:66:             note=cpatterns[j][order[current_pattern]][current_note];
	movq	%rcx, %rdx	# ivtmp.67, tmp150
	salq	$8, %rdx	#, tmp150
	movsbl	(%rbx,%rdx), %edx	# MEM[base: _77, index: _1, offset: 0B],
# src/t2k.c:67:             if((previous[j]!=pos)&&(note))
	cmpl	%eax, previous.60495(,%rcx,4)	# tmp138, MEM[symbol: previous, index: ivtmp.67_80, step: 4, offset: 0B]
	je	.L3	#,
	testb	%dl, %dl	# _11
	je	.L3	#,
# src/t2k.c:37:     float freq=61.7337f;
	movss	.LC0(%rip), %xmm0	#, freq
.L4:
# src/t2k.c:40:         freq*=1.05946f;
	mulss	%xmm3, %xmm0	# tmp220, freq
# src/t2k.c:41:     } while(--note);
	decl	%edx	# note
	jne	.L4	#,
# src/t2k.c:69:                 hertz[j]=getFrq(note);
	movss	%xmm0, hertz.60501(,%rcx,4)	# freq, MEM[symbol: hertz, index: ivtmp.67_80, step: 4, offset: 0B]
# src/t2k.c:70:                 previous[j]=pos;
	movl	%eax, previous.60495(,%rcx,4)	# tmp138, MEM[symbol: previous, index: ivtmp.67_80, step: 4, offset: 0B]
# src/t2k.c:71:                 vol[j]=8192;
	movw	$8192, vol.60492(%rcx,%rcx)	#, MEM[symbol: vol, index: ivtmp.67_80, step: 2, offset: 0B]
.L3:
# src/t2k.c:73:             if((song_clock&7)==0)
	testl	%ebp, %ebp	# tmp160
	jne	.L5	#,
# src/t2k.c:75:                 vol[j]--;
	decw	vol.60492(%rcx,%rcx)	# MEM[symbol: vol, index: ivtmp.67_80, step: 2, offset: 0B]
.L5:
# src/t2k.c:77:             if(vol[j]>0)
	movw	vol.60492(%rcx,%rcx), %r9w	# MEM[symbol: vol, index: ivtmp.67_80, step: 2, offset: 0B], _21
# src/t2k.c:77:             if(vol[j]>0)
	testw	%r9w, %r9w	# _21
	jle	.L6	#,
# src/t2k.c:79:                 float freq=SAMPLERATE/hertz[j];
	movaps	%xmm4, %xmm2	# tmp221, freq
	divss	hertz.60501(,%rcx,4), %xmm2	# MEM[symbol: hertz, index: ivtmp.67_80, step: 4, offset: 0B], freq
# src/t2k.c:80:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	movl	counter.60494(,%rcx,4), %r12d	# MEM[symbol: counter, index: ivtmp.67_80, step: 4, offset: 0B],
	movq	%r12, %rdx	#,
# src/t2k.c:80:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	cvtsi2ssq	%r12, %xmm1	# _23, tmp171
# src/t2k.c:80:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	comiss	%xmm1, %xmm2	# tmp171, freq
	cmovbe	%r11d, %edx	# _23,, tmp222, _23
# src/t2k.c:81:                 freq*=j==1?.5f:.7f;
	movss	.LC1(%rip), %xmm0	#, iftmp.30_37
	cmpq	$1, %rcx	#, ivtmp.67
	jne	.L11	#,
	movss	.LC2(%rip), %xmm0	#, iftmp.30_37
.L11:
# src/t2k.c:82:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	movw	(%rsi,%r8,2), %r12w	# MEM[base: byte_stream_44(D), index: ivtmp.79_17, step: 2, offset: 0B], _26
# src/t2k.c:82:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	movl	%edx, %r13d	# _23, _23
	cvtsi2ssq	%r13, %xmm1	# _23, tmp176
# src/t2k.c:81:                 freq*=j==1?.5f:.7f;
	mulss	%xmm2, %xmm0	# freq, freq
# src/t2k.c:82:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	comiss	%xmm1, %xmm0	# tmp176, freq
	jnb	.L12	#,
# src/t2k.c:82:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	negl	%r9d	# iftmp.31_38
.L12:
# src/t2k.c:82:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	addl	%r12d, %r9d	# _26, tmp182
	movw	%r9w, (%rsi,%r8,2)	# tmp182, MEM[base: byte_stream_44(D), index: ivtmp.79_17, step: 2, offset: 0B]
# src/t2k.c:83:                 counter[j]++;
	incl	%edx	# tmp184
	movl	%edx, counter.60494(,%rcx,4)	# tmp184, MEM[symbol: counter, index: ivtmp.67_80, step: 4, offset: 0B]
.L6:
	incq	%rcx	# ivtmp.67
# src/t2k.c:64:         for(int j=0;j<VOICES;j++)
	cmpq	$3, %rcx	#, ivtmp.67
	jne	.L15	#,
	incq	%r8	# ivtmp.79
	movb	$1, %al	#, song_clock_lsm.59
	jmp	.L2	#
.L33:
	testl	%edi, %edi	# _33
	movl	$0, %edx	#, tmp186
	cmovs	%edx, %edi	# _33,, tmp186, tmp185
	addl	%r10d, %edi	# song_clock_lsm.58, song_clock_lsm.58
	testb	%al, %al	# song_clock_lsm.59
	je	.L1	#,
	movl	%edi, song_clock.60493(%rip)	# song_clock_lsm.58, song_clock
.L1:
# src/t2k.c:88: }
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
.L39:
# src/t2k.c:24:         result=SDL_GetTicks()&7;
	call	*SDL_GetTicks@GOTPCREL(%rip)	#
# src/t2k.c:24:         result=SDL_GetTicks()&7;
	andl	$7, %eax	#, result
# src/t2k.c:25:     } while(result==7||result==nCurrentPiece);
	cmpl	$7, %eax	#, result
	je	.L39	#,
# src/t2k.c:25:     } while(result==7||result==nCurrentPiece);
	cmpl	nCurrentPiece(%rip), %eax	# nCurrentPiece, result
	je	.L39	#,
# src/t2k.c:26:     nCurrentPiece=result;
	movl	%eax, nCurrentPiece(%rip)	# result, nCurrentPiece
# src/t2k.c:202:         nCurrentRotation=0;
	movb	$0, nCurrentRotation(%rip)	#, nCurrentRotation
# src/t2k.c:203:         nCurrentY= 0;
	movb	$0, nCurrentY(%rip)	#, nCurrentY
# src/t2k.c:204:         nCurrentX = (FIELDWIDTH>>2)+1;
	movb	$4, nCurrentX(%rip)	#, nCurrentX
# src/t2k.c:205:         runtime=0;
	movl	$0, runtime(%rip)	#, runtime
	xorl	%eax, %eax	# ivtmp.85
.L36:
# src/t2k.c:14:         ((char*)dest)[i]=((char*)src)[i];
	movb	pBackBuffer(%rax), %dl	# MEM[symbol: pBackBuffer, index: ivtmp.85_26, offset: 0B], MEM[symbol: pBackBuffer, index: ivtmp.85_26, offset: 0B]
	movb	%dl, pBuffer(%rax)	# MEM[symbol: pBackBuffer, index: ivtmp.85_26, offset: 0B], MEM[symbol: pBuffer, index: ivtmp.85_26, offset: 0B]
	incq	%rax	# ivtmp.85
# src/t2k.c:12: 	for(int i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, ivtmp.85
	jne	.L36	#,
# src/t2k.c:207: }
	popq	%rax	#
	ret	
	.size	initStone, .-initStone
	.section	.text.initGame,"ax",@progbits
	.type	initGame, @function
initGame:
# src/t2k.c:210: {
	xorl	%eax, %eax	# ivtmp.108
.L43:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movb	$9, pBackBuffer(%rax)	#, MEM[symbol: pBackBuffer, index: ivtmp.108_31, offset: 0B]
	incq	%rax	# ivtmp.108
# src/t2k.c:4:     for(int i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, ivtmp.108
	jne	.L43	#,
	xorl	%eax, %eax	# ivtmp.106
.L45:
# src/t2k.c:4:     for(int i=0;i<numbytes;i++)
	movl	$1, %edx	#, ivtmp.94
.L44:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movb	$0, pBackBuffer(%rax,%rdx)	#, MEM[symbol: pBackBuffer, base: ivtmp.106_6, index: ivtmp.94_26, offset: 0B]
	incq	%rdx	# ivtmp.94
# src/t2k.c:4:     for(int i=0;i<numbytes;i++)
	cmpq	$11, %rdx	#, ivtmp.94
	jne	.L44	#,
	addq	$12, %rax	#, ivtmp.106
# src/t2k.c:216:     for(int y=0;y<FIELDHEIGHT-1;y++)
	cmpq	$204, %rax	#, ivtmp.106
	jne	.L45	#,
# src/t2k.c:220:     initStone();
	xorl	%eax, %eax	#
	jmp	initStone	#
	.size	initGame, .-initGame
	.section	.text.Rotate,"ax",@progbits
	.globl	Rotate
	.type	Rotate, @function
Rotate:
.L50:
# src/t2k.c:96:         x=12+py-(px<<2);
	addl	$12, %esi	#, tmp106
# src/t2k.c:96:         x=12+py-(px<<2);
	leal	0(,%rdi,4), %eax	#, tmp107
# src/t2k.c:96:         x=12+py-(px<<2);
	subl	%eax, %esi	# tmp107, x
# src/t2k.c:97:         px=x&3;
	movl	%esi, %edi	# x, px
	andl	$3, %edi	#, px
# src/t2k.c:98:         py=x>>2;
	sarb	$2, %sil	#, py
# src/t2k.c:100:     } while(--r);
	decb	%dl	# r
	jne	.L50	#,
# src/t2k.c:101:     return (py<<2)+px;
	leal	(%rdi,%rsi,4), %eax	#, tmp108
# src/t2k.c:102: }
	ret	
	.size	Rotate, .-Rotate
	.section	.text.DoesPieceFit,"ax",@progbits
	.globl	DoesPieceFit
	.type	DoesPieceFit, @function
DoesPieceFit:
# src/t2k.c:114:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	movslq	%edi, %rdi	# nTetromino, nTetromino
	movswl	characters(%rdi,%rdi), %r11d	# characters, _12
	imull	$12, %ecx, %ecx	#, nPosY, tmp113
	addl	%edx, %ecx	# nPosX, ivtmp.132
# src/t2k.c:106:     for(int px=0;px<4;++px)
	xorl	%r9d, %r9d	# px
# src/t2k.c:111:             int pi = (Rotate((px),(py),(nRotation)));
	movsbl	%sil, %r10d	# nRotation, nRotation
.L53:
# src/t2k.c:108:         for(int py=0;py<4;++py)
	xorl	%r8d, %r8d	# py
.L56:
# src/t2k.c:111:             int pi = (Rotate((px),(py),(nRotation)));
	movl	%r10d, %edx	# nRotation,
	movl	%r8d, %esi	# py,
	movl	%r9d, %edi	# px,
	call	Rotate	#
# src/t2k.c:114:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	btl	%eax, %r11d	# _7, _12
	jnc	.L54	#,
# src/t2k.c:114:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	imull	$12, %r8d, %eax	#, py, tmp119
	addl	%ecx, %eax	# ivtmp.132, tmp120
	cltq
# src/t2k.c:114:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	cmpb	$0, pBuffer(%rax)	#, pBuffer
	jne	.L57	#,
.L54:
# src/t2k.c:108:         for(int py=0;py<4;++py)
	incl	%r8d	# py
# src/t2k.c:108:         for(int py=0;py<4;++py)
	cmpl	$4, %r8d	#, py
	jne	.L56	#,
# src/t2k.c:106:     for(int px=0;px<4;++px)
	incl	%r9d	# px
	incl	%ecx	# ivtmp.132
# src/t2k.c:106:     for(int px=0;px<4;++px)
	cmpl	$4, %r9d	#, px
	jne	.L53	#,
# src/t2k.c:120:     return true;
	movb	$1, %al	#, <retval>
# src/t2k.c:121: }
	ret	
.L57:
# src/t2k.c:116:                 return(false);
	xorl	%eax, %eax	# <retval>
	ret	
	.size	DoesPieceFit, .-DoesPieceFit
	.section	.rodata._start.str1.1,"aMS",@progbits,1
.LC5:
	.string	"v"
.LC6:
	.string	"R"
	.section	.text._start,"ax",@progbits
	.globl	_start
	.type	_start, @function
_start:
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	subq	$72, %rsp	#,
# src/t2k.c:344:     asm volatile("sub $8, %rsp");
#APP
# 344 "src/t2k.c" 1
	sub $8, %rsp
# 0 "" 2
# src/t2k.c:345:     initGame();
#NO_APP
	xorl	%eax, %eax	#
	call	initGame	#
# src/t2k.c:263:     want.freq = SAMPLERATE;
	movl	$44100, 8(%rsp)	#, want.freq
# src/t2k.c:264:     want.format = AUDIO_S16SYS;
	movw	$-32752, 12(%rsp)	#, want.format
# src/t2k.c:265:     want.channels=1;
	movb	$1, 14(%rsp)	#, want.channels
# src/t2k.c:266:     want.samples = BUFFERSIZE;
	movw	$-32768, 16(%rsp)	#, want.samples
# src/t2k.c:267:     want.callback = audio_callback;    
	movq	$audio_callback, 24(%rsp)	#, want.callback
# src/t2k.c:268:     SDL_OpenAudio((&want), NULL);
	xorl	%esi, %esi	#
	leaq	8(%rsp), %rdi	#, tmp255
	call	*SDL_OpenAudio@GOTPCREL(%rip)	#
# src/t2k.c:269:     SDL_PauseAudio(0);             
	xorl	%edi, %edi	#
	call	*SDL_PauseAudio@GOTPCREL(%rip)	#
# src/t2k.c:270:     GLWindow=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,SDL_WINDOW_OPENGL);
	movl	$2, %r9d	#,
	movl	$960, %r8d	#,
	movl	$630, %ecx	#,
	xorl	%edx, %edx	#
	xorl	%esi, %esi	#
	xorl	%edi, %edi	#
	call	*SDL_CreateWindow@GOTPCREL(%rip)	#
# src/t2k.c:270:     GLWindow=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,SDL_WINDOW_OPENGL);
	movq	%rax, GLWindow(%rip)	# _19, GLWindow
# src/t2k.c:271:     SDL_GL_CreateContext(GLWindow);
	movq	%rax, %rdi	# _19,
	call	*SDL_GL_CreateContext@GOTPCREL(%rip)	#
# src/t2k.c:272:     f = glCreateShader(GL_FRAGMENT_SHADER);
	movl	$35632, %edi	#,
	call	*glCreateShader@GOTPCREL(%rip)	#
# src/t2k.c:272:     f = glCreateShader(GL_FRAGMENT_SHADER);
	movl	%eax, f(%rip)	# _20, f
# src/t2k.c:273: 	glShaderSource(f, 1, &shader_glsl, NULL);
	xorl	%ecx, %ecx	#
	movl	$shader_glsl, %edx	#,
	movl	$1, %esi	#,
	movl	%eax, %edi	# _20,
	call	*glShaderSource@GOTPCREL(%rip)	#
# src/t2k.c:274: 	glCompileShader(f);
	movl	f(%rip), %edi	# f,
	call	*glCompileShader@GOTPCREL(%rip)	#
# src/t2k.c:297:     p=glCreateProgram();
	call	*glCreateProgram@GOTPCREL(%rip)	#
# src/t2k.c:297:     p=glCreateProgram();
	movl	%eax, p(%rip)	# _22, p
# src/t2k.c:298: 	glAttachShader(p,f);
	movl	f(%rip), %esi	# f,
	movl	%eax, %edi	# _22,
	call	*glAttachShader@GOTPCREL(%rip)	#
# src/t2k.c:299: 	glLinkProgram(p);
	movl	p(%rip), %edi	# p,
	call	*glLinkProgram@GOTPCREL(%rip)	#
# src/t2k.c:321:     glUseProgram(p);
	movl	p(%rip), %edi	# p,
	call	*glUseProgram@GOTPCREL(%rip)	#
# src/t2k.c:322:     GLPlayfieldPos = glGetUniformLocation( p, VAR_PLAYFIELD ); 
	movl	$.LC5, %esi	#,
	movl	p(%rip), %edi	# p,
	call	*glGetUniformLocation@GOTPCREL(%rip)	#
# src/t2k.c:322:     GLPlayfieldPos = glGetUniformLocation( p, VAR_PLAYFIELD ); 
	movl	%eax, GLPlayfieldPos(%rip)	# _27, GLPlayfieldPos
# src/t2k.c:323:     GLSizePos = glGetUniformLocation( p, VAR_SIZE ); 
	movl	$.LC6, %esi	#,
	movl	p(%rip), %edi	# p,
	call	*glGetUniformLocation@GOTPCREL(%rip)	#
# src/t2k.c:323:     GLSizePos = glGetUniformLocation( p, VAR_SIZE ); 
	movl	%eax, GLSizePos(%rip)	# _29, GLSizePos
# src/t2k.c:324:     GLint size[2]={SCREEN_WIDTH,SCREEN_HEIGHT};
	movabsq	$4123168604790, %rsi	#, tmp256
	movq	%rsi, (%rsp)	# tmp256, MEM[(int *)&size]
# src/t2k.c:325:     glUniform1iv(GLSizePos,2,&size[0]);
	movq	%rsp, %rdx	#,
	movl	$2, %esi	#,
	movl	%eax, %edi	# _29,
	call	*glUniform1iv@GOTPCREL(%rip)	#
# src/t2k.c:326:     glUniform2f(GLSizePos,size[0],size[1]);
	cvtsi2ss	(%rsp), %xmm0	# size, tmp198
	cvtsi2ss	4(%rsp), %xmm1	# size,
	movl	GLSizePos(%rip), %edi	# GLSizePos,
	call	*glUniform2f@GOTPCREL(%rip)	#
# src/t2k.c:327:     SDL_GL_SetSwapInterval(1);
	movl	$1, %edi	#,
	call	*SDL_GL_SetSwapInterval@GOTPCREL(%rip)	#
# src/t2k.c:338:     glRecti(-1,-1,1,1);
	orl	$-1, %ebp	#, tmp253
.L86:
# src/t2k.c:343: {
	xorl	%eax, %eax	# ivtmp.189
.L64:
# src/t2k.c:14:         ((char*)dest)[i]=((char*)src)[i];
	movb	pBuffer(%rax), %dl	# MEM[symbol: pBuffer, index: ivtmp.189_247, offset: 0B], MEM[symbol: pBuffer, index: ivtmp.189_247, offset: 0B]
	movb	%dl, pBackBuffer(%rax)	# MEM[symbol: pBuffer, index: ivtmp.189_247, offset: 0B], MEM[symbol: pBackBuffer, index: ivtmp.189_247, offset: 0B]
	incq	%rax	# ivtmp.189
# src/t2k.c:12: 	for(int i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, ivtmp.189
	jne	.L64	#,
	xorl	%ebx, %ebx	# ivtmp.186
.L65:
# src/t2k.c:343: {
	xorl	%eax, %eax	# ivtmp.174
.L67:
# src/t2k.c:227:         if(!pBackBuffer[line*FIELDWIDTH+px])
	cmpb	$0, pBackBuffer(%rbx,%rax)	#, MEM[symbol: pBackBuffer, base: ivtmp.186_192, index: ivtmp.174_256, offset: 0B]
	je	.L66	#,
	incq	%rax	# ivtmp.174
# src/t2k.c:225:     for(int px=0;px<FIELDWIDTH;++px)
	cmpq	$12, %rax	#, ivtmp.174
	jne	.L67	#,
	leaq	12(%rbx), %rax	#, ivtmp.160
.L87:
# src/t2k.c:191:     for(line=(++line)*FIELDWIDTH;line>12;--line)
	cmpl	$12, %eax	#, ivtmp.160
	je	.L100	#,
# src/t2k.c:193:         pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
	movb	pBackBuffer-12(%rax), %dl	# MEM[symbol: pBackBuffer, index: ivtmp.160_3, offset: -12B], _61
# src/t2k.c:193:         pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
	movb	%dl, pBackBuffer(%rax)	# _61, MEM[symbol: pBackBuffer, index: ivtmp.160_3, offset: 0B]
	decq	%rax	# ivtmp.160
	jmp	.L87	#
.L100:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movq	$0, pBackBuffer+1(%rip)	#, MEM[(char *)&pBackBuffer + 1B]
	movb	$0, pBackBuffer+9(%rip)	#, MEM[(char *)&pBackBuffer + 9B]
# src/t2k.c:196:     initStone();
	xorl	%eax, %eax	#
	call	initStone	#
.L66:
	addq	$12, %rbx	#, ivtmp.186
# src/t2k.c:242:     for(int py=0;py<FIELDHEIGHT-1;++py)
	cmpq	$204, %rbx	#, ivtmp.186
	jne	.L65	#,
# src/t2k.c:254:     placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
	movsbl	nCurrentRotation(%rip), %r11d	# nCurrentRotation, _39
	movslq	nCurrentPiece(%rip), %rdx	# nCurrentPiece,
	movq	%rdx, %rax	#,
# src/t2k.c:180:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	movswl	characters(%rdx,%rdx), %ebx	# characters, _68
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY, nCurrentY
	imull	$12, %ecx, %ecx	#, nCurrentY, tmp210
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	addl	%edx, %ecx	# nCurrentX, ivtmp.154
# src/t2k.c:176:     for(int py=0;py<4;++py)
	xorl	%r9d, %r9d	# py
# src/t2k.c:183:                 pBackBuffer[i]=(piece+1);
	leal	1(%rax), %r10d	#, tmp251
.L71:
# src/t2k.c:178:         for(int px=0;px<4;++px)
	xorl	%r8d, %r8d	# px
.L73:
# src/t2k.c:180:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	movl	%r11d, %edx	# _39,
	movl	%r9d, %esi	# py,
	movl	%r8d, %edi	# px,
	call	Rotate	#
# src/t2k.c:180:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	btl	%eax, %ebx	# _77, _68
	jnc	.L72	#,
# src/t2k.c:183:                 pBackBuffer[i]=(piece+1);
	leal	(%r8,%rcx), %eax	#, tmp216
	cltq
# src/t2k.c:183:                 pBackBuffer[i]=(piece+1);
	movb	%r10b, pBackBuffer(%rax)	# tmp251, pBackBuffer
.L72:
# src/t2k.c:178:         for(int px=0;px<4;++px)
	incl	%r8d	# px
# src/t2k.c:178:         for(int px=0;px<4;++px)
	cmpl	$4, %r8d	#, px
	jne	.L73	#,
# src/t2k.c:176:     for(int py=0;py<4;++py)
	incl	%r9d	# py
	addl	$12, %ecx	#, ivtmp.154
# src/t2k.c:176:     for(int py=0;py<4;++py)
	cmpl	$4, %r9d	#, py
	jne	.L71	#,
# src/t2k.c:255:     SDL_Delay(15);
	movl	$15, %edi	#,
	call	*SDL_Delay@GOTPCREL(%rip)	#
# src/t2k.c:352:         if((runtime&15)==0)
	testb	$15, runtime(%rip)	#, runtime
	jne	.L76	#,
# src/t2k.c:125:     if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY,
	movl	%ecx, %ebx	#,
	incl	%ecx	# tmp222
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	movsbl	nCurrentRotation(%rip), %esi	# nCurrentRotation, nCurrentRotation
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:125:     if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
	testb	%al, %al	# _98
	je	.L77	#,
# src/t2k.c:127:         ++nCurrentY;
	incl	%ebx	# tmp225
	movb	%bl, nCurrentY(%rip)	# tmp225, nCurrentY
	jmp	.L76	#
.L77:
# src/t2k.c:132:         initStone();
	xorl	%eax, %eax	#
	call	initStone	#
# src/t2k.c:133:         return (!DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY));
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY, nCurrentY
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	movsbl	nCurrentRotation(%rip), %esi	# nCurrentRotation, nCurrentRotation
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:354:             if(FallDown())
	testb	%al, %al	# _109
	jne	.L76	#,
# src/t2k.c:356:                 initGame();
	call	initGame	#
# src/t2k.c:357:                 SDL_Delay(2000);
	movl	$2000, %edi	#,
	call	*SDL_Delay@GOTPCREL(%rip)	#
.L76:
# src/t2k.c:360:         runtime++;
	incl	runtime(%rip)	# runtime
# src/t2k.c:140:     handlekeys=true;
	movb	$1, handlekeys(%rip)	#, handlekeys
.L79:
# src/t2k.c:141:     while(SDL_PollEvent(&e))
	leaq	8(%rsp), %rdi	#, tmp257
	call	*SDL_PollEvent@GOTPCREL(%rip)	#
# src/t2k.c:141:     while(SDL_PollEvent(&e))
	testl	%eax, %eax	# _148
	je	.L101	#,
# src/t2k.c:144:         if (e.type==SDL_QUIT)
	movl	8(%rsp), %eax	# e.type, _118
# src/t2k.c:144:         if (e.type==SDL_QUIT)
	cmpl	$256, %eax	#, _118
	jne	.L80	#,
# src/t2k.c:146:             asm volatile("push $231;pop %rax;syscall");
#APP
# 146 "src/t2k.c" 1
	push $231;pop %rax;syscall
# 0 "" 2
#NO_APP
.L80:
# src/t2k.c:149:         if(e.type==SDL_KEYDOWN&&handlekeys)
	cmpl	$768, %eax	#, _118
	jne	.L79	#,
# src/t2k.c:149:         if(e.type==SDL_KEYDOWN&&handlekeys)
	cmpb	$0, handlekeys(%rip)	#, handlekeys
	je	.L79	#,
# src/t2k.c:151:             handlekeys=false;
	movb	$0, handlekeys(%rip)	#, handlekeys
# src/t2k.c:152:             char key=(e.key.keysym.sym);
	movl	28(%rsp), %eax	# e.key.keysym.sym, e.key.keysym.sym
# src/t2k.c:153:             char newRot=nCurrentRotation+(key=='w');
	cmpb	$119, %al	#, e.key.keysym.sym
	sete	%r13b	#, tmp231
# src/t2k.c:153:             char newRot=nCurrentRotation+(key=='w');
	addb	nCurrentRotation(%rip), %r13b	# nCurrentRotation, newRot
# src/t2k.c:154:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	cmpb	$100, %al	#, e.key.keysym.sym
	sete	%bl	#, tmp234
# src/t2k.c:154:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	addb	nCurrentX(%rip), %bl	# nCurrentX, tmp235
# src/t2k.c:154:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	cmpb	$97, %al	#, e.key.keysym.sym
	sete	%dl	#, tmp238
# src/t2k.c:154:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	subl	%edx, %ebx	# tmp238, newX
# src/t2k.c:155:             char newY=(nCurrentY)+(key=='s');
	cmpb	$115, %al	#, e.key.keysym.sym
	sete	%r12b	#, tmp240
# src/t2k.c:155:             char newY=(nCurrentY)+(key=='s');
	addb	nCurrentY(%rip), %r12b	# nCurrentY, newY
# src/t2k.c:157:             if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
	movsbl	%r12b, %ecx	# newY, newY
	movsbl	%bl, %edx	# newX, newX
	movsbl	%r13b, %esi	# newRot, newRot
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:157:             if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
	testb	%al, %al	# _147
	je	.L79	#,
# src/t2k.c:165:                 nCurrentRotation=newRot;
	movb	%r13b, nCurrentRotation(%rip)	# newRot, nCurrentRotation
# src/t2k.c:166:                 nCurrentX=newX;
	movb	%bl, nCurrentX(%rip)	# newX, nCurrentX
# src/t2k.c:167:                 nCurrentY=newY;
	movb	%r12b, nCurrentY(%rip)	# newY, nCurrentY
	jmp	.L79	#
.L101:
	xorl	%eax, %eax	# ivtmp.134
.L85:
# src/t2k.c:334:         glbuffer[i]=pBackBuffer[i];
	movsbl	pBackBuffer(%rax), %edx	# MEM[symbol: pBackBuffer, index: ivtmp.134_155, offset: 0B], MEM[symbol: pBackBuffer, index: ivtmp.134_155, offset: 0B]
	movl	%edx, glbuffer(,%rax,4)	# MEM[symbol: pBackBuffer, index: ivtmp.134_155, offset: 0B], MEM[symbol: glbuffer, index: ivtmp.134_155, step: 4, offset: 0B]
	incq	%rax	# ivtmp.134
# src/t2k.c:332:     for(int i=0;i<FIELDHEIGHT*FIELDWIDTH;i++)
	cmpq	$216, %rax	#, ivtmp.134
	jne	.L85	#,
# src/t2k.c:336:     glUniform1iv(GLPlayfieldPos,FIELDHEIGHT*FIELDWIDTH,&glbuffer[0]);
	movl	$glbuffer, %edx	#,
	movl	$216, %esi	#,
	movl	GLPlayfieldPos(%rip), %edi	# GLPlayfieldPos,
	call	*glUniform1iv@GOTPCREL(%rip)	#
# src/t2k.c:338:     glRecti(-1,-1,1,1);
	movl	$1, %ecx	#,
	movl	$1, %edx	#,
	movl	%ebp, %esi	# tmp253,
	movl	%ebp, %edi	# tmp253,
	call	*glRecti@GOTPCREL(%rip)	#
# src/t2k.c:339: 	SDL_GL_SwapWindow(GLWindow);
	movq	GLWindow(%rip), %rdi	# GLWindow,
	call	*SDL_GL_SwapWindow@GOTPCREL(%rip)	#
	jmp	.L86	#
	.size	_start, .-_start
	.section	.bss.counter.60494,"aw",@nobits
	.align 4
	.type	counter.60494, @object
	.size	counter.60494, 12
counter.60494:
	.zero	12
	.section	.bss.vol.60492,"aw",@nobits
	.align 2
	.type	vol.60492, @object
	.size	vol.60492, 6
vol.60492:
	.zero	6
	.section	.bss.hertz.60501,"aw",@nobits
	.align 4
	.type	hertz.60501, @object
	.size	hertz.60501, 12
hertz.60501:
	.zero	12
	.section	.bss.previous.60495,"aw",@nobits
	.align 4
	.type	previous.60495, @object
	.size	previous.60495, 12
previous.60495:
	.zero	12
	.section	.bss.song_clock.60493,"aw",@nobits
	.align 4
	.type	song_clock.60493, @object
	.size	song_clock.60493, 4
song_clock.60493:
	.zero	4
	.section	.bss.GLSizePos,"aw",@nobits
	.align 4
	.type	GLSizePos, @object
	.size	GLSizePos, 4
GLSizePos:
	.zero	4
	.section	.bss.GLPlayfieldPos,"aw",@nobits
	.align 4
	.type	GLPlayfieldPos, @object
	.size	GLPlayfieldPos, 4
GLPlayfieldPos:
	.zero	4
	.section	.bss.p,"aw",@nobits
	.align 4
	.type	p, @object
	.size	p, 4
p:
	.zero	4
	.section	.bss.f,"aw",@nobits
	.align 4
	.type	f, @object
	.size	f, 4
f:
	.zero	4
	.section	.bss.GLWindow,"aw",@nobits
	.align 8
	.type	GLWindow, @object
	.size	GLWindow, 8
GLWindow:
	.zero	8
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
	.section	.bss.nCurrentPiece,"aw",@nobits
	.align 4
	.type	nCurrentPiece, @object
	.size	nCurrentPiece, 4
nCurrentPiece:
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
	.section	.bss.glbuffer,"aw",@nobits
	.align 64
	.type	glbuffer, @object
	.size	glbuffer, 864
glbuffer:
	.zero	864
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
	.globl	shader_glsl
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.ascii	"#version 450\nuniform vec2 R;uniform int v[216];out vec3 i;v"
	.ascii	"ec2 y=gl_FragCoord.xy/vec2(620)-vec2(.5,.3);vec3 n[10]={vec3"
	.ascii	"(0),vec3(1,0,0),vec3(0,1,0),vec3(0,0,1),vec3(0,1,1),vec3(1,1"
	.ascii	",0),vec3(1,0,1),vec3(1.,.5,0),vec3(1),vec3(.5)};struct RR{ve"
	.ascii	"c3 RC;vec3 RP;bool RH;};vec4 t(vec3 v,vec3 R,float y,vec3 x)"
	.ascii	"{vec3 f=abs(v)-R;return vec4(x,length(max(f,0.))+min(max(f.x"
	.ascii	",max(f.y,f.z)),0.)-y);}vec4 t(vec3 y){vec2 f=floor(y.xy/.25)"
	.ascii	"+6;f.y=-f.y+20;int R=v[int(f.y*12+f.x)];y.xy=mod(y.xy,.25)-."
	.ascii	"125;vec3 x;if(f.x<0||f.y<0||f.x>11||f.y>17)x=vec3(0);else x="
	.ascii	"n[R];return t(y,vec3(.1,.1,.01),.025,vec3(x));}RR x(vec3 v,v"
	.ascii	"ec3 y,float R,float x){y=normalize(y);RR f;f.RP=v;f.RH=false"
	.ascii	";vec4 n;for(float i=0;i<R;){n=t(f.RP);if(n.w<x){f.RH=true;f."
	.ascii	"RC=n.xyz;break;}f.RP+=y*n.w;i+=n.w;}return f;}float f(vec3 v"
	.ascii	",vec3 y,vec3 f,float x){return y=normalize(y),(dot(v,y)*.5+."
	.ascii	"5+pow(max(dot(f,reflect(y,v)),0),4)*.2"
	.string	"5)*x;}void main(){vec3 v=vec3(0,0,-3.2),R=vec3(y,1);RR n=x(v,R,6,.0001);i=n.RC;vec2 m=vec2(.005,0.);vec3 w=normalize(vec3(t(n.RP+m.xyy).w-t(n.RP-m.xyy).w,t(n.RP+m.yxy).w-t(n.RP-m.yxy).w,t(n.RP+m.yyx).w-t(n.RP-m.yyx).w));i*=f(w,n.RP-vec3(-10,-120,1),R,1.);}"
	.section	.data.shader_glsl,"aw"
	.align 8
	.type	shader_glsl, @object
	.size	shader_glsl, 8
shader_glsl:
	.quad	.LC7
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1115090767
	.align 4
.LC1:
	.long	1060320051
	.align 4
.LC2:
	.long	1056964608
	.align 4
.LC3:
	.long	1065852003
	.align 4
.LC4:
	.long	1194083328
