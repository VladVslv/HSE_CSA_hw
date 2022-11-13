	.intel_syntax noprefix
	.text
	.globl	getResult
	.type	getResult, @function
getResult:
	endbr64	
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi			# edi = size_of_array
	mov	r14d, 0
	jmp	.L2	
.L5:
	mov	eax, r14d	                   	# r14d = j
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	jne	.L3	
	mov	eax, r14d				# r14d = j
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	je	.L3	
	mov	eax, r14d				# r14d = j
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B_A[rip]	
	mov	DWORD PTR [rdx+rax], 1	
.L3:
	mov	eax, r14d      				# r14d = j	
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	je	.L4	
	mov	eax, r14d				# r14d = j
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, B[rip]	
	mov	eax, DWORD PTR [rdx+rax]	
	test	eax, eax	
	jne	.L4	
	mov	eax, r14d				# r14d = j
	cdqe
	lea	rdx, 0[0+rax*4]	
	lea	rax, A_B[rip]	
	mov	DWORD PTR [rdx+rax], 1	
.L4:
	add	r14d, 1	        			# r14d = j
.L2:
	mov	eax, r14d				# r14d = j
	cmp	eax, DWORD PTR -20[rbp]			# 20[rbp] = size_of_array
	jl	.L5	
	nop	
	nop	
	pop	rbp	
	ret	
	.size	getResult, .-getResult
