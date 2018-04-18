	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #8000
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #8064
	ldr	r3, .L4+24
	strh	r1, [r2, #10]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #1
	ldr	ip, .L4+28
	ldr	r0, .L4+32
	ldr	r2, .L4+36
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	titlePal
	.word	titleTiles
	.word	100726784
	.word	titleMap
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.word	seed
	.word	first
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4608
	push	{r4, lr}
	ldr	r3, .L8
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r0, .L8+12
	ldr	r1, .L8+16
	ldr	r2, .L8+20
	pop	{r4, lr}
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	b	goToStart
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupInterrupts
	.word	stopSound
	.word	first
	.word	firstSelecting
	.word	currentDay
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+8
	mov	r2, #100663296
	ldr	r1, .L12+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L12+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionsPal
	.word	12960
	.word	instructionsTiles
	.word	100726784
	.word	instructionsMap
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	ldr	r5, .L21+8
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L21+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L21+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	bl	goToInstructions
	ldr	r5, .L21+24
	mov	r3, #1
	ldr	r2, .L21+28
	ldr	r1, .L21+32
	ldr	r0, .L21+36
	mov	lr, pc
	bx	r5
	ldr	r0, [r4]
	ldr	r3, .L21+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	seed
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	playSoundA
	.word	11025
	.word	522823
	.word	gameMusic
	.word	srand
	.size	start, .-start
	.align	2
	.global	goToInstructions1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions1, %function
goToInstructions1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L25
	mov	r2, #83886080
	ldr	r1, .L25+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #14464
	mov	r2, #100663296
	ldr	r1, .L25+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L25+12
	ldr	r1, .L25+16
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+24
	mov	lr, pc
	bx	r3
	mov	r2, #11
	ldr	r3, .L25+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	instructions1Pal
	.word	instructions1Tiles
	.word	100726784
	.word	instructions1Map
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToInstructions1, .-goToInstructions1
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L33
.L27:
	pop	{r4, lr}
	bx	lr
.L33:
	pop	{r4, lr}
	b	goToInstructions1
.L35:
	.align	2
.L34:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	goToInstructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions2, %function
goToInstructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L38
	mov	r2, #83886080
	ldr	r1, .L38+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+8
	mov	r2, #100663296
	ldr	r1, .L38+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L38+16
	ldr	r1, .L38+20
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+28
	mov	lr, pc
	bx	r3
	mov	r2, #12
	ldr	r3, .L38+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	DMANow
	.word	instructions2Pal
	.word	15264
	.word	instructions2Tiles
	.word	100726784
	.word	instructions2Map
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToInstructions2, .-goToInstructions2
	.align	2
	.global	instructions1
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions1, %function
instructions1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
	ldr	r3, .L47+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L46
.L40:
	pop	{r4, lr}
	bx	lr
.L46:
	pop	{r4, lr}
	b	goToInstructions2
.L48:
	.align	2
.L47:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions1, .-instructions1
	.align	2
	.global	goToInstructions3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions3, %function
goToInstructions3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L51
	mov	r2, #83886080
	ldr	r1, .L51+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #15040
	mov	r2, #100663296
	ldr	r1, .L51+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L51+12
	ldr	r1, .L51+16
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L51+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+24
	mov	lr, pc
	bx	r3
	mov	r2, #13
	ldr	r3, .L51+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	DMANow
	.word	instructions3Pal
	.word	instructions3Tiles
	.word	100726784
	.word	instructions3Map
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToInstructions3, .-goToInstructions3
	.align	2
	.global	instructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions2, %function
instructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L60
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
	ldr	r3, .L60+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
.L53:
	pop	{r4, lr}
	bx	lr
.L59:
	pop	{r4, lr}
	b	goToInstructions3
.L61:
	.align	2
.L60:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions2, .-instructions2
	.align	2
	.global	goToInstructions4
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions4, %function
goToInstructions4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L64
	mov	r2, #83886080
	ldr	r1, .L64+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16896
	mov	r2, #100663296
	ldr	r1, .L64+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L64+12
	ldr	r1, .L64+16
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L64+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+24
	mov	lr, pc
	bx	r3
	mov	r2, #14
	ldr	r3, .L64+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L65:
	.align	2
.L64:
	.word	DMANow
	.word	instructions4Pal
	.word	instructions4Tiles
	.word	100726784
	.word	instructions4Map
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToInstructions4, .-goToInstructions4
	.align	2
	.global	instructions3
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions3, %function
instructions3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L73
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
	ldr	r3, .L73+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
.L66:
	pop	{r4, lr}
	bx	lr
.L72:
	pop	{r4, lr}
	b	goToInstructions4
.L74:
	.align	2
.L73:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions3, .-instructions3
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L81
	mov	r2, #83886080
	ldr	r1, .L81+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3200
	mov	r2, #100663296
	ldr	r1, .L81+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L81+12
	ldr	r1, .L81+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L81+20
	ldr	r1, .L81+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L81+28
	ldr	r1, .L81+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #448
	ldr	r2, .L81+36
	ldr	r1, .L81+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L81+44
	ldr	r1, .L81+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7808
	mvn	r2, #4
	mvn	r0, #69
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	ldr	r2, .L81+52
	strh	r1, [r3, #10]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r2, #1
	ldr	r4, .L81+56
	ldr	r1, [r4]
	ldr	r3, .L81+60
	cmp	r1, #0
	str	r2, [r3]
	beq	.L75
	ldr	r3, .L81+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+68
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4]
.L75:
	pop	{r4, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	DMANow
	.word	itemShopPal
	.word	itemShopTiles
	.word	100724736
	.word	itemShopMap
	.word	83886592
	.word	playerPal
	.word	100728832
	.word	playerTiles
	.word	100679680
	.word	textBoxTiles
	.word	100716544
	.word	textBoxMap
	.word	waitForVBlank
	.word	first
	.word	state
	.word	initGame
	.word	initCheat
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions4
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions4, %function
instructions4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L90
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L83
	ldr	r3, .L90+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L89
.L83:
	pop	{r4, lr}
	bx	lr
.L89:
	pop	{r4, lr}
	b	goToGame
.L91:
	.align	2
.L90:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions4, .-instructions4
	.align	2
	.global	goToManCounter
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToManCounter, %function
goToManCounter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4864
	ldr	r3, .L97
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, lr}
	strh	r1, [r2]	@ movhi
	beq	.L94
	cmp	r3, #2
	bne	.L93
	mov	r3, #2880
	ldr	r2, .L97+4
	ldr	r1, .L97+8
	mov	r0, #3
	ldr	r4, .L97+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L97+16
	ldr	r1, .L97+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
.L93:
	mov	r2, #67108864
	ldr	r1, .L97+24
	ldr	r3, .L97+28
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #10
	ldr	r3, .L97+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L94:
	mov	r3, #2880
	ldr	r2, .L97+4
	ldr	r1, .L97+36
	mov	r0, #3
	ldr	r4, .L97+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L97+16
	ldr	r1, .L97+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	b	.L93
.L98:
	.align	2
.L97:
	.word	currentDay
	.word	100679680
	.word	textBoxManDay2Tiles
	.word	DMANow
	.word	100716544
	.word	textBoxManDay2Map
	.word	6788
	.word	waitForVBlank
	.word	state
	.word	textBoxManDay1Tiles
	.word	textBoxManDay1Map
	.size	goToManCounter, .-goToManCounter
	.align	2
	.global	manCounter
	.syntax unified
	.arm
	.fpu softvfp
	.type	manCounter, %function
manCounter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L106
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L99
	ldr	r3, .L106+16
	ldrh	r3, [r3]
	ands	r4, r3, #1
	beq	.L105
.L99:
	pop	{r4, lr}
	bx	lr
.L105:
	bl	goToGame
	mov	r2, #67108864
	mov	r1, #4608
	ldr	r3, .L106+20
	strh	r1, [r2]	@ movhi
	str	r4, [r3, #76]
	str	r4, [r3, #44]
	pop	{r4, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	updateMan
	.word	drawMan
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	man
	.size	manCounter, .-manCounter
	.align	2
	.global	goToPlacingInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPlacingInstructions, %function
goToPlacingInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4864
	mov	r4, #67108864
	ldr	r5, .L110
	strh	r2, [r4]	@ movhi
	mov	r3, #1888
	ldr	r2, .L110+4
	ldr	r1, .L110+8
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L110+12
	ldr	r1, .L110+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L110+20
	ldr	r3, .L110+24
	strh	r2, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #9
	ldr	r3, .L110+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L111:
	.align	2
.L110:
	.word	DMANow
	.word	100679680
	.word	textBoxPlacingInstructionsTiles
	.word	100716544
	.word	textBoxPlacingInstructionsMap
	.word	6788
	.word	waitForVBlank
	.word	state
	.size	goToPlacingInstructions, .-goToPlacingInstructions
	.align	2
	.global	placingInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	placingInstructions, %function
placingInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L122
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L122+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #1
	beq	.L121
	pop	{r4, lr}
	bx	lr
.L121:
	bl	goToGame
	mov	r0, #67108864
	mov	ip, #4608
	mov	r1, #1
	ldr	r2, .L122+8
	ldr	r3, .L122+12
	strh	ip, [r0]	@ movhi
	str	r4, [r3]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	oldButtons
	.word	buttons
	.word	placingInstructionsCompleted
	.word	placingInstruction
	.size	placingInstructions, .-placingInstructions
	.align	2
	.global	goToPlacing
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPlacing, %function
goToPlacing:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4864
	ldr	r2, .L130
	push	{r4, lr}
	ldr	r4, .L130+4
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L130+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L125
	ldr	r3, .L130+12
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4]
.L125:
	ldr	r3, .L130+16
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L130+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L131:
	.align	2
.L130:
	.word	6788
	.word	firstSelecting
	.word	waitForVBlank
	.word	initItems
	.word	initSelecting
	.word	state
	.size	goToPlacing, .-goToPlacing
	.align	2
	.global	placing
	.syntax unified
	.arm
	.fpu softvfp
	.type	placing, %function
placing:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L141
	ldr	r6, .L141+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L141+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	ldr	r4, .L141+12
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #1
	add	r2, r4, r3, lsl #2
	ldr	r3, [r2, #64]
	add	r3, r3, r3, lsr #31
	ldr	r1, [r2, #60]
	asr	r3, r3, #1
	ldr	r2, .L141+16
	mov	r0, #3
	ldr	r5, .L141+20
	mov	lr, pc
	bx	r5
	ldr	r3, [r6]
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #1
	add	r4, r4, r3, lsl #2
	ldr	r3, [r4, #72]
	ldr	r6, .L141+24
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	ldr	r1, [r4, #68]
	ldr	r2, .L141+28
	mov	r0, #3
	ldr	r4, .L141+32
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	cmp	r3, #0
	bne	.L139
.L133:
	ldr	r3, .L141+36
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L140
	pop	{r4, r5, r6, lr}
	bx	lr
.L140:
	mov	r1, #67108864
	mov	ip, #4608
	mov	r2, #0
	strh	ip, [r1]	@ movhi
	ldr	r0, .L141+40
	ldr	r1, .L141+44
	str	r2, [r6]
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	str	r2, [r0]
	str	r2, [r1]
	b	goToGame
.L139:
	ldr	r3, .L141+48
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L141+52
	str	r2, [r3]
	b	.L133
.L142:
	.align	2
.L141:
	.word	updateSelecting
	.word	placementCounter
	.word	drawSelecting
	.word	items
	.word	100679680
	.word	DMANow
	.word	selected
	.word	100716544
	.word	waitForVBlank
	.word	cancel
	.word	beginSelection
	.word	priced
	.word	initPricing
	.word	state
	.size	placing, .-placing
	.align	2
	.global	goToPricing
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPricing, %function
goToPricing:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L145
	mov	lr, pc
	bx	r3
	ldr	r3, .L145+4
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L145+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L146:
	.align	2
.L145:
	.word	initPricing
	.word	waitForVBlank
	.word	state
	.size	goToPricing, .-goToPricing
	.align	2
	.global	pricing
	.syntax unified
	.arm
	.fpu softvfp
	.type	pricing, %function
pricing:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L153
	mov	lr, pc
	bx	r3
	ldr	r4, .L153+4
	ldr	r3, .L153+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L153+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L147
	mov	r3, #67108864
	mov	r2, #4608
	strh	r2, [r3]	@ movhi
	bl	goToGame
	mov	r3, #0
	ldr	r2, .L153+16
	str	r3, [r4]
	str	r3, [r2]
.L147:
	pop	{r4, lr}
	bx	lr
.L154:
	.align	2
.L153:
	.word	updatePricing
	.word	priced
	.word	drawPricing
	.word	waitForVBlank
	.word	beginSelection
	.size	pricing, .-pricing
	.align	2
	.global	goToPriceChange
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPriceChange, %function
goToPriceChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	ldr	r2, .L157
	push	{r4, lr}
	ldr	r3, .L157+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L157+8
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldr	r3, .L157+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L158:
	.align	2
.L157:
	.word	firstPriceChange
	.word	initChangePrice
	.word	waitForVBlank
	.word	state
	.size	goToPriceChange, .-goToPriceChange
	.align	2
	.global	priceChange
	.syntax unified
	.arm
	.fpu softvfp
	.type	priceChange, %function
priceChange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L163
	mov	lr, pc
	bx	r3
	ldr	r3, .L163+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L163+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L163+12
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L162
	pop	{r4, lr}
	bx	lr
.L162:
	mov	r2, #0
	ldr	r1, .L163+16
	pop	{r4, lr}
	str	r2, [r3]
	str	r2, [r1]
	b	goToGame
.L164:
	.align	2
.L163:
	.word	changePrice
	.word	drawChangePrice
	.word	waitForVBlank
	.word	priced
	.word	changingPrice
	.size	priceChange, .-priceChange
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L167
	mov	lr, pc
	bx	r3
	ldr	r3, .L167+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L167+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L167+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L167+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L168:
	.align	2
.L167:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L181
	mov	r2, #83886080
	ldr	r1, .L181+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3328
	mov	r2, #100663296
	ldr	r1, .L181+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L181+12
	ldr	r1, .L181+16
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L181+20
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #7808
	ldr	r3, .L181+24
	strh	r1, [r2, #10]	@ movhi
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L170
	ldr	r2, .L181+28
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L179
.L170:
	tst	r3, #4
	beq	.L169
	ldr	r3, .L181+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L180
.L169:
	pop	{r4, lr}
	bx	lr
.L180:
	bl	initialize
	pop	{r4, lr}
	b	goToStart
.L179:
	pop	{r4, lr}
	b	goToGame
.L182:
	.align	2
.L181:
	.word	DMANow
	.word	pausePal
	.word	pauseTiles
	.word	100724736
	.word	pauseMap
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L185
	mov	lr, pc
	bx	r3
	ldr	r4, .L185+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L185+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16128
	mov	r2, #100663296
	ldr	r1, .L185+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L185+16
	ldr	r1, .L185+20
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L185+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L185+28
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #8064
	mov	r2, #4608
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r1, .L185+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L185+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L186:
	.align	2
.L185:
	.word	hideSprites
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100726784
	.word	winMap
	.word	initEndGame
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L194
	mov	lr, pc
	bx	r3
	ldr	r3, .L194+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L194+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L194+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L194+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L187
	ldr	r3, .L194+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L193
.L187:
	pop	{r4, lr}
	bx	lr
.L193:
	bl	initialize
	ldr	r3, .L194+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L195:
	.align	2
.L194:
	.word	endGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	gameResetSprites
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L198
	mov	lr, pc
	bx	r3
	ldr	r4, .L198+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L198+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #15616
	mov	r2, #100663296
	ldr	r1, .L198+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L198+16
	ldr	r1, .L198+20
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L198+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L198+28
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #8064
	mov	r2, #4608
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r1, .L198+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L198+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L199:
	.align	2
.L198:
	.word	hideSprites
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100726784
	.word	loseMap
	.word	initEndGame
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L243
	mov	lr, pc
	bx	r3
	ldr	r3, .L243+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L243+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L243+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L243+16
	ldr	r3, .L243+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L243+24
	ldr	r3, .L243+28
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L201
	ldr	r3, .L243+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L236
.L201:
	ldr	r3, .L243+36
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L237
	ldr	r3, .L243+40
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L238
.L203:
	ldr	r3, .L243+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L239
.L204:
	ldr	r3, .L243+48
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L240
.L205:
	ldr	r3, .L243+52
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L241
.L206:
	ldr	r3, .L243+56
	ldr	r3, [r3, #76]
	cmp	r3, #0
	bne	.L242
.L207:
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L200
	ldr	r3, .L243+32
	ldrh	r3, [r3]
	ands	r3, r3, #4
	bne	.L200
	ldr	r2, .L243+60
	ldr	r1, [r2]
	cmp	r1, #0
	moveq	r3, #1
	str	r3, [r2]
.L200:
	pop	{r4, r5, r6, lr}
	bx	lr
.L241:
	ldr	r3, .L243+64
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L206
	bl	goToPlacingInstructions
	ldr	r3, .L243+56
	ldr	r3, [r3, #76]
	cmp	r3, #0
	beq	.L207
.L242:
	bl	goToManCounter
	b	.L207
.L240:
	bl	goToLose
	b	.L205
.L237:
	bl	goToPlacing
	ldr	r3, .L243+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L203
.L238:
	mov	r1, #1
	ldr	r2, .L243+68
	ldr	r3, .L243+72
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	r2, #7
	ldr	r3, .L243+76
	str	r2, [r3]
	ldr	r3, .L243+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L204
.L239:
	bl	goToWin
	b	.L204
.L236:
	bl	goToPause
	b	.L201
.L244:
	.align	2
.L243:
	.word	updateGame
	.word	checkOver
	.word	cheat
	.word	updateMan
	.word	oldButtons
	.word	drawMan
	.word	waitForVBlank
	.word	drawGame
	.word	buttons
	.word	beginSelection
	.word	changingPrice
	.word	won
	.word	lost
	.word	currentDay
	.word	man
	.word	cheating
	.word	placingInstruction
	.word	firstPriceChange
	.word	initChangePrice
	.word	state
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L266
	mov	lr, pc
	bx	r3
	ldr	r6, .L266+4
	ldr	r8, .L266+8
	ldr	r5, .L266+12
	ldr	fp, .L266+16
	ldr	r10, .L266+20
	ldr	r9, .L266+24
	ldr	r7, .L266+28
	ldr	r4, .L266+32
.L246:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L247:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #14
	ldrls	pc, [pc, r2, asl #2]
	b	.L247
.L249:
	.word	.L248
	.word	.L250
	.word	.L251
	.word	.L252
	.word	.L252
	.word	.L253
	.word	.L254
	.word	.L255
	.word	.L256
	.word	.L257
	.word	.L258
	.word	.L259
	.word	.L260
	.word	.L261
	.word	.L262
.L252:
	mov	lr, pc
	bx	r7
	b	.L246
.L251:
	mov	lr, pc
	bx	r9
	b	.L246
.L250:
	mov	lr, pc
	bx	r10
	b	.L246
.L248:
	mov	lr, pc
	bx	fp
	b	.L246
.L261:
	ldr	r3, .L266+36
	mov	lr, pc
	bx	r3
	b	.L246
.L260:
	ldr	r3, .L266+40
	mov	lr, pc
	bx	r3
	b	.L246
.L259:
	ldr	r3, .L266+44
	mov	lr, pc
	bx	r3
	b	.L246
.L258:
	ldr	r3, .L266+48
	mov	lr, pc
	bx	r3
	b	.L246
.L257:
	ldr	r3, .L266+52
	mov	lr, pc
	bx	r3
	b	.L246
.L256:
	ldr	r3, .L266+56
	mov	lr, pc
	bx	r3
	b	.L246
.L255:
	ldr	r3, .L266+60
	mov	lr, pc
	bx	r3
	b	.L246
.L254:
	ldr	r3, .L266+64
	mov	lr, pc
	bx	r3
	b	.L246
.L253:
	ldr	r3, .L266+68
	mov	lr, pc
	bx	r3
	b	.L246
.L262:
	ldr	r3, .L266+72
	mov	lr, pc
	bx	r3
	b	.L246
.L267:
	.align	2
.L266:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.word	instructions3
	.word	instructions2
	.word	instructions1
	.word	manCounter
	.word	placingInstructions
	.word	instructions
	.word	priceChange
	.word	pricing
	.word	placing
	.word	instructions4
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	firstSelecting,4,4
	.comm	first,4,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
