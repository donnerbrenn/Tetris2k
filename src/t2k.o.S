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
# src/t2k.c:66:     for (int i = 0; i < byte_stream_length>>1; ++i)
	movl	%edx, %edi	# byte_stream_length, byte_stream_length
	sarl	%edi	# byte_stream_length
	movl	song_clock.36298(%rip), %r10d	# song_clock, song_clock_lsm.59
# src/t2k.c:66:     for (int i = 0; i < byte_stream_length>>1; ++i)
	xorl	%r8d, %r8d	# ivtmp.80
	xorl	%eax, %eax	# song_clock_lsm.60
# src/t2k.c:47:         freq*=1.05946f;
	movss	.LC3(%rip), %xmm3	#, tmp220
# src/t2k.c:87:                 float freq=SAMPLERATE/hertz[j];
	movss	.LC4(%rip), %xmm4	#, tmp221
# src/t2k.c:88:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	xorl	%r11d, %r11d	# tmp222
.L2:
	leal	(%r10,%r8), %ebp	#, _70
# src/t2k.c:66:     for (int i = 0; i < byte_stream_length>>1; ++i)
	cmpl	%r8d, %edi	# ivtmp.80, _33
	jle	.L33	#,
# src/t2k.c:68:         pos=song_clock/(SAMPLERATE/SPEED);
	movl	$4900, %ecx	#, tmp140
	movl	%ebp, %eax	# _70, tmp138
	xorl	%edx, %edx	# tmp139
	divl	%ecx	# tmp140
# src/t2k.c:71:         stream[i]=0;
	movw	$0, (%rsi,%r8,2)	#, MEM[base: byte_stream_44(D), index: ivtmp.80_17, step: 2, offset: 0B]
# src/t2k.c:69:         current_pattern=(pos>>6)&7;
	movl	%eax, %edx	# tmp138, tmp142
	shrl	$6, %edx	#, tmp142
# src/t2k.c:74:             note=cpatterns[j][order[current_pattern]][current_note];
	andl	$7, %edx	#, tmp144
	movsbq	order(%rdx), %rdx	# order, tmp145
	salq	$6, %rdx	#, tmp146
	movl	%eax, %ecx	# tmp138, tmp148
	andl	$63, %ecx	#, tmp148
	leaq	cpatterns(%rdx,%rcx), %rbx	#, _49
	xorl	%ecx, %ecx	# ivtmp.68
# src/t2k.c:81:             if((song_clock&7)==0)
	andl	$7, %ebp	#, tmp160
.L15:
# src/t2k.c:74:             note=cpatterns[j][order[current_pattern]][current_note];
	movq	%rcx, %rdx	# ivtmp.68, tmp150
	salq	$8, %rdx	#, tmp150
	movsbl	(%rbx,%rdx), %edx	# MEM[base: _49, index: _1, offset: 0B],
# src/t2k.c:75:             if((previous[j]!=pos)&&(note))
	cmpl	%eax, previous.36300(,%rcx,4)	# tmp138, MEM[symbol: previous, index: ivtmp.68_80, step: 4, offset: 0B]
	je	.L3	#,
	testb	%dl, %dl	# _11
	je	.L3	#,
# src/t2k.c:44:     float freq=61.7337f;
	movss	.LC0(%rip), %xmm0	#, freq
.L4:
# src/t2k.c:47:         freq*=1.05946f;
	mulss	%xmm3, %xmm0	# tmp220, freq
# src/t2k.c:48:     } while(--note);
	decl	%edx	# note
	jne	.L4	#,
# src/t2k.c:77:                 hertz[j]=getFrq(note);
	movss	%xmm0, hertz.36306(,%rcx,4)	# freq, MEM[symbol: hertz, index: ivtmp.68_80, step: 4, offset: 0B]
# src/t2k.c:78:                 previous[j]=pos;
	movl	%eax, previous.36300(,%rcx,4)	# tmp138, MEM[symbol: previous, index: ivtmp.68_80, step: 4, offset: 0B]
# src/t2k.c:79:                 vol[j]=8192;
	movw	$8192, vol.36297(%rcx,%rcx)	#, MEM[symbol: vol, index: ivtmp.68_80, step: 2, offset: 0B]
.L3:
# src/t2k.c:81:             if((song_clock&7)==0)
	testl	%ebp, %ebp	# tmp160
	jne	.L5	#,
# src/t2k.c:83:                 vol[j]--;
	decw	vol.36297(%rcx,%rcx)	# MEM[symbol: vol, index: ivtmp.68_80, step: 2, offset: 0B]
.L5:
# src/t2k.c:85:             if(vol[j]>0)
	movw	vol.36297(%rcx,%rcx), %r9w	# MEM[symbol: vol, index: ivtmp.68_80, step: 2, offset: 0B], _21
# src/t2k.c:85:             if(vol[j]>0)
	testw	%r9w, %r9w	# _21
	jle	.L6	#,
# src/t2k.c:87:                 float freq=SAMPLERATE/hertz[j];
	movaps	%xmm4, %xmm2	# tmp221, freq
	divss	hertz.36306(,%rcx,4), %xmm2	# MEM[symbol: hertz, index: ivtmp.68_80, step: 4, offset: 0B], freq
# src/t2k.c:88:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	movl	counter.36299(,%rcx,4), %r12d	# MEM[symbol: counter, index: ivtmp.68_80, step: 4, offset: 0B],
	movq	%r12, %rdx	#,
# src/t2k.c:88:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	cvtsi2ssq	%r12, %xmm1	# _23, tmp171
# src/t2k.c:88:                 counter[j]=(counter[j]>=freq)?0:counter[j];
	comiss	%xmm1, %xmm2	# tmp171, freq
	cmovbe	%r11d, %edx	# _23,, tmp222, _23
# src/t2k.c:89:                 freq*=j==1?.5f:.7f;
	movss	.LC1(%rip), %xmm0	#, iftmp.20_37
	cmpq	$1, %rcx	#, ivtmp.68
	jne	.L11	#,
	movss	.LC2(%rip), %xmm0	#, iftmp.20_37
.L11:
# src/t2k.c:90:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	movw	(%rsi,%r8,2), %r12w	# MEM[base: byte_stream_44(D), index: ivtmp.80_17, step: 2, offset: 0B], _26
# src/t2k.c:90:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	movl	%edx, %r13d	# _23, _23
	cvtsi2ssq	%r13, %xmm1	# _23, tmp176
# src/t2k.c:89:                 freq*=j==1?.5f:.7f;
	mulss	%xmm2, %xmm0	# freq, freq
# src/t2k.c:90:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	comiss	%xmm1, %xmm0	# tmp176, freq
	jnb	.L12	#,
# src/t2k.c:90:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	negl	%r9d	# iftmp.21_38
.L12:
# src/t2k.c:90:                 stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
	addl	%r12d, %r9d	# _26, tmp182
	movw	%r9w, (%rsi,%r8,2)	# tmp182, MEM[base: byte_stream_44(D), index: ivtmp.80_17, step: 2, offset: 0B]
# src/t2k.c:91:                 counter[j]++;
	incl	%edx	# tmp184
	movl	%edx, counter.36299(,%rcx,4)	# tmp184, MEM[symbol: counter, index: ivtmp.68_80, step: 4, offset: 0B]
.L6:
	incq	%rcx	# ivtmp.68
# src/t2k.c:72:         for(int j=0;j<VOICES;j++)
	cmpq	$3, %rcx	#, ivtmp.68
	jne	.L15	#,
	incq	%r8	# ivtmp.80
	movb	$1, %al	#, song_clock_lsm.60
	jmp	.L2	#
.L33:
	testl	%edi, %edi	# _33
	movl	$0, %edx	#, tmp186
	cmovs	%edx, %edi	# _33,, tmp186, tmp185
	addl	%r10d, %edi	# song_clock_lsm.59, song_clock_lsm.59
	testb	%al, %al	# song_clock_lsm.60
	je	.L1	#,
	movl	%edi, song_clock.36298(%rip)	# song_clock_lsm.59, song_clock
.L1:
# src/t2k.c:96: }
	popq	%rbx	#
	popq	%rbp	#
	popq	%r12	#
	popq	%r13	#
	ret	
	.size	audio_callback, .-audio_callback
	.section	.text.drawRect,"ax",@progbits
	.type	drawRect, @function
drawRect:
	movl	%edx, %eax	# w, w
	movl	%ecx, %edx	# col, col
# src/t2k.c:20:     rect=(SDL_Rect){x,y,w,w};
	movl	%edi, rect(%rip)	# x, rect.x
	movl	%esi, rect+4(%rip)	# y, rect.y
	movl	%eax, rect+8(%rip)	# w, rect.w
	movl	%eax, rect+12(%rip)	# w, rect.h
# src/t2k.c:21:     SDL_FillRect(screenSurface,&rect,col);
	movl	$rect, %esi	#,
	movq	screenSurface(%rip), %rdi	# screenSurface,
	jmp	*SDL_FillRect@GOTPCREL(%rip)	#
	.size	drawRect, .-drawRect
	.section	.text.drawScore,"ax",@progbits
	.type	drawScore, @function
drawScore:
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbp	#
	pushq	%rbx	#
	pushq	%rdx	#
	movl	%esi, %ebx	# x, x
# src/t2k.c:104:     SDL_itoa(value,buffer,10);
	movl	$10, %edx	#,
	movl	$buffer.36320, %esi	#,
	call	*SDL_itoa@GOTPCREL(%rip)	#
	movl	$buffer.36320, %r14d	#, ivtmp.105
.L36:
# src/t2k.c:105:     for(int i=0;buffer[i];i++)
	movsbl	(%r14), %eax	# MEM[base: _56, offset: 0B],
# src/t2k.c:105:     for(int i=0;buffer[i];i++)
	testb	%al, %al	# _5
	je	.L47	#,
# src/t2k.c:107:         drawcharacter((buffer[i]-48),((FONTSIZE<<2)*i)+x,SCREEN_HEIGHT-45);
	subl	$48, %eax	#, _4
	xorl	%ebp, %ebp	# ivtmp.101
	movl	$915, %r13d	#, ivtmp.99
# src/t2k.c:118:             if(16384 >> (i) & characters2[num])
	cltq
	movswl	characters2(%rax,%rax), %r15d	# characters2, tmp115
.L37:
# src/t2k.c:115:         for(int x=0;x<3;++x)
	xorl	%r12d, %r12d	# x
.L39:
# src/t2k.c:118:             if(16384 >> (i) & characters2[num])
	leal	(%r12,%rbp), %ecx	#, tmp110
	movl	$16384, %eax	#, tmp111
	sarl	%cl, %eax	# tmp110, tmp111
# src/t2k.c:118:             if(16384 >> (i) & characters2[num])
	testl	%r15d, %eax	# tmp115, tmp111
	je	.L38	#,
# src/t2k.c:120:                 drawRect(x*FONTSIZE+posX,y*FONTSIZE+posY,FONTSIZE,white);
	leal	(%rbx,%r12,8), %edi	#, tmp118
	movl	$16777215, %ecx	#,
	movl	$8, %edx	#,
	movl	%r13d, %esi	# ivtmp.99,
	call	drawRect	#
.L38:
# src/t2k.c:115:         for(int x=0;x<3;++x)
	incl	%r12d	# x
# src/t2k.c:115:         for(int x=0;x<3;++x)
	cmpl	$3, %r12d	#, x
	jne	.L39	#,
	addl	$8, %r13d	#, ivtmp.99
	addl	$3, %ebp	#, ivtmp.101
# src/t2k.c:114:     for(int y=0;y<5;++y)
	cmpl	$955, %r13d	#, ivtmp.99
	jne	.L37	#,
	incq	%r14	# ivtmp.105
	addl	$32, %ebx	#, ivtmp.106
	jmp	.L36	#
.L47:
# src/t2k.c:109: }
	popq	%rax	#
	popq	%rbx	#
	popq	%rbp	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	ret	
	.size	drawScore, .-drawScore
	.section	.text.initStone,"ax",@progbits
	.type	initStone, @function
initStone:
	pushq	%rdx	#
.L53:
# src/t2k.c:31:         result=SDL_GetTicks()&7;
	call	*SDL_GetTicks@GOTPCREL(%rip)	#
# src/t2k.c:31:         result=SDL_GetTicks()&7;
	andl	$7, %eax	#, result
# src/t2k.c:32:     } while(result==7||result==nCurrentPiece);
	cmpl	$7, %eax	#, result
	je	.L53	#,
# src/t2k.c:32:     } while(result==7||result==nCurrentPiece);
	cmpl	nCurrentPiece(%rip), %eax	# nCurrentPiece, result
	je	.L53	#,
# src/t2k.c:33:     nCurrentPiece=result;
	movl	%eax, nCurrentPiece(%rip)	# result, nCurrentPiece
# src/t2k.c:271:         nCurrentRotation=0;
	movb	$0, nCurrentRotation(%rip)	#, nCurrentRotation
# src/t2k.c:272:         nCurrentY= 0;
	movb	$0, nCurrentY(%rip)	#, nCurrentY
# src/t2k.c:273:         nCurrentX = (FIELDWIDTH>>2)+1;
	movb	$4, nCurrentX(%rip)	#, nCurrentX
# src/t2k.c:274:         runtime=0;
	movl	$0, runtime(%rip)	#, runtime
	xorl	%eax, %eax	# ivtmp.108
.L50:
# src/t2k.c:14:         ((char*)dest)[i]=((char*)src)[i];
	movb	pBackBuffer(%rax), %dl	# MEM[symbol: pBackBuffer, index: ivtmp.108_27, offset: 0B], MEM[symbol: pBackBuffer, index: ivtmp.108_27, offset: 0B]
	movb	%dl, pBuffer(%rax)	# MEM[symbol: pBackBuffer, index: ivtmp.108_27, offset: 0B], MEM[symbol: pBuffer, index: ivtmp.108_27, offset: 0B]
	incq	%rax	# ivtmp.108
# src/t2k.c:12: 	for(int i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, ivtmp.108
	jne	.L50	#,
# src/t2k.c:276: }
	popq	%rax	#
	ret	
	.size	initStone, .-initStone
	.section	.text.initGame,"ax",@progbits
	.type	initGame, @function
initGame:
# src/t2k.c:281:     score=0;
	movl	$0, score(%rip)	#, score
# src/t2k.c:282:     lines=0;
	movl	$0, lines(%rip)	#, lines
	xorl	%eax, %eax	# ivtmp.131
.L57:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movb	$9, pBackBuffer(%rax)	#, MEM[symbol: pBackBuffer, index: ivtmp.131_22, offset: 0B]
	incq	%rax	# ivtmp.131
# src/t2k.c:4:     for(int i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, ivtmp.131
	jne	.L57	#,
	xorl	%eax, %eax	# ivtmp.129
.L59:
# src/t2k.c:4:     for(int i=0;i<numbytes;i++)
	movl	$1, %edx	#, ivtmp.117
.L58:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movb	$0, pBackBuffer(%rax,%rdx)	#, MEM[symbol: pBackBuffer, base: ivtmp.129_6, index: ivtmp.117_33, offset: 0B]
	incq	%rdx	# ivtmp.117
# src/t2k.c:4:     for(int i=0;i<numbytes;i++)
	cmpq	$11, %rdx	#, ivtmp.117
	jne	.L58	#,
	addq	$12, %rax	#, ivtmp.129
# src/t2k.c:285:     for(int y=0;y<FIELDHEIGHT-1;y++)
	cmpq	$204, %rax	#, ivtmp.129
	jne	.L59	#,
# src/t2k.c:289:     initStone();
	xorl	%eax, %eax	#
	jmp	initStone	#
	.size	initGame, .-initGame
	.section	.text.Rotate,"ax",@progbits
	.globl	Rotate
	.type	Rotate, @function
Rotate:
.L64:
# src/t2k.c:131:         x=12+py-(px<<2);
	addl	$12, %esi	#, tmp106
# src/t2k.c:131:         x=12+py-(px<<2);
	leal	0(,%rdi,4), %eax	#, tmp107
# src/t2k.c:131:         x=12+py-(px<<2);
	subl	%eax, %esi	# tmp107, x
# src/t2k.c:132:         px=x&3;
	movl	%esi, %edi	# x, px
	andl	$3, %edi	#, px
# src/t2k.c:133:         py=x>>2;
	sarb	$2, %sil	#, py
# src/t2k.c:135:     } while(--r);
	decb	%dl	# r
	jne	.L64	#,
# src/t2k.c:136:     return (py<<2)+px;
	leal	(%rdi,%rsi,4), %eax	#, tmp108
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
	addl	%edx, %ecx	# nPosX, ivtmp.155
# src/t2k.c:141:     for(int px=0;px<4;++px)
	xorl	%r9d, %r9d	# px
# src/t2k.c:146:             int pi = (Rotate((px),(py),(nRotation)));
	movsbl	%sil, %r10d	# nRotation, nRotation
.L67:
# src/t2k.c:143:         for(int py=0;py<4;++py)
	xorl	%r8d, %r8d	# py
.L70:
# src/t2k.c:146:             int pi = (Rotate((px),(py),(nRotation)));
	movl	%r10d, %edx	# nRotation,
	movl	%r8d, %esi	# py,
	movl	%r9d, %edi	# px,
	call	Rotate	#
# src/t2k.c:149:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	btl	%eax, %r11d	# _7, _12
	jnc	.L68	#,
# src/t2k.c:149:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	imull	$12, %r8d, %eax	#, py, tmp119
	addl	%ecx, %eax	# ivtmp.155, tmp120
	cltq
# src/t2k.c:149:             if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
	cmpb	$0, pBuffer(%rax)	#, pBuffer
	jne	.L71	#,
.L68:
# src/t2k.c:143:         for(int py=0;py<4;++py)
	incl	%r8d	# py
# src/t2k.c:143:         for(int py=0;py<4;++py)
	cmpl	$4, %r8d	#, py
	jne	.L70	#,
# src/t2k.c:141:     for(int px=0;px<4;++px)
	incl	%r9d	# px
	incl	%ecx	# ivtmp.155
# src/t2k.c:141:     for(int px=0;px<4;++px)
	cmpl	$4, %r9d	#, px
	jne	.L67	#,
# src/t2k.c:155:     return true;
	movb	$1, %al	#, <retval>
# src/t2k.c:156: }
	ret	
.L71:
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
	subq	$72, %rsp	#,
# src/t2k.c:348:     asm volatile("sub $8, %rsp");
#APP
# 348 "src/t2k.c" 1
	sub $8, %rsp
# 0 "" 2
# src/t2k.c:349:     initGame();
#NO_APP
	xorl	%eax, %eax	#
	call	initGame	#
# src/t2k.c:331:     want.freq = SAMPLERATE;
	movl	$44100, 8(%rsp)	#, want.freq
# src/t2k.c:332:     want.format = AUDIO_S16SYS;
	movw	$-32752, 12(%rsp)	#, want.format
# src/t2k.c:333:     want.channels=1;
	movb	$1, 14(%rsp)	#, want.channels
# src/t2k.c:334:     want.samples = BUFFERSIZE;
	movw	$8192, 16(%rsp)	#, want.samples
# src/t2k.c:335:     want.callback = audio_callback;    
	movq	$audio_callback, 24(%rsp)	#, want.callback
# src/t2k.c:336:     SDL_OpenAudio((&want), NULL);
	xorl	%esi, %esi	#
	leaq	8(%rsp), %rdi	#, tmp275
	call	*SDL_OpenAudio@GOTPCREL(%rip)	#
# src/t2k.c:337:     SDL_PauseAudio(0);             
	xorl	%edi, %edi	#
	call	*SDL_PauseAudio@GOTPCREL(%rip)	#
# src/t2k.c:342:     window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
	xorl	%r9d, %r9d	#
	movl	$960, %r8d	#,
	movl	$620, %ecx	#,
	xorl	%edx, %edx	#
	xorl	%esi, %esi	#
	xorl	%edi, %edi	#
	call	*SDL_CreateWindow@GOTPCREL(%rip)	#
# src/t2k.c:342:     window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
	movq	%rax, window(%rip)	# _19, window
# src/t2k.c:343:     screenSurface = SDL_GetWindowSurface(window);
	movq	%rax, %rdi	# _19,
	call	*SDL_GetWindowSurface@GOTPCREL(%rip)	#
# src/t2k.c:343:     screenSurface = SDL_GetWindowSurface(window);
	movq	%rax, screenSurface(%rip)	# _20, screenSurface
.L104:
# src/t2k.c:347: {
	xorl	%eax, %eax	# ivtmp.226
.L78:
# src/t2k.c:14:         ((char*)dest)[i]=((char*)src)[i];
	movb	pBuffer(%rax), %dl	# MEM[symbol: pBuffer, index: ivtmp.226_271, offset: 0B], MEM[symbol: pBuffer, index: ivtmp.226_271, offset: 0B]
	movb	%dl, pBackBuffer(%rax)	# MEM[symbol: pBuffer, index: ivtmp.226_271, offset: 0B], MEM[symbol: pBackBuffer, index: ivtmp.226_271, offset: 0B]
	incq	%rax	# ivtmp.226
# src/t2k.c:12: 	for(int i=0;i<numbytes;i++)
	cmpq	$216, %rax	#, ivtmp.226
	jne	.L78	#,
	xorl	%ebx, %ebx	# ivtmp.223
# src/t2k.c:308:     int multi=0;
	xorl	%ebp, %ebp	# multi
.L79:
# src/t2k.c:347: {
	xorl	%eax, %eax	# ivtmp.211
.L81:
# src/t2k.c:296:         if(!pBackBuffer[line*FIELDWIDTH+px])
	cmpb	$0, pBackBuffer(%rbx,%rax)	#, MEM[symbol: pBackBuffer, base: ivtmp.223_268, index: ivtmp.211_90, offset: 0B]
	je	.L80	#,
	incq	%rax	# ivtmp.211
# src/t2k.c:294:     for(int px=0;px<FIELDWIDTH;++px)
	cmpq	$12, %rax	#, ivtmp.211
	jne	.L81	#,
# src/t2k.c:316:             lines++;
	incl	lines(%rip)	# lines
# src/t2k.c:317:             multi+=25;
	addl	$25, %ebp	#, multi
# src/t2k.c:318:             score+=multi;
	addl	%ebp, score(%rip)	# multi, score
	leaq	12(%rbx), %rax	#, ivtmp.197
.L105:
# src/t2k.c:260:     for(line=(++line)*FIELDWIDTH;line>12;--line)
	cmpl	$12, %eax	#, ivtmp.197
	je	.L118	#,
# src/t2k.c:262:         pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
	movb	pBackBuffer-12(%rax), %dl	# MEM[symbol: pBackBuffer, index: ivtmp.197_224, offset: -12B], _82
# src/t2k.c:262:         pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
	movb	%dl, pBackBuffer(%rax)	# _82, MEM[symbol: pBackBuffer, index: ivtmp.197_224, offset: 0B]
	decq	%rax	# ivtmp.197
	jmp	.L105	#
.L118:
# src/t2k.c:6:         ((char*)dest)[i]=val;
	movq	$0, pBackBuffer+1(%rip)	#, MEM[(char *)&pBackBuffer + 1B]
	movb	$0, pBackBuffer+9(%rip)	#, MEM[(char *)&pBackBuffer + 9B]
# src/t2k.c:265:     initStone();
	xorl	%eax, %eax	#
	call	initStone	#
.L80:
	addq	$12, %rbx	#, ivtmp.223
# src/t2k.c:311:     for(int py=0;py<FIELDHEIGHT-1;++py)
	cmpq	$204, %rbx	#, ivtmp.223
	jne	.L79	#,
# src/t2k.c:323:     placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
	movsbl	nCurrentRotation(%rip), %r11d	# nCurrentRotation, _59
	movslq	nCurrentPiece(%rip), %rdx	# nCurrentPiece,
	movq	%rdx, %rax	#,
# src/t2k.c:249:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	movswl	characters(%rdx,%rdx), %ebx	# characters, _89
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY, nCurrentY
	imull	$12, %ecx, %ecx	#, nCurrentY, tmp223
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	addl	%edx, %ecx	# nCurrentX, ivtmp.191
# src/t2k.c:245:     for(int py=0;py<4;++py)
	xorl	%r9d, %r9d	# py
# src/t2k.c:252:                 pBackBuffer[i]=(piece+1);
	leal	1(%rax), %r10d	#, tmp271
.L85:
# src/t2k.c:247:         for(int px=0;px<4;++px)
	xorl	%r8d, %r8d	# px
.L87:
# src/t2k.c:249:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	movl	%r11d, %edx	# _59,
	movl	%r9d, %esi	# py,
	movl	%r8d, %edi	# px,
	call	Rotate	#
# src/t2k.c:249:             if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
	btl	%eax, %ebx	# _98, _89
	jnc	.L86	#,
# src/t2k.c:252:                 pBackBuffer[i]=(piece+1);
	leal	(%r8,%rcx), %eax	#, tmp229
	cltq
# src/t2k.c:252:                 pBackBuffer[i]=(piece+1);
	movb	%r10b, pBackBuffer(%rax)	# tmp271, pBackBuffer
.L86:
# src/t2k.c:247:         for(int px=0;px<4;++px)
	incl	%r8d	# px
# src/t2k.c:247:         for(int px=0;px<4;++px)
	cmpl	$4, %r8d	#, px
	jne	.L87	#,
# src/t2k.c:245:     for(int py=0;py<4;++py)
	incl	%r9d	# py
	addl	$12, %ecx	#, ivtmp.191
# src/t2k.c:245:     for(int py=0;py<4;++py)
	cmpl	$4, %r9d	#, py
	jne	.L85	#,
# src/t2k.c:324:     SDL_Delay(15);
	movl	$15, %edi	#,
	call	*SDL_Delay@GOTPCREL(%rip)	#
# src/t2k.c:216:     SDL_FillRect(screenSurface,NULL,0x12121212);
	movl	$303174162, %edx	#,
	xorl	%esi, %esi	#
	movq	screenSurface(%rip), %rdi	# screenSurface,
	call	*SDL_FillRect@GOTPCREL(%rip)	#
# src/t2k.c:219:      drawScore(score,10);
	movl	$10, %esi	#,
	movl	score(%rip), %edi	# score,
	call	drawScore	#
# src/t2k.c:220:      drawScore(lines,200);
	movl	$200, %esi	#,
	movl	lines(%rip), %edi	# lines,
	call	drawScore	#
	movl	$pBackBuffer, %r13d	#, ivtmp.176
	movl	$12, %ebp	#, ivtmp.173
.L89:
	leal	-2(%rbp), %r15d	#, _18
	leal	6(%rbp), %r14d	#, _49
# src/t2k.c:245:     for(int py=0;py<4;++py)
	movq	%r13, %r12	# ivtmp.176, ivtmp.162
	movl	$10, %ebx	#, ivtmp.163
.L91:
# src/t2k.c:231:             drawRect(x*50+10,y*50+10,48,(int)(colors[(int)(pBackBuffer[i])]));
	movsbq	(%r12), %rax	# MEM[base: _168, offset: 0B], MEM[base: _168, offset: 0B]
# src/t2k.c:231:             drawRect(x*50+10,y*50+10,48,(int)(colors[(int)(pBackBuffer[i])]));
	movl	colors(,%rax,4), %ecx	# colors, tmp235
	movl	$48, %edx	#,
	movl	%r15d, %esi	# _18,
	movl	%ebx, %edi	# ivtmp.163,
	call	drawRect	#
# src/t2k.c:233:             if(pBackBuffer[i]!=9)
	cmpb	$9, (%r12)	#, MEM[base: _168, offset: 0B]
	je	.L90	#,
# src/t2k.c:235:                 drawRect(x*50+12,y*50+12,44,(int)(0));
	leal	2(%rbx), %edi	#, tmp236
	xorl	%ecx, %ecx	#
	movl	$44, %edx	#,
	movl	%ebp, %esi	# ivtmp.173,
	call	drawRect	#
# src/t2k.c:236:                 drawRect(x*50+18,y*50+18,32,(int)(colors[(int)(pBackBuffer[i])]));
	movsbq	(%r12), %rax	# MEM[base: _168, offset: 0B], MEM[base: _168, offset: 0B]
# src/t2k.c:236:                 drawRect(x*50+18,y*50+18,32,(int)(colors[(int)(pBackBuffer[i])]));
	movl	colors(,%rax,4), %ecx	# colors, tmp240
	leal	8(%rbx), %edi	#, tmp241
	movl	$32, %edx	#,
	movl	%r14d, %esi	# _49,
	call	drawRect	#
.L90:
	incq	%r12	# ivtmp.162
	addl	$50, %ebx	#, ivtmp.163
# src/t2k.c:228:         for(int x=0;x<FIELDWIDTH;++x)
	cmpl	$610, %ebx	#, ivtmp.163
	jne	.L91	#,
	addl	$50, %ebp	#, ivtmp.173
	addq	$12, %r13	#, ivtmp.176
# src/t2k.c:226:     for(int y=0;y<FIELDHEIGHT;++y)
	cmpl	$912, %ebp	#, ivtmp.173
	jne	.L89	#,
# src/t2k.c:240:     SDL_UpdateWindowSurface(window);
	movq	window(%rip), %rdi	# window,
	call	*SDL_UpdateWindowSurface@GOTPCREL(%rip)	#
# src/t2k.c:355:         if((runtime&15)==0)
	testb	$15, runtime(%rip)	#, runtime
	jne	.L94	#,
# src/t2k.c:160:     if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY,
	movl	%ecx, %ebx	#,
	incl	%ecx	# tmp245
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	movsbl	nCurrentRotation(%rip), %esi	# nCurrentRotation, nCurrentRotation
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:160:     if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
	testb	%al, %al	# _119
	je	.L95	#,
# src/t2k.c:162:         ++nCurrentY;
	incl	%ebx	# tmp248
	movb	%bl, nCurrentY(%rip)	# tmp248, nCurrentY
	jmp	.L94	#
.L95:
# src/t2k.c:167:         initStone();
	xorl	%eax, %eax	#
	call	initStone	#
# src/t2k.c:168:         return (!DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY));
	movsbl	nCurrentY(%rip), %ecx	# nCurrentY, nCurrentY
	movsbl	nCurrentX(%rip), %edx	# nCurrentX, nCurrentX
	movsbl	nCurrentRotation(%rip), %esi	# nCurrentRotation, nCurrentRotation
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:357:             if(FallDown())
	testb	%al, %al	# _130
	jne	.L94	#,
# src/t2k.c:359:                 initGame();
	call	initGame	#
# src/t2k.c:360:                 SDL_Delay(2000);
	movl	$2000, %edi	#,
	call	*SDL_Delay@GOTPCREL(%rip)	#
.L94:
# src/t2k.c:363:         runtime++;
	incl	runtime(%rip)	# runtime
# src/t2k.c:175:     handlekeys=true;
	movb	$1, handlekeys(%rip)	#, handlekeys
.L97:
# src/t2k.c:176:     while(SDL_PollEvent(&e))
	leaq	8(%rsp), %rdi	#, tmp276
	call	*SDL_PollEvent@GOTPCREL(%rip)	#
# src/t2k.c:176:     while(SDL_PollEvent(&e))
	testl	%eax, %eax	# _165
	je	.L104	#,
# src/t2k.c:178:         if (e.type==SDL_QUIT)
	movl	8(%rsp), %eax	# e.type, _133
# src/t2k.c:178:         if (e.type==SDL_QUIT)
	cmpl	$256, %eax	#, _133
	jne	.L98	#,
# src/t2k.c:181:             asm volatile("push $231;pop %rax;syscall");
#APP
# 181 "src/t2k.c" 1
	push $231;pop %rax;syscall
# 0 "" 2
#NO_APP
.L98:
# src/t2k.c:189:         if(e.type==SDL_KEYDOWN&&handlekeys)
	cmpl	$768, %eax	#, _133
	jne	.L97	#,
# src/t2k.c:189:         if(e.type==SDL_KEYDOWN&&handlekeys)
	cmpb	$0, handlekeys(%rip)	#, handlekeys
	je	.L97	#,
# src/t2k.c:191:             handlekeys=false;
	movb	$0, handlekeys(%rip)	#, handlekeys
# src/t2k.c:192:             char key=(e.key.keysym.sym);
	movl	28(%rsp), %eax	# e.key.keysym.sym, e.key.keysym.sym
# src/t2k.c:193:             char newRot=nCurrentRotation+(key=='w');
	cmpb	$119, %al	#, e.key.keysym.sym
	sete	%r12b	#, tmp254
# src/t2k.c:193:             char newRot=nCurrentRotation+(key=='w');
	addb	nCurrentRotation(%rip), %r12b	# nCurrentRotation, newRot
# src/t2k.c:194:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	cmpb	$100, %al	#, e.key.keysym.sym
	sete	%bl	#, tmp257
# src/t2k.c:194:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	addb	nCurrentX(%rip), %bl	# nCurrentX, tmp258
# src/t2k.c:194:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	cmpb	$97, %al	#, e.key.keysym.sym
	sete	%dl	#, tmp261
# src/t2k.c:194:             char newX=(nCurrentX)+(key=='d')-(key=='a');
	subl	%edx, %ebx	# tmp261, newX
# src/t2k.c:195:             char newY=(nCurrentY)+(key=='s');
	movb	nCurrentY(%rip), %r13b	# nCurrentY, nCurrentY.54_154
# src/t2k.c:195:             char newY=(nCurrentY)+(key=='s');
	cmpb	$115, %al	#, e.key.keysym.sym
	sete	%bpl	#, tmp263
# src/t2k.c:195:             char newY=(nCurrentY)+(key=='s');
	addl	%r13d, %ebp	# nCurrentY.54_154, newY
# src/t2k.c:197:             if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
	movsbl	%bpl, %ecx	# newY, newY
	movsbl	%bl, %edx	# newX, newX
	movsbl	%r12b, %esi	# newRot, newRot
	movl	nCurrentPiece(%rip), %edi	# nCurrentPiece,
	call	DoesPieceFit	#
# src/t2k.c:197:             if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
	testb	%al, %al	# _162
	je	.L97	#,
# src/t2k.c:200:                 if(newY!=nCurrentY)
	cmpb	%bpl, %r13b	# newY, nCurrentY.54_154
	je	.L102	#,
# src/t2k.c:202:                     score++;
	incl	score(%rip)	# score
.L102:
# src/t2k.c:205:                 nCurrentRotation=newRot;
	movb	%r12b, nCurrentRotation(%rip)	# newRot, nCurrentRotation
# src/t2k.c:206:                 nCurrentX=newX;
	movb	%bl, nCurrentX(%rip)	# newX, nCurrentX
# src/t2k.c:207:                 nCurrentY=newY;
	movb	%bpl, nCurrentY(%rip)	# newY, nCurrentY
	jmp	.L97	#
	.size	_start, .-_start
	.section	.bss.buffer.36320,"aw",@nobits
	.type	buffer.36320, @object
	.size	buffer.36320, 15
buffer.36320:
	.zero	15
	.section	.bss.counter.36299,"aw",@nobits
	.align 4
	.type	counter.36299, @object
	.size	counter.36299, 12
counter.36299:
	.zero	12
	.section	.bss.vol.36297,"aw",@nobits
	.align 2
	.type	vol.36297, @object
	.size	vol.36297, 6
vol.36297:
	.zero	6
	.section	.bss.hertz.36306,"aw",@nobits
	.align 4
	.type	hertz.36306, @object
	.size	hertz.36306, 12
hertz.36306:
	.zero	12
	.section	.bss.previous.36300,"aw",@nobits
	.align 4
	.type	previous.36300, @object
	.size	previous.36300, 12
previous.36300:
	.zero	12
	.section	.bss.song_clock.36298,"aw",@nobits
	.align 4
	.type	song_clock.36298, @object
	.size	song_clock.36298, 4
song_clock.36298:
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
	.section	.bss.lines,"aw",@nobits
	.align 4
	.type	lines, @object
	.size	lines, 4
lines:
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
