	.file	1 "src/app.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"hV\000"
	.globl	short_options
	.data
	.align	2
	.type	short_options, @object
	.size	short_options, 4
short_options:
	.word	$LC0
	.rdata
	.align	2
$LC1:
	.ascii	"help\000"
	.align	2
$LC2:
	.ascii	"version\000"
	.data
	.align	2
	.type	options, @object
	.size	options, 48
options:
	.word	$LC1
	.word	0
	.word	0
	.word	104
	.word	$LC2
	.word	0
	.word	0
	.word	86
	.word	0
	.word	0
	.space	8
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,64,$ra		# vars= 16, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 24
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	addu	$v0,$fp,36
	sw	$v0,16($sp)
	lw	$a0,64($fp)
	lw	$a1,68($fp)
	lw	$a2,short_options
	la	$a3,options
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L18
	lw	$v0,32($fp)
	sw	$v0,40($fp)
	li	$v0,86			# 0x56
	lw	$v1,40($fp)
	beq	$v1,$v0,$L21
	li	$v0,104			# 0x68
	lw	$v1,40($fp)
	beq	$v1,$v0,$L20
	b	$L22
$L20:
	la	$t9,print_help
	jal	$ra,$t9
	b	$L24
$L21:
	la	$t9,print_version
	jal	$ra,$t9
	b	$L24
$L22:
	la	$t9,print_help
	jal	$ra,$t9
	b	$L24
$L18:
	la	$t9,run
	jal	$ra,$t9
$L24:
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC3:
	.ascii	"Version: %-1.1f\n\000"
	.align	3
$LC4:
	.word	0
	.word	1072693248
	.text
	.align	2
	.ent	print_version
print_version:
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
	l.d	$f0,$LC4
	la	$a0,$LC3
	mfc1	$a2,$f0
	mfc1	$a3,$f1
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	print_version
	.size	print_version, .-print_version
	.rdata
	.align	2
$LC5:
	.ascii	"Usage:\n"
	.ascii	"  tp0 -h\n"
	.ascii	"  tp0 -V\n"
	.ascii	"  tp0 < in_file > out_file\n"
	.ascii	"Options:\n"
	.ascii	"  -V, --version    Print version and quit.\n"
	.ascii	"  -h, --help       Print this information and quit.\n"
	.ascii	"Examples:\n"
	.ascii	"  tp0 < in.txt > out.txt\n"
	.ascii	"  cat in.txt | tp0 > out.txt\n\000"
	.text
	.align	2
	.ent	print_help
print_help:
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
	la	$a0,$LC5
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	print_help
	.size	print_help, .-print_help
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
