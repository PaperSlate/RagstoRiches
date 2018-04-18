

#include <stdlib.h>
#include <stdio.h>
#include "game.h"
#include "myLib.h"
#include "title.h"
#include "player.h"
#include "itemShop.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "textBox.h"
#include "instructions.h"
#include "sound.h"
#include "gameMusic.h"
#include "menuSFX.h"
#include "textBoxPlacingInstructions.h"
#include "textBoxManDay1.h"
#include "textBoxManDay2.h"
#include "textBoxWon.h"
#include "textBoxLost.h"
#include "instructions1.h"
#include "instructions2.h"
#include "instructions3.h"
#include "instructions4.h"


// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void goToPlacing();
void placing();
void goToPricing();
void pricing();
void goToPriceChange();
void priceChange();
void goToInstructions();
void instructions();
void placingInstructions();

// States
enum {START, GAME, PAUSE, WIN, LOSE, PLACING, PRICING, PRICECHANGE, INSTRUCTIONS, PLACINGINSTRUCTIONS, MANCOUNTER, INSTRUCTIONS1, INSTRUCTIONS2, INSTRUCTIONS3, INSTRUCTIONS4};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// Miscellaneous Triggers
int first;
int firstSelecting;

OBJ_ATTR shadowOAM[128];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            case PLACING:
            	placing();
            	break;
            case PRICING:
            	pricing();
            	break;
            case PRICECHANGE:
            	priceChange();
            	break;
            case INSTRUCTIONS:
            	instructions();
            	break;
            case PLACINGINSTRUCTIONS:
                placingInstructions();
                break;
            case MANCOUNTER:
                manCounter();
                break;
            case INSTRUCTIONS1:
                instructions1();
                break;
            case INSTRUCTIONS2:
                instructions2();
                break;
            case INSTRUCTIONS3:
                instructions3();
                break;
            case INSTRUCTIONS4:
                instructions4();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    setupSounds();
    setupInterrupts();
    stopSound();
    first = 1;
    firstSelecting = 1;
    currentDay = 1;
    player.value = 0;
    goToStart();
}

// Sets up the start state
void goToStart() {

    // DMA's the background of this state so that it shows correctly
    DMANow(3, titlePal, PALETTE, titlePalLen / 2);
    DMANow(3, titleTiles, &CHARBLOCK[0], titleTilesLen / 2);
    DMANow(3, titleMap, &SCREENBLOCK[31], titleMapLen / 2);

    hideSprites();

    // Sets up the background controller
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP | BG_SIZE_SMALL;

    waitForVBlank();

    state = START;
    first = 1;

    seed = 0;
}

// Runs every frame of the start state
void start() {

    seed++;

    waitForVBlank();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
    	goToInstructions();
        playSoundA(gameMusic, GAMEMUSICLEN, GAMEMUSICFREQ, 1);
        srand(seed);
    }
}

void goToInstructions() {
	DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[31], instructionsMapLen / 2);

    hideSprites();

    waitForVBlank();

    state = INSTRUCTIONS;
}

void instructions() {
	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
		goToInstructions1();
	}
}

void goToInstructions1() {
    DMANow(3, instructions1Pal, PALETTE, instructions1PalLen / 2);
    DMANow(3, instructions1Tiles, &CHARBLOCK[0], instructions1TilesLen / 2);
    DMANow(3, instructions1Map, &SCREENBLOCK[31], instructions1MapLen / 2);

    hideSprites();

    waitForVBlank();

    state = INSTRUCTIONS1;
}

void instructions1() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions2();
    }
}

void goToInstructions2() {
    DMANow(3, instructions2Pal, PALETTE, instructions2PalLen / 2);
    DMANow(3, instructions2Tiles, &CHARBLOCK[0], instructions2TilesLen / 2);
    DMANow(3, instructions2Map, &SCREENBLOCK[31], instructions2MapLen / 2);

    hideSprites();

    waitForVBlank();

    state = INSTRUCTIONS2;
}

void instructions2() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions3();
    }
}

void goToInstructions3() {
    DMANow(3, instructions3Pal, PALETTE, instructions3PalLen / 2);
    DMANow(3, instructions3Tiles, &CHARBLOCK[0], instructions3TilesLen / 2);
    DMANow(3, instructions3Map, &SCREENBLOCK[31], instructions3MapLen / 2);

    hideSprites();

    waitForVBlank();

    state = INSTRUCTIONS3;
}

void instructions3() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions4();
    }
}

void goToInstructions4() {
    DMANow(3, instructions4Pal, PALETTE, instructions4PalLen / 2);
    DMANow(3, instructions4Tiles, &CHARBLOCK[0], instructions4TilesLen / 2);
    DMANow(3, instructions4Map, &SCREENBLOCK[31], instructions4MapLen / 2);

    hideSprites();

    waitForVBlank();

    state = INSTRUCTIONS4;
}

void instructions4() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

// Sets up the game state
void goToGame() {
    // DMA's the background of this state so that it shows correctly
    DMANow(3, itemShopPal, PALETTE, itemShopPalLen / 2);
    DMANow(3, itemShopTiles, &CHARBLOCK[0], itemShopTilesLen / 2);
    DMANow(3, itemShopMap, &SCREENBLOCK[30], itemShopMapLen / 2);

    DMANow(3, playerPal, SPRITEPALETTE, playerPalLen / 2);
    DMANow(3, playerTiles, &CHARBLOCK[4], playerTilesLen / 2);

    DMANow(3, textBoxTiles, &CHARBLOCK[1], textBoxTilesLen / 2);
    DMANow(3, textBoxMap, &SCREENBLOCK[26], textBoxMapLen / 2);
    REG_BG0VOFF = -5;
    REG_BG0HOFF = -70;
    // Sets up the background controller
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_8BPP | BG_SIZE_SMALL;

    waitForVBlank();
    
    state = GAME;
    if (first) {
    	initGame();
        initCheat();
    	first = 0;
    }
}

// Runs every frame of the game state
void game() {

    updateGame();
    checkOver();
    cheat();
    updateMan();
    drawMan();
    drawGame();

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    if (beginSelection) {
    	goToPlacing();
    }
    if (changingPrice) {
    	goToPriceChange();
    }
    if (won) {
    	goToWin();
    }
    if (lost) {
    	goToLose();
    }
    if (currentDay == 1) {
        if (placingInstruction) {
            goToPlacingInstructions();
        }
    }
    if (man.atCounter) {
        goToManCounter();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        if (cheating) {
            cheating = 0;
        } else {
            cheating = 1;
        }
    }
}

void goToManCounter() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    switch(currentDay) {
        case 1:
            DMANow(3, textBoxManDay1Tiles, &CHARBLOCK[1], textBoxManDay1TilesLen / 2);
            DMANow(3, textBoxManDay1Map, &SCREENBLOCK[26], textBoxManDay1MapLen / 2);
            break;
        case 2:
            DMANow(3, textBoxManDay2Tiles, &CHARBLOCK[1], textBoxManDay2TilesLen / 2);
            DMANow(3, textBoxManDay2Map, &SCREENBLOCK[26], textBoxManDay2MapLen / 2);
            break;
    }

    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(26) | BG_8BPP | BG_SIZE_SMALL;

    waitForVBlank();

    state = MANCOUNTER;
}

void manCounter() {
    updateMan();
    drawMan();

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_A)) {
        goToGame();
        REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
        man.atCounter = 0;
        man.active = 0;
    }
}

void goToPlacingInstructions() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    DMANow(3, textBoxPlacingInstructionsTiles, &CHARBLOCK[1], textBoxPlacingInstructionsTilesLen / 2);
    DMANow(3, textBoxPlacingInstructionsMap, &SCREENBLOCK[26], textBoxPlacingInstructionsMapLen / 2);

    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(26) | BG_8BPP | BG_SIZE_SMALL;

    waitForVBlank();

    state = PLACINGINSTRUCTIONS;
}

void placingInstructions() {
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToGame();
        REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
        placingInstruction = 0;
        placingInstructionsCompleted = 1;
    }
}

void goToPlacing() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(26) | BG_8BPP | BG_SIZE_SMALL;
	waitForVBlank();
	if (firstSelecting) {
		initItems();
		firstSelecting = 0;
	}
	initSelecting();

	state = PLACING;
}

void placing() {
	updateSelecting();
	drawSelecting();
    DMANow(3, items[placementCounter].tiles, &CHARBLOCK[1], items[placementCounter].tilesLen / 2);
    DMANow(3, items[placementCounter].map, &SCREENBLOCK[26], items[placementCounter].mapLen / 2);

	waitForVBlank();

	if (selected) {
		//REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
		goToPricing();
	}
    if (cancel) {
        REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
        beginSelection = 0;
        priced = 0;
        selected = 0;
        cancel = 0;
        goToGame();
    }
}

void goToPricing() {
	initPricing();
	waitForVBlank();

	state = PRICING;
}

void pricing() {
	updatePricing();
	drawPricing();

	waitForVBlank();

	if (priced) {
		REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
		goToGame();
		beginSelection = 0;
		priced = 0;
	}
}

void goToPriceChange() {
	firstPriceChange = 1;
	initChangePrice();

	waitForVBlank();

	state = PRICECHANGE;
}

void priceChange() {
	changePrice();
	drawChangePrice();

	waitForVBlank();

	if (priced) {
		priced = 0;
		changingPrice = 0;
		goToGame();
	}
}

// Sets up the pause state
void goToPause() {

    hideSprites();

    waitForVBlank();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    // DMA's the background of this state so that it shows correctly
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[30], pauseMapLen / 2);

    waitForVBlank();
    // Sets up the background controller
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_8BPP | BG_SIZE_SMALL;


    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
        goToStart();
    }
}

// Sets up the pre-win state
void goToWin() {
    hideSprites();
    // DMA's the background of this state so that it shows correctly
    DMANow(3, winPal, PALETTE, winPalLen / 2);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[31], winMapLen / 2);

    initEndGame();

    waitForVBlank();
    // Sets up the background controller
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;


    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = WIN;
}

// Runs every frame of the win state
void win() {
    endGame();
    
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
        gameResetSprites();
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    hideSprites();
    // DMA's the background of this state so that it shows correctly
    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen / 2);
    initEndGame();

    waitForVBlank();
    // Sets up the background controller
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;


    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    endGame();
     
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
        gameResetSprites();
        goToStart();
    }
}
