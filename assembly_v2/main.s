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
	mov	eax, DWORD PTR -4[rbp]			# eax = mygetch()
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
	mov	DWORD PTR -68[rbp], edi			# -68[rbp] = argc
	mov	QWORD PTR -80[rbp], rsi			# -80[rbp] = argv
	mov	r13d, 0					# r13d = i
	jmp	.L4	
.L5:
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A[rip]	
	mov	DWORD PTR [rdx+rax], 0	
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B[rip]	
	mov	DWORD PTR [rdx+rax], 0	
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A_B[rip]	
	mov	DWORD PTR [rdx+rax], 0	
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B_A[rip]	
	mov	DWORD PTR [rdx+rax], 0	
	add	r13d, 1					# r13d = i
.L4:
	cmp	r13d, 127				# r13d = i
	jle	.L5	
	cmp	DWORD PTR -68[rbp], 1			# -68[rbp] =argc
	jle	.L6	
	mov	rax, QWORD PTR -80[rbp]			# -80[rbp] = argv
	add	rax, 8	
	mov	rax, QWORD PTR [rax]			
	mov	rdi, rax	
	call	atoi@PLT	
	test	eax, eax	
	jne	.L7	
.L6:
	lea	rdi, .LC0[rip]
	mov	eax, 0	
	call	printf@PLT	
.L10:
	mov	eax, 0	
	call	mygetch	
	mov	DWORD PTR -24[rbp], eax			# -24[rbp] = temp_int, eax = mygetch()
	cmp	DWORD PTR -24[rbp], 4			# -24[rbp] = temp_int
	je	.L49			
	mov	rdx, QWORD PTR stdout[rip]	
		mov	eax, DWORD PTR -24[rbp]		# -24[rbp] = temp_int
		movsx	eax, al	
	mov	rsi, rdx	
	mov	edi, eax	
	call	putc@PLT	
	mov	eax, DWORD PTR -24[rbp]			# -24[rbp] = temp_int
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A[rip]	
	mov	DWORD PTR [rdx+rax], 1	
	jmp	.L10	
.L49:
	nop	
	lea	rdi, .LC1[rip]	
	mov	eax, 0	
	call	printf@PLT	
.L13:
	mov	eax, 0	
	call	mygetch	
	mov	DWORD PTR -24[rbp], eax			# -24[rbp] = temp_int
	cmp	DWORD PTR -24[rbp], 4			# -24[rbp] = temp_int
	je	.L50	
	mov	rdx, QWORD PTR stdout[rip]	
	mov	eax, DWORD PTR -24[rbp]			# -24[rbp] = temp_int
	mov	rsi, rdx	
	mov	edi, eax	
	call	putc@PLT	
	mov	eax, DWORD PTR -24[rbp]			# -24[rbp] = temp_int
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B[rip]	
	mov	DWORD PTR [rdx+rax], 1	
	jmp	.L13	
.L50:
	nop	
	jmp	.L14	
.L7:
	mov	rax, QWORD PTR -80[rbp]			# -80[rbp] = argv
	add	rax, 8	
	mov	rax, QWORD PTR [rax]	
	mov	rdi, rax	
	call	atoi@PLT	
	cmp	eax, 1	
	jne	.L15	
	lea	rsi, .LC2[rip]
	lea	rdi, .LC3[rip]	
	call	fopen@PLT	
	mov	QWORD PTR -16[rbp], rax			# -16[rbp] = input
.L18:
	mov	rax, QWORD PTR -16[rbp]			# -16[rbp] = input
	mov	rdi, rax
	call	getc@PLT	
	mov	BYTE PTR -17[rbp], al			# -17[rbp] temp_char
	cmp	BYTE PTR -17[rbp], -1			# -17[rbp] temp_char
	je	.L51	
	movsx	eax, BYTE PTR -17[rbp]			# -17[rbp] temp_char
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A[rip]	
	mov	DWORD PTR [rdx+rax], 1	
	jmp	.L18	
.L51:
	nop	
	lea	rsi, .LC2[rip]	
	lea	rdi, .LC4[rip]	
	call	fopen@PLT	
	mov	QWORD PTR -16[rbp], rax			# -16[rbp] = input
.L21:
	mov	rax, QWORD PTR -16[rbp]			# -16[rbp] = input
	mov	rdi, rax	
	call	getc@PLT	
	mov	BYTE PTR -17[rbp], al			# -17[rbp] temp_char
	cmp	BYTE PTR -17[rbp], -1			# -17[rbp] temp_char
	je	.L52	
	movsx	eax, BYTE PTR -17[rbp]			# -17[rbp] temp_char
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B[rip]	
	mov	DWORD PTR [rdx+rax], 1	
	jmp	.L21
.L15:
	mov	rax, QWORD PTR -80[rbp]			# -80[rbp] = argv
	add	rax, 8	
	mov	rax, QWORD PTR [rax]	
	mov	rdi, rax	
	call	atoi@PLT	
	cmp	eax, 2	
	jne	.L14	
	mov	r13d, 33				# r13d = i
	jmp	.L22	
.L23:
	call	rand@PLT	
	cdq
	shr	edx, 31	
	add	eax, edx	
	and	eax, 1	
	sub	eax, edx	
	mov	ecx, eax	
	mov	eax, r13d				# r13d = i
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
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B[rip]	
	mov	DWORD PTR [rdx+rax], ecx	
	add	r13d, 1					# r13d = i
.L22:
	cmp	r13d, 127				# r13d = i
	jle	.L23	
	lea	rdi, .LC0[rip]	
	mov	eax, 0	
	call	printf@PLT	
	mov	r13d, 0					# r13d = i
	jmp	.L24	
.L26:
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	je	.L25	
	mov	eax, r13d				# r13d = i
	mov	edi, eax	
	call	putchar@PLT	
.L25:
	add	r13d, 1					# r13d = i
.L24:
	cmp	r13d, 127	
	jle	.L26	
	lea	rdi, .LC1[rip]
	mov	eax, 0	
	call	printf@PLT	
	mov	r13d, 0					# r13d = i
	jmp	.L27	
.L29:
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	je	.L28	
	mov	eax, r13d				# r13d = i
	mov	edi, eax	
	call	putchar@PLT	
.L28:
	add	r13d, 1					# r13d = i
.L27:
	cmp	r13d, 127				# r13d = i
	jle	.L29	
	jmp	.L14	
.L52:
	nop	
.L14:
	call	clock@PLT	
	mov	QWORD PTR -32[rbp], rax			# -32[rbp] = begin
	mov	r13d, 0					# r13d = i
	jmp	.L30	
.L31:
	mov	edi, 128				# edi = 128 (size_of_array)
	mov	eax, 0	
	call	getResult@PLT	
	add	r13d, 1					# r13d = i
.L30:
	cmp	r13d, 2999999				# r13d = i
	jle	.L31	
	call	clock@PLT	
	mov	QWORD PTR -40[rbp], rax			# -40[rbp] = end
	mov	rax, QWORD PTR -40[rbp]			# -40[rbp] = end
	sub	rax, QWORD PTR -32[rbp]			# -32[rbp] = begin
	pxor	xmm0, xmm0	
	cvtsi2sd	xmm0, rax	
	movsd	xmm1, QWORD PTR .LC5[rip]	
	divsd	xmm0, xmm1	
	movsd	QWORD PTR -48[rbp], xmm0		# -48[rbp] = prog_time
	cmp	DWORD PTR -68[rbp], 1			# -68[rbp] =argc
	jle	.L32	
	mov	rax, QWORD PTR -80[rbp]			#  -80[rbp] = argv
	add	rax, 8		
	mov	rax, QWORD PTR [rax]	
	mov	rdi, rax	
	call	atoi@PLT	
	cmp	eax, 1	
	jne	.L32	
	lea	rsi, .LC6[rip]	
	lea	rdi, .LC7[rip]	
	call	fopen@PLT	
	mov	QWORD PTR -56[rbp], rax			# -56[rbp] = output
	mov	rdx, QWORD PTR -48[rbp]			# -48[rbp] = prog_time
	mov	rax, QWORD PTR -56[rbp]			# -56[rbp] = output
	movq	xmm0, rdx	
	lea	rsi, .LC8[rip]	
	mov	rdi, rax	
	mov	eax, 1	
	call	fprintf@PLT	
	mov	rax, QWORD PTR -56[rbp]			# -56[rbp] = output
	mov	rcx, rax	
	mov	edx, 6	
	mov	esi, 1	
	lea	rdi, .LC9[rip]	
	call	fwrite@PLT	
	mov	r13d, 0					# r13d = i
	jmp	.L33	
.L35:
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A_B[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	je	.L34	
	mov	rdx, QWORD PTR -56[rbp]			# -56[rbp] = output
	mov	eax, r13d				# r13d = i
	mov	rsi, rdx	
	mov	edi, eax	
	call	fputc@PLT	
.L34:
	add	r13d, 1					# r13d = i
.L33:
	cmp	r13d, 127				# r13d = i
	jle	.L35	
	mov	rax, QWORD PTR -56[rbp]			# -56[rbp] = output
	mov	rcx, rax	
	mov	edx, 6	
	mov	esi, 1	
	lea	rdi, .LC10[rip]	
	call	fwrite@PLT	
	mov	r13d, 0					# r13d = i
	jmp	.L36	
.L38:
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B_A[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	je	.L37	
	mov	rdx, QWORD PTR -56[rbp]			# -56[rbp] = output
	mov	eax, r13d				# r13d = i
	mov	rsi, rdx	
	mov	edi, eax	
	call	fputc@PLT	
.L37:
	add	r13d, 1					# r13d = i
.L36:
	cmp	r13d, 127				# r13d = i
	jle	.L38	
	mov	eax, 0	
	jmp	.L39	
.L32:
	mov	rax, QWORD PTR -48[rbp]			# -48[rbp] = prog_time
	movq	xmm0, rax	
	lea	rdi, .LC11[rip]	
	mov	eax, 1	
	call	printf@PLT	
	lea	rdi, .LC12[rip]	
	mov	eax, 0	
	call	printf@PLT	
	mov	r13d, 0					# r13d = i
	jmp	.L40	
.L42:
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A_B[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	je	.L41	
	mov	eax, r13d				# r13d = i
	mov	edi, eax	
	call	putchar@PLT	
.L41:
	add	r13d, 1					# r13d = i
.L40:
	cmp	r13d, 127				# r13d = i
	jle	.L42	
	lea	rdi, .LC10[rip]
	mov	eax, 0	
	call	printf@PLT	
	mov	r13d, 0					# r13d = i
	jmp	.L43	
.L45:
	mov	eax, r13d				# r13d = i
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B_A[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	je	.L44	
	mov	eax, r13d				# r13d = i
	mov	edi, eax				
	call	putchar@PLT				
.L44:
	add	r13d, 1					# r13d = i
.L43:
	cmp	r13d, 127				# r13d = i
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
