#ifdef TI73
#define LINK_ASSIST_RO
.equ PRIVILEGED_PAGE 0x1C
.equ BOOT_PAGE       0x1F
#endif

#ifdef TI83p
#define LINK_ASSIST_RO
.equ PRIVILEGED_PAGE 0x1C
.equ BOOT_PAGE       0x1F
#endif

#ifdef TI83pSE
#define CPU15
#define CRYSTAL_TIMERS
#define LINK_ASSIST
#define MD5_ACCELERATION
.equ PRIVILEGED_PAGE 0x7C
.equ BOOT_PAGE       0x7F
#endif

#ifdef TI84p
#define CPU15
#define CRYSTAL_TIMERS
#define LINK_ASSIST
#define MD5_ACCELERATION
#define USB
#define CLOCK
.equ PRIVILEGED_PAGE 0x3C
.equ BOOT_PAGE       0x3F
#endif

#ifdef TI84pSE
#define CPU15
#define CRYSTAL_TIMERS
#define LINK_ASSIST
#define MD5_ACCELERATION
#define USB
#define CLOCK
.equ PRIVILEGED_PAGE 0x7C
.equ BOOT_PAGE       0x7F
#endif

#ifdef TI84pCSE
#define CPU15
#define CRYSTAL_TIMERS
#define LINK_ASSIST
#define MD5_ACCELERATION
#define USB
#define CLOCK
#define COLOR
#define FLASH4MB
.equ PRIVILEGED_PAGE 0xFC
.equ BOOT_PAGE       0xFF

.macro lcdout(reg, value)
    ld a, reg
    ld hl, value
    call writeLcdRegister
.endmacro
#endif

#ifndef FLASH4MB
.macro SET_BANK_A
    out (6), a
.endmacro

.macro SET_BANK_A(page)
    ld a, page
    out (6), a
.endmacro

.macro GET_BANK_A
    in a, (6)
.endmacro

.macro SET_BANK_B
    out (7), a
.endmacro

.macro SET_BANK_B(page)
    ld a, page
    out (7), a
.endmacro

.macro GET_BANK_B
    in a, (7)
.endmacro
#else

; TODO: Flesh out color support

#endif
