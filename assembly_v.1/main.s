	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	A
	.bss
	.align 32
	.type	A, @object
	.size	A, 200
A:
	.zero	200
	.globl	B
	.align 32
	.type	B, @object
	.size	B, 200
B:
	.zero	200
	.globl	b_size
	.align 4
	.type	b_size, @object
	.size	b_size, 4
b_size:
	.zero	4
	.section	.rodata
	.align 8
.LC0:
	.string	"Print size of array A (1 <= size <= %d): \n"
.LC1:
	.string	"%d"
.LC2:
	.string	"Incorrect input : size < 1 !\n"
	.align 8
.LC3:
	.string	"Incorrect input : size > %d !\n\n"
.LC4:
	.string	"A[%d] : "
.LC5:
	.string	"r"
.LC6:
	.string	"input.txt"
.LC7:
	.string	"Incorrect input : size < 1 !"
	.align 8
.LC8:
	.string	"Incorrect input : size > %d !\n"
.LC9:
	.string	"A[%d] : %d\n"
.LC11:
	.string	"w"
.LC12:
	.string	"output.txt"
.LC13:
	.string	"Time: %f sec\n"
.LC14:
	.string	"B[%d]: %d \n"
.LC15:
	.string	"\nTime: %f sec\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	cmp	DWORD PTR -68[rbp], 1
	jle	.L6
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	test	eax, eax
	jne	.L3
.L6:
	mov	esi, 50
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -52[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -52[rbp]
	test	eax, eax
	jg	.L4
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L5
.L4:
	mov	eax, DWORD PTR -52[rbp]
	cmp	eax, 50
	jle	.L5
	mov	esi, 50
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L5:
	mov	eax, DWORD PTR -52[rbp]
	test	eax, eax
	jle	.L6
	mov	eax, DWORD PTR -52[rbp]
	cmp	eax, 50
	jg	.L6
	mov	DWORD PTR -4[rbp], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1
.L7:
	mov	eax, DWORD PTR -52[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L8
	jmp	.L9
.L3:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L10
	lea	rax, .LC5[rip]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	lea	rdx, -52[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -52[rbp]
	test	eax, eax
	jg	.L11
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L23
.L11:
	mov	eax, DWORD PTR -52[rbp]
	cmp	eax, 50
	jle	.L13
	mov	esi, 50
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L23
.L13:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	add	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1
.L14:
	mov	eax, DWORD PTR -52[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L15
	jmp	.L9
.L10:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2
	jne	.L9
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 4
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 50
	sub	eax, ecx
	mov	edx, eax
	lea	eax, 1[rdx]
	mov	DWORD PTR -52[rbp], eax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L16
.L17:
	call	rand@PLT
	lea	ecx, -1073741823[rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	DWORD PTR [rdx+rax], ecx
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	edx, DWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L16:
	mov	eax, DWORD PTR -52[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L17
.L9:
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	eax, DWORD PTR -52[rbp]
	mov	edi, eax
	call	createArrayB@PLT
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC10[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	cmp	DWORD PTR -68[rbp], 1
	jle	.L18
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L18
	lea	rax, .LC11[rip]
	mov	rsi, rax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L19
.L20:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	ecx, DWORD PTR [rdx+rax]
	mov	edx, DWORD PTR -4[rbp]
	mov	rax, QWORD PTR -48[rbp]
	lea	rsi, .LC14[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L19:
	mov	eax, DWORD PTR b_size[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L20
	mov	eax, 0
	jmp	.L23
.L18:
	mov	rax, QWORD PTR -40[rbp]
	movq	xmm0, rax
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L21
.L22:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	edx, DWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, .LC14[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L21:
	mov	eax, DWORD PTR b_size[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L22
	mov	eax, 0
.L23:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC10:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
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
