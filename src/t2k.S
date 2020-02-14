	.file	"t2k.c"
	.text
	.section	.text.audio_callback,"ax",@progbits
	.type	audio_callback, @function
audio_callback:
	pushq	%rbp
	pushq	%rbx
	movl	%edx, %ecx
	sarl	%ecx
	movl	song_clock(%rip), %r11d
	movl	noteCnt(%rip), %r9d
	xorl	%edi, %edi
	xorl	%r8d, %r8d
	xorl	%r10d, %r10d
	movl	$10850, %ebx
	movss	.LC1(%rip), %xmm1
	movss	.LC2(%rip), %xmm2
.L2:
	leal	(%r11,%rdi), %eax
	cmpl	%edi, %ecx
	jle	.L34
	cltd
	idivl	%ebx
	testl	%edx, %edx
	jne	.L3
	movl	%r9d, %eax
	sarl	$6, %eax
	andl	$7, %eax
	movsbq	order(%rax), %rax
	salq	$6, %rax
	movl	%r9d, %edx
	andl	$63, %edx
	leaq	cpatterns(%rax,%rdx), %r10
	xorl	%eax, %eax
.L8:
	movq	%rax, %rdx
	salq	$8, %rdx
	movsbl	(%r10,%rdx), %edx
	cmpl	%edx, previous(,%rax,4)
	je	.L4
	testl	%edx, %edx
	je	.L4
	movw	$1024, vol(%rax,%rax)
	movl	%edx, previous(,%rax,4)
.L4:
	subw	$100, vol(%rax,%rax)
	testl	%edx, %edx
	je	.L6
	movl	$1, %r8d
	movss	.LC0(%rip), %xmm0
.L5:
	cmpl	%r8d, %edx
	jle	.L35
	mulss	%xmm1, %xmm0
	incl	%r8d
	jmp	.L5
.L35:
	movss	%xmm0, hertz(,%rax,4)
.L6:
	incq	%rax
	cmpq	$3, %rax
	jne	.L8
	incl	%r9d
	movb	$1, %r10b
.L3:
	movw	$0, (%rsi,%rdi,2)
	xorl	%eax, %eax
.L12:
	movswl	vol(%rax,%rax), %edx
	testw	%dx, %dx
	jle	.L9
	movaps	%xmm2, %xmm0
	divss	hertz(,%rax,4), %xmm0
	cvttss2si	%xmm0, %ebp
	movl	counter(,%rax,4), %r8d
	cmpl	%r8d, %ebp
	jg	.L10
	xorl	%r8d, %r8d
.L10:
	incl	%r8d
	movl	%r8d, counter(,%rax,4)
	sarl	$2, %ebp
	cmpl	%r8d, %ebp
	jge	.L11
	negl	%edx
.L11:
	addw	%dx, (%rsi,%rdi,2)
.L9:
	incq	%rax
	cmpq	$3, %rax
	jne	.L12
	incq	%rdi
	movb	$1, %r8b
	jmp	.L2
.L34:
	testl	%ecx, %ecx
	movl	$0, %edx
	cmovs	%edx, %ecx
	addl	%r11d, %ecx
	testb	%r10b, %r10b
	je	.L14
	movl	%r9d, noteCnt(%rip)
.L14:
	testb	%r8b, %r8b
	je	.L1
	movl	%ecx, song_clock(%rip)
.L1:
	popq	%rbx
	popq	%rbp
	ret
	.size	audio_callback, .-audio_callback
	.section	.text.shuffle,"ax",@progbits
	.type	shuffle, @function
shuffle:
	pushq	%rdx
.L39:
	call	*SDL_GetTicks@GOTPCREL(%rip)
	andl	$7, %eax
	cmpl	$7, %eax
	je	.L39
	cmpl	%eax, nCurrentPiece(%rip)
	je	.L39
	movl	%eax, nCurrentPiece(%rip)
	popq	%rax
	ret
	.size	shuffle, .-shuffle
	.section	.text.updateBuffer,"ax",@progbits
	.type	updateBuffer, @function
updateBuffer:
	xorl	%eax, %eax
.L43:
	movb	pBackBuffer(%rax), %dl
	movb	%dl, pBuffer(%rax)
	incq	%rax
	cmpq	$216, %rax
	jne	.L43
	ret
	.size	updateBuffer, .-updateBuffer
	.section	.text.Rotate,"ax",@progbits
	.globl	Rotate
	.type	Rotate, @function
Rotate:
.L46:
	testb	%dl, %dl
	je	.L48
	addl	$12, %esi
	leal	0(,%rdi,4), %eax
	subl	%eax, %esi
	movl	%esi, %edi
	andl	$3, %edi
	sarb	$2, %sil
	decl	%edx
	jmp	.L46
.L48:
	leal	(%rdi,%rsi,4), %eax
	ret
	.size	Rotate, .-Rotate
	.section	.text.DoesPieceFit,"ax",@progbits
	.globl	DoesPieceFit
	.type	DoesPieceFit, @function
DoesPieceFit:
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edx, %ebp
	xorl	%r8d, %r8d
	movsbl	%sil, %r11d
	movslq	%edi, %rbx
.L50:
	movl	%ecx, %r10d
	xorl	%r9d, %r9d
	leal	0(%rbp,%r8), %r12d
.L53:
	movl	%r9d, %eax
	addl	%ebp, %eax
	js	.L51
	cmpl	$17, %r10d
	jg	.L51
	movl	%r11d, %edx
	movl	%r9d, %esi
	movl	%r8d, %edi
	call	Rotate
	movswl	characters(%rbx,%rbx), %edx
	btl	%eax, %edx
	jnc	.L51
	imull	$12, %r10d, %eax
	addl	%r12d, %eax
	movswq	%ax, %rax
	cmpb	$0, pBuffer(%rax)
	jne	.L54
.L51:
	incl	%r9d
	incl	%r10d
	cmpl	$4, %r9d
	jne	.L53
	incl	%r8d
	cmpl	$4, %r8d
	jne	.L50
	movb	$1, %al
	jmp	.L49
.L54:
	xorl	%eax, %eax
.L49:
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	DoesPieceFit, .-DoesPieceFit
	.section	.text.initGame,"ax",@progbits
	.globl	initGame
	.type	initGame, @function
initGame:
	pushq	%rcx
	movl	$0, score(%rip)
	xorl	%eax, %eax
	call	shuffle
	movb	$4, nCurrentX(%rip)
	xorl	%eax, %eax
.L65:
	movb	$9, pBackBuffer(%rax)
	incq	%rax
	cmpq	$216, %rax
	jne	.L65
	xorl	%eax, %eax
.L67:
	xorl	%edx, %edx
.L66:
	movb	$0, pBackBuffer+1(%rax,%rdx)
	incq	%rdx
	cmpq	$10, %rdx
	jne	.L66
	addq	$12, %rax
	cmpq	$204, %rax
	jne	.L67
	xorl	%eax, %eax
	popq	%rdx
	jmp	updateBuffer
	.size	initGame, .-initGame
	.section	.text._start,"ax",@progbits
	.globl	_start
	.type	_start, @function
_start:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$88, %rsp
#APP
# 317 "src/t2k.c" 1
	sub $8, %rsp

# 0 "" 2
#NO_APP
	xorl	%eax, %eax
	call	initGame
	movl	$96000, 24(%rsp)
	movw	$-32752, 28(%rsp)
	movb	$1, 30(%rsp)
	movw	$4096, 32(%rsp)
	movq	$audio_callback, 40(%rsp)
	xorl	%esi, %esi
	leaq	24(%rsp), %rdi
	call	*SDL_OpenAudio@GOTPCREL(%rip)
	xorl	%edi, %edi
	call	*SDL_PauseAudio@GOTPCREL(%rip)
	xorl	%r9d, %r9d
	movl	$960, %r8d
	movl	$620, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	*SDL_CreateWindow@GOTPCREL(%rip)
	movq	%rax, window(%rip)
	movq	%rax, %rdi
	call	*SDL_GetWindowSurface@GOTPCREL(%rip)
	movq	%rax, screenSurface(%rip)
	movabsq	$34359738376, %rbx
.L102:
	xorl	%eax, %eax
.L73:
	movb	pBuffer(%rax), %dl
	movb	%dl, pBackBuffer(%rax)
	incq	%rax
	cmpq	$216, %rax
	jne	.L73
	xorl	%ecx, %ecx
	xorl	%esi, %esi
.L74:
	xorl	%eax, %eax
.L76:
	cmpb	$0, pBackBuffer(%rcx,%rax)
	je	.L75
	incq	%rax
	cmpq	$12, %rax
	jne	.L76
	addl	$25, %esi
	addl	%esi, score(%rip)
	leaq	12(%rcx), %rax
.L103:
	cmpl	$12, %eax
	je	.L120
	movb	pBackBuffer-12(%rax), %dl
	movb	%dl, pBackBuffer(%rax)
	decq	%rax
	jmp	.L103
.L120:
	movq	$0, pBackBuffer+1(%rip)
	movb	$0, pBackBuffer+9(%rip)
	xorl	%eax, %eax
	call	updateBuffer
.L75:
	addq	$12, %rcx
	cmpq	$204, %rcx
	jne	.L74
	movsbl	nCurrentRotation(%rip), %r11d
	movslq	nCurrentPiece(%rip), %rdx
	movq	%rdx, %rax
	movswl	characters(%rdx,%rdx), %ebp
	movsbl	nCurrentY(%rip), %ecx
	imull	$12, %ecx, %ecx
	movsbl	nCurrentX(%rip), %edx
	addl	%edx, %ecx
	xorl	%r9d, %r9d
	leal	1(%rax), %r10d
.L80:
	xorl	%r8d, %r8d
.L82:
	movl	%r11d, %edx
	movl	%r9d, %esi
	movl	%r8d, %edi
	call	Rotate
	btl	%eax, %ebp
	jnc	.L81
	leal	(%r8,%rcx), %eax
	cltq
	movb	%r10b, pBackBuffer(%rax)
.L81:
	incl	%r8d
	cmpl	$4, %r8d
	jne	.L82
	incl	%r9d
	addl	$12, %ecx
	cmpl	$4, %r9d
	jne	.L80
	movl	$15, %edi
	call	*SDL_Delay@GOTPCREL(%rip)
	movl	$303174162, %edx
	xorl	%esi, %esi
	movq	screenSurface(%rip), %rdi
	call	*SDL_FillRect@GOTPCREL(%rip)
	movl	$10, %edx
	movl	$buffer.10899, %esi
	movl	score(%rip), %edi
	call	*SDL_itoa@GOTPCREL(%rip)
	movl	$buffer.10899, %r13d
	xorl	%r14d, %r14d
.L84:
	movsbl	0(%r13), %eax
	testb	%al, %al
	je	.L121
	subl	$47, %eax
	xorl	%r15d, %r15d
	movl	$915, %r12d
	cltq
	movswl	characters2(%rax,%rax), %eax
	movl	%eax, 12(%rsp)
.L85:
	xorl	%ebp, %ebp
.L87:
	leal	(%r15,%rbp), %ecx
	movl	$16384, %eax
	sarl	%cl, %eax
	testl	%eax, 12(%rsp)
	je	.L86
	leal	(%r14,%rbp,8), %eax
	movl	%eax, 24(%rsp)
	movl	%r12d, 28(%rsp)
	movq	%rbx, 32(%rsp)
	movl	$16777215, %edx
	leaq	24(%rsp), %rsi
	movq	screenSurface(%rip), %rdi
	call	*SDL_FillRect@GOTPCREL(%rip)
.L86:
	incl	%ebp
	cmpl	$3, %ebp
	jne	.L87
	addl	$8, %r12d
	addl	$3, %r15d
	cmpl	$955, %r12d
	jne	.L85
	incq	%r13
	addl	$32, %r14d
	jmp	.L84
.L121:
	movl	$pBackBuffer, %r14d
	movl	$10, %r12d
	movabsq	$206158430256, %r15
.L90:
	movq	%r14, %r13
	movl	$10, %ebp
.L91:
	movsbq	0(%r13), %rax
	movl	colors(,%rax,4), %edx
	movl	%ebp, 24(%rsp)
	movl	%r12d, 28(%rsp)
	movq	%r15, 32(%rsp)
	leaq	24(%rsp), %rsi
	movq	screenSurface(%rip), %rdi
	call	*SDL_FillRect@GOTPCREL(%rip)
	incq	%r13
	addl	$50, %ebp
	cmpl	$610, %ebp
	jne	.L91
	addq	$12, %r14
	addl	$50, %r12d
	cmpl	$910, %r12d
	jne	.L90
	movq	window(%rip), %rdi
	call	*SDL_UpdateWindowSurface@GOTPCREL(%rip)
	testb	$15, runtime(%rip)
	jne	.L94
	movsbl	nCurrentY(%rip), %ecx
	movl	%ecx, %ebp
	incl	%ecx
	movsbl	nCurrentX(%rip), %edx
	movsbl	nCurrentRotation(%rip), %esi
	movl	nCurrentPiece(%rip), %edi
	call	DoesPieceFit
	testb	%al, %al
	je	.L95
	incl	%ebp
	movb	%bpl, nCurrentY(%rip)
	jmp	.L94
.L95:
	xorl	%eax, %eax
	call	shuffle
	movb	$0, nCurrentRotation(%rip)
	movb	$0, nCurrentY(%rip)
	movb	$4, nCurrentX(%rip)
	xorl	%eax, %eax
	call	updateBuffer
	xorl	%ecx, %ecx
	movl	$4, %edx
	xorl	%esi, %esi
	movl	nCurrentPiece(%rip), %edi
	call	DoesPieceFit
	testb	%al, %al
	jne	.L94
	call	initGame
	movl	$2000, %edi
	call	*SDL_Delay@GOTPCREL(%rip)
.L94:
	incl	runtime(%rip)
.L97:
	leaq	24(%rsp), %rdi
	call	*SDL_PollEvent@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L102
	movl	24(%rsp), %eax
	cmpl	$256, %eax
	jne	.L98
#APP
# 156 "src/t2k.c" 1
	.intel_syntax noprefix;push 231;pop rax;xor edi, edi;syscall;.att_syntax prefix
# 0 "" 2
#NO_APP
.L98:
	cmpl	$768, %eax
	jne	.L97
	movl	44(%rsp), %eax
	cmpb	$119, %al
	sete	%r13b
	addb	nCurrentRotation(%rip), %r13b
	cmpb	$100, %al
	sete	%bpl
	addb	nCurrentX(%rip), %bpl
	cmpb	$97, %al
	sete	%dl
	subl	%edx, %ebp
	movb	nCurrentY(%rip), %r14b
	cmpb	$115, %al
	sete	%r12b
	addl	%r14d, %r12d
	movsbl	%r12b, %ecx
	movsbl	%bpl, %edx
	movsbl	%r13b, %esi
	movl	nCurrentPiece(%rip), %edi
	call	DoesPieceFit
	testb	%al, %al
	je	.L97
	cmpb	%r12b, %r14b
	je	.L100
	incl	score(%rip)
.L100:
	movb	%r13b, nCurrentRotation(%rip)
	movb	%bpl, nCurrentX(%rip)
	movb	%r12b, nCurrentY(%rip)
	jmp	.L97
	.size	_start, .-_start
	.section	.bss.buffer.10899,"aw",@nobits
	.type	buffer.10899, @object
	.size	buffer.10899, 15
buffer.10899:
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
