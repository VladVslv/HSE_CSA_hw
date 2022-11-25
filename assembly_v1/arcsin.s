	.file	"arcsin.c"
	.intel_syntax noprefix
	.text
	.globl	arcsin
	.type	arcsin, @function
arcsin:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -40[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 0
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
.L2:
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -40[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR -40[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	addsd	xmm0, xmm0
	movsd	xmm2, QWORD PTR .LC1[rip]
	subsd	xmm0, xmm2
	mulsd	xmm1, xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	addsd	xmm0, xmm0
	mulsd	xmm1, xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	addsd	xmm0, xmm0
	movsd	xmm2, QWORD PTR .LC1[rip]
	subsd	xmm0, xmm2
	mulsd	xmm1, xmm0
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, DWORD PTR -12[rbp]
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm2, xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	mulsd	xmm2, xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	movapd	xmm3, xmm0
	addsd	xmm3, xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm3
	mulsd	xmm2, xmm0
	divsd	xmm1, xmm2
	movapd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	movq	xmm1, QWORD PTR .LC3[rip]
	andpd	xmm0, xmm1
	movsd	xmm2, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR .LC4[rip]
	mulsd	xmm1, xmm2
	movq	xmm2, QWORD PTR .LC3[rip]
	andpd	xmm1, xmm2
	comisd	xmm0, xmm1
	ja	.L2
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.size	arcsin, .-arcsin
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.align 16
.LC3:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC4:
	.long	-755914244
	.long	1061184077
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
