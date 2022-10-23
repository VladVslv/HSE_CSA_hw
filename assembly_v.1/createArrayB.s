	.file	"createArrayB.c"
	.intel_syntax noprefix
	.text
	.globl	createArrayB
	.type	createArrayB, @function
createArrayB:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -8[rbp], 0
	jmp	.L2
.L8:
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR b_size[rip], 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L3
.L4:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	eax, DWORD PTR [rdx+rax]
	add	DWORD PTR -12[rbp], eax
	add	DWORD PTR -4[rbp], 2
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L4
	mov	DWORD PTR -4[rbp], 0
	jmp	.L5
.L7:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cmp	DWORD PTR -12[rbp], eax
	jle	.L6
	mov	edx, DWORD PTR b_size[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	lea	rax, A[rip]
	mov	eax, DWORD PTR [rcx+rax]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, B[rip]
	mov	DWORD PTR [rcx+rdx], eax
	mov	eax, DWORD PTR b_size[rip]
	add	eax, 1
	mov	DWORD PTR b_size[rip], eax
.L6:
	add	DWORD PTR -4[rbp], 1
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L7
	add	DWORD PTR -8[rbp], 1
.L2:
	cmp	DWORD PTR -8[rbp], 9999999
	jle	.L8
	nop
	nop
	pop	rbp
	ret
	.size	createArrayB, .-createArrayB
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
