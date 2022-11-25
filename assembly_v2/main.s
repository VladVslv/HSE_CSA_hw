        .intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Print x (-1 <= x <= 1): "
.LC1:
	.string	"%lf"
	.align 8
.LC2:
	.string	"Incorrect input!\n\nPrint x (-1 <= x <= 1): "
.LC5:
	.string	"r"
.LC6:
	.string	"Input file does not exist"
	.align 8
.LC7:
	.string	"\nIncorrect input (-1 <= x <= 1)!"
.LC10:
	.string	"w"
.LC11:
	.string	"Time: %lf sec\n"
.LC12:
	.string	"res = %lf \n"
.LC13:
	.string	"x = %lf \n"
.LC14:
	.string	"\nTime: %lf sec\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi				#-68[rbp] = argc
	mov	QWORD PTR -80[rbp], rsi				#-80[rbp] = argv
	cmp	DWORD PTR -68[rbp], 1				#-68[rbp] = argc
	jg	.L2
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rsi, -64[rbp]					#-64[rbp] = x
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L3
.L4:
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rsi, -64[rbp]					#-64[rbp] = x
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L3:
	movsd	xmm1, QWORD PTR -64[rbp]			#-64[rbp] = x
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, xmm1
	ja	.L4
	movsd	xmm0, QWORD PTR -64[rbp]			#-64[rbp] = x
	movsd	xmm1, QWORD PTR .LC4[rip]
	comisd	xmm0, xmm1
	ja	.L4
	jmp	.L5
.L2:
	cmp	DWORD PTR -68[rbp], 2				#-68[rbp] = argc
	jle	.L6
	mov	rax, QWORD PTR -80[rbp]				#-80[rbp] = argv
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax				#-24[rbp] = input
	cmp	QWORD PTR -24[rbp], 0				#-24[rbp] = input
	jne	.L7
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L15
.L7:
	lea	rdx, -64[rbp]					#-64[rbp] = x
	mov	rax, QWORD PTR -24[rbp]				#-24[rbp] = input
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	movsd	xmm0, QWORD PTR -64[rbp]			#-64[rbp] = x
	movsd	xmm1, QWORD PTR .LC4[rip]
	comisd	xmm0, xmm1
	ja	.L9
	movsd	xmm1, QWORD PTR -64[rbp]			#-64[rbp] = x
	movsd	xmm0, QWORD PTR .LC3[rip]
	comisd	xmm0, xmm1
	jbe	.L5
.L9:
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L15
.L6:
	cmp	DWORD PTR -68[rbp], 1				#-68[rbp] = argc
	jle	.L5
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	addsd	xmm0, xmm0
	movsd	xmm1, QWORD PTR .LC8[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0			#-64[rbp] = x
.L5:
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax				#-32[rbp] = begin
	mov	r13d, 0						#r13d = i
	jmp	.L11
.L12:
	mov	rax, QWORD PTR -64[rbp]				#-64[rbp] = x
	movq	xmm0, rax					#xmm0 = x
	call	arcsin@PLT					#xmm0 = arcsin(x)
	movq	rax, xmm0					#rax = arcsin(x)
	mov	QWORD PTR -16[rbp], rax				#-16[rbp] = res
	add	r13d, 1						#r13d = i
.L11:
	cmp	r13d, 3999999					#r13d = i
	jle	.L12
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax				#-40[rbp] = end
	mov	rax, QWORD PTR -40[rbp]				#-40[rbp] = end
	sub	rax, QWORD PTR -32[rbp]				#-32[rbp] = begin
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0			#-48[rbp] = prog_time
	cmp	DWORD PTR -68[rbp], 2				#-68[rbp] = argc
	jle	.L13
	mov	rax, QWORD PTR -80[rbp]				#-80[rbp] = argv
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax				#-56[rbp] = output
	mov	rdx, QWORD PTR -48[rbp]				#-48[rbp] = prog_time
	mov	rax, QWORD PTR -56[rbp]				#-56[rbp] = output
	movq	xmm0, rdx
	lea	rsi, .LC11[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -16[rbp]				#-16[rbp] = res
	mov	rax, QWORD PTR -56[rbp]				#-56[rbp] = output
	movq	xmm0, rdx
	lea	rsi, .LC12[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	eax, 0
	jmp	.L15
.L13:
	cmp	DWORD PTR -68[rbp], 1				#-68[rbp] = argc
	jle	.L14
	mov	rax, QWORD PTR -80[rbp]				#-80[rbp] = argv
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax				#-56[rbp] = output
	mov	rdx, QWORD PTR -64[rbp]				#-64[rbp] = x
	mov	rax, QWORD PTR -56[rbp]				#-56[rbp] = output
	movq	xmm0, rdx
	lea	rsi, .LC13[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -48[rbp]				#-48[rbp] = prog_time
	mov	rax, QWORD PTR -56[rbp]				#-56[rbp] = output
	movq	xmm0, rdx
	lea	rsi, .LC14[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -16[rbp]				#-16[rbp] = res
	mov	rax, QWORD PTR -56[rbp]				#-56[rbp] = output
	movq	xmm0, rdx
	lea	rsi, .LC12[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	eax, 0
	jmp	.L15
.L14:
	mov	rax, QWORD PTR -48[rbp]				#-48[rbp] = prog_time
	movq	xmm0, rax
	lea	rdi, .LC14[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]				#-16[rbp] = res
	movq	xmm0, rax
	lea	rdi, .LC12[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
.L15:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	0
	.long	-1074790400
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC8:
	.long	-4194304
	.long	1105199103
	.align 8
.LC9:
	.long	0
	.long	1093567616
