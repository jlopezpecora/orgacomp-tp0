	.file	1 "src/engine.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"parse error\n\000"
	.text
	.align	2
	.globl	run
	.ent	run
run:
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
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	sw	$zero,32($fp)
$L18:
	lhu	$v0,__sF+12
	srl	$v0,$v0,5
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L20
	b	$L17
$L20:
	li	$a0,15			# 0xf
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,36($fp)
	addu	$v0,$fp,36
	la	$a0,__sF
	move	$a1,$v0
	li	$a2,15			# 0xf
	la	$t9,fgetline
	jal	$ra,$t9
	blez	$v0,$L21
	addu	$v0,$fp,28
	lw	$a0,36($fp)
	addu	$a1,$fp,24
	move	$a2,$v0
	la	$t9,parseline
	jal	$ra,$t9
	beq	$v0,$zero,$L22
	lw	$a0,36($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L22:
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	la	$t9,matrix_multiply
	jal	$ra,$t9
	sw	$v0,32($fp)
	la	$a0,__sF+88
	lw	$a1,32($fp)
	la	$t9,print_matrix
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
$L21:
	lw	$a0,36($fp)
	la	$t9,free
	jal	$ra,$t9
	b	$L18
$L17:
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	run
	.size	run, .-run
	.align	2
	.ent	fgetline
fgetline:
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
	sw	$a2,56($fp)
	sw	$zero,24($fp)
$L24:
	lw	$v0,56($fp)
	addu	$v1,$v0,-1
	lw	$v0,24($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L25
	lw	$a0,48($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sb	$v0,28($fp)
	lbu	$v0,28($fp)
	sll	$v0,$v0,24
	sra	$v1,$v0,24
	li	$v0,10			# 0xa
	beq	$v1,$v0,$L25
	lb	$v1,28($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L27
	b	$L25
$L27:
	lw	$v0,56($fp)
	addu	$v1,$v0,-2
	lw	$v0,24($fp)
	bne	$v0,$v1,$L29
	lw	$s0,52($fp)
	lw	$a0,52($fp)
	lw	$v1,56($fp)
	sra	$v0,$v1,31
	srl	$v0,$v0,31
	addu	$v0,$v1,$v0
	sra	$v1,$v0,1
	lw	$v0,56($fp)
	addu	$v0,$v0,$v1
	sw	$v0,56($fp)
	lw	$a0,0($a0)
	move	$a1,$v0
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,0($s0)
$L29:
	lw	$v0,52($fp)
	lw	$v1,0($v0)
	lw	$v0,24($fp)
	addu	$v1,$v1,$v0
	lbu	$v0,28($fp)
	sb	$v0,0($v1)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L24
$L25:
	lw	$v0,52($fp)
	lw	$v1,0($v0)
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	fgetline
	.size	fgetline, .-fgetline
	.align	2
	.ent	parseline
parseline:
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
	sw	$a2,64($fp)
	lw	$v0,56($fp)
	sw	$v0,24($fp)
	addu	$v0,$fp,28
	move	$a0,$v0
	addu	$a1,$fp,24
	la	$t9,getInteger
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	beq	$v0,$zero,$L31
	lw	$v0,32($fp)
	sw	$v0,36($fp)
	b	$L30
$L31:
	lw	$a0,28($fp)
	lw	$a1,28($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	move	$v1,$v0
	lw	$v0,60($fp)
	sw	$v1,0($v0)
	lw	$v0,60($fp)
	addu	$a0,$fp,24
	lw	$a1,0($v0)
	la	$t9,loadMatrix
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	beq	$v0,$zero,$L32
	lw	$v0,60($fp)
	lw	$a0,0($v0)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$v0,32($fp)
	sw	$v0,36($fp)
	b	$L30
$L32:
	lw	$a0,28($fp)
	lw	$a1,28($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	move	$v1,$v0
	lw	$v0,64($fp)
	sw	$v1,0($v0)
	lw	$v0,64($fp)
	addu	$a0,$fp,24
	lw	$a1,0($v0)
	la	$t9,loadMatrix
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	beq	$v0,$zero,$L33
	lw	$v0,60($fp)
	lw	$a0,0($v0)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$v0,64($fp)
	lw	$a0,0($v0)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$v0,32($fp)
	sw	$v0,36($fp)
	b	$L30
$L33:
	sw	$zero,36($fp)
$L30:
	lw	$v0,36($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	parseline
	.size	parseline, .-parseline
	.align	2
	.ent	advanceBlanks
advanceBlanks:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
$L35:
	lw	$v0,16($fp)
	lw	$v0,0($v0)
	lb	$v1,0($v0)
	li	$v0,32			# 0x20
	beq	$v1,$v0,$L37
	b	$L34
$L37:
	lw	$v1,16($fp)
	lw	$v0,16($fp)
	lw	$v0,0($v0)
	addu	$v0,$v0,1
	sw	$v0,0($v1)
	b	$L35
$L34:
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	advanceBlanks
	.size	advanceBlanks, .-advanceBlanks
	.align	2
	.ent	invalidChar
invalidChar:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sw	$zero,8($fp)
	lw	$v0,24($fp)
	beq	$v0,$zero,$L39
	lw	$v0,24($fp)
	lw	$v0,0($v0)
	beq	$v0,$zero,$L39
	lw	$v0,24($fp)
	lw	$v0,0($v0)
	lb	$v1,0($v0)
	li	$v0,32			# 0x20
	beq	$v1,$v0,$L39
	lw	$v0,24($fp)
	lw	$v0,0($v0)
	lb	$v0,0($v0)
	beq	$v0,$zero,$L39
	li	$v0,1			# 0x1
	sw	$v0,8($fp)
$L39:
	lw	$v0,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	invalidChar
	.size	invalidChar, .-invalidChar
	.align	2
	.ent	getInteger
getInteger:
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
	lw	$a0,52($fp)
	la	$t9,advanceBlanks
	jal	$ra,$t9
	la	$t9,__errno
	jal	$ra,$t9
	sw	$zero,0($v0)
	lw	$v0,52($fp)
	lw	$a0,0($v0)
	lw	$a1,52($fp)
	li	$a2,10			# 0xa
	la	$t9,strtol
	jal	$ra,$t9
	sw	$v0,24($fp)
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	bne	$v0,$zero,$L42
	lw	$a0,52($fp)
	la	$t9,invalidChar
	jal	$ra,$t9
	bne	$v0,$zero,$L42
	b	$L41
$L42:
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	b	$L40
$L41:
	lw	$v1,48($fp)
	lw	$v0,24($fp)
	sw	$v0,0($v1)
	sw	$zero,28($fp)
$L40:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	getInteger
	.size	getInteger, .-getInteger
	.align	2
	.ent	getDouble
getDouble:
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
	lw	$a0,52($fp)
	la	$t9,advanceBlanks
	jal	$ra,$t9
	la	$t9,__errno
	jal	$ra,$t9
	sw	$zero,0($v0)
	lw	$v0,52($fp)
	lw	$a0,0($v0)
	lw	$a1,52($fp)
	la	$t9,strtod
	jal	$ra,$t9
	lw	$v0,48($fp)
	s.d	$f0,0($v0)
	sw	$zero,24($fp)
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	bne	$v0,$zero,$L45
	lw	$a0,52($fp)
	la	$t9,invalidChar
	jal	$ra,$t9
	bne	$v0,$zero,$L45
	b	$L44
$L45:
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
$L44:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	getDouble
	.size	getDouble, .-getDouble
	.align	2
	.ent	loadMatrix
loadMatrix:
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
	sw	$zero,24($fp)
$L47:
	lw	$v0,52($fp)
	lw	$v1,52($fp)
	lw	$a0,0($v0)
	lw	$v0,4($v1)
	mult	$a0,$v0
	mflo	$v1
	lw	$v0,24($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L50
	b	$L48
$L50:
	lw	$a0,52($fp)
	lw	$v0,24($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	move	$a0,$v0
	lw	$a1,48($fp)
	la	$t9,getDouble
	jal	$ra,$t9
	beq	$v0,$zero,$L49
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	b	$L46
$L49:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L47
$L48:
	sw	$zero,28($fp)
$L46:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	loadMatrix
	.size	loadMatrix, .-loadMatrix
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
