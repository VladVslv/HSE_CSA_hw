	.file	"createArrayB.c"
	.intel_syntax noprefix
	.text
	.globl	createArrayB
	.type	createArrayB, @function
createArrayB:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi			#DWORD PTR -20[rbp]=a_size
	mov	DWORD PTR -8[rbp], 0			#k=0
	jmp	.L2
.L8:
	mov	DWORD PTR -12[rbp], 0			#sum=0
	mov	DWORD PTR b_size[rip], 0		#b_size=0
	mov	r13d, 0					#i_A=0
	jmp	.L3
.L4:
	mov	eax, r13d				#eax=i_A
	lea	rdx, 0[0+rax*4]				#move A		
	lea	rax, A[rip]				#rax=A
	mov	eax, DWORD PTR [rdx+rax]		#eax=A+4*i_A
	add	DWORD PTR -12[rbp], eax			#sum+=A[i]
	add	r13d, 2					#i_A+=2
.L3:
	mov	eax, r13d				#eax=i_A
	cmp	eax, DWORD PTR -20[rbp]			#compare i_A and a_size
	jl	.L4					#if i_A<a_size => sum+=A[j]
	mov	r13d, 0					#i_A=0
	jmp	.L5
.L7:
	mov	eax, r13d				#eax=i_A
	lea	rdx, 0[0+rax*4]				#move A
	lea	rax, A[rip]				#rax=A
	mov	eax, DWORD PTR [rdx+rax]		#eax=A+i*4
	cmp	DWORD PTR -12[rbp], eax			#compare sum and A[i]
	jle	.L6					#if sum<=A[j] => do not append A[j]
	mov	edx, DWORD PTR b_size[rip]		#edx=b_size
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]				#move B
	lea	rdx, B[rip]				#rdx=B
	mov	DWORD PTR [rcx+rdx], eax		#B[b_size]=A[i_A]
	add	DWORD PTR b_size[rip], 1		#++b
.L6:
	add	r13d, 1					#++i_A
.L5:
	mov	eax, r13d				#eax=i_A
	cmp	eax, DWORD PTR -20[rbp]			#compare i_A and a_size
	jl	.L7					#if j<size_a => add A[j] to B, if A[j]<sum
	add	DWORD PTR -8[rbp], 1			#++k
.L2:
	cmp	DWORD PTR -8[rbp], 9999999		#compare k and 9999999
	jle	.L8					#if k<=9999999 => repeat
	nop
	nop
	pop	rbp
	ret
	.size	createArrayB, .-createArrayB
4:
