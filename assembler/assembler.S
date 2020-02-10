	.file	"tetris.c"
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
	movl	$5000, %ebx
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
	movw	$2048, vol(%rax,%rax)
	movl	%edx, previous(,%rax,4)
.L4:
	subw	$200, vol(%rax,%rax)
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
	cvttss2sil	%xmm0, %ebp
	movl	counter(,%rax,4), %r8d
	cmpl	%r8d, %ebp
	jg	.L10
	xorl	%r8d, %r8d
.L10:
	incl	%r8d
	movl	%r8d, counter(,%rax,4)
	sarl	$3, %ebp
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
	.section	.text.InitPlayField,"ax",@progbits
	.type	InitPlayField, @function
InitPlayField:
	movb	$4, nCurrentX(%rip)
	xorl	%eax, %eax
.L46:
	movb	$9, pBackBuffer(%rax)
	incq	%rax
	cmpq	$216, %rax
	jne	.L46
	movl	$1, %eax
.L48:
	xorl	%edx, %edx
.L47:
	movb	$0, pBackBuffer(%rax,%rdx)
	incq	%rdx
	cmpq	$10, %rdx
	jne	.L47
	addq	$12, %rax
	cmpq	$205, %rax
	jne	.L48
	xorl	%eax, %eax
	jmp	updateBuffer
	.size	InitPlayField, .-InitPlayField
	.section	.text.Rotate,"ax",@progbits
	.globl	Rotate
	.type	Rotate, @function
Rotate:
.L53:
	testb	%dl, %dl
	je	.L55
	leal	12(%rsi), %ecx
	leal	0(,%rdi,4), %eax
	movl	%ecx, %esi
	subl	%eax, %esi
	andl	$3, %ecx
	movl	%ecx, %edi
	sarb	$2, %sil
	decl	%edx
	jmp	.L53
.L55:
	leal	(%rdi,%rsi,4), %eax
	ret
	.size	Rotate, .-Rotate
	.section	.text.DoesPieceFit,"ax",@progbits
	.globl	DoesPieceFit
	.type	DoesPieceFit, @function
DoesPieceFit:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edx, %r10d
	movl	%ecx, %ebx
	xorl	%r8d, %r8d
	movsbl	%sil, %ebp
	movslq	%edi, %r13
.L57:
	movl	%ebx, %r11d
	xorl	%r9d, %r9d
	leal	(%r10,%r8), %r12d
.L60:
	movl	%r9d, %eax
	addl	%r10d, %eax
	js	.L58
	cmpl	$17, %r11d
	jg	.L58
	movl	%ebp, %edx
	movl	%r9d, %esi
	movl	%r8d, %edi
	call	Rotate
	movswl	characters(%r13,%r13), %edx
	btl	%eax, %edx
	jnc	.L58
	imull	$12, %r11d, %eax
	addl	%r12d, %eax
	movswq	%ax, %rax
	cmpb	$0, pBuffer(%rax)
	jne	.L61
.L58:
	incl	%r9d
	incl	%r11d
	cmpl	$4, %r9d
	jne	.L60
	incl	%r8d
	cmpl	$4, %r8d
	jne	.L57
	movb	$1, %al
	jmp	.L56
.L61:
	xorl	%eax, %eax
.L56:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	DoesPieceFit, .-DoesPieceFit
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
# 326 "src/tetris.c" 1
	sub $8, %rsp

# 0 "" 2
#NO_APP
	movl	$44100, 24(%rsp)
	movw	$-32752, 28(%rsp)
	movb	$1, 30(%rsp)
	movw	$128, 32(%rsp)
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
	movq	%rax, %rdi
	movq	%rax, window(%rip)
	call	*SDL_GetWindowSurface@GOTPCREL(%rip)
	movq	%rax, screenSurface(%rip)
	xorl	%eax, %eax
	call	shuffle
	xorl	%eax, %eax
	call	InitPlayField
	movabsq	$34359738376, %rbx
.L101:
	xorl	%eax, %eax
.L72:
	movb	pBuffer(%rax), %dl
	movb	%dl, pBackBuffer(%rax)
	incq	%rax
	cmpq	$216, %rax
	jne	.L72
	xorl	%ecx, %ecx
.L73:
	xorl	%eax, %eax
.L75:
	cmpb	$0, pBackBuffer(%rcx,%rax)
	je	.L74
	incq	%rax
	cmpq	$12, %rax
	jne	.L75
	addl	$25, score(%rip)
	leaq	12(%rcx), %rax
.L102:
	cmpl	$12, %eax
	je	.L119
	movb	pBackBuffer-12(%rax), %dl
	movb	%dl, pBackBuffer(%rax)
	decq	%rax
	jmp	.L102
.L119:
	movq	$0, pBackBuffer+1(%rip)
	movb	$0, pBackBuffer+9(%rip)
	xorl	%eax, %eax
	call	updateBuffer
.L74:
	addq	$12, %rcx
	cmpq	$204, %rcx
	jne	.L73
	movsbl	nCurrentRotation(%rip), %r12d
	movslq	nCurrentPiece(%rip), %rdx
	movq	%rdx, %rax
	movswl	characters(%rdx,%rdx), %ebp
	movsbl	nCurrentY(%rip), %r8d
	imull	$12, %r8d, %r8d
	movsbl	nCurrentX(%rip), %edx
	addl	%edx, %r8d
	xorl	%r10d, %r10d
	leal	1(%rax), %r11d
.L79:
	xorl	%r9d, %r9d
.L81:
	movl	%r12d, %edx
	movl	%r10d, %esi
	movl	%r9d, %edi
	call	Rotate
	btl	%eax, %ebp
	jnc	.L80
	leal	(%r9,%r8), %eax
	cltq
	movb	%r11b, pBackBuffer(%rax)
.L80:
	incl	%r9d
	cmpl	$4, %r9d
	jne	.L81
	incl	%r10d
	addl	$12, %r8d
	cmpl	$4, %r10d
	jne	.L79
	movl	$303174162, %edx
	xorl	%esi, %esi
	movq	screenSurface(%rip), %rdi
	call	*SDL_FillRect@GOTPCREL(%rip)
	movl	$10, %edx
	movl	$buffer.37481, %esi
	movl	score(%rip), %edi
	call	*SDL_itoa@GOTPCREL(%rip)
	movl	$buffer.37481, %r13d
	xorl	%r14d, %r14d
.L83:
	movsbl	0(%r13), %eax
	testb	%al, %al
	je	.L120
	subl	$47, %eax
	xorl	%r15d, %r15d
	movl	$915, %r12d
	cltq
	movswl	characters2(%rax,%rax), %eax
	movl	%eax, 12(%rsp)
.L84:
	xorl	%ebp, %ebp
.L86:
	leal	(%r15,%rbp), %ecx
	movl	$16384, %eax
	sarl	%cl, %eax
	testl	%eax, 12(%rsp)
	je	.L85
	leal	(%r14,%rbp,8), %eax
	movl	%eax, 24(%rsp)
	movl	%r12d, 28(%rsp)
	movq	%rbx, 32(%rsp)
	movl	$16777215, %edx
	leaq	24(%rsp), %rsi
	movq	screenSurface(%rip), %rdi
	call	*SDL_FillRect@GOTPCREL(%rip)
.L85:
	incl	%ebp
	cmpl	$3, %ebp
	jne	.L86
	addl	$8, %r12d
	addl	$3, %r15d
	cmpl	$955, %r12d
	jne	.L84
	incq	%r13
	addl	$32, %r14d
	jmp	.L83
.L120:
	movl	$pBackBuffer, %r14d
	xorl	%r12d, %r12d
	movabsq	$206158430256, %rcx
.L89:
	imull	$50, %r12d, %r15d
	addl	$10, %r15d
	movq	%r14, %r13
	movl	$10, %ebp
.L90:
	movsbq	0(%r13), %rax
	movl	colors(,%rax,4), %edx
	movl	%ebp, 24(%rsp)
	movl	%r15d, 28(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	24(%rsp), %rsi
	movq	screenSurface(%rip), %rdi
	call	*SDL_FillRect@GOTPCREL(%rip)
	incq	%r13
	addl	$50, %ebp
	cmpl	$610, %ebp
	movabsq	$206158430256, %rcx
	jne	.L90
	incl	%r12d
	addq	$12, %r14
	cmpl	$18, %r12d
	jne	.L89
	movq	window(%rip), %rdi
	call	*SDL_UpdateWindowSurface@GOTPCREL(%rip)
	movl	$15, %edi
	call	*SDL_Delay@GOTPCREL(%rip)
	testb	$15, i.37543(%rip)
	jne	.L93
	movsbl	nCurrentY(%rip), %ecx
	movl	%ecx, %ebp
	incl	%ecx
	movsbl	nCurrentX(%rip), %edx
	movsbl	nCurrentRotation(%rip), %esi
	movl	nCurrentPiece(%rip), %edi
	call	DoesPieceFit
	testb	%al, %al
	je	.L94
	incl	%ebp
	movb	%bpl, nCurrentY(%rip)
	jmp	.L93
.L94:
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
	jne	.L93
	call	InitPlayField
	movl	$2000, %edi
	call	*SDL_Delay@GOTPCREL(%rip)
	movl	$0, score(%rip)
	movl	$0, i.37543(%rip)
.L93:
	incl	i.37543(%rip)
.L96:
	leaq	24(%rsp), %rdi
	call	*SDL_PollEvent@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L101
	movl	24(%rsp), %eax
	cmpl	$256, %eax
	jne	.L97
#APP
# 157 "src/tetris.c" 1
	.intel_syntax noprefix
# 0 "" 2
# 158 "src/tetris.c" 1
	push 231
# 0 "" 2
# 159 "src/tetris.c" 1
	pop rax
# 0 "" 2
# 160 "src/tetris.c" 1
	xor edi, edi
# 0 "" 2
# 161 "src/tetris.c" 1
	syscall
# 0 "" 2
# 162 "src/tetris.c" 1
	.att_syntax prefix
# 0 "" 2
#NO_APP
.L97:
	cmpl	$768, %eax
	jne	.L96
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
	je	.L96
	cmpb	%r12b, %r14b
	je	.L99
	incl	score(%rip)
.L99:
	movb	%r13b, nCurrentRotation(%rip)
	movb	%bpl, nCurrentX(%rip)
	movb	%r12b, nCurrentY(%rip)
	jmp	.L96
	.size	_start, .-_start
	.section	.bss.buffer.37481,"aw",@nobits
	.type	buffer.37481, @object
	.size	buffer.37481, 15
buffer.37481:
	.zero	15
	.section	.bss.i.37543,"aw",@nobits
	.align 4
	.type	i.37543, @object
	.size	i.37543, 4
i.37543:
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
	.section	.text.cpatterns,"a"
	.align 8
	.type	cpatterns, @object
	.size	cpatterns, 256
cpatterns:
	.string	">"
	.string	""
	.string	""
	.string	"9"
	.string	":"
	.string	"<"
	.string	"><:"
	.string	"9"
	.string	"7"
	.string	""
	.string	""
	.string	"7"
	.string	":"
	.string	">"
	.string	""
	.string	""
	.string	"<"
	.string	":"
	.string	"9"
	.string	""
	.string	""
	.string	"9"
	.string	":"
	.string	"<"
	.string	""
	.string	""
	.string	">"
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<"
	.string	""
	.string	""
	.string	"?"
	.string	"C"
	.string	""
	.string	""
	.string	"A"
	.string	"?"
	.string	">"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	":"
	.string	">"
	.string	"?><"
	.string	":"
	.string	"9"
	.string	""
	.string	""
	.string	"9"
	.string	":"
	.string	"<"
	.string	""
	.string	""
	.string	">"
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	">"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"9"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"6"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"9"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	">"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"9"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	">"
	.string	""
	.string	""
	.string	"C"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"B"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\032"
	.string	"&"
	.string	"\032"
	.string	"&"
	.string	"\032"
	.string	"&"
	.string	"\032"
	.string	"&"
	.string	"\037"
	.string	"+"
	.string	"\037"
	.string	"+"
	.string	"\037"
	.string	"+"
	.string	"\037"
	.string	"+"
	.string	"\036"
	.string	"*"
	.string	"\036"
	.string	"*"
	.string	"\032"
	.string	"&"
	.string	"\032"
	.string	"&"
	.string	"\037"
	.string	"+"
	.string	"\037"
	.string	"+"
	.string	"\037"
	.string	"!"
	.string	""
	.string	""
	.string	"\""
	.string	"$"
	.string	"\030"
	.string	""
	.string	""
	.string	"\030"
	.string	""
	.string	""
	.string	"\030"
	.string	"\037"
	.string	"\030"
	.string	"\026"
	.string	"\""
	.string	""
	.string	""
	.string	"\""
	.string	"\026"
	.string	"\035"
	.string	"\035"
	.string	""
	.string	""
	.string	"!"
	.string	"-"
	.string	""
	.string	""
	.string	"-"
	.string	""
	.string	""
	.string	"&"
	.string	""
	.string	""
	.string	"*"
	.string	"\037"
	.string	"&"
	.string	"\037"
	.string	"&"
	.string	"\037"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"+"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	"2"
	.string	"*"
	.string	""
	.string	""
	.string	"2"
	.string	""
	.string	""
	.string	"9"
	.string	""
	.string	""
	.string	"6"
	.string	"7"
	.string	"9"
	.string	""
	.string	""
	.string	"7"
	.string	"6"
	.string	"2"
	.string	""
	.string	""
	.string	"2"
	.string	"7"
	.string	":"
	.string	""
	.string	""
	.string	"9"
	.string	"7"
	.string	"6"
	.string	"2"
	.string	"6"
	.string	"7"
	.string	"9"
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	"2"
	.string	""
	.string	""
	.string	"2"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"3"
	.string	""
	.string	""
	.string	"7"
	.string	":"
	.string	"::9"
	.string	"7"
	.string	"5"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"2"
	.string	"5"
	.string	"753"
	.string	"2"
	.string	"6"
	.string	"2"
	.string	"6"
	.string	"7"
	.string	"9"
	.string	"6"
	.string	":"
	.string	"6"
	.string	"7"
	.string	"2"
	.string	"2"
	.string	""
	.string	""
	.string	"2"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"9"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"6"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"2"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"2"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"6"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"9"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"6"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"7"
	.string	""
	.string	""
	.string	":"
	.string	""
	.string	""
	.string	">"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.globl	order
	.section	.text.order,"a"
	.type	order, @object
	.size	order, 8
order:
	.string	""
	.string	"\001"
	.string	"\001\002\003"
	.ascii	"\001"
	.globl	characters2
	.section	.text.characters2,"a"
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
	.section	.text.characters,"a"
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
	.section	.text.colors,"a"
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
	.section	.text.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1099091988
	.align 4
.LC1:
	.long	1065852003
	.align 4
.LC2:
	.long	1194083328
	.ident	"GCC: (GNU) 9.2.0"
	.section	.note.GNU-stack,"",@progbits
