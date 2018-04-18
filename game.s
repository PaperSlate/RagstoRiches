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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #80
	mov	r4, #100
	mov	lr, #16
	mov	r1, #1
	mov	ip, #32
	mov	r0, #4
	ldr	r3, .L4
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #40]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L167
	ldr	r3, [r4, #32]
	cmp	r3, #4
	movne	r2, #4
	strne	r3, [r4, #28]
	strne	r2, [r4, #32]
	ldr	r3, .L167+4
	ldr	r2, [r4, #24]
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r1, r3, r3, lsl #1
	add	r3, r3, r1, lsl #2
	cmp	r2, r3
	sub	sp, sp, #20
	bne	.L8
	ldr	r0, [r4, #36]
	ldr	r3, .L167+8
	add	r0, r0, #1
	ldr	r1, [r4, #40]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L8:
	ldr	r3, .L167+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldm	r4, {r0, r1}
	bne	.L9
	cmp	r1, #0
	ble	.L10
	ldr	r2, [r4, #20]
	add	r3, r2, r2, lsr #31
	add	r3, r0, r3, asr #1
	rsb	r3, r3, r3, lsl #4
	sub	ip, r1, #1
	add	r3, ip, r3, lsl #4
	ldr	lr, .L167+16
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	bne	.L155
.L10:
	mov	r3, #3
	str	r3, [r4, #32]
.L9:
	ldr	r3, .L167+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldr	r3, [r4, #16]
	bne	.L11
	rsb	r2, r3, #240
	cmp	r2, r1
	bgt	.L156
.L12:
	mov	r2, #1
	str	r2, [r4, #32]
.L11:
	ldr	r2, .L167+12
	ldrh	r2, [r2, #48]
	tst	r2, #64
	bne	.L13
	cmp	r0, #0
	ble	.L14
	ldr	r2, [r4, #20]
	add	r2, r2, r2, lsr #31
	add	r2, r0, r2, asr #1
	sub	r2, r2, #1
	rsb	r2, r2, r2, lsl #4
	add	r2, r1, r2, lsl #4
	ldr	ip, .L167+16
	lsl	lr, r2, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #0
	bne	.L157
.L14:
	mov	r2, #2
	str	r2, [r4, #32]
.L13:
	ldr	r2, .L167+12
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bne	.L15
	ldr	r2, [r4, #20]
	rsb	ip, r2, #160
	cmp	ip, r0
	bgt	.L158
.L16:
	mov	r2, #0
	str	r2, [r4, #32]
.L15:
	mov	r2, #16
	mov	lr, #142
	mov	ip, #60
	str	r2, [sp, #12]
	str	r2, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r5, .L167+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L18
	ldr	r6, .L167+24
	ldrh	lr, [r6]
	tst	lr, #1
	beq	.L19
	ldr	r3, .L167+28
	ldrh	r2, [r3]
	ands	r2, r2, #1
	bne	.L19
	mov	ip, #1
	mov	r1, ip
	ldr	r0, .L167+32
	ldr	r3, .L167+36
	str	ip, [r0]
	add	r7, r3, #608
.L21:
	ldr	ip, [r3, #40]
	add	r3, r3, #76
	cmp	ip, #4
	moveq	r2, #1
	moveq	r1, #0
	cmp	r7, r3
	bne	.L21
	cmp	r2, #0
	bne	.L159
.L22:
	mov	lr, #4
	ldr	ip, .L167+40
	mov	r3, #0
	ldr	r2, .L167+44
	ldr	r1, .L167+48
	ldr	r0, .L167+52
	ldr	r7, .L167+56
	str	lr, [ip]
	mov	lr, pc
	bx	r7
	ldrh	lr, [r6]
.L19:
	tst	lr, #2
	bne	.L160
.L18:
	mov	r2, #16
	mov	r0, #126
	mov	ip, #60
	stmib	sp, {r0, r2}
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #4]
	str	r2, [sp, #12]
	ldr	r0, [r4]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L25
	ldr	r6, .L167+24
	ldrh	lr, [r6]
	tst	lr, #1
	beq	.L26
	ldr	r3, .L167+28
	ldrh	r2, [r3]
	ands	r2, r2, #1
	bne	.L26
	mov	ip, #1
	mov	r1, ip
	ldr	r0, .L167+32
	ldr	r3, .L167+36
	str	ip, [r0]
	add	r7, r3, #608
.L28:
	ldr	ip, [r3, #40]
	add	r3, r3, #76
	cmp	ip, #3
	moveq	r2, #1
	moveq	r1, #0
	cmp	r7, r3
	bne	.L28
	cmp	r2, #0
	bne	.L161
.L29:
	mov	lr, #3
	ldr	ip, .L167+40
	mov	r3, #0
	ldr	r2, .L167+44
	ldr	r1, .L167+48
	ldr	r0, .L167+52
	ldr	r7, .L167+56
	str	lr, [ip]
	mov	lr, pc
	bx	r7
	ldrh	lr, [r6]
.L26:
	tst	lr, #2
	bne	.L162
.L25:
	mov	r2, #16
	mov	r0, #110
	mov	ip, #60
	stmib	sp, {r0, r2}
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #4]
	str	r2, [sp, #12]
	ldr	r0, [r4]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L32
	ldr	r6, .L167+24
	ldrh	lr, [r6]
	tst	lr, #1
	beq	.L33
	ldr	r3, .L167+28
	ldrh	r2, [r3]
	ands	r2, r2, #1
	bne	.L33
	mov	ip, #1
	mov	r1, ip
	ldr	r0, .L167+32
	ldr	r3, .L167+36
	str	ip, [r0]
	add	r7, r3, #608
.L35:
	ldr	ip, [r3, #40]
	add	r3, r3, #76
	cmp	ip, #2
	moveq	r2, #1
	moveq	r1, #0
	cmp	r3, r7
	bne	.L35
	cmp	r2, #0
	bne	.L163
.L36:
	mov	lr, #2
	ldr	ip, .L167+40
	mov	r3, #0
	ldr	r2, .L167+44
	ldr	r1, .L167+48
	ldr	r0, .L167+52
	ldr	r7, .L167+56
	str	lr, [ip]
	mov	lr, pc
	bx	r7
	ldrh	lr, [r6]
.L33:
	tst	lr, #2
	bne	.L164
.L32:
	mov	r2, #16
	mov	r0, #94
	mov	ip, #60
	stmib	sp, {r0, r2}
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #4]
	str	r2, [sp, #12]
	ldr	r0, [r4]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L39
	ldr	r6, .L167+24
	ldrh	lr, [r6]
	tst	lr, #1
	beq	.L40
	ldr	r3, .L167+28
	ldrh	r2, [r3]
	ands	r2, r2, #1
	bne	.L40
	mov	ip, #1
	mov	r1, ip
	ldr	r0, .L167+32
	ldr	r3, .L167+36
	str	ip, [r0]
	add	r5, r3, #608
.L42:
	ldr	ip, [r3, #40]
	add	r3, r3, #76
	cmp	ip, #1
	moveq	r2, #1
	moveq	r1, #0
	cmp	r3, r5
	bne	.L42
	cmp	r2, #0
	bne	.L165
.L43:
	mov	lr, #1
	ldr	ip, .L167+40
	mov	r3, #0
	ldr	r2, .L167+44
	ldr	r1, .L167+48
	ldr	r0, .L167+52
	ldr	r5, .L167+56
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	ldrh	lr, [r6]
.L40:
	tst	lr, #2
	beq	.L39
	ldr	r3, .L167+28
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L39
	ldr	r2, .L167+60
	ldr	r2, [r2, #36]
	cmp	r2, #0
	beq	.L39
	ldr	r2, .L167+64
	ldr	r2, [r2, #36]
	cmp	r2, #0
	bne	.L166
.L39:
	ldr	r3, [r4, #32]
	cmp	r3, #4
	moveq	r2, #0
	ldrne	r3, [r4, #24]
	ldreq	r3, [r4, #28]
	addne	r3, r3, #1
	streq	r2, [r4, #36]
	streq	r3, [r4, #32]
	strne	r3, [r4, #24]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L156:
	ldr	lr, [r4, #20]
	add	r2, lr, lr, lsr #31
	add	r2, r0, r2, asr #1
	add	ip, r1, r3
	rsb	r2, r2, r2, lsl #4
	add	ip, ip, #1
	add	r2, ip, r2, lsl #4
	ldr	r5, .L167+16
	lsl	r2, r2, #1
	ldrh	r2, [r5, r2]
	cmp	r2, #0
	beq	.L12
	add	lr, lr, r0
	sub	lr, lr, #1
	rsb	lr, lr, lr, lsl #4
	add	ip, ip, lr, lsl #4
	lsl	ip, ip, #1
	ldrh	r2, [r5, ip]
	cmp	r2, #0
	ldrne	r2, [r4, #8]
	addne	r1, r1, r2
	strne	r1, [r4, #4]
	b	.L12
.L164:
	ldr	r3, .L167+28
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L32
	ldr	r2, .L167+60
	ldr	r2, [r2, #112]
	cmp	r2, #0
	beq	.L32
	ldr	r2, .L167+64
	ldr	r2, [r2, #112]
	cmp	r2, #0
	beq	.L32
	mov	r0, #2
	mov	lr, #1
	ldr	r1, .L167+68
	ldr	ip, .L167+72
	str	r0, [r1]
	ldr	r2, .L167+44
	ldr	r1, .L167+48
	ldr	r0, .L167+52
	ldr	r6, .L167+56
	str	lr, [ip]
	mov	lr, pc
	bx	r6
	b	.L32
.L162:
	ldr	r3, .L167+28
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L25
	ldr	r2, .L167+60
	ldr	r2, [r2, #188]
	cmp	r2, #0
	beq	.L25
	ldr	r2, .L167+64
	ldr	r2, [r2, #188]
	cmp	r2, #0
	beq	.L25
	mov	r0, #3
	mov	lr, #1
	ldr	r1, .L167+68
	ldr	ip, .L167+72
	str	r0, [r1]
	ldr	r2, .L167+44
	ldr	r1, .L167+48
	ldr	r0, .L167+52
	ldr	r6, .L167+56
	str	lr, [ip]
	mov	lr, pc
	bx	r6
	b	.L25
.L160:
	ldr	r3, .L167+28
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L18
	ldr	r2, .L167+60
	ldr	r2, [r2, #264]
	cmp	r2, #0
	beq	.L18
	ldr	r2, .L167+64
	ldr	r2, [r2, #264]
	cmp	r2, #0
	beq	.L18
	mov	r0, #4
	mov	lr, #1
	ldr	r1, .L167+68
	ldr	ip, .L167+72
	str	r0, [r1]
	ldr	r2, .L167+44
	ldr	r1, .L167+48
	ldr	r0, .L167+52
	ldr	r6, .L167+56
	str	lr, [ip]
	mov	lr, pc
	bx	r6
	b	.L18
.L158:
	add	r2, r2, r0
	add	r2, r2, #1
	rsb	r2, r2, r2, lsl #4
	add	r2, r1, r2, lsl #4
	ldr	ip, .L167+16
	lsl	lr, r2, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #0
	beq	.L16
	add	r2, r2, r3
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	ldrne	r2, [r4, #12]
	addne	r0, r0, r2
	strne	r0, [r4]
	b	.L16
.L155:
	add	r2, r2, r0
	sub	r2, r2, #1
	rsb	r2, r2, r2, lsl #4
	add	r2, ip, r2, lsl #4
	lsl	r2, r2, #1
	ldrh	r3, [lr, r2]
	cmp	r3, #0
	ldrne	r3, [r4, #8]
	subne	r1, r1, r3
	strne	r1, [r4, #4]
	b	.L10
.L157:
	add	r2, r2, r3
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	ldrne	r2, [r4, #12]
	subne	r0, r0, r2
	strne	r0, [r4]
	b	.L14
.L166:
	mov	ip, #1
	ldr	r0, .L167+68
	ldr	lr, .L167+72
	str	ip, [r0]
	ldr	r2, .L167+44
	ldr	r1, .L167+48
	ldr	r0, .L167+52
	ldr	r5, .L167+56
	str	ip, [lr]
	mov	lr, pc
	bx	r5
	b	.L39
.L161:
	cmp	r1, #0
	str	r1, [r0]
	beq	.L26
	b	.L29
.L159:
	cmp	r1, #0
	str	r1, [r0]
	beq	.L19
	b	.L22
.L165:
	cmp	r1, #0
	str	r1, [r0]
	beq	.L40
	b	.L43
.L163:
	cmp	r1, #0
	str	r1, [r0]
	beq	.L33
	b	.L36
.L168:
	.align	2
.L167:
	.word	player
	.word	1321528399
	.word	__aeabi_idivmod
	.word	67109120
	.word	collisionMapBitmap
	.word	collision
	.word	oldButtons
	.word	buttons
	.word	tempEvent
	.word	items
	.word	beginSelection
	.word	11025
	.word	1701
	.word	menuSFX
	.word	playSoundB
	.word	unitsCounter
	.word	tensCounter
	.word	currentPair
	.word	changingPrice
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L171
	str	lr, [sp, #-4]!
	ldr	r3, [r2, #36]
	ldr	lr, [r2, #32]
	ldm	r2, {r0, r1}
	ldr	ip, .L171+4
	ldr	r2, .L171+8
	add	r3, r3, lr, lsl #6
	lsl	r3, r3, #1
	orr	r0, r0, ip
	orr	r1, r1, ip
	strh	r3, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L172:
	.align	2
.L171:
	.word	player
	.word	-32768
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawRest
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRest, %function
drawRest:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L190
	mov	r3, r2
	ldr	r1, .L190+4
	ldr	r0, .L190+8
	push	{r4, r5, r6, lr}
	add	lr, r1, #304
.L178:
	ldr	ip, [r1, #32]
	cmp	ip, #0
	beq	.L174
	add	r6, r0, #24
	ldm	r6, {r6, ip}
	ldr	r5, [r0]
	ldr	r4, [r0, #4]
	add	ip, ip, r6, lsl #5
	strh	ip, [r3, #236]	@ movhi
	strh	r5, [r3, #232]	@ movhi
	strh	r4, [r3, #234]	@ movhi
.L175:
	ldr	ip, [r0, #32]
	cmp	ip, #0
	beq	.L176
	add	r6, r1, #24
	ldm	r6, {r6, ip}
	ldr	r5, [r1]
	ldr	r4, [r1, #4]
	add	ip, ip, r6, lsl #5
	strh	ip, [r3, #244]	@ movhi
	strh	r5, [r3, #240]	@ movhi
	strh	r4, [r3, #242]	@ movhi
.L177:
	add	r1, r1, #76
	cmp	r1, lr
	add	r3, r3, #16
	add	r0, r0, #76
	bne	.L178
	ldr	r3, .L190+12
	add	r0, r3, #608
	b	.L181
.L189:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	bne	.L179
	add	r4, r3, #24
	ldr	r1, [r3, #56]
	ldm	r4, {r4, lr}
	ldr	ip, [r3, #4]
	add	lr, lr, r4, lsl #5
	lsl	r1, r1, #12
	ldr	r4, [r3]
	add	r3, r3, #76
	orr	r1, r1, lr, lsl #1
	orr	ip, ip, #16384
	cmp	r0, r3
	strh	r1, [r2, #172]	@ movhi
	strh	ip, [r2, #170]	@ movhi
	strh	r4, [r2, #168]	@ movhi
	add	r2, r2, #8
	beq	.L188
.L181:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	bne	.L189
.L179:
	ldrh	r1, [r2, #168]
	add	r3, r3, #76
	orr	r1, r1, #512
	cmp	r0, r3
	strh	r1, [r2, #168]	@ movhi
	add	r2, r2, #8
	bne	.L181
.L188:
	pop	{r4, r5, r6, lr}
	bx	lr
.L176:
	ldrh	ip, [r3, #240]
	orr	ip, ip, #512
	strh	ip, [r3, #240]	@ movhi
	b	.L177
.L174:
	ldrh	ip, [r3, #232]
	orr	ip, ip, #512
	strh	ip, [r3, #232]	@ movhi
	b	.L175
.L191:
	.align	2
.L190:
	.word	shadowOAM
	.word	unitsCounter
	.word	tensCounter
	.word	items
	.size	drawRest, .-drawRest
	.align	2
	.global	initChangePrice
	.syntax unified
	.arm
	.fpu softvfp
	.type	initChangePrice, %function
initChangePrice:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	mov	r3, r0
	ldr	r2, .L201
	push	{r4, lr}
	ldr	r4, .L201+4
	ldr	r1, [r2]
	ldr	ip, [r4]
	ldr	r2, .L201+8
.L194:
	ldr	lr, [r2, #40]
	cmp	lr, r1
	moveq	ip, r3
	add	r3, r3, #1
	moveq	r0, #1
	cmp	r3, #8
	add	r2, r2, #76
	bne	.L194
	cmp	r0, #0
	mov	r0, #0
	sub	r1, r1, #1
	add	r3, r1, r1, lsl #3
	add	r1, r1, r3, lsl #1
	ldr	r2, .L201+12
	ldr	r3, .L201+16
	lsl	r1, r1, #2
	add	r2, r2, r1
	add	r1, r3, r1
	ldr	lr, [r2, #16]
	strne	ip, [r4]
	ldr	r1, [r1, #16]
	ldr	ip, .L201+20
	ldr	r2, .L201+24
	ldr	r3, .L201+28
	str	lr, [ip]
	str	r1, [r2]
	str	r0, [r3]
	pop	{r4, lr}
	bx	lr
.L202:
	.align	2
.L201:
	.word	currentPair
	.word	currentItem
	.word	items
	.word	unitsCounter
	.word	tensCounter
	.word	unitsInitial
	.word	tensInitial
	.word	priced
	.size	initChangePrice, .-initChangePrice
	.align	2
	.global	changePrice
	.syntax unified
	.arm
	.fpu softvfp
	.type	changePrice, %function
changePrice:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L261
	ldr	r4, .L261+4
	ldr	r3, [r5]
	ldrh	r2, [r4]
	cmp	r3, #0
	and	r3, r2, #64
	beq	.L204
	cmp	r3, #0
	beq	.L205
	ldr	r3, .L261+8
	ldrh	r3, [r3]
	ands	r0, r3, #64
	bne	.L205
	ldr	r3, .L261+12
	ldr	r3, [r3]
	sub	r3, r3, #1
	lsl	ip, r3, #3
	add	r2, ip, r3
	ldr	r1, .L261+16
	add	r2, r3, r2, lsl #1
	add	r2, r1, r2, lsl #2
	ldr	lr, [r2, #16]
	add	ip, ip, r3
	cmp	lr, #8
	add	r3, r3, ip, lsl #1
	add	r3, r1, r3, lsl #2
	addle	lr, lr, #1
	strgt	r0, [r2, #16]
	strle	lr, [r2, #16]
	ldr	r2, [r3, #28]
	add	r2, r2, #1
	cmp	r2, #18
	moveq	r2, #8
	mov	r1, #1648
	str	r2, [r3, #28]
	ldr	r0, .L261+20
	ldr	r2, .L261+24
	mov	r3, #0
	ldr	r6, .L261+28
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4]
.L205:
	tst	r2, #128
	beq	.L210
	ldr	r3, .L261+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L210
	ldr	r3, .L261+12
	ldr	r2, [r3]
	sub	r2, r2, #1
	lsl	r0, r2, #3
	add	r3, r0, r2
	ldr	r1, .L261+16
	add	r3, r2, r3, lsl #1
	add	r3, r1, r3, lsl #2
	ldr	ip, [r3, #16]
	cmp	ip, #0
	movle	ip, #9
	add	r0, r0, r2
	add	r2, r2, r0, lsl #1
	add	r2, r1, r2, lsl #2
	subgt	ip, ip, #1
	str	ip, [r3, #16]
	ldr	r3, [r2, #28]
	sub	r3, r3, #1
	cmp	r3, #7
	moveq	r3, #17
	mov	r1, #1648
	str	r3, [r2, #28]
	ldr	r0, .L261+20
	ldr	r2, .L261+24
	mov	r3, #0
	ldr	r6, .L261+28
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4]
.L210:
	tst	r2, #32
	bne	.L258
.L215:
	tst	r2, #2
	beq	.L226
	ldr	r3, .L261+8
	ldrh	r3, [r3]
	ands	r3, r3, #2
	beq	.L259
.L226:
	tst	r2, #1
	beq	.L203
	ldr	r3, .L261+8
	ldrh	r3, [r3]
	ands	r3, r3, #1
	beq	.L260
.L203:
	pop	{r4, r5, r6, lr}
	bx	lr
.L204:
	cmp	r3, #0
	beq	.L216
	ldr	r3, .L261+8
	ldrh	r3, [r3]
	ands	r0, r3, #64
	bne	.L216
	ldr	r3, .L261+12
	ldr	r3, [r3]
	sub	r3, r3, #1
	lsl	ip, r3, #3
	add	r2, ip, r3
	ldr	r1, .L261+32
	add	r2, r3, r2, lsl #1
	add	r2, r1, r2, lsl #2
	ldr	lr, [r2, #16]
	add	ip, ip, r3
	cmp	lr, #8
	add	r3, r3, ip, lsl #1
	add	r3, r1, r3, lsl #2
	addle	lr, lr, #1
	strgt	r0, [r2, #16]
	strle	lr, [r2, #16]
	ldr	r2, [r3, #28]
	add	r2, r2, #1
	cmp	r2, #18
	moveq	r2, #8
	mov	r1, #1648
	str	r2, [r3, #28]
	ldr	r0, .L261+20
	ldr	r2, .L261+24
	mov	r3, #0
	ldr	r6, .L261+28
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4]
.L216:
	tst	r2, #128
	beq	.L221
	ldr	r3, .L261+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L221
	ldr	r3, .L261+12
	ldr	r2, [r3]
	sub	r2, r2, #1
	lsl	r0, r2, #3
	add	r3, r0, r2
	ldr	r1, .L261+32
	add	r3, r2, r3, lsl #1
	add	r3, r1, r3, lsl #2
	ldr	ip, [r3, #16]
	cmp	ip, #0
	movle	ip, #9
	add	r0, r0, r2
	add	r2, r2, r0, lsl #1
	add	r2, r1, r2, lsl #2
	subgt	ip, ip, #1
	str	ip, [r3, #16]
	ldr	r3, [r2, #28]
	sub	r3, r3, #1
	cmp	r3, #7
	moveq	r3, #17
	mov	r1, #1648
	str	r3, [r2, #28]
	ldr	r0, .L261+20
	ldr	r2, .L261+24
	mov	r3, #0
	ldr	r6, .L261+28
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4]
.L221:
	tst	r2, #16
	beq	.L215
	ldr	r3, .L261+8
	ldrh	r3, [r3]
	ands	r3, r3, #16
	bne	.L215
	mov	ip, #1
.L257:
	ldr	r2, .L261+24
	str	ip, [r5]
	mov	r1, #1648
	ldr	r0, .L261+20
	ldr	r5, .L261+28
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4]
	b	.L215
.L258:
	ldr	r3, .L261+8
	ldrh	r3, [r3]
	ands	ip, r3, #32
	moveq	r3, ip
	bne	.L215
	b	.L257
.L260:
	mov	ip, #1
	ldr	r2, .L261+12
	ldr	r2, [r2]
	sub	r2, r2, #1
	add	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl ip
	ldr	r1, .L261+36
	ldr	lr, .L261+16
	ldr	r0, .L261+32
	ldr	r1, [r1]
	lsl	r2, r2, #2
	add	r0, r0, r2
	add	r2, lr, r2
	ldr	lr, [r2, #16]
	ldr	r0, [r0, #16]
	add	r2, r1, r1, lsl #3
	add	r1, r1, r2, lsl ip
	ldr	r2, .L261+40
	add	r0, r0, r0, lsl #2
	add	r0, lr, r0, lsl ip
	add	r1, r2, r1, lsl #2
	ldr	lr, .L261+44
	str	r0, [r1, #20]
	ldr	r4, .L261+28
	ldr	r2, .L261+24
	mov	r1, #1648
	ldr	r0, .L261+20
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L259:
	mov	ip, #1
	ldr	r2, .L261+12
	ldr	r2, [r2]
	ldr	lr, .L261+48
	sub	r2, r2, #1
	add	r5, r2, r2, lsl #3
	ldr	lr, [lr]
	add	r2, r2, r5, lsl ip
	ldr	r5, .L261+16
	lsl	r2, r2, #2
	ldr	r0, .L261+52
	add	r5, r5, r2
	add	r6, lr, #8
	ldr	r1, .L261+36
	ldr	r0, [r0]
	str	r6, [r5, #28]
	ldr	r5, .L261+32
	ldr	r1, [r1]
	add	r2, r5, r2
	add	r5, r0, #8
	add	r0, r0, r0, lsl #2
	add	r0, lr, r0, lsl ip
	add	lr, r1, r1, lsl #3
	add	r1, r1, lr, lsl ip
	ldr	lr, .L261+40
	add	r1, lr, r1, lsl #2
	ldr	lr, .L261+44
	str	r5, [r2, #28]
	str	r0, [r1, #20]
	ldr	r2, .L261+24
	ldr	r1, .L261+56
	ldr	r0, .L261+60
	ldr	r5, .L261+28
	str	ip, [lr]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4]
	b	.L226
.L262:
	.align	2
.L261:
	.word	pricePointer
	.word	oldButtons
	.word	buttons
	.word	currentPair
	.word	unitsCounter
	.word	priceSFX
	.word	11025
	.word	playSoundB
	.word	tensCounter
	.word	currentItem
	.word	items
	.word	priced
	.word	unitsInitial
	.word	tensInitial
	.word	1701
	.word	menuSFX
	.size	changePrice, .-changePrice
	.align	2
	.global	drawChangePrice
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChangePrice, %function
drawChangePrice:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L265
	ldr	r3, [r3]
	sub	r3, r3, #1
	add	r2, r3, r3, lsl #3
	push	{r4, r5, r6, r7, r8, lr}
	add	r2, r3, r2, lsl #1
	ldr	r5, .L265+4
	lsl	r2, r2, #2
	ldr	r4, .L265+8
	add	ip, r5, r2
	lsl	r3, r3, #1
	ldr	r7, [r5, r2]
	ldr	r6, [ip, #24]
	ldr	r5, [r4, r2]
	ldr	r0, .L265+12
	add	lr, r4, r2
	add	r1, r3, #29
	ldr	r4, [ip, #4]
	ldr	ip, [ip, #28]
	lsl	r1, r1, #3
	strh	r7, [r0, r1]	@ movhi
	add	r2, r0, r1
	add	r3, r3, #30
	add	r1, ip, r6, lsl #5
	ldr	r6, [lr, #24]
	ldr	ip, [lr, #28]
	strh	r4, [r2, #2]	@ movhi
	lsl	r3, r3, #3
	ldr	r4, [lr, #4]
	add	ip, ip, r6, lsl #5
	add	lr, r0, r3
	strh	r1, [r2, #4]	@ movhi
	strh	r5, [r0, r3]	@ movhi
	mov	r1, r0
	strh	r4, [lr, #2]	@ movhi
	strh	ip, [lr, #4]	@ movhi
	ldr	r4, .L265+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L266:
	.align	2
.L265:
	.word	currentPair
	.word	tensCounter
	.word	unitsCounter
	.word	shadowOAM
	.word	DMANow
	.size	drawChangePrice, .-drawChangePrice
	.align	2
	.global	initSelecting
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSelecting, %function
initSelecting:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L275
	mov	r4, #0
	mov	r1, #80
	mov	r2, r3
	mov	lr, #5
	mov	ip, #1
	ldr	r0, .L275+4
	str	r4, [r0]
.L269:
	ldr	r0, [r2, #36]
	cmp	r0, #0
	streq	r1, [r2, #4]
	add	r1, r1, #16
	streq	lr, [r2]
	streq	ip, [r2, #32]
	cmp	r1, #144
	add	r2, r2, #76
	bne	.L269
	mov	r2, #80
	mov	ip, #25
	mov	r0, #1
.L271:
	ldr	r1, [r3, #340]
	cmp	r1, #0
	streq	r2, [r3, #308]
	add	r2, r2, #16
	streq	ip, [r3, #304]
	streq	r0, [r3, #336]
	cmp	r2, #144
	add	r3, r3, #76
	bne	.L271
	mov	r4, #5
	mov	lr, #80
	mov	ip, #12
	mov	r0, #16
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L275+8
	stm	r3, {r4, lr}
	str	ip, [r3, #28]
	ldr	lr, .L275+12
	ldr	ip, .L275+16
	str	r1, [lr]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #24]
	str	r2, [r3, #32]
	str	r2, [ip]
	pop	{r4, lr}
	bx	lr
.L276:
	.align	2
.L275:
	.word	items
	.word	placementCounter
	.word	arrow
	.word	selected
	.word	selectingItem
	.size	initSelecting, .-initSelecting
	.align	2
	.global	initItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	initItems, %function
initItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #10
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r10, .L279
	mov	fp, #4
	str	r0, [r10, #16]
	mov	ip, #1280
	mov	r0, #5
	ldr	r6, .L279+4
	mov	r3, #0
	mov	r2, #16
	mov	r1, #2048
	str	fp, [r10, #28]
	str	r0, [r10, #52]
	str	ip, [r10, #64]
	str	r0, [r6, #28]
	mov	ip, r0
	str	r0, [r6, #52]
	mov	fp, #1920
	mov	r0, #20
	ldr	r5, .L279+8
	ldr	lr, .L279+12
	ldr	r4, .L279+16
	ldr	r7, .L279+20
	str	r3, [r10]
	str	r3, [r10, #4]
	str	r3, [r10, #24]
	str	r3, [r10, #32]
	str	r3, [r10, #36]
	str	r3, [r10, #44]
	str	r3, [r10, #56]
	str	r5, [r10, #60]
	str	lr, [r10, #68]
	str	r3, [r6]
	str	r3, [r6, #4]
	str	r3, [r6, #24]
	str	r3, [r6, #32]
	str	r3, [r6, #36]
	str	r3, [r6, #44]
	str	r3, [r6, #56]
	str	r4, [r6, #60]
	str	r7, [r6, #68]
	str	r0, [r6, #16]
	str	r2, [r10, #8]
	str	r2, [r10, #12]
	str	r1, [r10, #72]
	str	r2, [r6, #8]
	str	r2, [r6, #12]
	str	r1, [r6, #72]
	str	fp, [r6, #64]
	mov	fp, #6
	ldr	r4, .L279+24
	ldr	r7, .L279+28
	str	ip, [r4, #16]
	str	fp, [r4, #28]
	str	ip, [r4, #52]
	mov	fp, ip
	str	r7, [r4, #60]
	mov	ip, #1152
	ldr	r7, .L279+32
	str	r0, [r7, #16]
	mov	r0, #7
	ldr	r6, .L279+36
	ldr	r10, .L279+40
	str	r3, [r4]
	str	r3, [r4, #4]
	str	r3, [r4, #24]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r3, [r4, #56]
	str	ip, [r4, #64]
	str	r6, [r4, #68]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r1, [r4, #72]
	ldr	r6, .L279+44
	ldr	r4, .L279+48
	str	r3, [r10]
	str	r3, [r7]
	str	r3, [r7, #4]
	str	r3, [r7, #24]
	str	r3, [r7, #32]
	str	r3, [r7, #36]
	str	r3, [r7, #44]
	str	fp, [r7, #52]
	str	r3, [r7, #56]
	str	ip, [r7, #64]
	str	r4, [r7, #60]
	str	r6, [r7, #68]
	str	r2, [r7, #8]
	str	r2, [r7, #12]
	str	r1, [r7, #72]
	str	r0, [r7, #28]
	mov	r0, #10
	mov	ip, #8
	str	r0, [r10, #16]
	mov	r0, #1536
	str	fp, [r10, #52]
	str	r0, [r10, #64]
	mov	fp, r0
	str	ip, [r10, #28]
	mov	r0, #10
	mov	ip, #5
	ldr	r7, .L279+52
	str	r0, [r7, #16]
	str	ip, [r7, #52]
	mov	r0, #2
	mov	ip, #9
	ldr	r4, .L279+56
	ldr	r6, .L279+60
	ldr	lr, .L279+64
	str	r4, [r10, #60]
	str	r6, [r10, #68]
	ldr	r4, .L279+68
	ldr	r6, .L279+72
	str	r3, [r10, #4]
	str	r3, [r10, #24]
	str	r3, [r10, #32]
	str	r3, [r10, #36]
	str	r3, [r10, #44]
	str	r3, [r10, #56]
	str	r3, [lr]
	str	r3, [lr, #4]
	str	r3, [r7]
	str	r3, [r7, #4]
	str	r3, [r7, #24]
	str	r3, [r7, #32]
	str	r3, [r7, #36]
	str	r3, [r7, #44]
	str	r3, [r7, #56]
	str	fp, [r7, #64]
	str	r4, [r7, #60]
	str	r6, [r7, #68]
	str	r2, [r10, #8]
	str	r2, [r10, #12]
	str	r1, [r10, #72]
	str	r2, [r7, #8]
	str	r2, [r7, #12]
	str	r1, [r7, #72]
	str	ip, [r7, #28]
	str	r0, [lr, #24]
	mov	r0, #10
	str	r0, [lr, #52]
	mov	r0, #3
	mov	fp, #4
	str	r0, [lr, #56]
	mov	r0, #1792
	str	fp, [lr, #28]
	str	r0, [lr, #64]
	mov	fp, r0
	mov	ip, #25
	mov	r0, #2
	ldr	r6, .L279+76
	str	ip, [lr, #16]
	str	r0, [r6, #24]
	mov	ip, #60
	mov	r0, #15
	str	ip, [r6, #16]
	str	r0, [r6, #52]
	mov	ip, #5
	mov	r0, #3
	str	ip, [r6, #28]
	str	r0, [r6, #56]
	mov	ip, r0
	str	fp, [r6, #64]
	mov	r0, #10
	mov	fp, #4
	ldr	r10, .L279+80
	ldr	r5, .L279+84
	str	r10, [lr, #60]
	ldr	r4, .L279+88
	ldr	r7, .L279+92
	ldr	r10, .L279+96
	str	r3, [lr, #32]
	str	r3, [lr, #36]
	str	r3, [lr, #44]
	str	r3, [r5]
	str	r3, [r5, #4]
	str	r4, [lr, #68]
	str	r3, [r6]
	str	r3, [r6, #4]
	str	r3, [r6, #32]
	str	r3, [r6, #36]
	str	r3, [r6, #44]
	str	r7, [r6, #60]
	str	r2, [lr, #8]
	str	r2, [lr, #12]
	str	r1, [lr, #72]
	str	r2, [r5, #8]
	str	r2, [r6, #8]
	str	r2, [r6, #12]
	str	r1, [r6, #72]
	str	r10, [r6, #68]
	str	fp, [r5, #28]
	str	r0, [r5, #52]
	mov	fp, r0
	mov	r0, #30
	str	r0, [r5, #16]
	mov	r0, #3
	ldr	r7, .L279+100
	str	ip, [r5, #24]
	str	ip, [r5, #56]
	str	r0, [r7, #24]
	mov	ip, #1664
	mov	r0, #3
	str	ip, [r5, #64]
	str	r0, [r7, #56]
	mov	ip, #60
	mov	r0, #1536
	str	ip, [r7, #16]
	str	r0, [r7, #64]
	mov	ip, #5
	mov	r0, #20
	ldr	r9, .L279+104
	ldr	lr, .L279+108
	ldr	r4, .L279+112
	ldr	r6, .L279+116
	ldr	r10, .L279+120
	str	r3, [r5, #32]
	str	r3, [r5, #36]
	str	r3, [r5, #44]
	str	r3, [r9]
	str	r3, [r9, #4]
	str	lr, [r5, #60]
	str	r4, [r5, #68]
	str	r3, [r7]
	str	r3, [r7, #4]
	str	ip, [r7, #28]
	str	r3, [r7, #32]
	str	r3, [r7, #36]
	str	r3, [r7, #44]
	str	fp, [r7, #52]
	str	r6, [r7, #60]
	str	r2, [r5, #12]
	str	r1, [r5, #72]
	str	r2, [r9, #8]
	str	r2, [r9, #12]
	str	r2, [r7, #8]
	str	r2, [r7, #12]
	str	r1, [r7, #72]
	str	r10, [r7, #68]
	str	r0, [r9, #16]
	str	ip, [r9, #52]
	mov	r0, ip
	mov	ip, #3
	mov	fp, #4
	str	ip, [r9, #56]
	mov	ip, #1152
	ldr	r10, .L279+124
	str	r10, [r9, #60]
	ldr	r10, .L279+128
	str	fp, [r9, #24]
	str	fp, [r9, #28]
	str	r3, [r9, #32]
	str	r3, [r9, #36]
	str	r3, [r9, #44]
	str	ip, [r9, #64]
	str	r1, [r9, #72]
	str	r10, [r9, #68]
	ldr	r9, .L279+132
	str	r0, [r9, #28]
	mov	r0, #10
	str	r0, [r9, #52]
	mov	r0, #3
	str	fp, [r9, #24]
	str	r0, [r9, #56]
	mov	fp, r0
	mov	ip, #40
	mov	r0, #1280
	ldr	r8, .L279+136
	str	r0, [r9, #64]
	str	ip, [r8, #16]
	mov	r0, #5
	mov	ip, #25
	ldr	r10, .L279+140
	str	r10, [r9, #60]
	ldr	r10, .L279+144
	str	r3, [r8]
	str	r3, [r8, #4]
	str	r3, [r9]
	str	r3, [r9, #4]
	str	ip, [r9, #16]
	str	r3, [r9, #32]
	str	r3, [r9, #36]
	str	r3, [r9, #44]
	str	r2, [r8, #8]
	str	r2, [r8, #12]
	str	r2, [r9, #8]
	str	r2, [r9, #12]
	str	r1, [r9, #72]
	str	r10, [r9, #68]
	str	r0, [r8, #24]
	mov	r0, #1664
	str	r0, [r8, #64]
	mov	r0, #2
	ldr	r7, .L279+148
	mov	r10, #4
	str	r0, [r7, #24]
	mov	r0, #75
	str	r10, [r8, #28]
	mov	r10, #10
	str	fp, [r8, #56]
	str	r0, [r7, #16]
	mov	fp, r0
	mov	r0, #5
	ldr	r9, .L279+152
	str	r9, [r8, #60]
	ldr	r9, .L279+156
	str	r3, [r8, #32]
	str	r3, [r8, #36]
	str	r3, [r8, #44]
	str	r10, [r8, #52]
	str	r1, [r8, #72]
	str	r9, [r8, #68]
	ldr	r8, .L279+160
	str	r0, [r8, #24]
	str	r0, [r8, #28]
	mov	r0, #15
	str	r0, [r8, #52]
	mov	r0, #3
	str	r0, [r8, #56]
	mov	r0, #1792
	ldr	r9, .L279+164
	str	r9, [r8, #60]
	ldr	r9, .L279+168
	str	r3, [r7]
	str	r3, [r7, #4]
	str	r3, [r8]
	str	r3, [r8, #4]
	str	r3, [r8, #32]
	str	r3, [r8, #36]
	str	r3, [r8, #44]
	str	r0, [r8, #64]
	str	fp, [r8, #16]
	str	r2, [r7, #8]
	str	r2, [r7, #12]
	str	r2, [r8, #8]
	str	r2, [r8, #12]
	str	r1, [r8, #72]
	str	r9, [r8, #68]
	mov	r9, #1920
	str	r9, [r7, #64]
	mov	r9, #4
	mov	r0, #20
	mov	fp, #6
	str	r9, [r7, #56]
	mov	r9, #4
	ldr	r8, .L279+172
	str	r8, [r7, #60]
	ldr	r8, .L279+176
	ldr	r6, .L279+180
	str	fp, [r7, #28]
	str	r3, [r7, #32]
	str	r3, [r7, #36]
	str	r3, [r7, #44]
	str	r0, [r7, #52]
	str	r1, [r7, #72]
	str	r8, [r7, #68]
	ldr	r7, .L279+184
	str	r9, [r6, #24]
	str	fp, [r6, #28]
	str	fp, [r7, #28]
	mov	r9, #50
	mov	fp, #4
	str	ip, [r6, #16]
	str	r9, [r7, #16]
	mov	ip, #3
	mov	r9, #15
	str	fp, [r7, #56]
	mov	fp, #1536
	ldr	r8, .L279+188
	str	r8, [r7, #60]
	ldr	r8, .L279+192
	str	r3, [r6]
	str	r3, [r6, #4]
	str	r3, [r7]
	str	r3, [r7, #4]
	str	ip, [r7, #24]
	str	r3, [r7, #32]
	str	r3, [r7, #36]
	str	r3, [r7, #44]
	str	r9, [r7, #52]
	str	fp, [r7, #64]
	str	r2, [r6, #8]
	str	r2, [r6, #12]
	str	r2, [r7, #8]
	str	r2, [r7, #12]
	str	r1, [r7, #72]
	str	r8, [r7, #68]
	mov	r8, #4
	str	r8, [r6, #56]
	mov	r8, #1856
	str	r8, [r6, #64]
	mov	r8, #30
	ldr	r5, .L279+196
	str	r8, [r5, #16]
	mov	r8, #2
	ldr	r7, .L279+200
	str	r7, [r6, #60]
	ldr	r7, .L279+204
	str	r3, [r6, #32]
	str	r3, [r6, #36]
	str	r3, [r6, #44]
	str	r10, [r6, #52]
	str	r1, [r6, #72]
	str	r7, [r6, #68]
	ldr	r6, .L279+208
	str	ip, [r5, #24]
	str	r8, [r6, #24]
	mov	ip, r8
	mov	r8, #4
	str	r8, [r6, #56]
	mov	r8, #1792
	mov	fp, #7
	str	r8, [r6, #64]
	mov	r8, #45
	ldr	r7, .L279+212
	str	r7, [r6, #60]
	ldr	r7, .L279+216
	str	r3, [r5]
	str	r3, [r5, #4]
	str	fp, [r5, #28]
	str	r3, [r5, #32]
	str	r3, [r6]
	str	r3, [r6, #4]
	str	fp, [r6, #28]
	str	r3, [r6, #32]
	str	r3, [r6, #36]
	str	r3, [r6, #44]
	str	r0, [r6, #52]
	str	r8, [r6, #16]
	str	r2, [r5, #8]
	str	r2, [r5, #12]
	str	r2, [r6, #8]
	str	r2, [r6, #12]
	str	r1, [r6, #72]
	str	r7, [r6, #68]
	mov	r6, #1408
	mov	r7, #4
	str	r6, [r5, #64]
	ldr	r6, .L279+220
	str	r6, [r5, #60]
	ldr	r6, .L279+224
	ldr	r4, .L279+228
	str	r3, [r5, #36]
	str	r3, [r5, #44]
	str	r9, [r5, #52]
	str	r7, [r5, #56]
	str	r1, [r5, #72]
	str	r6, [r5, #68]
	ldr	r5, .L279+232
	str	r8, [r4, #16]
	str	ip, [r4, #24]
	mov	r8, ip
	str	r7, [r5, #24]
	mov	ip, #8
	str	fp, [r5, #28]
	mov	r7, #1792
	mov	fp, #4
	ldr	r6, .L279+236
	str	r6, [r5, #60]
	ldr	r6, .L279+240
	str	r3, [r4]
	str	r3, [r4, #4]
	str	ip, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r5]
	str	r3, [r5, #4]
	str	r9, [r5, #16]
	str	r3, [r5, #32]
	str	r3, [r5, #36]
	str	r3, [r5, #44]
	str	r10, [r5, #52]
	str	fp, [r5, #56]
	str	r7, [r5, #64]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r2, [r5, #8]
	str	r2, [r5, #12]
	str	r1, [r5, #72]
	str	r6, [r5, #68]
	str	r7, [r4, #64]
	mov	r7, #30
	ldr	r5, .L279+244
	str	r5, [r4, #60]
	ldr	r5, .L279+248
	ldr	lr, .L279+252
	str	r3, [r4, #44]
	str	r0, [r4, #52]
	str	fp, [r4, #56]
	str	r1, [r4, #72]
	str	r5, [r4, #68]
	ldr	r4, .L279+256
	str	ip, [lr, #28]
	str	ip, [r4, #28]
	str	r7, [r4, #16]
	mov	ip, #3
	mov	r7, #1408
	ldr	r6, .L279+260
	ldr	r5, .L279+264
	str	r6, [r4, #60]
	ldr	r6, .L279+268
	str	r3, [lr]
	str	r3, [lr, #4]
	str	r9, [lr, #16]
	str	fp, [lr, #24]
	str	r3, [lr, #32]
	str	r3, [lr, #36]
	str	r3, [lr, #44]
	str	r3, [r4]
	str	r3, [r4, #4]
	str	ip, [r4, #24]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r9, [r4, #52]
	str	fp, [r4, #56]
	str	r7, [r4, #64]
	str	r2, [lr, #8]
	str	r2, [lr, #12]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r1, [r4, #72]
	str	r5, [r4, #68]
	ldr	r5, .L279+272
	str	r6, [lr, #68]
	ldr	r6, .L279+276
	str	r6, [r5, #68]
	mov	r6, #70
	str	fp, [lr, #56]
	mov	fp, #1856
	str	r6, [r5, #16]
	mov	r6, #50
	ldr	r7, .L279+280
	str	r10, [lr, #52]
	str	fp, [lr, #64]
	str	r7, [lr, #60]
	str	r1, [lr, #72]
	ldr	lr, .L279+284
	mov	ip, #9
	str	r6, [lr, #16]
	mov	r7, #5
	mov	r6, #3
	ldr	r4, .L279+288
	str	r3, [r5]
	str	r3, [r5, #4]
	str	r8, [r5, #24]
	str	ip, [r5, #28]
	str	r3, [r5, #32]
	str	r3, [r5, #36]
	str	r3, [r5, #44]
	str	r0, [r5, #52]
	str	r7, [r5, #56]
	str	fp, [r5, #64]
	str	r4, [r5, #60]
	str	r3, [lr]
	str	r3, [lr, #4]
	str	r6, [lr, #24]
	str	ip, [lr, #28]
	str	r3, [lr, #32]
	str	r3, [lr, #36]
	str	r3, [lr, #44]
	str	r2, [r5, #8]
	str	r2, [r5, #12]
	str	r1, [r5, #72]
	str	r2, [lr, #8]
	str	r2, [lr, #12]
	str	r9, [lr, #52]
	mov	r9, #60
	ldr	r4, .L279+292
	mov	r6, #5
	str	r9, [r4, #16]
	mov	r9, #30
	ldr	r5, .L279+296
	str	r6, [lr, #56]
	str	r6, [r4, #56]
	mov	r6, #1472
	str	ip, [r5, #28]
	str	r9, [r5, #16]
	str	fp, [r5, #64]
	mov	r9, #4
	mov	ip, #5
	mov	fp, #15
	ldr	r7, .L279+300
	str	r7, [lr, #60]
	ldr	r7, .L279+304
	str	r8, [r4, #24]
	str	r7, [lr, #68]
	str	r6, [lr, #64]
	ldr	r8, .L279+308
	ldr	r6, .L279+312
	ldr	r7, .L279+316
	str	r3, [r4]
	str	r3, [r4, #4]
	str	r10, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r0, [r4, #52]
	str	r3, [r5]
	str	r3, [r5, #4]
	str	r9, [r5, #24]
	str	r3, [r5, #32]
	str	r3, [r5, #36]
	str	r3, [r5, #44]
	str	r10, [r5, #52]
	str	ip, [r5, #56]
	str	r8, [r5, #60]
	str	r1, [lr, #72]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r2, [r5, #8]
	str	r2, [r5, #12]
	str	r1, [r5, #72]
	str	r7, [r5, #68]
	str	fp, [r6, #52]
	mov	fp, #3
	str	fp, [r6, #24]
	mov	fp, #5
	ldr	r9, .L279+320
	ldr	lr, .L279+324
	str	fp, [r6, #56]
	str	lr, [r4, #60]
	mov	fp, r0
	mov	lr, #1664
	str	r0, [r9, #16]
	mov	r0, #10
	ldr	r7, .L279+328
	mov	ip, lr
	str	lr, [r4, #64]
	str	r7, [r6, #68]
	str	r0, [r9, #28]
	str	r0, [r9, #52]
	mov	lr, #40
	mov	r7, #1216
	mov	r0, #5
	ldr	r5, .L279+332
	str	lr, [r6, #16]
	str	r10, [r6, #28]
	str	r3, [r6]
	str	r3, [r6, #4]
	str	r3, [r6, #32]
	str	r3, [r6, #36]
	str	r3, [r6, #44]
	str	r5, [r6, #60]
	str	r7, [r6, #64]
	str	r0, [r9, #56]
	str	r1, [r6, #72]
	str	r2, [r6, #8]
	str	r2, [r6, #12]
	mov	r0, #1856
	mov	r6, #4
	ldr	r8, .L279+336
	str	r1, [r4, #72]
	str	r8, [r4, #68]
	ldr	lr, .L279+340
	ldr	r4, .L279+344
	str	r3, [r9]
	str	r3, [r9, #4]
	str	r6, [r9, #24]
	str	r3, [r9, #32]
	str	r3, [r9, #36]
	str	r3, [r9, #44]
	str	r2, [r9, #8]
	str	r2, [r9, #12]
	str	lr, [r9, #60]
	str	r0, [r4, #64]
	mov	r0, #2
	str	r0, [r4, #24]
	mov	r0, #5
	ldr	r8, .L279+348
	str	fp, [r4, #52]
	str	r0, [r4, #56]
	str	r8, [r4, #68]
	mov	r6, #70
	mov	r8, #11
	mov	r0, #1472
	mov	fp, #15
	ldr	r7, .L279+352
	ldr	r5, .L279+356
	str	ip, [r9, #64]
	str	r6, [r4, #16]
	mov	ip, r8
	str	r3, [r4]
	str	r3, [r4, #4]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r5, [r4, #60]
	str	r8, [r4, #28]
	str	r0, [r7, #64]
	str	fp, [r7, #52]
	str	r1, [r4, #72]
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	mov	fp, #3
	mov	r4, #50
	mov	r0, #5
	ldr	r6, .L279+360
	ldr	r10, .L279+364
	ldr	lr, .L279+368
	str	r10, [r9, #68]
	str	r4, [r7, #16]
	str	ip, [r7, #28]
	str	fp, [r7, #24]
	str	r0, [r7, #56]
	str	r3, [r7]
	str	r3, [r7, #4]
	str	r3, [r7, #32]
	str	r3, [r7, #36]
	str	r3, [r7, #44]
	str	r1, [r9, #72]
	str	r2, [r7, #8]
	str	r2, [r7, #12]
	mov	r0, #1856
	str	lr, [r7, #60]
	str	ip, [r6, #28]
	mov	ip, #4
	ldr	fp, .L279+372
	str	r0, [r6, #64]
	str	fp, [r7, #68]
	str	ip, [r6, #24]
	str	r1, [r7, #72]
	mov	ip, #10
	mov	r7, #30
	mov	r0, #5
	ldr	r10, .L279+376
	ldr	r9, .L279+380
	str	r7, [r6, #16]
	str	r0, [r6, #56]
	str	ip, [r6, #52]
	str	r3, [r6]
	str	r3, [r6, #4]
	str	r3, [r6, #32]
	str	r3, [r6, #36]
	str	r3, [r6, #44]
	str	r10, [r6, #60]
	str	r9, [r6, #68]
	str	r1, [r6, #72]
	str	r2, [r6, #8]
	str	r2, [r6, #12]
	mov	r6, #3
	ldr	r5, .L279+384
	ldr	r8, .L279+388
	mov	r10, #1408
	mov	r9, #6
	str	r6, [r5, #16]
	str	r6, [r5, #52]
	str	r8, [r5, #68]
	mov	r6, #2
	mov	r8, #12
	str	r10, [r5, #64]
	ldr	r10, .L279+392
	str	r6, [r5, #24]
	str	r9, [r5, #56]
	str	r3, [r5]
	str	r3, [r5, #4]
	str	r3, [r5, #32]
	str	r3, [r5, #36]
	str	r3, [r5, #44]
	str	r10, [r5, #60]
	str	r2, [r5, #8]
	str	r2, [r5, #12]
	str	r8, [r5, #28]
	mov	r8, #25
	ldr	r4, .L279+396
	str	r8, [r4, #16]
	str	r9, [r4, #56]
	mov	r8, r9
	mov	r9, #14
	mov	fp, ip
	mov	r10, #1216
	str	r1, [r5, #72]
	mov	r5, #1152
	ldr	lr, .L279+400
	str	r6, [r4, #24]
	str	r9, [r4, #28]
	str	r6, [lr, #24]
	ldr	r9, .L279+404
	ldr	r6, .L279+408
	str	r9, [r4, #60]
	str	r6, [lr, #60]
	ldr	r9, .L279+412
	ldr	r6, .L279+416
	str	r10, [r4, #64]
	str	fp, [r4, #52]
	str	r3, [r4]
	str	r3, [r4, #4]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #44]
	str	r9, [r4, #68]
	mov	fp, #7
	str	r6, [lr, #68]
	str	r1, [r4, #72]
	mov	r6, #13
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	mov	r4, #20
	str	r5, [lr, #64]
	mov	r5, #12
	str	r3, [lr]
	str	r3, [lr, #4]
	str	r4, [lr, #16]
	str	r3, [lr, #32]
	str	r3, [lr, #36]
	str	r3, [lr, #44]
	str	fp, [lr, #52]
	str	r8, [lr, #56]
	str	r2, [lr, #8]
	str	r2, [lr, #12]
	str	r1, [lr, #72]
	str	r6, [lr, #28]
	mov	lr, #1280
	ldr	r7, .L279+420
	ldr	r0, .L279+424
	str	r5, [r7, #28]
	str	fp, [r0, #52]
	mov	r5, #3
	mov	fp, #1536
	str	lr, [r7, #64]
	ldr	lr, .L279+428
	str	r3, [r7]
	str	r3, [r7, #4]
	str	r3, [r7, #32]
	str	r3, [r7, #36]
	str	r3, [r7, #44]
	str	lr, [r7, #60]
	str	r3, [r0]
	ldr	lr, .L279+432
	str	r3, [r0, #4]
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	str	r3, [r0, #44]
	ldr	ip, .L279+436
	ldr	r3, .L279+440
	str	r5, [r7, #16]
	str	r5, [r7, #24]
	str	r5, [r7, #52]
	str	r8, [r7, #56]
	str	r1, [r7, #72]
	str	r2, [r7, #8]
	str	r2, [r7, #12]
	str	lr, [r7, #68]
	str	r6, [r0, #28]
	str	fp, [r0, #64]
	str	r5, [r0, #24]
	str	r8, [r0, #56]
	str	r4, [r0, #16]
	str	r1, [r0, #72]
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	str	r3, [r0, #60]
	str	ip, [r0, #68]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L280:
	.align	2
.L279:
	.word	cheese
	.word	boneMeat
	.word	textBoxCheeseTiles
	.word	textBoxCheeseMap
	.word	textBoxBoneMeatTiles
	.word	textBoxBoneMeatMap
	.word	egg
	.word	textBoxEggTiles
	.word	fishDead
	.word	textBoxEggMap
	.word	drumstick
	.word	textBoxFishDeadMap
	.word	textBoxFishDeadTiles
	.word	sandwich
	.word	textBoxDrumstickTiles
	.word	textBoxDrumstickMap
	.word	sword1
	.word	textBoxSandwichTiles
	.word	textBoxSandwichMap
	.word	sword2
	.word	textBoxSword1Tiles
	.word	ironShield
	.word	textBoxSword1Map
	.word	textBoxSword2Tiles
	.word	textBoxSword2Map
	.word	goldShield
	.word	ring
	.word	textBoxIronShieldTiles
	.word	textBoxIronShieldMap
	.word	textBoxGoldShieldTiles
	.word	textBoxGoldShieldMap
	.word	textBoxRingTiles
	.word	textBoxRingMap
	.word	helm
	.word	ironArmor
	.word	textBoxHelmTiles
	.word	textBoxHelmMap
	.word	diamondLarge
	.word	textBoxIronArmorTiles
	.word	textBoxIronArmorMap
	.word	goldArmor
	.word	textBoxGoldArmorTiles
	.word	textBoxGoldArmorMap
	.word	textBoxDiamondLargeTiles
	.word	textBoxDiamondLargeMap
	.word	diamondSmall
	.word	diamondMed
	.word	textBoxDiamondMedTiles
	.word	textBoxDiamondMedMap
	.word	sapphireMed
	.word	textBoxDiamondSmallTiles
	.word	textBoxDiamondSmallMap
	.word	sapphireLarge
	.word	textBoxSapphireLargeTiles
	.word	textBoxSapphireLargeMap
	.word	textBoxSapphireMedTiles
	.word	textBoxSapphireMedMap
	.word	emeraldLarge
	.word	sapphireSmall
	.word	textBoxSapphireSmallTiles
	.word	textBoxSapphireSmallMap
	.word	textBoxEmeraldLargeTiles
	.word	textBoxEmeraldLargeMap
	.word	emeraldSmall
	.word	emeraldMed
	.word	textBoxEmeraldMedTiles
	.word	textBoxEmeraldMedMap
	.word	textBoxEmeraldSmallMap
	.word	platinumLarge
	.word	textBoxPlatinumLargeMap
	.word	textBoxEmeraldSmallTiles
	.word	platinumMed
	.word	textBoxPlatinumLargeTiles
	.word	rubyLarge
	.word	platinumSmall
	.word	textBoxPlatinumMedTiles
	.word	textBoxPlatinumMedMap
	.word	textBoxPlatinumSmallTiles
	.word	rubyMed
	.word	textBoxPlatinumSmallMap
	.word	rubySmall
	.word	textBoxRubyLargeTiles
	.word	textBoxRubyMedMap
	.word	textBoxRubyMedTiles
	.word	textBoxRubyLargeMap
	.word	textBoxRubySmallTiles
	.word	obsidianLarge
	.word	textBoxObsidianLargeMap
	.word	obsidianMed
	.word	textBoxObsidianLargeTiles
	.word	obsidianSmall
	.word	textBoxRubySmallMap
	.word	textBoxObsidianMedTiles
	.word	textBoxObsidianMedMap
	.word	textBoxObsidianSmallTiles
	.word	textBoxObsidianSmallMap
	.word	cookie
	.word	textBoxCookieMap
	.word	textBoxCookieTiles
	.word	wine
	.word	steak
	.word	textBoxWineTiles
	.word	textBoxSteakTiles
	.word	textBoxWineMap
	.word	textBoxSteakMap
	.word	apple
	.word	fish
	.word	textBoxAppleTiles
	.word	textBoxAppleMap
	.word	textBoxFishMap
	.word	textBoxFishTiles
	.size	initItems, .-initItems
	.align	2
	.global	day1
	.syntax unified
	.arm
	.fpu softvfp
	.type	day1, %function
day1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L297
	mov	lr, pc
	bx	r5
	ldr	r3, .L297+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #10
	ldrgt	r1, .L297+8
	ldrle	r1, .L297+12
	ldr	r4, .L297+16
	mov	r2, #76
	ldr	r0, .L297+20
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L297+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #20
	ldrgt	r1, .L297+24
	ldrle	r1, .L297+28
	mov	r2, #76
	ldr	r0, .L297+32
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L297+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #30
	ldrgt	r1, .L297+36
	ldrle	r1, .L297+40
	mov	r2, #76
	ldr	r0, .L297+44
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L297+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #40
	ldrgt	r1, .L297+48
	ldrle	r1, .L297+52
	mov	r2, #76
	ldr	r0, .L297+56
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L297+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #50
	ldrgt	r1, .L297+60
	ldrle	r1, .L297+64
	mov	r2, #76
	ldr	r0, .L297+68
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L297+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #60
	ldrgt	r1, .L297+72
	ldrle	r1, .L297+76
	mov	r2, #76
	ldr	r0, .L297+80
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r1, .L297+84
	mov	r2, #76
	ldr	r0, .L297+88
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L297+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #80
	mov	r2, #76
	ldrgt	r1, .L297+92
	ldrle	r1, .L297+96
	ldr	r0, .L297+100
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L298:
	.align	2
.L297:
	.word	rand
	.word	1374389535
	.word	cheese
	.word	egg
	.word	memcpy
	.word	items
	.word	fish
	.word	fishDead
	.word	items+76
	.word	diamondSmall
	.word	emeraldSmall
	.word	items+152
	.word	obsidianSmall
	.word	platinumSmall
	.word	items+228
	.word	helm
	.word	sword1
	.word	items+304
	.word	steak
	.word	wine
	.word	items+380
	.word	apple
	.word	items+456
	.word	rubySmall
	.word	sapphireSmall
	.word	items+532
	.size	day1, .-day1
	.align	2
	.global	day2
	.syntax unified
	.arm
	.fpu softvfp
	.type	day2, %function
day2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L317
	mov	lr, pc
	bx	r5
	ldr	r3, .L317+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #10
	ldrgt	r1, .L317+8
	ldrle	r1, .L317+12
	ldr	r4, .L317+16
	mov	r2, #76
	ldr	r0, .L317+20
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L317+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #20
	ldrgt	r1, .L317+24
	ldrle	r1, .L317+28
	mov	r2, #76
	ldr	r0, .L317+32
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L317+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #30
	ldrgt	r1, .L317+36
	ldrle	r1, .L317+40
	mov	r2, #76
	ldr	r0, .L317+44
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L317+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #40
	ldrgt	r1, .L317+48
	ldrle	r1, .L317+52
	mov	r2, #76
	ldr	r0, .L317+56
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L317+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #50
	ldrgt	r1, .L317+60
	ldrle	r1, .L317+64
	mov	r2, #76
	ldr	r0, .L317+68
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L317+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #60
	ldrgt	r1, .L317+72
	ldrle	r1, .L317+76
	mov	r2, #76
	ldr	r0, .L317+80
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L317+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #70
	ldrgt	r1, .L317+84
	ldrle	r1, .L317+88
	mov	r2, #76
	ldr	r0, .L317+92
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L317+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #80
	mov	r2, #76
	ldrgt	r1, .L317+96
	ldrle	r1, .L317+100
	ldr	r0, .L317+104
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L318:
	.align	2
.L317:
	.word	rand
	.word	1374389535
	.word	ironShield
	.word	goldShield
	.word	memcpy
	.word	items
	.word	ironArmor
	.word	goldArmor
	.word	items+76
	.word	obsidianMed
	.word	obsidianLarge
	.word	items+152
	.word	sword2
	.word	sword1
	.word	items+228
	.word	rubyMed
	.word	platinumMed
	.word	items+304
	.word	boneMeat
	.word	diamondSmall
	.word	items+380
	.word	diamondMed
	.word	sapphireMed
	.word	items+456
	.word	diamondLarge
	.word	cookie
	.word	items+532
	.size	day2, .-day2
	.align	2
	.global	day3
	.syntax unified
	.arm
	.fpu softvfp
	.type	day3, %function
day3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L335
	mov	lr, pc
	bx	r5
	ldr	r3, .L335+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #10
	ldrgt	r1, .L335+8
	ldrle	r1, .L335+12
	ldr	r4, .L335+16
	mov	r2, #76
	ldr	r0, .L335+20
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L335+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #20
	ldrgt	r1, .L335+24
	ldrle	r1, .L335+28
	mov	r2, #76
	ldr	r0, .L335+32
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L335+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #30
	ldrgt	r1, .L335+36
	ldrle	r1, .L335+40
	mov	r2, #76
	ldr	r0, .L335+44
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L335+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #40
	ldrgt	r1, .L335+48
	ldrle	r1, .L335+52
	mov	r2, #76
	ldr	r0, .L335+56
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L335+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #50
	ldrgt	r1, .L335+60
	ldrle	r1, .L335+64
	mov	r2, #76
	ldr	r0, .L335+68
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L335+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #60
	ldrgt	r1, .L335+72
	ldrle	r1, .L335+76
	mov	r2, #76
	ldr	r0, .L335+80
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r1, .L335+84
	mov	r2, #76
	ldr	r0, .L335+88
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L335+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #80
	mov	r2, #76
	ldrgt	r1, .L335+28
	ldrle	r1, .L335+92
	ldr	r0, .L335+96
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L336:
	.align	2
.L335:
	.word	rand
	.word	1374389535
	.word	sword2
	.word	goldShield
	.word	memcpy
	.word	items
	.word	diamondLarge
	.word	diamondMed
	.word	items+76
	.word	obsidianLarge
	.word	obsidianMed
	.word	items+152
	.word	steak
	.word	fish
	.word	items+228
	.word	ring
	.word	helm
	.word	items+304
	.word	emeraldLarge
	.word	emeraldMed
	.word	items+380
	.word	wine
	.word	items+456
	.word	cookie
	.word	items+532
	.size	day3, .-day3
	.align	2
	.global	updateSelecting
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSelecting, %function
updateSelecting:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L394
	ldrh	r2, [r5]
	tst	r2, #16
	bne	.L381
	ldr	r6, .L394+4
.L338:
	tst	r2, #32
	beq	.L339
	ldr	r3, .L394+8
	ldrh	r3, [r3]
	ands	r3, r3, #32
	beq	.L387
.L339:
	tst	r2, #128
	beq	.L340
	ldr	r3, .L394+8
	ldrh	r3, [r3]
	ands	r3, r3, #128
	beq	.L388
.L340:
	tst	r2, #64
	beq	.L341
	ldr	r3, .L394+8
	ldrh	r3, [r3]
	ands	r3, r3, #64
	beq	.L389
.L341:
	tst	r2, #2
	bne	.L383
	ldr	r4, .L394+12
.L342:
	ldr	r2, [r6]
	lsl	r1, r2, #3
	add	r3, r1, r2
	add	r3, r2, r3, lsl #1
	add	r3, r4, r3, lsl #2
	ldr	r0, [r3, #36]
	cmp	r0, #0
	bne	.L337
	ldr	r3, [r3, #44]
	cmp	r3, #0
	bne	.L337
	ldrh	r0, [r5]
	tst	r0, #1
	beq	.L337
	ldr	r0, .L394+8
	ldrh	r0, [r0]
	tst	r0, #1
	bne	.L337
	ldr	r0, .L394+16
	ldr	lr, [r0]
	cmp	lr, #1
	beq	.L390
	cmp	lr, #2
	beq	.L391
	cmp	lr, #3
	beq	.L392
	cmp	lr, #4
	beq	.L393
.L349:
	mov	r0, #1
	mov	r3, #0
	add	r1, r1, r2
	add	r2, r2, r1, lsl r0
	ldr	r5, .L394+20
	ldr	ip, .L394+24
	ldr	r1, .L394+28
	add	r2, r4, r2, lsl #2
	str	lr, [r2, #40]
	str	r0, [r2, #36]
	str	r0, [r5]
	str	r3, [ip, #32]
	str	r3, [r1]
.L337:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L383:
	ldr	r3, .L394+8
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r4, .L394+12
	bne	.L342
	mov	r3, r4
	add	r1, r4, #608
.L344:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	streq	r2, [r3, #32]
	add	r3, r3, #76
	cmp	r3, r1
	bne	.L344
	mov	r1, #0
	mov	lr, #1
	ldr	r2, .L394+28
	ldr	r0, .L394+24
	ldr	ip, .L394+32
	mov	r3, r1
	str	r1, [r2]
	str	r1, [r0, #32]
	ldr	r2, .L394+36
	ldr	r1, .L394+40
	ldr	r0, .L394+44
	ldr	r7, .L394+48
	str	lr, [ip]
	mov	lr, pc
	bx	r7
	b	.L342
.L381:
	ldr	r3, .L394+8
	ldrh	r3, [r3]
	ands	r3, r3, #16
	ldr	r6, .L394+4
	bne	.L338
	ldr	r1, [r6]
	bic	r0, r1, #4
	cmp	r0, #2
	bhi	.L338
	ldr	lr, .L394+24
	ldr	ip, [lr, #4]
	add	r0, r1, #1
	add	ip, ip, #16
	ldr	r2, .L394+36
	str	r0, [r6]
	ldr	r1, .L394+40
	ldr	r0, .L394+44
	ldr	r4, .L394+48
	str	ip, [lr, #4]
	mov	lr, pc
	bx	r4
	ldrh	r2, [r5]
	b	.L338
.L389:
	ldr	r1, [r6]
	cmp	r1, #3
	ble	.L341
	ldr	lr, .L394+24
	ldr	ip, [lr]
	sub	r0, r1, #4
	sub	ip, ip, #20
	ldr	r2, .L394+36
	str	r0, [r6]
	ldr	r1, .L394+40
	ldr	r0, .L394+44
	ldr	r4, .L394+48
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	ldrh	r2, [r5]
	b	.L341
.L388:
	ldr	r1, [r6]
	cmp	r1, #3
	bgt	.L340
	ldr	lr, .L394+24
	ldr	ip, [lr]
	add	r0, r1, #4
	add	ip, ip, #20
	ldr	r2, .L394+36
	str	r0, [r6]
	ldr	r1, .L394+40
	ldr	r0, .L394+44
	ldr	r4, .L394+48
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	ldrh	r2, [r5]
	b	.L340
.L387:
	ldr	r0, [r6]
	bic	r1, r0, #4
	sub	r1, r1, #1
	cmp	r1, #2
	bhi	.L339
	ldr	lr, .L394+24
	ldr	ip, [lr, #4]
	sub	r0, r0, #1
	sub	ip, ip, #16
	ldr	r2, .L394+36
	str	r0, [r6]
	ldr	r1, .L394+40
	ldr	r0, .L394+44
	ldr	r4, .L394+48
	str	ip, [lr, #4]
	mov	lr, pc
	bx	r4
	ldrh	r2, [r5]
	b	.L339
.L391:
	ldr	r0, .L394+12
.L352:
	cmp	r2, r3
	add	r3, r3, #1
	beq	.L351
	ldr	ip, [r0, #36]
	cmp	ip, #0
	streq	ip, [r0, #32]
.L351:
	cmp	r3, #8
	add	r0, r0, #76
	bne	.L352
	mov	ip, #55
	mov	r0, #110
.L386:
	add	r3, r1, r2
	add	r3, r2, r3, lsl #1
	lsl	r3, r3, #2
	str	ip, [r4, r3]
	add	r3, r4, r3
	str	r0, [r3, #4]
	b	.L349
.L390:
	ldr	r0, .L394+12
.L348:
	cmp	r2, r3
	add	r3, r3, #1
	beq	.L347
	ldr	ip, [r0, #36]
	cmp	ip, #0
	streq	ip, [r0, #32]
.L347:
	cmp	r3, #8
	add	r0, r0, #76
	bne	.L348
	mov	ip, #55
	mov	r0, #94
	b	.L386
.L392:
	ldr	r0, .L394+12
.L355:
	cmp	r2, r3
	add	r3, r3, #1
	beq	.L354
	ldr	ip, [r0, #36]
	cmp	ip, #0
	streq	ip, [r0, #32]
.L354:
	cmp	r3, #8
	add	r0, r0, #76
	bne	.L355
	mov	ip, #55
	mov	r0, #126
	b	.L386
.L393:
	ldr	r0, .L394+12
.L357:
	cmp	r2, r3
	add	r3, r3, #1
	beq	.L356
	ldr	ip, [r0, #36]
	cmp	ip, #0
	streq	ip, [r0, #32]
.L356:
	cmp	r3, #8
	add	r0, r0, #76
	bne	.L357
	mov	ip, #55
	mov	r0, #142
	b	.L386
.L395:
	.align	2
.L394:
	.word	oldButtons
	.word	placementCounter
	.word	buttons
	.word	items
	.word	beginSelection
	.word	selected
	.word	arrow
	.word	selectingItem
	.word	cancel
	.word	11025
	.word	1701
	.word	menuSFX
	.word	playSoundB
	.size	updateSelecting, .-updateSelecting
	.align	2
	.global	drawSelecting
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSelecting, %function
drawSelecting:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L412
	ldr	r5, .L412+4
	mov	r3, r4
	mov	r2, r5
	add	r0, r4, #608
	b	.L399
.L410:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	bne	.L397
	add	r6, r3, #24
	ldr	r1, [r3, #56]
	ldm	r6, {r6, lr}
	ldr	ip, [r3, #4]
	add	lr, lr, r6, lsl #5
	lsl	r1, r1, #12
	ldr	r6, [r3]
	add	r3, r3, #76
	orr	r1, r1, lr, lsl #1
	orr	ip, ip, #16384
	cmp	r3, r0
	strh	r1, [r2, #172]	@ movhi
	strh	ip, [r2, #170]	@ movhi
	strh	r6, [r2, #168]	@ movhi
	add	r2, r2, #8
	beq	.L409
.L399:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L410
.L397:
	ldrh	r1, [r2, #168]
	add	r3, r3, #76
	orr	r1, r1, #512
	cmp	r3, r0
	strh	r1, [r2, #168]	@ movhi
	add	r2, r2, #8
	bne	.L399
.L409:
	ldr	r3, .L412+8
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L400
	add	r0, r3, #24
	ldm	r0, {r0, r2}
	add	r2, r2, r0, lsl #5
	ldr	r1, [r3, #4]
	ldr	r0, [r3]
	lsl	r3, r2, #1
	strh	r3, [r5, #164]	@ movhi
	ldr	r3, .L412+12
	ldr	r3, [r3]
	orr	r2, r1, #16384
	cmp	r3, #0
	strh	r2, [r5, #162]	@ movhi
	strh	r0, [r5, #160]	@ movhi
	bne	.L411
.L402:
	ldr	r2, .L412+16
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L403:
	ldr	r4, .L412+20
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L412+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L400:
	ldrh	r3, [r5, #160]
	orr	r3, r3, #512
	strh	r3, [r5, #160]	@ movhi
	ldr	r3, .L412+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L402
.L411:
	mov	ip, #115
	ldr	r3, .L412+24
	ldr	r3, [r3]
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #1
	add	r4, r4, r3, lsl #2
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #28]
	ldr	r3, [r4, #56]
	add	r1, r1, r2, lsl #5
	lsl	r3, r3, #12
	ldr	r2, .L412+16
	ldr	r0, .L412+28
	orr	r3, r3, r1, lsl #1
	strh	r3, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	b	.L403
.L413:
	.align	2
.L412:
	.word	items
	.word	shadowOAM
	.word	arrow
	.word	selectingItem
	.word	shadowOAM+560
	.word	DMANow
	.word	placementCounter
	.word	16519
	.size	drawSelecting, .-drawSelecting
	.align	2
	.global	initPricing
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPricing, %function
initPricing:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L429
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L415
	mov	r0, #94
	mov	r4, #50
	mov	lr, #2
	mov	r1, #8
	mov	ip, #0
	ldr	r2, .L429+4
	ldr	r3, .L429+8
.L416:
	str	r0, [r3, #4]
	add	r5, r0, #9
	add	r0, r0, #16
	cmp	r0, #158
	str	r4, [r2]
	str	lr, [r2, #24]
	str	r1, [r2, #28]
	str	r1, [r2, #12]
	str	r1, [r2, #8]
	str	ip, [r2, #16]
	str	ip, [r2, #32]
	str	r4, [r3]
	str	lr, [r3, #24]
	str	r1, [r3, #28]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	str	ip, [r3, #32]
	str	r5, [r2, #4]
	add	r3, r3, #76
	add	r2, r2, #76
	bne	.L416
	str	ip, [r6]
.L415:
	ldr	r3, .L429+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L426
	cmp	r3, #2
	beq	.L427
	cmp	r3, #3
	beq	.L428
	cmp	r3, #4
	bne	.L418
	mov	r3, #1
	ldr	r1, .L429+4
	ldr	r2, .L429+8
	str	r3, [r1, #260]
	str	r3, [r1, #264]
	str	r3, [r2, #260]
	str	r3, [r2, #264]
	b	.L418
.L427:
	mov	r3, #1
	ldr	r1, .L429+4
	ldr	r2, .L429+8
	str	r3, [r1, #108]
	str	r3, [r1, #112]
	str	r3, [r2, #108]
	str	r3, [r2, #112]
.L418:
	mov	r3, #0
	ldr	r1, .L429+16
	ldr	r2, .L429+20
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L426:
	ldr	r1, .L429+4
	ldr	r2, .L429+8
	str	r3, [r1, #32]
	str	r3, [r1, #36]
	str	r3, [r2, #32]
	str	r3, [r2, #36]
	b	.L418
.L428:
	mov	r3, #1
	ldr	r1, .L429+4
	ldr	r2, .L429+8
	str	r3, [r1, #184]
	str	r3, [r1, #188]
	str	r3, [r2, #184]
	str	r3, [r2, #188]
	b	.L418
.L430:
	.align	2
.L429:
	.word	firstPricing
	.word	unitsCounter
	.word	tensCounter
	.word	beginSelection
	.word	pricePointer
	.word	priced
	.size	initPricing, .-initPricing
	.align	2
	.global	updatePricing
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePricing, %function
updatePricing:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L489
	ldr	r4, .L489+4
	ldr	r3, [r5]
	ldrh	r2, [r4]
	cmp	r3, #0
	and	r3, r2, #64
	beq	.L432
	cmp	r3, #0
	beq	.L433
	ldr	r3, .L489+8
	ldrh	r3, [r3]
	ands	r0, r3, #64
	bne	.L433
	ldr	r3, .L489+12
	ldr	r3, [r3]
	sub	r3, r3, #1
	lsl	ip, r3, #3
	add	r2, ip, r3
	ldr	r1, .L489+16
	add	r2, r3, r2, lsl #1
	add	r2, r1, r2, lsl #2
	ldr	lr, [r2, #16]
	add	ip, ip, r3
	cmp	lr, #8
	add	r3, r3, ip, lsl #1
	add	r3, r1, r3, lsl #2
	addle	lr, lr, #1
	strgt	r0, [r2, #16]
	strle	lr, [r2, #16]
	ldr	r2, [r3, #28]
	add	r2, r2, #1
	cmp	r2, #18
	moveq	r2, #8
	mov	r1, #1648
	str	r2, [r3, #28]
	ldr	r0, .L489+20
	ldr	r2, .L489+24
	mov	r3, #0
	ldr	r6, .L489+28
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4]
.L433:
	tst	r2, #128
	beq	.L438
	ldr	r3, .L489+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L438
	ldr	r3, .L489+12
	ldr	r2, [r3]
	sub	r2, r2, #1
	lsl	r0, r2, #3
	add	r3, r0, r2
	ldr	r1, .L489+16
	add	r3, r2, r3, lsl #1
	add	r3, r1, r3, lsl #2
	ldr	ip, [r3, #16]
	cmp	ip, #0
	movle	ip, #9
	add	r0, r0, r2
	add	r2, r2, r0, lsl #1
	add	r2, r1, r2, lsl #2
	subgt	ip, ip, #1
	str	ip, [r3, #16]
	ldr	r3, [r2, #28]
	sub	r3, r3, #1
	cmp	r3, #7
	moveq	r3, #17
	mov	r1, #1648
	str	r3, [r2, #28]
	ldr	r0, .L489+20
	ldr	r2, .L489+24
	mov	r3, #0
	ldr	r6, .L489+28
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4]
.L438:
	tst	r2, #32
	bne	.L486
.L443:
	tst	r2, #2
	beq	.L454
	ldr	r3, .L489+8
	ldrh	r1, [r3]
	ands	r1, r1, #2
	beq	.L487
.L454:
	tst	r2, #1
	beq	.L431
	ldr	r3, .L489+8
	ldrh	r3, [r3]
	ands	r3, r3, #1
	beq	.L488
.L431:
	pop	{r4, r5, r6, lr}
	bx	lr
.L432:
	cmp	r3, #0
	beq	.L444
	ldr	r3, .L489+8
	ldrh	r3, [r3]
	ands	r0, r3, #64
	bne	.L444
	ldr	r3, .L489+12
	ldr	r3, [r3]
	sub	r3, r3, #1
	lsl	ip, r3, #3
	add	r2, ip, r3
	ldr	r1, .L489+32
	add	r2, r3, r2, lsl #1
	add	r2, r1, r2, lsl #2
	ldr	lr, [r2, #16]
	add	ip, ip, r3
	cmp	lr, #8
	add	r3, r3, ip, lsl #1
	add	r3, r1, r3, lsl #2
	addle	lr, lr, #1
	strgt	r0, [r2, #16]
	strle	lr, [r2, #16]
	ldr	r2, [r3, #28]
	add	r2, r2, #1
	cmp	r2, #18
	moveq	r2, #8
	mov	r1, #1648
	str	r2, [r3, #28]
	ldr	r0, .L489+20
	ldr	r2, .L489+24
	mov	r3, #0
	ldr	r6, .L489+28
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4]
.L444:
	tst	r2, #128
	beq	.L449
	ldr	r3, .L489+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L449
	ldr	r3, .L489+12
	ldr	r2, [r3]
	sub	r2, r2, #1
	lsl	r0, r2, #3
	add	r3, r0, r2
	ldr	r1, .L489+32
	add	r3, r2, r3, lsl #1
	add	r3, r1, r3, lsl #2
	ldr	ip, [r3, #16]
	cmp	ip, #0
	movle	ip, #9
	add	r0, r0, r2
	add	r2, r2, r0, lsl #1
	add	r2, r1, r2, lsl #2
	subgt	ip, ip, #1
	str	ip, [r3, #16]
	ldr	r3, [r2, #28]
	sub	r3, r3, #1
	cmp	r3, #7
	moveq	r3, #17
	mov	r1, #1648
	str	r3, [r2, #28]
	ldr	r0, .L489+20
	ldr	r2, .L489+24
	mov	r3, #0
	ldr	r6, .L489+28
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4]
.L449:
	tst	r2, #16
	beq	.L443
	ldr	r3, .L489+8
	ldrh	r3, [r3]
	ands	r3, r3, #16
	bne	.L443
	mov	ip, #1
.L485:
	ldr	r2, .L489+24
	str	ip, [r5]
	mov	r1, #1648
	ldr	r0, .L489+20
	ldr	r5, .L489+28
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4]
	b	.L443
.L486:
	ldr	r3, .L489+8
	ldrh	r3, [r3]
	ands	ip, r3, #32
	moveq	r3, ip
	bne	.L443
	b	.L485
.L488:
	mov	ip, #1
	ldr	r2, .L489+12
	ldr	r2, [r2]
	sub	r2, r2, #1
	add	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl ip
	ldr	r1, .L489+36
	ldr	lr, .L489+16
	ldr	r0, .L489+32
	ldr	r1, [r1]
	lsl	r2, r2, #2
	add	r0, r0, r2
	add	r2, lr, r2
	ldr	lr, [r2, #16]
	ldr	r0, [r0, #16]
	add	r2, r1, r1, lsl #3
	add	r1, r1, r2, lsl ip
	ldr	r2, .L489+40
	add	r0, r0, r0, lsl #2
	add	r0, lr, r0, lsl ip
	add	r1, r2, r1, lsl #2
	ldr	lr, .L489+44
	str	r0, [r1, #20]
	ldr	r4, .L489+28
	ldr	r2, .L489+24
	mov	r1, #1648
	ldr	r0, .L489+20
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L487:
	mov	ip, #1
	ldr	r3, .L489+12
	ldr	r2, .L489+36
	ldr	r3, [r3]
	ldr	r2, [r2]
	sub	r3, r3, #1
	add	r0, r3, r3, lsl #3
	add	r3, r3, r0, lsl ip
	add	r0, r2, r2, lsl #3
	add	r2, r2, r0, lsl ip
	ldr	r5, .L489+16
	ldr	lr, .L489+32
	ldr	r0, .L489+40
	lsl	r3, r3, #2
	add	r5, r5, r3
	add	lr, lr, r3
	add	r0, r0, r2, lsl #2
	ldr	r6, .L489+44
	str	r1, [r5, #32]
	str	r1, [r5, #36]
	str	r1, [r0, #32]
	str	r1, [r0, #36]
	mov	r3, r1
	str	r1, [lr, #32]
	str	r1, [lr, #36]
	ldr	r2, .L489+24
	ldr	r1, .L489+48
	ldr	r0, .L489+52
	ldr	r5, .L489+28
	str	ip, [r6]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4]
	b	.L454
.L490:
	.align	2
.L489:
	.word	pricePointer
	.word	oldButtons
	.word	buttons
	.word	beginSelection
	.word	unitsCounter
	.word	priceSFX
	.word	11025
	.word	playSoundB
	.word	tensCounter
	.word	placementCounter
	.word	items
	.word	priced
	.word	1701
	.word	menuSFX
	.size	updatePricing, .-updatePricing
	.align	2
	.global	drawPricing
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPricing, %function
drawPricing:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L499
	ldr	r1, .L499+4
	ldr	r3, .L499+8
	add	ip, r2, #304
.L496:
	ldr	r0, [r2, #32]
	cmp	r0, #0
	ldrne	r5, [r2, #24]
	ldrne	r0, [r2, #28]
	ldrheq	r0, [r3, #232]
	addne	r0, r0, r5, lsl #5
	orreq	r0, r0, #512
	ldmne	r2, {r4, lr}
	strhne	r0, [r3, #236]	@ movhi
	strheq	r0, [r3, #232]	@ movhi
	ldr	r0, [r1, #32]
	strhne	r4, [r3, #232]	@ movhi
	strhne	lr, [r3, #234]	@ movhi
	cmp	r0, #0
	ldrne	r0, [r1, #28]
	ldrheq	r0, [r3, #240]
	ldrne	r5, [r1, #24]
	ldmne	r1, {r4, lr}
	addne	r0, r0, r5, lsl #5
	orreq	r0, r0, #512
	add	r2, r2, #76
	strhne	r0, [r3, #244]	@ movhi
	strhne	r4, [r3, #240]	@ movhi
	strhne	lr, [r3, #242]	@ movhi
	strheq	r0, [r3, #240]	@ movhi
	cmp	r2, ip
	add	r1, r1, #76
	add	r3, r3, #16
	bne	.L496
	ldr	r4, .L499+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L499+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L500:
	.align	2
.L499:
	.word	tensCounter
	.word	unitsCounter
	.word	shadowOAM
	.word	DMANow
	.size	drawPricing, .-drawPricing
	.align	2
	.global	initCurrency
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCurrency, %function
initCurrency:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #15
	str	lr, [sp, #-4]!
	mov	r1, #8
	mov	lr, r2
	mov	ip, #2
	mov	r0, #0
	ldr	r3, .L505
.L502:
	str	r2, [r3, #4]
	add	r2, r2, #8
	cmp	r2, #39
	str	lr, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #24]
	str	r1, [r3, #28]
	str	r0, [r3, #32]
	add	r3, r3, #76
	bne	.L502
	ldr	lr, [sp], #4
	bx	lr
.L506:
	.align	2
.L505:
	.word	currency
	.size	initCurrency, .-initCurrency
	.align	2
	.global	updateCurrency
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCurrency, %function
updateCurrency:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L513
	ldr	r1, .L513+4
	ldr	ip, [r3, #44]
	ldr	r3, .L513+8
	push	{r4, r5, r6, r7, lr}
	smull	r6, r7, ip, r1
	smull	r4, r5, ip, r3
	asr	r3, ip, #31
	rsb	r2, r3, r7, asr #2
	rsb	r3, r3, r5, asr #5
	smull	r4, r5, r3, r1
	smull	r6, r7, r2, r1
	asr	r0, r2, #31
	asr	r1, r3, #31
	rsb	r0, r0, r7, asr #2
	rsb	r1, r1, r5, asr #2
	add	lr, r2, r2, lsl #2
	add	r0, r0, r0, lsl #2
	add	r1, r1, r1, lsl #2
	sub	r2, r2, r0, lsl #1
	sub	r3, r3, r1, lsl #1
	sub	r0, ip, lr, lsl #1
	sub	r4, ip, #1
	ldr	lr, .L513+12
	add	r3, r3, #8
	cmp	r4, #8
	str	r3, [lr, #28]
	movls	r3, #1
	add	r2, r2, #8
	add	r1, r0, #8
	str	r2, [lr, #104]
	str	r1, [lr, #180]
	strls	r3, [lr, #184]
	bls	.L507
	sub	r3, ip, #10
	cmp	r3, #89
	bls	.L512
	cmp	ip, #99
	movgt	r3, #1
	strgt	r3, [lr, #32]
	strgt	r3, [lr, #108]
	strgt	r3, [lr, #184]
.L507:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L512:
	mov	r3, #1
	str	r3, [lr, #108]
	str	r3, [lr, #184]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L514:
	.align	2
.L513:
	.word	player
	.word	1717986919
	.word	1374389535
	.word	currency
	.size	updateCurrency, .-updateCurrency
	.align	2
	.global	drawCurrency
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCurrency, %function
drawCurrency:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, lr}
	ldr	r2, .L522
	ldr	r0, .L522+4
.L518:
	ldr	ip, [r2, #32]
	add	r3, r0, r1
	cmp	ip, #0
	add	lr, r3, #296
	add	r3, r3, #300
	beq	.L516
	add	r4, r2, #24
	ldm	r4, {r4, ip}
	ldr	r5, [r2]
	add	ip, ip, r4, lsl #5
	ldr	r4, [r2, #4]
	strh	r5, [lr]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	strh	ip, [r3]	@ movhi
.L517:
	add	r1, r1, #8
	cmp	r1, #24
	add	r2, r2, #76
	bne	.L518
	ldr	r3, .L522+8
	ldr	r3, [r3, #44]
	cmp	r3, #0
	ble	.L515
	mov	r0, #15
	mov	r1, #39
	mov	r2, #104
	ldr	r3, .L522+12
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
.L515:
	pop	{r4, r5, lr}
	bx	lr
.L516:
	add	ip, r1, #296
	ldrh	r3, [r0, ip]
	orr	r3, r3, #512
	strh	r3, [r0, ip]	@ movhi
	b	.L517
.L523:
	.align	2
.L522:
	.word	currency
	.word	shadowOAM
	.word	player
	.word	shadowOAM+320
	.size	drawCurrency, .-drawCurrency
	.align	2
	.global	moveRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveRight, %function
moveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #5
	ldr	r3, [r0, #48]
	ldmib	r0, {r1, ip}
	add	r1, r1, ip
	sub	r3, r3, #1
	str	r1, [r0, #4]
	str	r2, [r0, #32]
	str	r3, [r0, #48]
	bx	lr
	.size	moveRight, .-moveRight
	.align	2
	.global	moveLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveLeft, %function
moveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #7
	ldr	r3, [r0, #52]
	ldmib	r0, {r1, ip}
	sub	r1, r1, ip
	sub	r3, r3, #1
	str	r1, [r0, #4]
	str	r2, [r0, #32]
	str	r3, [r0, #52]
	bx	lr
	.size	moveLeft, .-moveLeft
	.align	2
	.global	moveUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveUp, %function
moveUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #6
	ldr	r2, [r0]
	ldr	r3, [r0, #56]
	ldr	ip, [r0, #12]
	sub	r3, r3, #1
	sub	r2, r2, ip
	str	r2, [r0]
	str	r1, [r0, #32]
	str	r3, [r0, #56]
	bx	lr
	.size	moveUp, .-moveUp
	.align	2
	.global	moveDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveDown, %function
moveDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #4
	ldr	r2, [r0]
	ldr	r3, [r0, #60]
	ldr	ip, [r0, #12]
	sub	r3, r3, #1
	add	r2, r2, ip
	str	r2, [r0]
	str	r1, [r0, #32]
	str	r3, [r0, #60]
	bx	lr
	.size	moveDown, .-moveDown
	.align	2
	.global	pathing
	.syntax unified
	.arm
	.fpu softvfp
	.type	pathing, %function
pathing:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	sub	r3, r1, #1
	str	r2, [r0, #44]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L529
.L531:
	.word	.L530
	.word	.L532
	.word	.L533
	.word	.L534
.L534:
	mov	r2, #64
	mov	r3, #32
	str	r2, [r0, #56]
	str	r3, [r0, #48]
.L529:
	str	r1, [r0, #64]
	bx	lr
.L533:
	mov	r2, #64
	mov	r3, #16
	str	r2, [r0, #56]
	str	r3, [r0, #48]
	str	r1, [r0, #64]
	bx	lr
.L532:
	mov	r3, #64
	str	r1, [r0, #64]
	str	r3, [r0, #56]
	bx	lr
.L530:
	mov	r2, #64
	mov	r3, #16
	str	r2, [r0, #56]
	str	r3, [r0, #52]
	str	r1, [r0, #64]
	bx	lr
	.size	pathing, .-pathing
	.align	2
	.global	pathingOut
	.syntax unified
	.arm
	.fpu softvfp
	.type	pathingOut, %function
pathingOut:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	sub	r1, r1, #1
	str	r3, [r0, #80]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L535
.L538:
	.word	.L537
	.word	.L539
	.word	.L540
	.word	.L541
.L541:
	mov	r2, #64
	mov	r3, #32
	str	r2, [r0, #60]
	str	r3, [r0, #52]
.L535:
	bx	lr
.L540:
	mov	r2, #64
	mov	r3, #16
	str	r2, [r0, #60]
	str	r3, [r0, #52]
	bx	lr
.L539:
	mov	r3, #64
	str	r3, [r0, #60]
	bx	lr
.L537:
	mov	r2, #64
	mov	r3, #16
	str	r2, [r0, #60]
	str	r3, [r0, #48]
	bx	lr
	.size	pathingOut, .-pathingOut
	.align	2
	.global	initFaces
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFaces, %function
initFaces:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, lr}
	mov	r1, #94
	mov	r0, r2
	mov	r6, #40
	mov	r5, #16
	mov	r4, #32
	mov	lr, #13
	mov	ip, #15
	ldr	r3, .L546
.L543:
	add	r2, r2, #1
	cmp	r2, #4
	stmib	r3, {r1, r5}
	str	r2, [r3, #40]
	str	r6, [r3]
	str	r4, [r3, #12]
	str	r0, [r3, #24]
	str	lr, [r3, #28]
	str	r0, [r3, #32]
	str	ip, [r3, #48]
	add	r1, r1, #16
	add	r3, r3, #76
	bne	.L543
	pop	{r4, r5, r6, lr}
	bx	lr
.L547:
	.align	2
.L546:
	.word	faces
	.size	initFaces, .-initFaces
	.align	2
	.global	happy
	.syntax unified
	.arm
	.fpu softvfp
	.type	happy, %function
happy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r1, #15
	ldr	r2, [r0, #64]
	sub	r3, r2, #1
	add	r0, r3, r3, lsl #3
	add	r3, r3, r0, lsl ip
	ldr	r0, .L550
	lsl	r3, r3, #2
	push	{r4, r5, r6, lr}
	add	lr, r0, r3
	ldr	r4, [r0, r3]
	ldr	r5, .L550+4
	ldr	r6, [lr, #24]
	ldr	r3, [lr, #28]
	ldr	r0, .L550+8
	add	r2, r2, #40
	lsl	r2, r2, #3
	orr	r4, r4, r5
	strh	r4, [r0, r2]	@ movhi
	add	r3, r3, r6, lsl #4
	add	r2, r0, r2
	ldr	r0, [lr, #4]
	lsl	r3, r3, ip
	orr	r0, r0, r5
	orr	r3, r3, #8192
	str	ip, [lr, #32]
	str	r1, [lr, #48]
	strh	r0, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L551:
	.align	2
.L550:
	.word	faces
	.word	-32768
	.word	shadowOAM
	.size	happy, .-happy
	.align	2
	.global	unhappy
	.syntax unified
	.arm
	.fpu softvfp
	.type	unhappy, %function
unhappy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, #1
	mov	lr, #15
	ldr	r2, [r0, #64]
	sub	r1, r2, #1
	add	r3, r1, r1, lsl #3
	add	r1, r1, r3, lsl r4
	ldr	r3, .L554
	add	r1, r3, r1, lsl #2
	ldr	r7, [r1, #24]
	ldr	r3, [r1, #28]
	ldr	r5, [r0, #4]
	ldr	r6, [r0]
	ldr	ip, .L554+4
	add	r3, r3, r7, lsl #4
	add	r2, r2, #40
	lsl	r2, r2, #3
	lsl	r3, r3, r4
	strh	r6, [ip, r2]	@ movhi
	orr	r0, r5, #16384
	add	r2, ip, r2
	orr	r3, r3, #8192
	strh	r0, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	str	r4, [r1, #32]
	str	lr, [r1, #48]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L555:
	.align	2
.L554:
	.word	faces
	.word	shadowOAM
	.size	unhappy, .-unhappy
	.align	2
	.global	drawFaces
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFaces, %function
drawFaces:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L561
	ldr	ip, .L561+4
.L558:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	addeq	r0, r3, #328
	ldrheq	r1, [r0, ip]
	add	r3, r3, #8
	orreq	r1, r1, #512
	strheq	r1, [r0, ip]	@ movhi
	cmp	r3, #32
	add	r2, r2, #76
	bne	.L558
	bx	lr
.L562:
	.align	2
.L561:
	.word	faces
	.word	shadowOAM
	.size	drawFaces, .-drawFaces
	.align	2
	.global	initCustomers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCustomers, %function
initCustomers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #100
	mov	r8, #128
	mov	r7, #112
	mov	r0, #1
	mov	r6, #16
	mov	r5, #32
	mov	r2, #0
	mov	r4, #6
	mov	lr, #4
	mov	ip, #60
	ldr	r3, .L567
.L564:
	str	r1, [r3, #68]
	add	r1, r1, #80
	cmp	r1, #420
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r4, [r3, #32]
	str	r2, [r3, #36]
	str	lr, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	str	r2, [r3, #52]
	str	r2, [r3, #48]
	str	r0, [r3, #72]
	str	r2, [r3, #64]
	str	r2, [r3, #80]
	str	ip, [r3, #84]
	add	r3, r3, #88
	bne	.L564
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L568:
	.align	2
.L567:
	.word	customers
	.size	initCustomers, .-initCustomers
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	mov	r2, #15
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #1
	mov	r10, #80
	mov	r9, #100
	mov	r8, #16
	mov	r7, #32
	mov	r6, #4
	mov	r4, r0
	mov	lr, r2
	mov	r1, #8
	mov	ip, #2
	ldr	r3, .L581
	str	r0, [r3, #24]
	str	r0, [r3, #32]
	str	r0, [r3, #36]
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #16]
	str	r7, [r3, #20]
	str	r6, [r3, #40]
	str	r5, [r3, #8]
	str	r5, [r3, #12]
	ldr	r3, .L581+4
.L570:
	str	r2, [r3, #4]
	add	r2, r2, #8
	cmp	r2, #39
	str	lr, [r3]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #24]
	str	r1, [r3, #28]
	str	r4, [r3, #32]
	add	r3, r3, #76
	bne	.L570
	mov	r2, #0
	mov	r1, #94
	mov	r4, r2
	mov	r6, #40
	mov	r5, #16
	mov	lr, #32
	mov	ip, #13
	mov	r0, #15
	ldr	r3, .L581+8
.L571:
	add	r2, r2, #1
	cmp	r2, #4
	stmib	r3, {r1, r5, lr}
	str	r2, [r3, #40]
	str	r6, [r3]
	str	r4, [r3, #24]
	str	ip, [r3, #28]
	str	r4, [r3, #32]
	str	r0, [r3, #48]
	add	r1, r1, #16
	add	r3, r3, #76
	bne	.L571
	bl	initCustomers
	bl	initItems
	mov	ip, #1
	ldr	r3, .L581+12
	ldr	r0, .L581+16
	ldr	r1, .L581+20
	ldr	r2, .L581+24
	ldr	r3, [r3]
	str	ip, [r0]
	str	r4, [r1]
	str	r4, [r2]
	ldr	ip, .L581+28
	ldr	r0, .L581+32
	ldr	r1, .L581+36
	ldr	r2, .L581+40
	cmp	r3, #2
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	beq	.L573
	cmp	r3, #3
	beq	.L574
	cmp	r3, #1
	beq	.L580
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L580:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	day1
.L574:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	day3
.L573:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	day2
.L582:
	.align	2
.L581:
	.word	player
	.word	currency
	.word	faces
	.word	currentDay
	.word	firstPricing
	.word	won
	.word	lost
	.word	placingTrigger
	.word	placingInstructionsCompleted
	.word	cheating
	.word	startedMan
	.size	initGame, .-initGame
	.align	2
	.global	updateCustomers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCustomers, %function
updateCustomers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L672
	mov	r5, #0
	mov	r4, r8
	ldr	r6, .L672+4
	ldr	r7, .L672+8
.L627:
	ldr	r3, [r4, #32]
	cmp	r3, #8
	movne	r2, #8
	strne	r2, [r4, #32]
	ldr	r2, [r4, #24]
	smull	r0, r1, r2, r7
	strne	r3, [r4, #28]
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r1, r3, r3, lsl #1
	add	r3, r3, r1, lsl #2
	cmp	r2, r3
	bne	.L585
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	ldr	r3, .L672+12
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L585:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	ldr	r2, [r4, #72]
	add	r5, r5, #1
	bne	.L586
	cmp	r2, #0
	beq	.L586
	mov	r3, #1
	cmp	r5, #3
	str	r3, [r4, #44]
	beq	.L588
	cmp	r5, #4
	beq	.L589
	cmp	r5, #2
	movne	r2, #64
	movne	r3, #16
	moveq	r3, #64
	strne	r2, [r8, #56]
	strne	r3, [r8, #52]
	streq	r3, [r8, #144]
.L591:
	mov	r3, #0
	str	r5, [r4, #64]
	str	r3, [r4, #72]
.L592:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L594
	mov	r1, #6
	ldr	r2, [r4]
	ldr	r0, [r4, #12]
	sub	r3, r3, #1
	sub	r2, r2, r0
	str	r2, [r4]
	str	r3, [r4, #56]
	str	r1, [r4, #32]
	ldr	r2, [r4, #76]
.L593:
	ldr	r3, [r4, #84]
	cmp	r3, #0
	beq	.L668
.L600:
	cmp	r2, #0
	bne	.L599
.L601:
	ldr	r3, [r4, #80]
.L610:
	cmp	r3, #0
	beq	.L622
.L608:
	ldr	r3, [r4]
	cmp	r3, #120
	ble	.L622
	mov	r2, #0
	mov	r0, #1
	mov	r1, #60
	add	r3, r5, r5, lsl #2
	lsl	r3, r3, #4
	add	r3, r3, #20
	str	r3, [r4, #68]
	str	r2, [r4, #44]
	str	r2, [r4, #80]
	str	r0, [r4, #72]
	str	r1, [r4, #84]
.L622:
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L623
	ldr	r3, [r6, #48]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r6, #48]
	streq	r3, [r6, #32]
.L623:
	ldr	r3, [r4, #32]
	cmp	r3, #8
	moveq	r2, #6
	moveq	r3, #0
	ldrne	r3, [r4, #24]
	addne	r3, r3, #1
	streq	r2, [r4, #32]
	streq	r3, [r4, #36]
	strne	r3, [r4, #24]
	cmp	r5, #4
	add	r4, r4, #88
	add	r6, r6, #76
	bne	.L627
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L586:
	sub	r3, r3, #1
	cmp	r2, #0
	str	r3, [r4, #68]
	beq	.L592
.L667:
	ldr	r3, [r4, #84]
	cmp	r3, #0
	ldr	r2, [r4, #76]
	bne	.L600
.L668:
	cmp	r2, #0
	beq	.L601
.L598:
	mov	r2, #0
	ldr	r3, .L672+16
	b	.L613
.L602:
	add	r2, r2, #1
	cmp	r2, #8
	add	r3, r3, #76
	beq	.L669
.L613:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L602
	ldr	r1, [r3, #40]
	ldr	r0, [r4, #64]
	cmp	r1, r0
	bne	.L602
	ldr	r0, [r3, #16]
	ldr	lr, [r3, #52]
	ldr	ip, [r3, #20]
	add	r0, r0, lr
	cmp	r0, ip
	blt	.L602
	ldr	fp, .L672+20
	mov	r3, fp
	mov	r9, #1
	add	r0, r1, #54
	lsl	r0, r0, #3
	ldrh	r10, [fp, r0]
	orr	r10, r10, #512
	strh	r10, [fp, r0]	@ movhi
	add	r10, r1, #89
	lsl	r10, r10, #3
	ldrh	fp, [fp, r10]
	sub	r1, r1, #1
	orr	fp, fp, #512
	strh	fp, [r3, r10]	@ movhi
	add	r10, r1, r1, lsl #3
	add	r1, r1, r10, lsl r9
	ldr	r3, .L672+24
	lsl	r10, r1, #2
	add	fp, r3, r10
	ldr	r3, .L672+28
	add	r10, r3, r10
	mov	r3, #8
	ldr	r0, .L672+32
	ldr	r1, [r0, #44]
	str	r3, [fp, #28]
	add	r1, r1, ip
	ldr	r3, .L672+16
	add	ip, r2, r2, lsl #3
	add	r2, r2, ip, lsl r9
	mov	lr, #0
	add	ip, r3, r2, lsl #2
	mov	r3, #8
	str	r1, [r0, #44]
	str	r3, [r10, #28]
	str	lr, [r10, #32]
	str	lr, [r10, #16]
	str	lr, [fp, #32]
	str	lr, [fp, #16]
	str	lr, [r4, #76]
	str	lr, [r4, #64]
	mov	r3, lr
	ldr	r2, .L672+36
	ldr	r1, .L672+40
	ldr	r0, .L672+44
	str	lr, [ip, #32]
	str	lr, [ip, #36]
	str	lr, [ip, #40]
	ldr	r10, .L672+48
	str	r9, [ip, #44]
	mov	lr, pc
	bx	r10
	cmp	r5, #3
	str	r9, [r4, #80]
	beq	.L604
	cmp	r5, #4
	beq	.L605
	cmp	r5, #2
	beq	.L606
	mov	r3, #16
	mov	r2, #64
	str	r3, [r8, #48]
	str	r2, [r8, #60]
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L608
	str	r9, [r4, #80]
	b	.L614
.L594:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L595
	mov	r2, #7
	sub	r3, r3, #1
	str	r3, [r4, #52]
	ldmib	r4, {r1, r3}
	sub	r3, r1, r3
	str	r2, [r4, #32]
	str	r3, [r4, #4]
	ldr	r2, [r4, #76]
	b	.L593
.L669:
	mov	r3, #1
	cmp	r5, #3
	str	r3, [r4, #80]
	beq	.L615
	cmp	r5, #4
	beq	.L616
	cmp	r5, #2
	beq	.L617
.L614:
	mov	r2, #64
	mov	r3, #16
	str	r2, [r8, #60]
	str	r3, [r8, #48]
.L618:
	mov	r3, #0
	str	r3, [r4, #76]
	str	r3, [r4, #64]
	ldr	r3, [r4, #80]
	b	.L610
.L595:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L670
	ldr	r3, [r4, #60]
	cmp	r3, #0
	bne	.L671
	mov	r2, #1
	ldr	r3, [r4, #84]
	cmp	r3, #0
	str	r2, [r4, #76]
	beq	.L598
.L599:
	ldr	r9, .L672+16
	sub	r3, r3, #1
	str	r3, [r4, #84]
	add	r10, r9, #608
	b	.L621
.L619:
	add	r9, r9, #76
	cmp	r9, r10
	beq	.L601
	ldr	r3, [r4, #84]
.L621:
	sub	r3, r3, #11
	cmp	r3, #18
	bhi	.L619
	ldr	r3, [r9, #36]
	cmp	r3, #0
	beq	.L619
	ldr	r2, [r9, #40]
	ldr	r3, [r4, #64]
	cmp	r2, r3
	bne	.L619
	ldr	r3, [r9, #16]
	ldr	r1, [r9, #52]
	ldr	r2, [r9, #20]
	add	r3, r3, r1
	cmp	r3, r2
	blt	.L619
	mov	r0, r4
	bl	happy
	b	.L619
.L670:
	mov	r2, #5
	sub	r3, r3, #1
	str	r3, [r4, #48]
	ldmib	r4, {r1, r3}
	add	r3, r1, r3
	str	r2, [r4, #32]
	str	r3, [r4, #4]
	b	.L667
.L588:
	mov	r2, #64
	mov	r3, #16
	str	r2, [r8, #232]
	str	r3, [r8, #224]
	b	.L591
.L589:
	mov	r2, #64
	mov	r3, #32
	str	r2, [r8, #320]
	str	r3, [r8, #312]
	b	.L591
.L604:
	mov	r3, #16
	mov	r2, #64
	str	r3, [r8, #228]
	str	r2, [r8, #236]
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L601
	str	r9, [r4, #80]
.L615:
	mov	r2, #64
	mov	r3, #16
	str	r2, [r8, #236]
	str	r3, [r8, #228]
	b	.L618
.L671:
	mov	r1, #4
	ldr	r2, [r4]
	ldr	r0, [r4, #12]
	sub	r3, r3, #1
	add	r2, r2, r0
	str	r2, [r4]
	str	r3, [r4, #60]
	str	r1, [r4, #32]
	ldr	r2, [r4, #76]
	b	.L593
.L606:
	mov	r3, #64
	str	r3, [r8, #148]
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L601
	str	r9, [r4, #80]
.L617:
	mov	r3, #64
	str	r3, [r8, #148]
	b	.L618
.L605:
	mov	r3, #32
	mov	r2, #64
	str	r3, [r8, #316]
	str	r2, [r8, #324]
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L601
	str	r9, [r4, #80]
.L616:
	mov	r2, #64
	mov	r3, #32
	str	r2, [r8, #324]
	str	r3, [r8, #316]
	b	.L618
.L673:
	.align	2
.L672:
	.word	customers
	.word	faces
	.word	1321528399
	.word	__aeabi_idivmod
	.word	items
	.word	shadowOAM
	.word	unitsCounter
	.word	tensCounter
	.word	player
	.word	11025
	.word	8609
	.word	kaching
	.word	playSoundB
	.size	updateCustomers, .-updateCustomers
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateCurrency
	bl	updateCustomers
	ldr	r3, .L678
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L674
	ldr	r2, .L678+4
	ldr	r3, [r2]
	cmp	r3, #59
	movgt	r2, #1
	ldrgt	r3, .L678+8
	addle	r3, r3, #1
	strle	r3, [r2]
	strgt	r2, [r3]
.L674:
	pop	{r4, lr}
	bx	lr
.L679:
	.align	2
.L678:
	.word	placingInstructionsCompleted
	.word	placingTrigger
	.word	placingInstruction
	.size	updateGame, .-updateGame
	.align	2
	.global	drawCustomers
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCustomers, %function
drawCustomers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r1, r2
	push	{r4, r5, r6, lr}
	ldr	r3, .L688
	ldr	ip, .L688+4
	ldr	r4, .L688+8
.L685:
	ldr	r0, [r3, #44]
	cmp	r0, #0
	beq	.L681
	ldr	lr, [r3, #32]
	lsl	r5, lr, #6
	ldr	lr, [r3, #36]
	add	r0, lr, #4
	tst	r1, #1
	add	r0, r0, r5
	addeq	lr, lr, r5
	lsl	r0, r0, #1
	orr	r0, r0, #4096
	lsleq	lr, lr, #1
	addeq	r0, r2, #364
	strheq	lr, [ip, r0]	@ movhi
	add	r6, r2, #364
	ldm	r3, {r5, lr}
	strhne	r0, [ip, r6]	@ movhi
	add	r0, ip, r2
	add	r0, r0, #360
	orr	r5, r5, r4
	orr	lr, lr, r4
	strh	r5, [r0]	@ movhi
	strh	lr, [r0, #2]	@ movhi
.L684:
	add	r1, r1, #1
	cmp	r1, #4
	add	r3, r3, #88
	add	r2, r2, #8
	bne	.L685
	pop	{r4, r5, r6, lr}
	bx	lr
.L681:
	add	lr, r2, #360
	ldrh	r0, [ip, lr]
	orr	r0, r0, #512
	strh	r0, [ip, lr]	@ movhi
	b	.L684
.L689:
	.align	2
.L688:
	.word	customers
	.word	shadowOAM
	.word	-32768
	.size	drawCustomers, .-drawCustomers
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L695
	ldr	ip, [r2, #32]
	ldr	r3, [r2, #36]
	ldr	r0, .L695+4
	ldm	r2, {r1, r2}
	push	{r4, lr}
	add	r3, r3, ip, lsl #6
	ldr	r4, .L695+8
	lsl	r3, r3, #1
	orr	r2, r2, r0
	orr	r1, r1, r0
	strh	r3, [r4, #4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	bl	drawCurrency
	bl	drawRest
	mov	r3, #0
	ldr	r2, .L695+12
.L692:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	addeq	r0, r3, #328
	ldrheq	r1, [r4, r0]
	add	r3, r3, #8
	orreq	r1, r1, #512
	strheq	r1, [r4, r0]	@ movhi
	cmp	r3, #32
	add	r2, r2, #76
	bne	.L692
	bl	drawCustomers
	ldr	r4, .L695+16
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L695+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L696:
	.align	2
.L695:
	.word	player
	.word	-32768
	.word	shadowOAM
	.word	faces
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	initCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCheat, %function
initCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #94
	mov	r6, #50
	mov	lr, #2
	mov	r1, #8
	mov	ip, #0
	mov	r5, #60
	ldr	r2, .L701
	ldr	r3, .L701+4
.L698:
	str	r0, [r3, #4]
	add	r4, r0, #9
	add	r0, r0, #16
	cmp	r0, #158
	str	r6, [r2]
	str	lr, [r2, #24]
	str	r1, [r2, #28]
	str	r1, [r2, #12]
	str	r1, [r2, #8]
	str	ip, [r2, #16]
	str	ip, [r2, #32]
	str	r5, [r3]
	str	lr, [r3, #24]
	str	r1, [r3, #28]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	str	ip, [r3, #32]
	str	r4, [r2, #4]
	add	r3, r3, #76
	add	r2, r2, #76
	bne	.L698
	pop	{r4, r5, r6, lr}
	bx	lr
.L702:
	.align	2
.L701:
	.word	cheatUnits
	.word	cheatTens
	.size	initCheat, .-initCheat
	.align	2
	.global	cheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	cheat, %function
cheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L719
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L708
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L719+4
	ldr	lr, .L719+8
	ldr	r7, .L719+12
	ldr	r6, .L719+16
	ldr	r0, .L719+20
	sub	sp, sp, #12
	add	ip, r3, #608
.L706:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L705
	ldr	r8, [r3, #16]
	smull	r4, r5, r8, lr
	asr	r1, r8, #31
	rsb	r9, r1, r5, asr #2
	smull	r4, r5, r9, lr
	ldr	r2, [r3, #40]
	str	r2, [sp, #4]
	sub	r2, r2, #1
	add	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl #1
	add	r1, r9, r9, lsl #2
	sub	r8, r8, r1, lsl #1
	asr	r1, r9, #31
	lsl	r2, r2, #2
	rsb	r1, r1, r5, asr #2
	add	r10, r6, r2
	add	r1, r1, r1, lsl #2
	ldr	r5, [r3]
	ldr	fp, [r10, #24]
	sub	r1, r9, r1, lsl #1
	ldr	r4, [sp, #4]
	add	r9, r7, r2
	add	r1, r1, #8
	str	r1, [r10, #28]
	add	fp, r1, fp, lsl #5
	add	r5, r5, #16
	ldr	r1, [r9, #24]
	add	r8, r8, #8
	add	r2, r4, #54
	lsl	r5, r5, #16
	str	r8, [r9, #28]
	lsr	r5, r5, #16
	lsl	r2, r2, #3
	add	r1, r8, r1, lsl #5
	add	r4, r4, #89
	ldrh	r8, [r3, #4]
	lsl	r4, r4, #3
	strh	r5, [r0, r2]	@ movhi
	add	r2, r0, r2
	strh	r8, [r2, #2]	@ movhi
	add	r9, r0, r4
	add	r8, r8, #8
	strh	fp, [r2, #4]	@ movhi
	strh	r5, [r0, r4]	@ movhi
	strh	r1, [r9, #4]	@ movhi
	strh	r8, [r9, #2]	@ movhi
.L705:
	add	r3, r3, #76
	cmp	r3, ip
	bne	.L706
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L708:
	ldr	ip, .L719+20
.L704:
	add	r3, ip, r2
	add	r0, r3, #440
	ldrh	r1, [r0]
	orr	r1, r1, #512
	strh	r1, [r0]	@ movhi
	add	r3, r3, #720
	ldrh	r1, [r3]
	add	r2, r2, #8
	orr	r1, r1, #512
	cmp	r2, #32
	strh	r1, [r3]	@ movhi
	bne	.L704
	bx	lr
.L720:
	.align	2
.L719:
	.word	cheating
	.word	items
	.word	1717986919
	.word	cheatUnits
	.word	cheatTens
	.word	shadowOAM
	.size	cheat, .-cheat
	.align	2
	.global	initMan
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMan, %function
initMan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r2, #0
	mov	r1, #1
	mov	r9, #128
	mov	r8, #112
	mov	r7, #16
	mov	r6, #32
	mov	r5, #6
	mov	r4, #4
	mov	lr, #60
	mov	ip, #64
	mov	r0, #2
	ldr	r3, .L723
	str	r9, [r3]
	str	r8, [r3, #4]
	str	r7, [r3, #16]
	str	r6, [r3, #20]
	str	r5, [r3, #32]
	str	r4, [r3, #40]
	str	lr, [r3, #84]
	str	ip, [r3, #56]
	str	r0, [r3, #64]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #44]
	str	r1, [r3, #72]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	str	r2, [r3, #60]
	str	r2, [r3, #52]
	str	r2, [r3, #48]
	str	r2, [r3, #68]
	str	r2, [r3, #80]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L724:
	.align	2
.L723:
	.word	man
	.size	initMan, .-initMan
	.align	2
	.global	checkOver
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkOver, %function
checkOver:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L746
	ldr	r2, [r4]
	cmp	r2, #0
	bne	.L725
	mov	r0, #1
	mov	r1, r0
	ldr	lr, .L746+4
	ldr	r3, .L746+8
	str	r0, [lr]
	add	ip, r3, #608
.L729:
	ldr	r0, [r3, #44]
	add	r3, r3, #76
	cmp	r0, #0
	moveq	r1, #0
	moveq	r2, #1
	cmp	r3, ip
	bne	.L729
	cmp	r2, #0
	bne	.L743
.L730:
	ldr	r3, .L746+12
	ldr	r3, [r3]
	sub	r2, r3, #1
	cmp	r2, #1
	bls	.L744
	cmp	r3, #3
	mov	r2, #1
	beq	.L745
.L733:
	ldr	r3, .L746+16
	str	r2, [r3]
.L725:
	pop	{r4, lr}
	bx	lr
.L744:
	bl	initMan
	mov	r3, #1
	str	r3, [r4]
	b	.L725
.L745:
	ldr	r3, .L746+20
	ldr	r3, [r3, #44]
	cmp	r3, #300
	blt	.L733
	ldr	r3, .L746+24
	str	r2, [r3]
	b	.L725
.L743:
	cmp	r1, #0
	str	r1, [lr]
	bne	.L730
	b	.L725
.L747:
	.align	2
.L746:
	.word	startedMan
	.word	tempEvent
	.word	items
	.word	currentDay
	.word	lost
	.word	player
	.word	won
	.size	checkOver, .-checkOver
	.align	2
	.global	updateMan
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMan, %function
updateMan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L775
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L748
	ldr	r3, [r4, #32]
	cmp	r3, #8
	movne	r2, #8
	strne	r3, [r4, #28]
	strne	r2, [r4, #32]
	ldr	r3, .L775+4
	ldr	r2, [r4, #24]
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r1, r3, r3, lsl #1
	add	r3, r3, r1, lsl #2
	cmp	r2, r3
	bne	.L751
	ldr	r0, [r4, #36]
	ldr	r3, .L775+8
	add	r0, r0, #1
	ldr	r1, [r4, #40]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L751:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L752
	mov	r1, #6
	ldr	r2, [r4]
	ldr	r0, [r4, #12]
	sub	r3, r3, #1
	sub	r2, r2, r0
	str	r3, [r4, #56]
	str	r2, [r4]
	str	r1, [r4, #32]
.L753:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	bne	.L761
.L760:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	str	r3, [r4, #24]
.L748:
	pop	{r4, lr}
	bx	lr
.L752:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L772
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L755
	mov	r1, #5
	ldmib	r4, {r0, r2}
	add	r2, r0, r2
	sub	r3, r3, #1
	str	r3, [r4, #48]
	str	r1, [r4, #32]
	str	r2, [r4, #4]
	b	.L753
.L755:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	bne	.L773
	mov	r3, #1
	str	r3, [r4, #76]
.L761:
	ldr	r3, .L775+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L757
	ldr	r3, .L775+16
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L757
	ldr	r2, .L775+20
	ldr	r3, [r2, #44]
	cmp	r3, #125
	ble	.L758
	ldr	r0, .L775+24
	ldr	r1, [r0]
	cmp	r1, #1
	beq	.L774
	cmp	r3, #300
	ble	.L758
	cmp	r1, #2
	bne	.L758
	mov	r1, #3
	sub	r3, r3, #300
	str	r3, [r2, #44]
	str	r1, [r0]
	bl	initGame
.L757:
	ldr	r3, [r4, #32]
	cmp	r3, #8
	bne	.L760
	mov	r2, #6
	mov	r3, #0
	str	r2, [r4, #32]
	str	r3, [r4, #36]
	pop	{r4, lr}
	bx	lr
.L772:
	mov	r1, #7
	ldmib	r4, {r0, r2}
	sub	r2, r0, r2
	sub	r3, r3, #1
	str	r3, [r4, #52]
	str	r1, [r4, #32]
	str	r2, [r4, #4]
	b	.L753
.L758:
	mov	r2, #1
	ldr	r3, .L775+28
	str	r2, [r3]
	b	.L757
.L773:
	mov	r1, #4
	ldr	r2, [r4]
	ldr	r0, [r4, #12]
	sub	r3, r3, #1
	add	r2, r2, r0
	str	r3, [r4, #60]
	str	r2, [r4]
	str	r1, [r4, #32]
	b	.L753
.L774:
	mov	r1, #2
	sub	r3, r3, #125
	str	r3, [r2, #44]
	str	r1, [r0]
	bl	initGame
	b	.L757
.L776:
	.align	2
.L775:
	.word	man
	.word	1321528399
	.word	__aeabi_idivmod
	.word	oldButtons
	.word	buttons
	.word	player
	.word	currentDay
	.word	lost
	.size	updateMan, .-updateMan
	.align	2
	.global	drawMan
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMan, %function
drawMan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L781
	ldr	r3, [r2, #44]
	cmp	r3, #0
	bne	.L780
	ldr	r2, .L781+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L780:
	add	r1, r2, #32
	ldm	r1, {r1, r3}
	add	r3, r3, #8
	add	r3, r3, r1, lsl #6
	ldr	ip, .L781+8
	ldm	r2, {r0, r1}
	lsl	r3, r3, #1
	ldr	r2, .L781+4
	orr	r3, r3, #28672
	orr	r0, r0, ip
	orr	r1, r1, ip
	strh	r3, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	bx	lr
.L782:
	.align	2
.L781:
	.word	man
	.word	shadowOAM+496
	.word	-32768
	.size	drawMan, .-drawMan
	.align	2
	.global	initEndGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEndGame, %function
initEndGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L787
	push	{r4, r5, r6, r7, lr}
	mov	r2, #88
	mov	r3, ip
	mov	r5, #99
	mov	r4, #2
	mov	r1, #8
	mov	lr, #0
	mov	r0, #1
.L784:
	str	r2, [r3, #4]
	add	r2, r2, #8
	cmp	r2, #112
	str	r5, [r3]
	str	r4, [r3, #24]
	str	r1, [r3, #28]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	lr, [r3, #16]
	str	r0, [r3, #32]
	add	r3, r3, #76
	bne	.L784
	ldr	r3, .L787+4
	ldr	r0, .L787+8
	ldr	r1, [r3, #44]
	ldr	r3, .L787+12
	smull	r6, r7, r1, r0
	smull	r4, r5, r1, r3
	asr	r3, r1, #31
	rsb	r2, r3, r7, asr #2
	rsb	r3, r3, r5, asr #5
	smull	r6, r7, r2, r0
	smull	r4, r5, r3, r0
	add	r0, r2, r2, lsl #2
	sub	r1, r1, r0, lsl #1
	asr	lr, r2, #31
	asr	r0, r3, #31
	rsb	lr, lr, r7, asr #2
	rsb	r0, r0, r5, asr #2
	add	lr, lr, lr, lsl #2
	add	r0, r0, r0, lsl #2
	sub	r2, r2, lr, lsl #1
	sub	r3, r3, r0, lsl #1
	add	r1, r1, #8
	add	r2, r2, #8
	add	r3, r3, #8
	str	r1, [ip, #180]
	str	r2, [ip, #104]
	str	r3, [ip, #28]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L788:
	.align	2
.L787:
	.word	finGame
	.word	player
	.word	1717986919
	.word	1374389535
	.size	initEndGame, .-initEndGame
	.align	2
	.global	endGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	endGame, %function
endGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, lr}
	ldr	r3, .L793
	ldr	r6, .L793+4
.L790:
	ldr	r5, [r3, #24]
	ldr	r0, [r3, #28]
	add	r2, r6, r1
	ldr	r4, [r3]
	ldr	lr, [r3, #4]
	add	r1, r1, #8
	add	ip, r2, #840
	add	r0, r0, r5, lsl #5
	add	r2, r2, #844
	cmp	r1, #24
	strh	r4, [ip]	@ movhi
	strh	lr, [ip, #2]	@ movhi
	add	r3, r3, #76
	strh	r0, [r2]	@ movhi
	bne	.L790
	mov	r0, #99
	mov	r1, #125
	mov	r2, #104
	ldr	r3, .L793+8
	pop	{r4, r5, r6, lr}
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L794:
	.align	2
.L793:
	.word	finGame
	.word	shadowOAM
	.word	shadowOAM+864
	.size	endGame, .-endGame
	.align	2
	.global	gameResetSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameResetSprites, %function
gameResetSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L797
	push	{r4, lr}
	add	r4, r3, #840
	ldrh	r2, [r4]
	add	lr, r3, #848
	add	ip, r3, #856
	orr	r2, r2, #512
	ldrh	r0, [lr]
	ldrh	r1, [ip]
	strh	r2, [r4]	@ movhi
	add	r3, r3, #864
	ldrh	r2, [r3]
	orr	r0, r0, #512
	orr	r1, r1, #512
	orr	r2, r2, #512
	strh	r0, [lr]	@ movhi
	strh	r1, [ip]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L798:
	.align	2
.L797:
	.word	shadowOAM
	.size	gameResetSprites, .-gameResetSprites
	.comm	fish,76,4
	.comm	apple,76,4
	.comm	wine,76,4
	.comm	steak,76,4
	.comm	cookie,76,4
	.comm	obsidianLarge,76,4
	.comm	obsidianMed,76,4
	.comm	obsidianSmall,76,4
	.comm	rubyLarge,76,4
	.comm	rubyMed,76,4
	.comm	rubySmall,76,4
	.comm	platinumLarge,76,4
	.comm	platinumMed,76,4
	.comm	platinumSmall,76,4
	.comm	emeraldLarge,76,4
	.comm	emeraldMed,76,4
	.comm	emeraldSmall,76,4
	.comm	sapphireLarge,76,4
	.comm	sapphireMed,76,4
	.comm	sapphireSmall,76,4
	.comm	diamondLarge,76,4
	.comm	diamondMed,76,4
	.comm	diamondSmall,76,4
	.comm	goldArmor,76,4
	.comm	ironArmor,76,4
	.comm	helm,76,4
	.comm	ring,76,4
	.comm	goldShield,76,4
	.comm	ironShield,76,4
	.comm	sword2,76,4
	.comm	sword1,76,4
	.comm	sandwich,76,4
	.comm	drumstick,76,4
	.comm	fishDead,76,4
	.comm	egg,76,4
	.comm	boneMeat,76,4
	.comm	cheese,76,4
	.comm	finGame,228,4
	.comm	startedMan,4,4
	.comm	man,88,4
	.comm	cheatTens,304,4
	.comm	cheatUnits,304,4
	.comm	cheating,4,4
	.comm	placingInstructionsCompleted,4,4
	.comm	placingTrigger,4,4
	.comm	placingInstruction,4,4
	.comm	cancel,4,4
	.comm	tensInitial,4,4
	.comm	unitsInitial,4,4
	.comm	selectingItem,4,4
	.comm	currentDay,4,4
	.comm	tempEvent,4,4
	.comm	faces,304,4
	.comm	customers,352,4
	.comm	currency,228,4
	.comm	currentItem,4,4
	.comm	currentPair,4,4
	.comm	firstPriceChange,4,4
	.comm	changingPrice,4,4
	.comm	lost,4,4
	.comm	won,4,4
	.comm	beginSelection,4,4
	.comm	firstPricing,4,4
	.comm	priced,4,4
	.comm	pricePointer,4,4
	.comm	unitsCounter,304,4
	.comm	tensCounter,304,4
	.comm	selected,4,4
	.comm	arrow,76,4
	.comm	placementCounter,4,4
	.comm	items,608,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	player,48,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
