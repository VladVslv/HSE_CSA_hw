	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	A
	.bss
	.align 32
	.type	A, @object
	.size	A, 512
A:
	.zero	512
	.globl	B
	.align 32
	.type	B, @object
	.size	B, 512
B:
	.zero	512
	.globl	A_B
	.align 32
	.type	A_B, @object
	.size	A_B, 512
A_B:
	.zero	512
	.globl	B_A
	.align 32
	.type	B_A, @object
	.size	B_A, 512
B_A:
	.zero	512
	.text
	.globl	mygetch
	.type	mygetch, @function
mygetch:
	endbr64
	push	rbp
	mov	rbp, rsp
	add	rsp, -128
	lea	rax, -64[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	tcgetattr@PLT
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR -56[rbp]
	mov	QWORD PTR -128[rbp], rax
	mov	QWORD PTR -120[rbp], rdx
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR -112[rbp], rax
	mov	QWORD PTR -104[rbp], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	QWORD PTR -88[rbp], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	eax, DWORD PTR -8[rbp]
	mov	DWORD PTR -72[rbp], eax
	mov	eax, DWORD PTR -116[rbp]
	and	eax, -11
	mov	DWORD PTR -116[rbp], eax
	lea	rax, -128[rbp]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 0
	call	tcsetattr@PLT
	call	getchar@PLT
	mov	DWORD PTR -4[rbp], eax
	lea	rax, -64[rbp]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 0
	call	tcsetattr@PLT
	mov	eax, DWORD PTR -4[rbp]
	leave
	ret
	.size	mygetch, .-mygetch
	.section	.rodata
.LC0:
	.string	"A: "
.LC1:
	.string	"\nB: "
.LC2:
	.string	"r"
.LC3:
	.string	"A.txt"
.LC4:
	.string	"B.txt"
.LC6:
	.string	"w"
.LC7:
	.string	"output.txt"
.LC8:
	.string	"Time: %f sec"
.LC9:
	.string	"\nA-B: "
.LC10:
	.string	"\nB-A: "
.LC11:
	.string	"\n\nTime: %f sec\n"
.LC12:
	.string	"A-B: "
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
	mov	DWORD PTR -4[rbp], 0
	jmp	.L4
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	DWORD PTR [rdx+rax], 0
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	DWORD PTR [rdx+rax], 0
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A_B[rip]
	mov	DWORD PTR [rdx+rax], 0
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B_A[rip]
	mov	DWORD PTR [rdx+rax], 0
	add	DWORD PTR -4[rbp], 1
.L4:
	cmp	DWORD PTR -4[rbp], 127
	jle	.L5
	cmp	DWORD PTR -68[rbp], 1
	jle	.L6
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	test	eax, eax
	jne	.L7
.L6:
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L10:
	mov	eax, 0
	call	mygetch
	mov	DWORD PTR -24[rbp], eax
	cmp	DWORD PTR -24[rbp], 4
	je	.L49
	mov	rdx, QWORD PTR stdout[rip]
	mov	eax, DWORD PTR -24[rbp]
	movsx	eax, al
	mov	rsi, rdx
	mov	edi, eax
	call	putc@PLT
	mov	eax, DWORD PTR -24[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	DWORD PTR [rdx+rax], 1
	jmp	.L10
.L49:
	nop
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L13:
	mov	eax, 0
	call	mygetch
	mov	DWORD PTR -24[rbp], eax
	cmp	DWORD PTR -24[rbp], 4
	je	.L50
	mov	rdx, QWORD PTR stdout[rip]
	mov	eax, DWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	putc@PLT
	mov	eax, DWORD PTR -24[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	DWORD PTR [rdx+rax], 1
	jmp	.L13
.L50:
	nop
	jmp	.L14
.L7:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L15
	lea	rax, .LC2[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
.L18:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	getc@PLT
	mov	BYTE PTR -17[rbp], al
	cmp	BYTE PTR -17[rbp], -1
	je	.L51
	movsx	eax, BYTE PTR -17[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	DWORD PTR [rdx+rax], 1
	jmp	.L18
.L51:
	nop
	lea	rax, .LC2[rip]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
.L21:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	getc@PLT
	mov	BYTE PTR -17[rbp], al
	cmp	BYTE PTR -17[rbp], -1
	je	.L52
	movsx	eax, BYTE PTR -17[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	DWORD PTR [rdx+rax], 1
	jmp	.L21
.L15:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2
	jne	.L14
	mov	DWORD PTR -4[rbp], 33
	jmp	.L22
.L23:
	call	rand@PLT
	cdq
	shr	edx, 31
	add	eax, edx
	and	eax, 1
	sub	eax, edx
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	DWORD PTR [rdx+rax], ecx
	call	rand@PLT
	cdq
	shr	edx, 31
	add	eax, edx
	and	eax, 1
	sub	eax, edx
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	DWORD PTR [rdx+rax], ecx
	add	DWORD PTR -4[rbp], 1
.L22:
	cmp	DWORD PTR -4[rbp], 127
	jle	.L23
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L24
.L26:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L25
	mov	eax, DWORD PTR -4[rbp]
	mov	edi, eax
	call	putchar@PLT
.L25:
	add	DWORD PTR -4[rbp], 1
.L24:
	cmp	DWORD PTR -4[rbp], 127
	jle	.L26
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L27
.L29:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L28
	mov	eax, DWORD PTR -4[rbp]
	mov	edi, eax
	call	putchar@PLT
.L28:
	add	DWORD PTR -4[rbp], 1
.L27:
	cmp	DWORD PTR -4[rbp], 127
	jle	.L29
	jmp	.L14
.L52:
	nop
.L14:
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L30
.L31:
	mov	edi, 128
	mov	eax, 0
	call	getResult@PLT
	add	DWORD PTR -4[rbp], 1
.L30:
	cmp	DWORD PTR -4[rbp], 2999999
	jle	.L31
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	sub	rax, QWORD PTR -32[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC5[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0
	cmp	DWORD PTR -68[rbp], 1
	jle	.L32
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L32
	lea	rax, .LC6[rip]
	mov	rsi, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	rcx, rax
	mov	edx, 6
	mov	esi, 1
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L33
.L35:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A_B[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L34
	mov	rdx, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR -4[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
.L34:
	add	DWORD PTR -4[rbp], 1
.L33:
	cmp	DWORD PTR -4[rbp], 127
	jle	.L35
	mov	rax, QWORD PTR -56[rbp]
	mov	rcx, rax
	mov	edx, 6
	mov	esi, 1
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L36
.L38:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B_A[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L37
	mov	rdx, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR -4[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
.L37:
	add	DWORD PTR -4[rbp], 1
.L36:
	cmp	DWORD PTR -4[rbp], 127
	jle	.L38
	mov	eax, 0
	jmp	.L39
.L32:
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L40
.L42:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A_B[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L41
	mov	eax, DWORD PTR -4[rbp]
	mov	edi, eax
	call	putchar@PLT
.L41:
	add	DWORD PTR -4[rbp], 1
.L40:
	cmp	DWORD PTR -4[rbp], 127
	jle	.L42
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L43
.L45:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, B_A[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L44
	mov	eax, DWORD PTR -4[rbp]
	mov	edi, eax
	call	putchar@PLT
.L44:
	add	DWORD PTR -4[rbp], 1
.L43:
	cmp	DWORD PTR -4[rbp], 127
	jle	.L45
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
.L39:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC5:
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
