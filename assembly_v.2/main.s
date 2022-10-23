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
	push	rbp 					#saving rbp on stack
	mov	rbp, rsp				#rbp:=rsp		
	sub	rsp, 80					#rsp-=80
	mov	DWORD PTR -68[rbp], edi			#argc
	mov	QWORD PTR -80[rbp], rsi			#argv[0]
	cmp	DWORD PTR -68[rbp], 1
	jle	.L6					#input from console, if argc<=1
	mov	rax, QWORD PTR -80[rbp]			#rax=argv[0]
	add	rax, 8
	mov	rax, QWORD PTR [rax]			#rax=argv[1]
	mov	rdi, rax
	call	atoi@PLT
	test	eax, eax				#compare atoi(argv[1]) and 0
	jne	.L3					
.L6:							#console input
	mov	esi, 50
	lea	rdi, .LC0[rip]				#rdi=&(.LC0)
	mov	eax, 0					#zeroing eax
	call	printf@PLT				#print .LC0
	lea	rsi, -52[rbp]				#rsi=&(a_size)
	lea	rdi, .LC1[rip]				#rdi=&(.LC1)
	mov	eax, 0					#zeroing eax	
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -52[rbp]			#eax=a_size
	test	eax, eax				#compare a_size and 0
	jg	.L4					#size_a>0 => go to .L4
	lea	rdi, .LC2[rip]				#rdi=&(.LC2)
	call	puts@PLT				#print .LC2
	jmp	.L5
.L4:
	mov	eax, DWORD PTR -52[rbp]			#eax=a_size
	cmp	eax, 50					#compare a_size and 50
	jle	.L5					#if a_size<=50 => gor to .L5
	mov	esi, 50					#esi=50
	lea	rdi, .LC3[rip]				#rdi=&(.LC3)
	mov	eax, 0					#zeroing eax
	call	printf@PLT				#print .LC3
.L5:
	mov	eax, DWORD PTR -52[rbp]
	test	eax, eax
	jle	.L6					#if a_size<=0 => input a_size again
	mov	eax, DWORD PTR -52[rbp]
	cmp	eax, 50
	jg	.L6					#if a_size>50 => input a_size again
	mov	r14d, 0					#i=0
	jmp	.L7
.L8:							#input A[i] from console
	mov	eax, r14d				#eax=i
	mov	esi, eax				#esi=i
	lea	rdi, .LC4[rip]				#rdi=&(.LC4)
	mov	eax, 0					#zeroing eax
	call	printf@PLT				#print .LC4
	mov	eax, r14d				#eax=i
	lea	rdx, 0[0+rax*4]				#move A
	lea	rax, A[rip]				#rax=A
	add	rax, rdx				#rax=A+4*i
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0					#zeroing eax
	call	__isoc99_scanf@PLT			#input A[i]
	add	r14d, 1					#++i
.L7:
	mov	eax, DWORD PTR -52[rbp]			#eax=a_size
	cmp	r14d, eax				#compare i and a_size
	jl	.L8					#if i<a_size => input next elem of A
	jmp	.L9	
.L3:
	mov	rax, QWORD PTR -80[rbp]			#rax=argv[0]
	add	rax, 8					
	mov	rax, QWORD PTR [rax]			#rax=argv[1]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1					#compare atio(argv[1]) and 1
	jne	.L10					#if argv!=1 => .L10, else => input from file	
	lea	rsi, .LC5[rip]						
	lea	rdi, .LC6[rip]				
	call	fopen@PLT				#open input file
	mov	QWORD PTR -16[rbp], rax			#input=rax
	lea	rdx, -52[rbp]				#rdx=a_size
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC1[rip]				#rsi=&(.LC1)
	mov	rdi, rax				#rdi=input
	mov	eax, 0					#zeroing rax
	call	__isoc99_fscanf@PLT			#input a_size
	mov	eax, DWORD PTR -52[rbp]			#eax=a_size
	test	eax, eax				#compare eax and 0
	jg	.L11					#if a_size>0 => go to .L11	
	lea	rdi, .LC7[rip]	
	call	puts@PLT				#if a_size <=0 => incorrect input => return 1
	mov	eax, 1
	jmp	.L23
.L11:
	mov	eax, DWORD PTR -52[rbp]			
	cmp	eax, 50					#compare a_size and 5
	jle	.L13					#a_size<=50 => right input
	mov	esi, 50
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT				#if a_size >50 => incorrect input
	mov	eax, 1
	jmp	.L23					#incorrect input => return 1
.L13:
	mov	r14d, 0					#i=0
	jmp	.L14
.L15:							#input A[i] frm file
	mov	eax, r14d				#eax=i
	lea	rdx, 0[0+rax*4]				#move A
	lea	rax, A[rip]				#rax=A
	add	rdx, rax				#rdx=A+4*i
	mov	rax, QWORD PTR -16[rbp]			#rax=input
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT			#input A[i]
	add	r14d, 1					#++i
.L14:
	mov	eax, DWORD PTR -52[rbp]			#eax=a_size
	cmp	r14d, eax				#compare i and a_size
	jl	.L15					#if i<size_a => input next elem of A
	jmp	.L9
.L10:							#random input
	mov	rax, QWORD PTR -80[rbp]			#rax=argv[0]
	add	rax, 8				
	mov	rax, QWORD PTR [rax]			#rax=argv[1]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2					#compare atoi argv[1] and 2
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
	mov	DWORD PTR -52[rbp], eax			#a_size - random
	mov	r14d, 0					#i=0
	jmp	.L16	
.L17:
	call	rand@PLT				
	lea	ecx, -1073741823[rax]			#ecx - random
	mov	eax, r14d				#eax=i
	cdqe
	lea	rdx, 0[0+rax*4]				#move A
	lea	rax, A[rip]				#rax=A
	mov	DWORD PTR [rdx+rax], ecx		#A[i]=ecx
	mov	eax, r14d			
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	edx, DWORD PTR [rdx+rax]
	mov	esi, r14d				#esi=i
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT				#print A[i]
	add	r14d, 1					#++i
.L16:
	mov	eax, DWORD PTR -52[rbp]			#eax=a_size
	cmp	r14d, eax				#compare i and a_size
	jl	.L17
.L9:
	call	clock@PLT			
	mov	QWORD PTR -24[rbp], rax			#start of clock
	mov	eax, DWORD PTR -52[rbp]
	mov	edi, eax				#edi=a_size
	call	createArrayB@PLT			#create B
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax			#end of clock
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -24[rbp]			#end-begin
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC10[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0		#time
	cmp	DWORD PTR -68[rbp], 1			#compare argc and 1
	jle	.L18					#argc<=1 => go to .L18
	mov	rax, QWORD PTR -80[rbp]			#rax=argv[0]
	add	rax, 8
	mov	rax, QWORD PTR [rax]			#rax=argv[1]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1					#compare atoi(argv[1]) and 1
	jne	.L18					#atoi(argv[1])!=1 => go to .L18, else => output ot file
	lea	rsi, .LC11[rip]
	lea	rdi, .LC12[rip]
	call	fopen@PLT				#open outpur file
	mov	QWORD PTR -48[rbp], rax			#output=rax
	mov	rdx, QWORD PTR -40[rbp]			#rdx=time
	mov	rax, QWORD PTR -48[rbp]			
	movq	xmm0, rdx				#xmm0=time
	lea	rsi, .LC13[rip]
	mov	rdi, rax				#rdi=output
	mov	eax, 1			
	call	fprintf@PLT				#print .LC13 to file
	mov	r14d, 0					#i=0
	jmp	.L19
.L20:							#print B[i] to file
	mov	eax, r14d				#eax=i
	lea	rdx, 0[0+rax*4]				#move B
	lea	rax, B[rip]				#rax=B
	mov	ecx, DWORD PTR [rdx+rax]		#ecx=B+i*4
	mov	edx, r14d				#edx=i
	mov	rax, QWORD PTR -48[rbp]			#rax=output
	lea	rsi, .LC14[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT				#print.LC14 to file
	add	r14d, 1					#++i
.L19:
	mov	eax, DWORD PTR b_size[rip]		#eax=size_b
	cmp	r14d, eax				#compare i and size_b
	jl	.L20					#if i<size_b => print next elem	of B to file	
	mov	eax, 0					#zeroing eax
	jmp	.L23
.L18:							#output to console
	mov	rax, QWORD PTR -40[rbp]			#rax=time
	movq	xmm0, rax				#xmm0=time
	lea	rdi, .LC15[rip]
	mov	eax, 1
	call	printf@PLT				#print .LC15
	mov	r14d, 0					#i=0
	jmp	.L21
.L22:							#print B[i] to console
	mov	eax, r14d				#eax=i
	lea	rdx, 0[0+rax*4]				#move B
	lea	rax, B[rip]				#rax=B
	mov	edx, DWORD PTR [rdx+rax]		#edx=B+i*4
	mov	eax, r14d	
	mov	esi, eax				#esi=i
	lea	rdi, .LC14[rip]
	mov	eax, 0
	call	printf@PLT				#print .LC14
	add	r14d, 1					#++i
.L21:
	mov	eax, DWORD PTR b_size[rip]		#eax=size_b
	cmp	r14d, eax				#compare i and b_size
	jl	.L22					#if i<size_b => print next elem of B
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
