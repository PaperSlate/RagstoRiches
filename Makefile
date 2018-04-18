PRODUCT_NAME       = Project
SOURCES            = main.c myLib.c itemShop.c title.c player.c game.c pause.c win.c lose.c textBox.c instructions.c collisionMap.c textBoxCheese.c textBoxBoneMeat.c textBoxEgg.c textBoxFishDead.c textBoxDrumstick.c textBoxSandwich.c textBoxSword1.c textBoxSword2.c textBoxIronShield.c textBoxGoldShield.c textBoxRing.c textBoxHelm.c textBoxIronArmor.c textBoxGoldArmor.c textBoxDiamondSmall.c textBoxDiamondMed.c textBoxDiamondLarge.c textBoxSapphireSmall.c textBoxSapphireMed.c textBoxSapphireLarge.c textBoxEmeraldSmall.c textBoxEmeraldMed.c textBoxEmeraldLarge.c textBoxPlatinumSmall.c textBoxPlatinumMed.c textBoxPlatinumLarge.c textBoxRubySmall.c textBoxRubyMed.c textBoxRubyLarge.c textBoxObsidianSmall.c textBoxObsidianMed.c textBoxObsidianLarge.c textBoxCookie.c textBoxSteak.c textBoxWine.c textBoxApple.c textBoxFish.c sound.c gameMusic.c menuSFX.c priceSFX.c textBoxPlacingInstructions.c textBoxManDay1.c kaching.c textBoxManDay2.c textBoxWon.c textBoxLost.c instructions1.c instructions2.c instructions3.c instructions4.c
CCPATH             = /usr/bin
DKPATH             = /Users/mohammed/Desktop/cs2261/devkitARM/bin
VBASIM             = open /Users/mohammed/Desktop/cs2261/visualboyadvance-m.app
FIND               = find
COPY               = cp -r

# --- File Names
ELF_NAME           = $(PRODUCT_NAME).elf
ROM_NAME           = $(PRODUCT_NAME).gba
BIN_NAME           = $(PRODUCT_NAME)

#MODEL              = -mthumb-interwork -mthumb
MODEL              = -mthumb-interwork -marm -mlong-calls #This makes interrupts work
SPECS              = -specs=gba.specs

# --- Archiver
AS                 = $(DKPATH)/arm-none-eabi-as
ASFLAGS            = -mthumb-interwork

# --- Compiler
CC                 = $(DKPATH)/arm-none-eabi-gcc
CFLAGS             = $(MODEL) -O2 -Wall -pedantic -Wextra -std=c99 -save-temps -D_ROM=$(ROM_NAME) -D_VBA=$(VBASIM)


# --- Linker
LD                 = $(DKPATH)/arm-none-eabi-gcc
LDFLAGS            = $(SPECS) $(MODEL) -lm

# --- Object/Executable Packager
OBJCOPY            = $(DKPATH)/arm-none-eabi-objcopy
OBJCOPYFLAGS       = -O binary

# --- ROM Fixer
GBAFIX             = $(DKPATH)/gbafix

# --- Delete
RM                 = rm -f

OBJECTS = $(SOURCES:.c=.o)


# --- Main build target

all : clean run

run : $(ROM_NAME)
	$(VBASIM) $(ROM_NAME)


build : $(ROM_NAME)

# --- Build .elf file into .gba ROM file
$(ROM_NAME) : $(ELF_NAME)
	$(OBJCOPY) $(OBJCOPYFLAGS) $(ELF_NAME) $(ROM_NAME)
	$(GBAFIX) $(ROM_NAME)

# --- Build .o files into .elf file
$(ELF_NAME) : $(OBJECTS)
	$(LD) $(OBJECTS) $(LDFLAGS) -o $@

# -- Build .c files into .o files
$(OBJECTS) : %.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@



clean:
	$(RM) $(ROM_NAME)
	$(RM) $(ELF_NAME)
	$(RM) $(BIN_NAME)
	$(RM) *.o
