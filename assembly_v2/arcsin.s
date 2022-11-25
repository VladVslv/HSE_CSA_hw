	.intel_syntax noprefix
	.text
	.globl	arcsin
	.type	arcsin, @function
arcsin:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	xmm4, xmm0					#xmm0 = x
	pxor	xmm0, xmm0
	movsd	xmm6, xmm0					#xmm6 = res
	mov	r14d, 0						#r14d = n
	movsd	xmm0, xmm4					#xmm4 = x
	movsd	xmm5, xmm0					#xmm5 = last
.L2:
	movsd	xmm0, xmm6					#xmm6 = res
	addsd	xmm0, xmm5					#xmm5 = last
	movsd	xmm6, xmm0					#xmm6 = res
	add	r14d, 1						#r14d = n
	movsd	xmm0, xmm5					#xmm5 = last
	mulsd	xmm0, xmm4					#xmm4 = x
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm4					#xmm4 = x
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, r14d				#r14d = n
	addsd	xmm0, xmm0
	movsd	xmm2, QWORD PTR .LC1[rip]
	subsd	xmm0, xmm2
	mulsd	xmm1, xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, r14d				#r14d = n
	addsd	xmm0, xmm0
	mulsd	xmm1, xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, r14d				#r14d = n
	addsd	xmm0, xmm0
	movsd	xmm2, QWORD PTR .LC1[rip]
	subsd	xmm0, xmm2
	mulsd	xmm1, xmm0
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, r14d				#r14d = n
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm2, xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, r14d				#r14d = n
	mulsd	xmm2, xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, r14d				#r14d = n
	movapd	xmm3, xmm0
	addsd	xmm3, xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm3
	mulsd	xmm2, xmm0
	divsd	xmm1, xmm2
	movapd	xmm0, xmm1
	movsd	xmm5, xmm0					#xmm5 = last
	movsd	xmm0, xmm5					#xmm5 = last
	movq	xmm1, QWORD PTR .LC3[rip]
	andpd	xmm0, xmm1
	movsd	xmm2, xmm6					#xmm6 = res
	movsd	xmm1, QWORD PTR .LC4[rip]
	mulsd	xmm1, xmm2
	movq	xmm2, QWORD PTR .LC3[rip]
	andpd	xmm1, xmm2
	comisd	xmm0, xmm1
	ja	.L2
	movsd	xmm0, xmm6					#xmm6 = res
	movq	rax, xmm0
	movq	xmm0, rax					#xmm0 = arcsin(x)
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
