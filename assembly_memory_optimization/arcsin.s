	.file	"arcsin.c"
	.intel_syntax noprefix
	.text
	.section	.text.arcsin,"ax",@progbits
	.globl	arcsin
	.type	arcsin, @function
arcsin:
	endbr64
	movsd	xmm6, QWORD PTR .LC1[rip]
	movaps	xmm3, xmm0
	xor	eax, eax
	xorps	xmm4, xmm4
	movq	xmm5, QWORD PTR .LC3[rip]
	movsd	xmm7, QWORD PTR .LC4[rip]
	movsd	xmm8, QWORD PTR .LC2[rip]
.L2:
	inc	eax
	addsd	xmm4, xmm0
	cvtsi2sd	xmm9, eax
	mulsd	xmm0, xmm3
	movaps	xmm2, xmm9
	addsd	xmm2, xmm9
	mulsd	xmm0, xmm3
	movaps	xmm1, xmm2
	subsd	xmm1, xmm6
	mulsd	xmm0, xmm1
	mulsd	xmm0, xmm2
	addsd	xmm2, xmm6
	mulsd	xmm0, xmm1
	movaps	xmm1, xmm9
	mulsd	xmm1, xmm8
	mulsd	xmm1, xmm9
	mulsd	xmm1, xmm2
	divsd	xmm0, xmm1
	movaps	xmm1, xmm4
	mulsd	xmm1, xmm7
	andps	xmm1, xmm5
	movaps	xmm2, xmm0
	andps	xmm2, xmm5
	comisd	xmm2, xmm1
	ja	.L2
	movaps	xmm0, xmm4
	ret
	.size	arcsin, .-arcsin
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
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
