	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Print x (-1 <= x <= 1): "
.LC1:
	.string	"%lf"
.LC2:
	.string	"Incorrect input!\n\nPrint x (-1 <= x <= 1): "
.LC5:
	.string	"r"
.LC6:
	.string	"Input file does not exist"
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
	.section	.text.startup.main,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r14
	push	r13
	push	r12
	push	rbp
	mov	ebp, edi
	push	rbx
	mov	rbx, rsi
	sub	rsp, 32
	dec	edi
	jg	.L2
	lea	rsi, .LC0[rip]
	mov	edi, 1
	xor	eax, eax
	lea	r12, 24[rsp]
	lea	r13, .LC1[rip]
	call	__printf_chk@PLT
	mov	rsi, r12
.L17:
	xor	eax, eax
	mov	rdi, r13
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	movsd	xmm2, QWORD PTR .LC3[rip]
	comisd	xmm2, xmm0
	jbe	.L22
.L4:
	lea	rsi, .LC2[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	rsi, r12
	jmp	.L17
.L22:
	comisd	xmm0, QWORD PTR .LC4[rip]
	ja	.L4
	jmp	.L5
.L2:
	cmp	ebp, 2
	je	.L6
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC5[rip]
	call	fopen@PLT
	mov	rdi, rax
	test	rax, rax
	jne	.L7
	lea	rdi, .LC6[rip]
	call	puts@PLT
	jmp	.L19
.L7:
	xor	eax, eax
	lea	rdx, 24[rsp]
	lea	rsi, .LC1[rip]
	call	__isoc99_fscanf@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	comisd	xmm0, QWORD PTR .LC4[rip]
	ja	.L9
	movsd	xmm1, QWORD PTR .LC3[rip]
	comisd	xmm1, xmm0
	jbe	.L5
.L9:
	lea	rsi, .LC7[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L19:
	mov	eax, 1
	jmp	.L1
.L6:
	call	rand@PLT
	cvtsi2sd	xmm0, eax
	addsd	xmm0, xmm0
	divsd	xmm0, QWORD PTR .LC8[rip]
	subsd	xmm0, QWORD PTR .LC4[rip]
	movsd	QWORD PTR 24[rsp], xmm0
.L5:
	call	clock@PLT
	mov	r13d, 4000000
	mov	r12, rax
.L12:
	movsd	xmm0, QWORD PTR 24[rsp]
	call	arcsin@PLT
	movq	r14, xmm0
	dec	r13d
	jne	.L12
	call	clock@PLT
	sub	rax, r12
	cmp	ebp, 2
	lea	r12, .LC12[rip]
	cvtsi2sd	xmm1, rax
	divsd	xmm1, QWORD PTR .LC9[rip]
	jle	.L13
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC10[rip]
	movsd	QWORD PTR 8[rsp], xmm1
	call	fopen@PLT
	movsd	xmm1, QWORD PTR 8[rsp]
	lea	rdx, .LC11[rip]
	mov	rbp, rax
	movaps	xmm0, xmm1
	jmp	.L20
.L13:
	lea	r13, .LC14[rip]
	jne	.L14
	mov	rdi, QWORD PTR 8[rbx]
	lea	rsi, .LC10[rip]
	movsd	QWORD PTR 8[rsp], xmm1
	call	fopen@PLT
	movsd	xmm0, QWORD PTR 24[rsp]
	mov	esi, 1
	lea	rdx, .LC13[rip]
	mov	rdi, rax
	mov	rbp, rax
	mov	al, 1
	call	__fprintf_chk@PLT
	movsd	xmm1, QWORD PTR 8[rsp]
	mov	rdx, r13
	movaps	xmm0, xmm1
.L20:
	mov	rdi, rbp
	mov	esi, 1
	mov	al, 1
	call	__fprintf_chk@PLT
	movq	xmm0, r14
	mov	rdx, r12
	mov	rdi, rbp
	mov	esi, 1
	mov	al, 1
	call	__fprintf_chk@PLT
	jmp	.L18
.L14:
	movaps	xmm0, xmm1
	mov	rsi, r13
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
	movq	xmm0, r14
	mov	rsi, r12
	mov	al, 1
	mov	edi, 1
	call	__printf_chk@PLT
.L18:
	xor	eax, eax
.L1:
	add	rsp, 32
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
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
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
