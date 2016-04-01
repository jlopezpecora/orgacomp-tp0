	.file	1 "src/matrix.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	create_matrix
	.ent	create_matrix
create_matrix:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	li	$a0,12			# 0xc
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v1,24($fp)
	lw	$v0,48($fp)
	sw	$v0,0($v1)
	lw	$v1,24($fp)
	lw	$v0,52($fp)
	sw	$v0,4($v1)
	lw	$s0,24($fp)
	lw	$v1,48($fp)
	lw	$v0,52($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,8($s0)
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	create_matrix
	.size	create_matrix, .-create_matrix
	.align	2
	.globl	destroy_matrix
	.ent	destroy_matrix
destroy_matrix:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	lw	$a0,8($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	destroy_matrix
	.size	destroy_matrix, .-destroy_matrix
	.rdata
	.align	2
$LC0:
	.ascii	"%d\000"
	.align	2
$LC1:
	.ascii	" %g\000"
	.align	2
$LC2:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	print_matrix
	.ent	print_matrix
print_matrix:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$v0,52($fp)
	lw	$a0,48($fp)
	la	$a1,$LC0
	lw	$a2,0($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,24($fp)
$L20:
	lw	$v0,52($fp)
	lw	$v1,52($fp)
	lw	$a0,0($v0)
	lw	$v0,4($v1)
	mult	$a0,$v0
	mflo	$v1
	lw	$v0,24($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L23
	b	$L21
$L23:
	lw	$a0,52($fp)
	lw	$v0,24($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,48($fp)
	la	$a1,$LC1
	lw	$a2,0($v0)
	lw	$a3,4($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L20
$L21:
	lw	$a0,48($fp)
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.align	2
	.globl	matrix_multiply
	.ent	matrix_multiply
matrix_multiply:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$v0,56($fp)
	lw	$v1,60($fp)
	lw	$a0,0($v0)
	lw	$a1,4($v1)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,56($fp)
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	sw	$zero,32($fp)
$L25:
	lw	$v1,28($fp)
	lw	$v0,28($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L28
	b	$L26
$L28:
	lw	$a0,24($fp)
	lw	$v0,32($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	sw	$zero,0($v0)
	sw	$zero,4($v0)
	sw	$zero,36($fp)
$L29:
	lw	$v0,36($fp)
	lw	$v1,28($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L32
	b	$L27
$L32:
	lw	$a0,24($fp)
	lw	$v0,32($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a3,$v1,$v0
	lw	$a0,24($fp)
	lw	$v0,32($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$t0,$v1,$v0
	lw	$a0,56($fp)
	lw	$v1,32($fp)
	lw	$v0,28($fp)
	div	$0,$v1,$v0
	mflo	$v1
	.set	noreorder
	bne	$v0,$0,1f
	nop
	break	7
1:
	.set	reorder
	lw	$v0,28($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,36($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a1,$v1,$v0
	lw	$a2,60($fp)
	lw	$v1,32($fp)
	lw	$v0,28($fp)
	div	$0,$v1,$v0
	mfhi	$a0
	.set	noreorder
	bne	$v0,$0,1f
	nop
	break	7
1:
	.set	reorder
	lw	$v1,36($fp)
	lw	$v0,28($fp)
	mult	$v1,$v0
	mflo	$v0
	addu	$v0,$a0,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a2)
	addu	$v0,$v1,$v0
	l.d	$f2,0($a1)
	l.d	$f0,0($v0)
	mul.d	$f2,$f2,$f0
	l.d	$f0,0($t0)
	add.d	$f0,$f0,$f2
	s.d	$f0,0($a3)
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	b	$L29
$L27:
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L25
$L26:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	matrix_multiply
	.size	matrix_multiply, .-matrix_multiply
	.rdata
	.align	2
$LC3:
	.ascii	"%f \000"
	.text
	.align	2
	.globl	print_matrix_2d
	.ent	print_matrix_2d
print_matrix_2d:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$zero,24($fp)
$L34:
	lw	$v0,48($fp)
	lw	$v1,48($fp)
	lw	$a0,0($v0)
	lw	$v0,4($v1)
	mult	$a0,$v0
	mflo	$v1
	lw	$v0,24($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L37
	b	$L35
$L37:
	lw	$v0,48($fp)
	lw	$v1,24($fp)
	lw	$v0,4($v0)
	divu	$0,$v1,$v0
	mfhi	$v1
	.set	noreorder
	bne	$v0,$0,1f
	nop
	break	7
1:
	.set	reorder
	bne	$v1,$zero,$L38
	la	$a0,$LC2
	la	$t9,printf
	jal	$ra,$t9
$L38:
	lw	$a0,48($fp)
	lw	$v0,24($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	la	$a0,$LC3
	lw	$a2,0($v0)
	lw	$a3,4($v0)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L34
$L35:
	la	$a0,$LC2
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	print_matrix_2d
	.size	print_matrix_2d, .-print_matrix_2d
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
