#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "player.h"
#include "collisionMap.h"
#include "textBoxCheese.h"
#include "textBoxBoneMeat.h"
#include "textBoxEgg.h"
#include "textBoxFishDead.h"
#include "textBoxDrumstick.h"
#include "textBoxSandwich.h"
#include "textBoxSword1.h"
#include "textBoxSword2.h"
#include "textBoxIronShield.h"
#include "textBoxGoldShield.h"
#include "textBoxRing.h"
#include "textBoxHelm.h"
#include "textBoxIronArmor.h"
#include "textBoxGoldArmor.h"
#include "textBoxDiamondSmall.h"
#include "textBoxDiamondMed.h"
#include "textBoxDiamondLarge.h"
#include "textBoxSapphireSmall.h"
#include "textBoxSapphireMed.h"
#include "textBoxSapphireLarge.h"
#include "textBoxEmeraldSmall.h"
#include "textBoxEmeraldMed.h"
#include "textBoxEmeraldLarge.h"
#include "textBoxPlatinumSmall.h"
#include "textBoxPlatinumMed.h"
#include "textBoxPlatinumLarge.h"
#include "textBoxRubySmall.h"
#include "textBoxRubyMed.h"
#include "textBoxRubyLarge.h"
#include "textBoxObsidianSmall.h"
#include "textBoxObsidianMed.h"
#include "textBoxObsidianLarge.h"
#include "textBoxCookie.h"
#include "textBoxSteak.h"
#include "textBoxWine.h"
#include "textBoxApple.h"
#include "textBoxFish.h"
#include "sound.h"
#include "menuSFX.h"
#include "priceSFX.h"
#include "textBoxPlacingInstructions.h"
#include "kaching.h"


// Variables
PLAYER player;
int hOff;
int vOff;
enum {PLAYERFRONT, PLAYERRIGHT, PLAYERBACK, PLAYERLEFT, PLAYERIDLE};
ITEM items[ITEMCOUNT];
int placementCounter;
ITEM arrow;
int selected;
ITEM tensCounter[4];
ITEM unitsCounter[4];
int pricePointer;
int priced;
int firstPricing;
int beginSelection;
int won;
int lost;
int changingPrice;
int firstPriceChange;
int currentPair;
int currentItem;
ITEM currency[3];
CUSTOMER customers[4];
enum {CUSTOMERFRONT = 4, CUSTOMERRIGHT, CUSTOMERBACK, CUSTOMERLEFT, CUSTOMERIDLE};
ITEM faces[4];
int tempEvent;
int currentDay;
int selectingItem;
int unitsInitial;
int tensInitial;
int cancel;
int placingInstruction;
int placingTrigger;
int placingInstructionsCompleted;
int cheating;
ITEM cheatUnits[4];
ITEM cheatTens[4];
CUSTOMER man;
int startedMan;
ITEM finGame[3];

// Each Item
ITEM cheese;
ITEM boneMeat;
ITEM egg;
ITEM fishDead;
ITEM drumstick;
ITEM sandwich;
ITEM sword1;
ITEM sword2;
ITEM ironShield;
ITEM goldShield;
ITEM ring;
ITEM helm;
ITEM ironArmor;
ITEM goldArmor;
ITEM diamondSmall;
ITEM diamondMed;
ITEM diamondLarge;
ITEM sapphireSmall;
ITEM sapphireMed;
ITEM sapphireLarge;
ITEM emeraldSmall;
ITEM emeraldMed;
ITEM emeraldLarge;
ITEM platinumSmall;
ITEM platinumMed;
ITEM platinumLarge;
ITEM rubySmall;
ITEM rubyMed;
ITEM rubyLarge;
ITEM obsidianSmall;
ITEM obsidianMed;
ITEM obsidianLarge;
ITEM cookie;
ITEM steak;
ITEM wine;
ITEM apple;
ITEM fish;




// Initialize the game
void initGame() {
	// Initializes all components of the game
	initPlayer();
	initCurrency();
	initFaces();
	initCustomers();
	initItems();
	won = 0;
	lost = 0;
	firstPricing = 1;
	placingTrigger = 0;
	placingInstructionsCompleted = 0;
	cheating = 0;
	startedMan = 0;
	switch (currentDay) {
		case 1:
			day1();
			break;
		case 2:
			day2();
			break;
		case 3:
			day3();
			break;
	}
}

// Updates the game each frame
void updateGame() {
	// Updates all the components of the game
	updatePlayer();
	updateCurrency();
	updateCustomers();
	if (!placingInstructionsCompleted && placingTrigger < 60) {
		placingTrigger++;
	} else if (!placingInstructionsCompleted && placingTrigger >= 60) {
		placingInstruction = 1;
	}

}

// Draws the game each frame
void drawGame() {
	// Draws all components of the game
	drawPlayer();
	drawCurrency();
	drawRest();
	drawFaces();
	drawCustomers();
	DMANow(3, shadowOAM, OAM, 128 * 4);
}


// Initialize the player
void initPlayer() {
    player.row = 80;
    player.col = 100;
    player.cdel = 1;
    player.rdel = 1;
    player.width = 16;
    player.height = 32;
    player.aniCounter = 0;
    player.aniState = PLAYERFRONT;
    player.curFrame = 0;
    player.numFrames = 4;
}

// Handle every-frame actions of the player
void updatePlayer() {
	if (player.aniState != PLAYERIDLE) {
		player.prevAniState = player.aniState;
		player.aniState = PLAYERIDLE;
	}

	if (player.aniCounter % 13 == 0) {
		player.curFrame = (player.curFrame + 1) % player.numFrames;
	}

	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT)) {
		if (player.col > 0 && collisionMapBitmap[OFFSET(player.row + (player.height / 2), player.col - 1, 240)]
            && collisionMapBitmap[OFFSET(player.row + player.height - 1, player.col - 1, 240)]) {
			player.col -= player.cdel;
		}
		player.aniState = PLAYERLEFT;
	}
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		if (player.col < 240 - player.width && collisionMapBitmap[OFFSET(player.row + (player.height / 2), player.col + player.width + 1, 240)]
            && collisionMapBitmap[OFFSET(player.row + player.height - 1, player.col + player.width + 1, 240)]) {
			player.col += player.cdel;
		}
		player.aniState = PLAYERRIGHT;
	} 
	if (BUTTON_HELD(BUTTON_UP)) {
		if (player.row > 0 && collisionMapBitmap[OFFSET(player.row + (player.height / 2) - 1, player.col, 240)] 
            && collisionMapBitmap[OFFSET(player.row + (player.height / 2) - 1, player.col + player.width, 240)]) {
			player.row -= player.rdel;
		}
		player.aniState = PLAYERBACK;
	}
	if (BUTTON_HELD(BUTTON_DOWN)) {
		if (player.row < 160 - player.height && collisionMapBitmap[OFFSET(player.row + player.height + 1, player.col, 240)]
            && collisionMapBitmap[OFFSET(player.row + player.height + 1, player.col + player.width, 240)]) {
			player.row += player.rdel;
		}
		player.aniState = PLAYERFRONT;
	}

	// Collision and button polling for placing an item and changing price
	if (collision(player.row, player.col, 16, player.width, 60, 142, 16, 16)) {
		if (BUTTON_PRESSED(BUTTON_A)) {
			tempEvent = 1;
			for (int i = 0; i < ITEMCOUNT; i++) {
				if (items[i].location == 4) {
					tempEvent = 0;
				}
			}
			if (tempEvent) {
				beginSelection = 4;
				playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
			}
		}
		if (BUTTON_PRESSED(BUTTON_B)) {
			if (unitsCounter[3].inUse && tensCounter[3].inUse) {
				currentPair = 4;
				changingPrice = 1;
				playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
			}
		}
	}
	if (collision(player.row, player.col, 16, player.width, 60, 126, 16, 16)) {
		if (BUTTON_PRESSED(BUTTON_A)) {
			tempEvent = 1;
			for (int i = 0; i < ITEMCOUNT; i++) {
				if (items[i].location == 3) {
					tempEvent = 0;
				}
			}
			if (tempEvent) {
				beginSelection = 3;
				playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
			}
		}
		if (BUTTON_PRESSED(BUTTON_B)) {
			if (unitsCounter[2].inUse && tensCounter[2].inUse) {
				currentPair = 3;
				changingPrice = 1;
				playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
			}
		}
	}
	if (collision(player.row, player.col, 16, player.width, 60, 110, 16, 16)) {
		if (BUTTON_PRESSED(BUTTON_A)) {
			tempEvent = 1;
			for (int i = 0; i < ITEMCOUNT; i++) {
				if (items[i].location == 2) {
					tempEvent = 0;
				}
			}
			if (tempEvent) {
				beginSelection = 2;
				playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
			}
		}
		if (BUTTON_PRESSED(BUTTON_B)) {
			if (unitsCounter[1].inUse && tensCounter[1].inUse) {
				currentPair = 2;
				changingPrice = 1;
				playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
			}
		}
	}
	if (collision(player.row, player.col, 16, player.width, 60, 94, 16, 16)) {
		if (BUTTON_PRESSED(BUTTON_A)) {
			tempEvent = 1;
			for (int i = 0; i < ITEMCOUNT; i++) {
				if (items[i].location == 1) {
					tempEvent = 0;
				}
			}
			if (tempEvent) {
				beginSelection = 1;
				playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
			}
		}
		if (BUTTON_PRESSED(BUTTON_B)) {
			if (unitsCounter[0].inUse && tensCounter[0].inUse) {
				currentPair = 1;
				changingPrice = 1;
				playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
			}
		}
	}

	if (player.aniState == PLAYERIDLE) {
		player.aniState = player.prevAniState;
		player.curFrame = 0;
	} else {
		player.aniCounter++;
	}
}

// Draw the player
void drawPlayer() {
	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 4, player.curFrame * 2); 
}

// Draws the rest of the game besides the player
void drawRest() {
	for (int i = 0; i < 4; i ++) {
		if (unitsCounter[i].active) {
			shadowOAM[29 + i * 2].attr0 = tensCounter[i].row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[29 + i * 2].attr1 = tensCounter[i].col | ATTR1_TINY;
			shadowOAM[29 + i * 2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tensCounter[i].spriteRow, tensCounter[i].spriteCol);
		} else {
			shadowOAM[29 + i * 2].attr0 |= ATTR0_HIDE;
		}
		if (tensCounter[i].active) {
			shadowOAM[30 + i * 2].attr0 = unitsCounter[i].row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[30 + i * 2].attr1 = unitsCounter[i].col | ATTR1_TINY;
			shadowOAM[30 + i * 2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(unitsCounter[i].spriteRow, unitsCounter[i].spriteCol);
		} else {
			shadowOAM[30 + i * 2].attr0 |= ATTR0_HIDE;
		}
	}
	for (int i = 0; i < ITEMCOUNT; i++) {
		if (items[i].inUse && !items[i].sold) {
			shadowOAM[21 + i].attr0 = items[i].row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[21 + i].attr1 = items[i].col | ATTR1_SMALL;
			shadowOAM[21 + i].attr2 = ATTR2_PALROW(items[i].palrow) | ATTR2_TILEID(items[i].spriteRow * 2, items[i].spriteCol * 2);
		} else {
			shadowOAM[21 + i].attr0 |= ATTR0_HIDE;
		}
	}
}

void initChangePrice() {
	for (int i = 0; i < ITEMCOUNT; i++) {
		if (items[i].location == currentPair) {
			currentItem = i;
		}
	}
	priced = 0;
	unitsInitial = unitsCounter[currentPair - 1].value;
	tensInitial = tensCounter[currentPair - 1].value;
}

void changePrice() {
	if (pricePointer) {
		if (BUTTON_PRESSED(BUTTON_UP)) {
			if (unitsCounter[currentPair - 1].value < 9) {
				unitsCounter[currentPair - 1].value++;
			} else {
				unitsCounter[currentPair - 1].value = 0;
			}
			unitsCounter[currentPair - 1].spriteCol += 1;
			if (unitsCounter[currentPair - 1].spriteCol == 18) {
				unitsCounter[currentPair - 1].spriteCol = 8;
			}
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
		if (BUTTON_PRESSED(BUTTON_DOWN)) {
			if (unitsCounter[currentPair - 1].value > 0) {
				unitsCounter[currentPair - 1].value--;
			} else {
				unitsCounter[currentPair - 1].value = 9;
			}
			unitsCounter[currentPair - 1].spriteCol -= 1;
			if (unitsCounter[currentPair - 1].spriteCol == 7) {
				unitsCounter[currentPair - 1].spriteCol = 17;
			}
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
		if (BUTTON_PRESSED(BUTTON_LEFT)) {
			pricePointer = 0;
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
	} else {
		if (BUTTON_PRESSED(BUTTON_UP)) {
			if (tensCounter[currentPair - 1].value < 9) {
				tensCounter[currentPair - 1].value++;
			} else {
				tensCounter[currentPair - 1].value = 0;
			}
			tensCounter[currentPair - 1].spriteCol += 1;
			if (tensCounter[currentPair - 1].spriteCol == 18) {
				tensCounter[currentPair - 1].spriteCol = 8;
			}
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
		if (BUTTON_PRESSED(BUTTON_DOWN)) {
			if (tensCounter[currentPair - 1].value > 0) {
				tensCounter[currentPair - 1].value--;
			} else {
				tensCounter[currentPair - 1].value = 9;
			}
			tensCounter[currentPair - 1].spriteCol -= 1;
			if (tensCounter[currentPair - 1].spriteCol == 7) {
				tensCounter[currentPair - 1].spriteCol = 17;
			}
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
		if (BUTTON_PRESSED(BUTTON_RIGHT)) {
			pricePointer = 1;
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
	}

	if (BUTTON_PRESSED(BUTTON_B)) {
		items[currentItem].price = unitsInitial + (10 * tensInitial);
		unitsCounter[currentPair - 1].spriteCol = unitsInitial + 8; 
		tensCounter[currentPair - 1].spriteCol = tensInitial + 8;
		priced = 1;
		playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
	}

	if (BUTTON_PRESSED(BUTTON_A)) {
		items[currentItem].price = unitsCounter[currentPair - 1].value + (tensCounter[currentPair - 1].value * 10);
		priced = 1;
		playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
	}
	// DO PRICE STUFF
}

void drawChangePrice() {
	shadowOAM[29 + (currentPair - 1) * 2].attr0 = tensCounter[currentPair - 1].row | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[29 + (currentPair - 1) * 2].attr1 = tensCounter[currentPair - 1].col | ATTR1_TINY;
	shadowOAM[29 + (currentPair - 1) * 2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tensCounter[currentPair - 1].spriteRow, tensCounter[currentPair - 1].spriteCol);
	shadowOAM[30 + (currentPair - 1) * 2].attr0 = unitsCounter[currentPair - 1].row | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[30 + (currentPair - 1) * 2].attr1 = unitsCounter[currentPair - 1].col | ATTR1_TINY;
	shadowOAM[30 + (currentPair - 1) * 2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(unitsCounter[currentPair - 1].spriteRow, unitsCounter[currentPair - 1].spriteCol);
	DMANow(3, shadowOAM, OAM, 128 * 4);
}



// Section for code dealing with when a player is trying to place an item on the counter
void initSelecting() {
	placementCounter = 0;
	for (int i = 0; i < 4; i++) {
		if (!items[i].inUse) {
			items[i].row = 5;
			items[i].col = 80 + 16 * i;
			items[i].active = 1;
		}
	}
	for (int i = 4; i < 8; i++) {
		if (!items[i].inUse) {
			items[i].row = 25;
			items[i].col = 80 + 16 * (i - 4);
			items[i].active = 1;
		}
	}
	arrow.row = 5;
	arrow.col = 80;
	arrow.width = 16;
	arrow.height = 16;
	arrow.spriteRow = 0;
	arrow.spriteCol = 12;
	arrow.active = 1;
	selected = 0;
	selectingItem = 1;
}

void initItems() {
	cheese.row = 0;
	cheese.col = 0;
	cheese.width = 16;
	cheese.height = 16;
	cheese.value = 10; 
	cheese.spriteRow = 0;
	cheese.spriteCol = 8 - 4;
	cheese.active = 0; 
	cheese.inUse = 0; 
	cheese.sold = 0;
	cheese.leeway = 5;
	cheese.palrow = 0;
	cheese.tiles = textBoxCheeseTiles;
	cheese.tilesLen = textBoxCheeseTilesLen;
	cheese.map = textBoxCheeseMap;
	cheese.mapLen = textBoxCheeseMapLen;

	boneMeat.row = 0;
	boneMeat.col = 0;
	boneMeat.width = 16;
	boneMeat.height = 16;
	boneMeat.value = 20; 
	boneMeat.spriteRow = 0;
	boneMeat.spriteCol = 9 - 4;
	boneMeat.active = 0; 
	boneMeat.inUse = 0; 
	boneMeat.sold = 0;
	boneMeat.leeway = 5;
	boneMeat.palrow = 0;
	boneMeat.tiles = textBoxBoneMeatTiles;
	boneMeat.tilesLen = textBoxBoneMeatTilesLen;
	boneMeat.map = textBoxBoneMeatMap;
	boneMeat.mapLen = textBoxBoneMeatMapLen;

	egg.row = 0;
	egg.col = 0;
	egg.width = 16;
	egg.height = 16;
	egg.value = 5; 
	egg.spriteRow = 0;
	egg.spriteCol = 10 - 4;
	egg.active = 0; 
	egg.inUse = 0; 
	egg.sold = 0;
	egg.leeway = 5;
	egg.palrow = 0;
	egg.tiles = textBoxEggTiles;
	egg.tilesLen = textBoxEggTilesLen;
	egg.map = textBoxEggMap;
	egg.mapLen = textBoxEggMapLen;

	fishDead.row = 0;
	fishDead.col = 0;
	fishDead.width = 16;
	fishDead.height = 16;
	fishDead.value = 20; 
	fishDead.spriteRow = 0;
	fishDead.spriteCol = 11 - 4;
	fishDead.active = 0; 
	fishDead.inUse = 0; 
	fishDead.sold = 0;
	fishDead.leeway = 5;
	fishDead.palrow = 0;
	fishDead.tiles = textBoxFishDeadTiles;
	fishDead.tilesLen = textBoxFishDeadTilesLen;
	fishDead.map = textBoxFishDeadMap;
	fishDead.mapLen = textBoxFishDeadMapLen;

	drumstick.row = 0;
	drumstick.col = 0;
	drumstick.width = 16;
	drumstick.height = 16;
	drumstick.value = 10; 
	drumstick.spriteRow = 0;
	drumstick.spriteCol = 12 - 4;
	drumstick.active = 0; 
	drumstick.inUse = 0; 
	drumstick.sold = 0;
	drumstick.leeway = 5;
	drumstick.palrow = 0;
	drumstick.tiles = textBoxDrumstickTiles;
	drumstick.tilesLen = textBoxDrumstickTilesLen;
	drumstick.map = textBoxDrumstickMap;
	drumstick.mapLen = textBoxDrumstickMapLen;

	sandwich.row = 0;
	sandwich.col = 0;
	sandwich.width = 16;
	sandwich.height = 16;
	sandwich.value = 10; 
	sandwich.spriteRow = 0;
	sandwich.spriteCol = 13 - 4;
	sandwich.active = 0; 
	sandwich.inUse = 0; 
	sandwich.sold = 0;
	sandwich.leeway = 5;
	sandwich.palrow = 0;
	sandwich.tiles = textBoxSandwichTiles;
	sandwich.tilesLen = textBoxSandwichTilesLen;
	sandwich.map = textBoxSandwichMap;
	sandwich.mapLen = textBoxSandwichMapLen;

	sword1.row = 0;
	sword1.col = 0;
	sword1.width = 16;
	sword1.height = 16;
	sword1.value = 25; 
	sword1.spriteRow = 2;
	sword1.spriteCol = 8 - 4;
	sword1.active = 0; 
	sword1.inUse = 0; 
	sword1.sold = 0;
	sword1.leeway = 10;
	sword1.palrow = 3;
	sword1.tiles = textBoxSword1Tiles;
	sword1.tilesLen = textBoxSword1TilesLen;
	sword1.map = textBoxSword1Map;
	sword1.mapLen = textBoxSword1MapLen;

	sword2.row = 0;
	sword2.col = 0;
	sword2.width = 16;
	sword2.height = 16;
	sword2.value = 60; 
	sword2.spriteRow = 2;
	sword2.spriteCol = 9 - 4;
	sword2.active = 0; 
	sword2.inUse = 0; 
	sword2.sold = 0;
	sword2.leeway = 15;
	sword2.palrow = 3;
	sword2.tiles = textBoxSword2Tiles;
	sword2.tilesLen = textBoxSword2TilesLen;
	sword2.map = textBoxSword2Map;
	sword2.mapLen = textBoxSword2MapLen;

	ironShield.row = 0;
	ironShield.col = 0;
	ironShield.width = 16;
	ironShield.height = 16;
	ironShield.value = 30; 
	ironShield.spriteRow = 3;
	ironShield.spriteCol = 8 - 4;
	ironShield.active = 0; 
	ironShield.inUse = 0; 
	ironShield.sold = 0;
	ironShield.leeway = 10;
	ironShield.palrow = 3;
	ironShield.tiles = textBoxIronShieldTiles;
	ironShield.tilesLen = textBoxIronShieldTilesLen;
	ironShield.map = textBoxIronShieldMap;
	ironShield.mapLen = textBoxIronShieldMapLen;

	goldShield.row = 0;
	goldShield.col = 0;
	goldShield.width = 16;
	goldShield.height = 16;
	goldShield.value = 60; 
	goldShield.spriteRow = 3;
	goldShield.spriteCol = 9 - 4;
	goldShield.active = 0; 
	goldShield.inUse = 0; 
	goldShield.sold = 0;
	goldShield.leeway = 10;
	goldShield.palrow = 3;
	goldShield.tiles = textBoxGoldShieldTiles;
	goldShield.tilesLen = textBoxGoldShieldTilesLen;
	goldShield.map = textBoxGoldShieldMap;
	goldShield.mapLen = textBoxGoldShieldMapLen;

	ring.row = 0;
	ring.col = 0;
	ring.width = 16;
	ring.height = 16;
	ring.value = 20; 
	ring.spriteRow = 4;
	ring.spriteCol = 8 - 4;
	ring.active = 0; 
	ring.inUse = 0; 
	ring.sold = 0;
	ring.leeway = 5;
	ring.palrow = 3;
	ring.tiles = textBoxRingTiles;
	ring.tilesLen = textBoxRingTilesLen;
	ring.map = textBoxRingMap;
	ring.mapLen = textBoxRingMapLen;

	helm.row = 0;
	helm.col = 0;
	helm.width = 16;
	helm.height = 16;
	helm.value = 25; 
	helm.spriteRow = 4;
	helm.spriteCol = 9 - 4;
	helm.active = 0; 
	helm.inUse = 0; 
	helm.sold = 0;
	helm.leeway = 10;
	helm.palrow = 3;
	helm.tiles = textBoxHelmTiles;
	helm.tilesLen = textBoxHelmTilesLen;
	helm.map = textBoxHelmMap;
	helm.mapLen = textBoxHelmMapLen;

	ironArmor.row = 0;
	ironArmor.col = 0;
	ironArmor.width = 16;
	ironArmor.height = 16;
	ironArmor.value = 40; 
	ironArmor.spriteRow = 5;
	ironArmor.spriteCol = 8 - 4;
	ironArmor.active = 0; 
	ironArmor.inUse = 0; 
	ironArmor.sold = 0;
	ironArmor.leeway = 10;
	ironArmor.palrow = 3;
	ironArmor.tiles = textBoxIronArmorTiles;
	ironArmor.tilesLen = textBoxIronArmorTilesLen;
	ironArmor.map = textBoxIronArmorMap;
	ironArmor.mapLen = textBoxIronArmorMapLen;

	goldArmor.row = 0;
	goldArmor.col = 0;
	goldArmor.width = 16;
	goldArmor.height = 16;
	goldArmor.value = 75; 
	goldArmor.spriteRow = 5;
	goldArmor.spriteCol = 9 - 4;
	goldArmor.active = 0; 
	goldArmor.inUse = 0; 
	goldArmor.sold = 0;
	goldArmor.leeway = 15;
	goldArmor.palrow = 3;
	goldArmor.tiles = textBoxGoldArmorTiles;
	goldArmor.tilesLen = textBoxGoldArmorTilesLen;
	goldArmor.map = textBoxGoldArmorMap;
	goldArmor.mapLen = textBoxGoldArmorMapLen;

	diamondLarge.row = 0;
	diamondLarge.col = 0;
	diamondLarge.width = 16;
	diamondLarge.height = 16;
	diamondLarge.value = 75; 
	diamondLarge.spriteRow = 2;
	diamondLarge.spriteCol = 10 - 4;
	diamondLarge.active = 0; 
	diamondLarge.inUse = 0; 
	diamondLarge.sold = 0;
	diamondLarge.leeway = 20;
	diamondLarge.palrow = 4;
	diamondLarge.tiles = textBoxDiamondLargeTiles;
	diamondLarge.tilesLen = textBoxDiamondLargeTilesLen;
	diamondLarge.map = textBoxDiamondLargeMap;
	diamondLarge.mapLen = textBoxDiamondLargeMapLen;

	diamondMed.row = 0;
	diamondMed.col = 0;
	diamondMed.width = 16;
	diamondMed.height = 16;
	diamondMed.value = 50; 
	diamondMed.spriteRow = 3;
	diamondMed.spriteCol = 10 - 4;
	diamondMed.active = 0; 
	diamondMed.inUse = 0; 
	diamondMed.sold = 0;
	diamondMed.leeway = 15;
	diamondMed.palrow = 4;
	diamondMed.tiles = textBoxDiamondMedTiles;
	diamondMed.tilesLen = textBoxDiamondMedTilesLen;
	diamondMed.map = textBoxDiamondMedMap;
	diamondMed.mapLen = textBoxDiamondMedMapLen;

	diamondSmall.row = 0;
	diamondSmall.col = 0;
	diamondSmall.width = 16;
	diamondSmall.height = 16;
	diamondSmall.value = 25; 
	diamondSmall.spriteRow = 4;
	diamondSmall.spriteCol = 10 - 4;
	diamondSmall.active = 0; 
	diamondSmall.inUse = 0; 
	diamondSmall.sold = 0;
	diamondSmall.leeway = 10;
	diamondSmall.palrow = 4;
	diamondSmall.tiles = textBoxDiamondSmallTiles;
	diamondSmall.tilesLen = textBoxDiamondSmallTilesLen;
	diamondSmall.map = textBoxDiamondSmallMap;
	diamondSmall.mapLen = textBoxDiamondSmallMapLen;

	sapphireLarge.row = 0;
	sapphireLarge.col = 0;
	sapphireLarge.width = 16;
	sapphireLarge.height = 16;
	sapphireLarge.value = 45; 
	sapphireLarge.spriteRow = 2;
	sapphireLarge.spriteCol = 11 - 4;
	sapphireLarge.active = 0; 
	sapphireLarge.inUse = 0; 
	sapphireLarge.sold = 0;
	sapphireLarge.leeway = 20;
	sapphireLarge.palrow = 4;
	sapphireLarge.tiles = textBoxSapphireLargeTiles;
	sapphireLarge.tilesLen = textBoxSapphireLargeTilesLen;
	sapphireLarge.map = textBoxSapphireLargeMap;
	sapphireLarge.mapLen = textBoxSapphireLargeMapLen;

	sapphireMed.row = 0;
	sapphireMed.col = 0;
	sapphireMed.width = 16;
	sapphireMed.height = 16;
	sapphireMed.value = 30; 
	sapphireMed.spriteRow = 3;
	sapphireMed.spriteCol = 11 - 4;
	sapphireMed.active = 0; 
	sapphireMed.inUse = 0; 
	sapphireMed.sold = 0;
	sapphireMed.leeway = 15;
	sapphireMed.palrow = 4;
	sapphireMed.tiles = textBoxSapphireMedTiles;
	sapphireMed.tilesLen = textBoxSapphireMedTilesLen;
	sapphireMed.map = textBoxSapphireMedMap;
	sapphireMed.mapLen = textBoxSapphireMedMapLen;

	sapphireSmall.row = 0;
	sapphireSmall.col = 0;
	sapphireSmall.width = 16;
	sapphireSmall.height = 16;
	sapphireSmall.value = 15; 
	sapphireSmall.spriteRow = 4;
	sapphireSmall.spriteCol = 11 - 4;
	sapphireSmall.active = 0; 
	sapphireSmall.inUse = 0; 
	sapphireSmall.sold = 0;
	sapphireSmall.leeway = 10;
	sapphireSmall.palrow = 4;
	sapphireSmall.tiles = textBoxSapphireSmallTiles;
	sapphireSmall.tilesLen = textBoxSapphireSmallTilesLen;
	sapphireSmall.map = textBoxSapphireSmallMap;
	sapphireSmall.mapLen = textBoxSapphireSmallMapLen;

	emeraldLarge.row = 0;
	emeraldLarge.col = 0;
	emeraldLarge.width = 16;
	emeraldLarge.height = 16;
	emeraldLarge.value = 45; 
	emeraldLarge.spriteRow = 2;
	emeraldLarge.spriteCol = 12 - 4;
	emeraldLarge.active = 0; 
	emeraldLarge.inUse = 0; 
	emeraldLarge.sold = 0;
	emeraldLarge.leeway = 20;
	emeraldLarge.palrow = 4;
	emeraldLarge.tiles = textBoxEmeraldLargeTiles;
	emeraldLarge.tilesLen = textBoxEmeraldLargeTilesLen;
	emeraldLarge.map = textBoxEmeraldLargeMap;
	emeraldLarge.mapLen = textBoxEmeraldLargeMapLen;

	emeraldMed.row = 0;
	emeraldMed.col = 0;
	emeraldMed.width = 16;
	emeraldMed.height = 16;
	emeraldMed.value = 30; 
	emeraldMed.spriteRow = 3;
	emeraldMed.spriteCol = 12 - 4;
	emeraldMed.active = 0; 
	emeraldMed.inUse = 0; 
	emeraldMed.sold = 0;
	emeraldMed.leeway = 15;
	emeraldMed.palrow = 4;
	emeraldMed.tiles = textBoxEmeraldMedTiles;
	emeraldMed.tilesLen = textBoxEmeraldMedTilesLen;
	emeraldMed.map = textBoxEmeraldMedMap;
	emeraldMed.mapLen = textBoxEmeraldMedMapLen;

	emeraldSmall.row = 0;
	emeraldSmall.col = 0;
	emeraldSmall.width = 16;
	emeraldSmall.height = 16;
	emeraldSmall.value = 15; 
	emeraldSmall.spriteRow = 4;
	emeraldSmall.spriteCol = 12 - 4;
	emeraldSmall.active = 0; 
	emeraldSmall.inUse = 0; 
	emeraldSmall.sold = 0;
	emeraldSmall.leeway = 10;
	emeraldSmall.palrow = 4;
	emeraldSmall.tiles = textBoxEmeraldSmallTiles;
	emeraldSmall.tilesLen = textBoxEmeraldSmallTilesLen;
	emeraldSmall.map = textBoxEmeraldSmallMap;
	emeraldSmall.mapLen = textBoxEmeraldSmallMapLen;

	platinumLarge.row = 0;
	platinumLarge.col = 0;
	platinumLarge.width = 16;
	platinumLarge.height = 16;
	platinumLarge.value = 70; 
	platinumLarge.spriteRow = 2;
	platinumLarge.spriteCol = 13 - 4;
	platinumLarge.active = 0; 
	platinumLarge.inUse = 0; 
	platinumLarge.sold = 0;
	platinumLarge.leeway = 20;
	platinumLarge.palrow = 5;
	platinumLarge.tiles = textBoxPlatinumLargeTiles;
	platinumLarge.tilesLen = textBoxPlatinumLargeTilesLen;
	platinumLarge.map = textBoxPlatinumLargeMap;
	platinumLarge.mapLen = textBoxPlatinumLargeMapLen;

	platinumMed.row = 0;
	platinumMed.col = 0;
	platinumMed.width = 16;
	platinumMed.height = 16;
	platinumMed.value = 50; 
	platinumMed.spriteRow = 3;
	platinumMed.spriteCol = 13 - 4;
	platinumMed.active = 0; 
	platinumMed.inUse = 0; 
	platinumMed.sold = 0;
	platinumMed.leeway = 15;
	platinumMed.palrow = 5;
	platinumMed.tiles = textBoxPlatinumMedTiles;
	platinumMed.tilesLen = textBoxPlatinumMedTilesLen;
	platinumMed.map = textBoxPlatinumMedMap;
	platinumMed.mapLen = textBoxPlatinumMedMapLen;

	platinumSmall.row = 0;
	platinumSmall.col = 0;
	platinumSmall.width = 16;
	platinumSmall.height = 16;
	platinumSmall.value = 30; 
	platinumSmall.spriteRow = 4;
	platinumSmall.spriteCol = 13 - 4;
	platinumSmall.active = 0; 
	platinumSmall.inUse = 0; 
	platinumSmall.sold = 0;
	platinumSmall.leeway = 10;
	platinumSmall.palrow = 5;
	platinumSmall.tiles = textBoxPlatinumSmallTiles;
	platinumSmall.tilesLen = textBoxPlatinumSmallTilesLen;
	platinumSmall.map = textBoxPlatinumSmallMap;
	platinumSmall.mapLen = textBoxPlatinumSmallMapLen;

	rubyLarge.row = 0;
	rubyLarge.col = 0;
	rubyLarge.width = 16;
	rubyLarge.height = 16;
	rubyLarge.value = 60; 
	rubyLarge.spriteRow = 2;
	rubyLarge.spriteCol = 14 - 4;
	rubyLarge.active = 0; 
	rubyLarge.inUse = 0; 
	rubyLarge.sold = 0;
	rubyLarge.leeway = 20;
	rubyLarge.palrow = 5;
	rubyLarge.tiles = textBoxRubyLargeTiles;
	rubyLarge.tilesLen = textBoxRubyLargeTilesLen;
	rubyLarge.map = textBoxRubyLargeMap;
	rubyLarge.mapLen = textBoxRubyLargeMapLen;

	rubyMed.row = 0;
	rubyMed.col = 0;
	rubyMed.width = 16;
	rubyMed.height = 16;
	rubyMed.value = 40; 
	rubyMed.spriteRow = 3;
	rubyMed.spriteCol = 14 - 4;
	rubyMed.active = 0; 
	rubyMed.inUse = 0; 
	rubyMed.sold = 0;
	rubyMed.leeway = 15;
	rubyMed.palrow = 5;
	rubyMed.tiles = textBoxRubyMedTiles;
	rubyMed.tilesLen = textBoxRubyMedTilesLen;
	rubyMed.map = textBoxRubyMedMap;
	rubyMed.mapLen = textBoxRubyMedMapLen;

	rubySmall.row = 0;
	rubySmall.col = 0;
	rubySmall.width = 16;
	rubySmall.height = 16;
	rubySmall.value = 20; 
	rubySmall.spriteRow = 4;
	rubySmall.spriteCol = 14 - 4;
	rubySmall.active = 0; 
	rubySmall.inUse = 0; 
	rubySmall.sold = 0;
	rubySmall.leeway = 10;
	rubySmall.palrow = 5;
	rubySmall.tiles = textBoxRubySmallTiles;
	rubySmall.tilesLen = textBoxRubySmallTilesLen;
	rubySmall.map = textBoxRubySmallMap;
	rubySmall.mapLen = textBoxRubySmallMapLen;

	obsidianLarge.row = 0;
	obsidianLarge.col = 0;
	obsidianLarge.width = 16;
	obsidianLarge.height = 16;
	obsidianLarge.value = 70; 
	obsidianLarge.spriteRow = 2;
	obsidianLarge.spriteCol = 15 - 4;
	obsidianLarge.active = 0; 
	obsidianLarge.inUse = 0; 
	obsidianLarge.sold = 0;
	obsidianLarge.leeway = 20;
	obsidianLarge.palrow = 5;
	obsidianLarge.tiles = textBoxObsidianLargeTiles;
	obsidianLarge.tilesLen = textBoxObsidianLargeTilesLen;
	obsidianLarge.map = textBoxObsidianLargeMap;
	obsidianLarge.mapLen = textBoxObsidianLargeMapLen;

	obsidianMed.row = 0;
	obsidianMed.col = 0;
	obsidianMed.width = 16;
	obsidianMed.height = 16;
	obsidianMed.value = 50; 
	obsidianMed.spriteRow = 3;
	obsidianMed.spriteCol = 15 - 4;
	obsidianMed.active = 0; 
	obsidianMed.inUse = 0; 
	obsidianMed.sold = 0;
	obsidianMed.leeway = 15;
	obsidianMed.palrow = 5;
	obsidianMed.tiles = textBoxObsidianMedTiles;
	obsidianMed.tilesLen = textBoxObsidianMedTilesLen;
	obsidianMed.map = textBoxObsidianMedMap;
	obsidianMed.mapLen = textBoxObsidianMedMapLen;

	obsidianSmall.row = 0;
	obsidianSmall.col = 0;
	obsidianSmall.width = 16;
	obsidianSmall.height = 16;
	obsidianSmall.value = 30; 
	obsidianSmall.spriteRow = 4;
	obsidianSmall.spriteCol = 15 - 4;
	obsidianSmall.active = 0; 
	obsidianSmall.inUse = 0; 
	obsidianSmall.sold = 0;
	obsidianSmall.leeway = 10;
	obsidianSmall.palrow = 5;
	obsidianSmall.tiles = textBoxObsidianSmallTiles;
	obsidianSmall.tilesLen = textBoxObsidianSmallTilesLen;
	obsidianSmall.map = textBoxObsidianSmallMap;
	obsidianSmall.mapLen = textBoxObsidianSmallMapLen;

	cookie.row = 0;
	cookie.col = 0;
	cookie.width = 16;
	cookie.height = 16;
	cookie.value = 3; 
	cookie.spriteRow = 2;
	cookie.spriteCol = 16 - 4;
	cookie.active = 0; 
	cookie.inUse = 0; 
	cookie.sold = 0;
	cookie.leeway = 3;
	cookie.palrow = 6;
	cookie.tiles = textBoxCookieTiles;
	cookie.tilesLen = textBoxCookieTilesLen;
	cookie.map = textBoxCookieMap;
	cookie.mapLen = textBoxCookieMapLen;

	steak.row = 0;
	steak.col = 0;
	steak.width = 16;
	steak.height = 16;
	steak.value = 20; 
	steak.spriteRow = 2;
	steak.spriteCol = 17 - 4;
	steak.active = 0; 
	steak.inUse = 0; 
	steak.sold = 0;
	steak.leeway = 7;
	steak.palrow = 6;
	steak.tiles = textBoxSteakTiles;
	steak.tilesLen = textBoxSteakTilesLen;
	steak.map = textBoxSteakMap;
	steak.mapLen = textBoxSteakMapLen;

	wine.row = 0;
	wine.col = 0;
	wine.width = 16;
	wine.height = 16;
	wine.value = 25; 
	wine.spriteRow = 2;
	wine.spriteCol = 18 - 4;
	wine.active = 0; 
	wine.inUse = 0; 
	wine.sold = 0;
	wine.leeway = 10;
	wine.palrow = 6;
	wine.tiles = textBoxWineTiles;
	wine.tilesLen = textBoxWineTilesLen;
	wine.map = textBoxWineMap;
	wine.mapLen = textBoxWineMapLen;

	apple.row = 0;
	apple.col = 0;
	apple.width = 16;
	apple.height = 16;
	apple.value = 3; 
	apple.spriteRow = 3;
	apple.spriteCol = 16 - 4;
	apple.active = 0; 
	apple.inUse = 0; 
	apple.sold = 0;
	apple.leeway = 3;
	apple.palrow = 6;
	apple.tiles = textBoxAppleTiles;
	apple.tilesLen = textBoxAppleTilesLen;
	apple.map = textBoxAppleMap;
	apple.mapLen = textBoxAppleMapLen;

	fish.row = 0;
	fish.col = 0;
	fish.width = 16;
	fish.height = 16;
	fish.value = 20; 
	fish.spriteRow = 3;
	fish.spriteCol = 17 - 4;
	fish.active = 0; 
	fish.inUse = 0; 
	fish.sold = 0;
	fish.leeway = 7;
	fish.palrow = 6;
	fish.tiles = textBoxFishTiles;
	fish.tilesLen = textBoxFishTilesLen;
	fish.map = textBoxFishMap;
	fish.mapLen = textBoxFishMapLen;
}

void day1() {
	if (rand() % 100 > 10) {
		items[0] = cheese;
	} else {
		items[0] = egg;
	}
	if (rand() % 100 > 20) {
		items[1] = fish;
	} else {
		items[1] = fishDead;
	}
	if (rand() % 100 > 30) {
		items[2] = diamondSmall;
	} else {
		items[2] = emeraldSmall;
	}
	if (rand() % 100 > 40) {
		items[3] = obsidianSmall;
	} else {
		items[3] = platinumSmall;
	}
	if (rand() % 100 > 50) {
		items[4] = helm;
	} else {
		items[4] = sword1;
	}
	if (rand() % 100 > 60) {
		items[5] = steak;
	} else {
		items[5] = wine;
	}
	if (rand() % 100 > 70) {
		items[6] = apple;
	} else {
		items[6] = apple;
	}
	if (rand() % 100 > 80) {
		items[7] = rubySmall;
	} else {
		items[7] = sapphireSmall;
	}
}

void day2() {
	if (rand() % 100 > 10) {
		items[0] = ironShield;
	} else {
		items[0] = goldShield;
	}
	if (rand() % 100 > 20) {
		items[1] = ironArmor;
	} else {
		items[1] = goldArmor;
	}
	if (rand() % 100 > 30) {
		items[2] = obsidianMed;
	} else {
		items[2] = obsidianLarge;
	}
	if (rand() % 100 > 40) {
		items[3] = sword2;
	} else {
		items[3] = sword1;
	}
	if (rand() % 100 > 50) {
		items[4] = rubyMed;
	} else {
		items[4] = platinumMed;
	}
	if (rand() % 100 > 60) {
		items[5] = boneMeat;
	} else {
		items[5] = diamondSmall;
	}
	if (rand() % 100 > 70) {
		items[6] = diamondMed;
	} else {
		items[6] = sapphireMed;
	}
	if (rand() % 100 > 80) {
		items[7] = diamondLarge;
	} else {
		items[7] = cookie;
	}
}

void day3() {
	if (rand() % 100 > 10) {
		items[0] = sword2;
	} else {
		items[0] = goldShield;
	}
	if (rand() % 100 > 20) {
		items[1] = diamondLarge;
	} else {
		items[1] = diamondMed;
	}
	if (rand() % 100 > 30) {
		items[2] = obsidianLarge;
	} else {
		items[2] = obsidianMed;
	}
	if (rand() % 100 > 40) {
		items[3] = steak;
	} else {
		items[3] = fish;
	}
	if (rand() % 100 > 50) {
		items[4] = ring;
	} else {
		items[4] = helm;
	}
	if (rand() % 100 > 60) {
		items[5] = emeraldLarge;
	} else {
		items[5] = emeraldMed;
	}
	if (rand() % 100 > 70) {
		items[6] = wine;
	} else {
		items[6] = wine;
	}
	if (rand() % 100 > 80) {
		items[7] = diamondMed;
	} else {
		items[7] = cookie;
	}
}

void updateSelecting() {
	if (BUTTON_PRESSED(BUTTON_RIGHT) && ((placementCounter >= 0 && placementCounter < 3) || (placementCounter >= 4 && placementCounter < 7))) {
		placementCounter++;
		arrow.col += 16;
		playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
	}
	if (BUTTON_PRESSED(BUTTON_LEFT) && ((placementCounter > 0 && placementCounter <= 3) || (placementCounter > 4 && placementCounter <= 7))) {
		placementCounter--;
		arrow.col -= 16;
		playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
	}
	if ((BUTTON_PRESSED(BUTTON_DOWN)) && placementCounter < 4) {
		placementCounter += 4;
		arrow.row += 20;
		playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
	}
	if ((BUTTON_PRESSED(BUTTON_UP)) && placementCounter > 3) {
		placementCounter -= 4;
		arrow.row -= 20;
		playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
	}

	if (BUTTON_PRESSED(BUTTON_B)) {
		for (int i = 0; i < ITEMCOUNT; i++) {
			if (!items[i].inUse) {
				items[i].active = 0;
			}
		}
		selectingItem = 0;
		arrow.active = 0;
		cancel = 1;
		playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
	}

	// Allow the item to be placed in a spot when BUTTON_A is pressed
	if (!items[placementCounter].inUse && !items[placementCounter].sold){
		if (BUTTON_PRESSED(BUTTON_A)) {
			if (beginSelection == 1) {
				for (int i = 0; i < ITEMCOUNT; i++) {
					if (i != placementCounter && !items[i].inUse) {
						items[i].active = 0;
					}
				}
				items[placementCounter].row = 55;
				items[placementCounter].col = 94;
			} else if (beginSelection == 2) {
				for (int i = 0; i < ITEMCOUNT; i++) {
					if (i != placementCounter && !items[i].inUse) {
						items[i].active = 0;
					}
				}
				items[placementCounter].row = 55;
				items[placementCounter].col = 110;
			} else if (beginSelection == 3) {
				for (int i = 0; i < ITEMCOUNT; i++) {
					if (i != placementCounter && !items[i].inUse) {
						items[i].active = 0;
					}
				}
				items[placementCounter].row = 55;
				items[placementCounter].col = 126;
			} else if (beginSelection == 4) {
				for (int i = 0; i < ITEMCOUNT; i++) {
					if (i != placementCounter && !items[i].inUse) {
						items[i].active = 0;
					}
				}
				items[placementCounter].row = 55;
				items[placementCounter].col = 142;
			}
			items[placementCounter].location = beginSelection;
			arrow.active = 0;
			items[placementCounter].inUse = 1;
			selectingItem = 0;
			selected = 1;
		}
	}
}

void drawSelecting() {
	for (int i = 0; i < ITEMCOUNT; i++) {
		if (items[i].active && !items[i].sold) {
			shadowOAM[21 + i].attr0 = items[i].row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[21 + i].attr1 = items[i].col | ATTR1_SMALL;
			shadowOAM[21 + i].attr2 = ATTR2_PALROW(items[i].palrow) | ATTR2_TILEID(items[i].spriteRow * 2, items[i].spriteCol * 2);
		} else {
			shadowOAM[21 + i].attr0 |= ATTR0_HIDE;
		}
	}
	if (arrow.active) {
		shadowOAM[20].attr0 = arrow.row | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[20].attr1 = arrow.col | ATTR1_SMALL;
		shadowOAM[20].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(arrow.spriteRow * 2, arrow.spriteCol * 2);
	} else {
		shadowOAM[20].attr0 |= ATTR0_HIDE;
	}
	if (selectingItem) {
		shadowOAM[70].attr0 = 115 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[70].attr1 = 135 | ATTR1_SMALL;
		shadowOAM[70].attr2 = ATTR2_PALROW(items[placementCounter].palrow) | ATTR2_TILEID(items[placementCounter].spriteRow * 2, items[placementCounter].spriteCol * 2);
	} else {
		shadowOAM[70].attr0 |= ATTR0_HIDE;
	}
	DMANow(3, shadowOAM, OAM, 128 * 4);
}

void initPricing() {
	if (firstPricing) {
		for (int i = 0; i < 4; i++) {
			unitsCounter[i].row = 50;
			unitsCounter[i].col = 103 + 16 * i;
			unitsCounter[i].spriteRow = 2;
			unitsCounter[i].spriteCol = 8;
			unitsCounter[i].height = 8;
			unitsCounter[i].width = 8;
			unitsCounter[i].value = 0;
			unitsCounter[i].active = 0;
			tensCounter[i].row = 50;
			tensCounter[i].col = 94 + 16 * i;
			tensCounter[i].spriteRow = 2;
			tensCounter[i].spriteCol = 8;
			tensCounter[i].height = 8;
			tensCounter[i].width = 8;
			tensCounter[i].value = 0;
			tensCounter[i].active = 0;
		}
		firstPricing = 0;
	}
	if (beginSelection == 1) {
		unitsCounter[0].active = 1;
		tensCounter[0].active = 1;
		unitsCounter[0].inUse = 1;
		tensCounter[0].inUse = 1;
	} else if (beginSelection == 2) {
		unitsCounter[1].active = 1;
		tensCounter[1].active = 1;
		unitsCounter[1].inUse = 1;
		tensCounter[1].inUse = 1;
	} else if (beginSelection == 3) {
		unitsCounter[2].active = 1;
		tensCounter[2].active = 1;
		unitsCounter[2].inUse = 1;
		tensCounter[2].inUse = 1;
	} else if (beginSelection == 4) {
		unitsCounter[3].active = 1;
		tensCounter[3].active = 1;
		unitsCounter[3].inUse = 1;
		tensCounter[3].inUse = 1;
	}
	pricePointer = 0;
	priced = 0;
}

void updatePricing() {
	if (pricePointer) {
		if (BUTTON_PRESSED(BUTTON_UP)) {
			if (unitsCounter[beginSelection - 1].value < 9) {
				unitsCounter[beginSelection - 1].value++;
			} else {
				unitsCounter[beginSelection - 1].value = 0;
			}
			unitsCounter[beginSelection - 1].spriteCol += 1;
			if (unitsCounter[beginSelection - 1].spriteCol == 18) {
				unitsCounter[beginSelection - 1].spriteCol = 8;
			}
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
		if (BUTTON_PRESSED(BUTTON_DOWN)) {
			if (unitsCounter[beginSelection - 1].value > 0) {
				unitsCounter[beginSelection - 1].value--;
			} else {
				unitsCounter[beginSelection - 1].value = 9;
			}
			unitsCounter[beginSelection - 1].spriteCol -= 1;
			if (unitsCounter[beginSelection - 1].spriteCol == 7) {
				unitsCounter[beginSelection - 1].spriteCol = 17;
			}
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
		if (BUTTON_PRESSED(BUTTON_LEFT)) {
			pricePointer = 0;
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
	} else {
		if (BUTTON_PRESSED(BUTTON_UP)) {
			if (tensCounter[beginSelection - 1].value < 9) {
				tensCounter[beginSelection - 1].value++;
			} else {
				tensCounter[beginSelection - 1].value = 0;
			}
			tensCounter[beginSelection - 1].spriteCol += 1;
			if (tensCounter[beginSelection - 1].spriteCol == 18) {
				tensCounter[beginSelection - 1].spriteCol = 8;
			}
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
		if (BUTTON_PRESSED(BUTTON_DOWN)) {
			if (tensCounter[beginSelection - 1].value > 0) {
				tensCounter[beginSelection - 1].value--;
			} else {
				tensCounter[beginSelection - 1].value = 9;
			}
			tensCounter[beginSelection - 1].spriteCol -= 1;
			if (tensCounter[beginSelection - 1].spriteCol == 7) {
				tensCounter[beginSelection - 1].spriteCol = 17;
			}
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
		if (BUTTON_PRESSED(BUTTON_RIGHT)) {
			pricePointer = 1;
			playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
		}
	}

	if (BUTTON_PRESSED(BUTTON_B)) {
		unitsCounter[beginSelection - 1].active = 0;
		unitsCounter[beginSelection - 1].inUse = 0;
		tensCounter[beginSelection - 1].active = 0;
		tensCounter[beginSelection - 1].inUse = 0;
		items[placementCounter].active = 0;
		items[placementCounter].inUse = 0;
		priced = 1;
		playSoundB(menuSFX, MENUSFXLEN, MENUSFXFREQ, 0);
	}

	if (BUTTON_PRESSED(BUTTON_A)) {
		items[placementCounter].price = unitsCounter[beginSelection - 1].value + (tensCounter[beginSelection - 1].value * 10);
		priced = 1;
		playSoundB(priceSFX, PRICESFXLEN, PRICESFXFREQ, 0);
	}
	
}

void drawPricing() {
	for (int i = 0; i < 4; i++) {
		if (tensCounter[i].active) {
			shadowOAM[29 + i * 2].attr0 = tensCounter[i].row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[29 + i * 2].attr1 = tensCounter[i].col | ATTR1_TINY;
			shadowOAM[29 + i * 2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tensCounter[i].spriteRow, tensCounter[i].spriteCol);
		} else {
			shadowOAM[29 + i * 2].attr0 |= ATTR0_HIDE;
		}
		if (unitsCounter[i].active) {
			shadowOAM[30 + i * 2].attr0 = unitsCounter[i].row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[30 + i * 2].attr1 = unitsCounter[i].col | ATTR1_TINY;
			shadowOAM[30 + i * 2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(unitsCounter[i].spriteRow, unitsCounter[i].spriteCol);
		} else {
			shadowOAM[30 + i * 2].attr0 |= ATTR0_HIDE;
		}
	}
	DMANow(3, shadowOAM, OAM, 128 * 4);
}

void initCurrency() {
	for (int i = 0; i < 3; i++) {
		currency[i].row = 15;
		currency[i].col = 15 + i * 8;
		currency[i].height = 8;
		currency[i].width = 8;
		currency[i].spriteRow = 2;
		currency[i].spriteCol = 8;
		currency[i].active = 0;
	}
}

void updateCurrency() {
	// Updating the numbers as they change in the game
	int temp = player.value;
	for (int i = 2; i >= 0; i--) {
		currency[i].spriteCol = 8 + (temp % 10);
		temp /= 10;
	}

	// if (player.value < 100) {
	// 	currency[0].spriteCol = 8;
	// }

	// Updating how many number counters need to show
	if (player.value > 0 && player.value < 10) {
		currency[2].active = 1;
	} else if (player.value > 9 && player.value < 100) {
		currency[1].active = 1;
		currency[2].active = 1;
	} else if (player.value > 99) {
		currency[0].active = 1;
		currency[1].active = 1;
		currency[2].active = 1;
	}
}

void drawCurrency() {
	for (int i = 0; i < 3; i++) {
		if (currency[i].active) {
			shadowOAM[37 + i].attr0 = currency[i].row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[37 + i].attr1 = currency[i].col | ATTR1_TINY;
			shadowOAM[37 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(currency[i].spriteRow, currency[i].spriteCol);
		} else {
			shadowOAM[37 + i].attr0 |= ATTR0_HIDE;
		}
	}
	if (player.value > 0) {
		shadowOAM[40].attr0 = 15 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[40].attr1 = 39 | ATTR1_TINY;
		shadowOAM[40].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, 8);
	}
}

void moveRight(CUSTOMER *c) {
	c->col += c->cdel;
	c->aniState = CUSTOMERRIGHT;
	c->moveRight--;
}

void moveLeft(CUSTOMER *c) {
	c->col -= c->cdel;
	c->aniState = CUSTOMERLEFT;
	c->moveLeft--;
}

void moveUp(CUSTOMER *c) {
	c->row -= c->rdel;
	c->aniState = CUSTOMERBACK;
	c->moveUp--;
}

void moveDown (CUSTOMER *c) {
	c->row += c->rdel;
	c->aniState = CUSTOMERFRONT;
	c->moveDown--;
}

void pathing(CUSTOMER *c, int pathNum) {
	c->active = 1;
	switch(pathNum) {
		case 1:
			c->moveUp = 64;
			c->moveLeft = 16;
			break;
		case 2:
			c->moveUp = 64;
			break;
		case 3:
			c->moveUp = 64;
			c->moveRight = 16;
			break;
		case 4:
			c->moveUp = 64;
			c->moveRight = 32;
			break;
	}
	c->location = pathNum;
}

void pathingOut(CUSTOMER *c, int pathNum) {
	c->leaving = 1;
	switch(pathNum) {
		case 1:
			c->moveDown = 64;
			c->moveRight = 16;
			break;
		case 2:
			c->moveDown = 64;
			break;
		case 3:
			c->moveDown = 64;
			c->moveLeft = 16;
			break;
		case 4:
			c->moveDown = 64;
			c->moveLeft = 32;
			break;
	}
}

void initFaces() {
	for (int i = 0; i < 4; i++) {
		faces[i].row = 40;
		faces[i].col = 94 + i * 16;
		faces[i].width = 16;
		faces[i].height = 32;
		faces[i].spriteRow = 0;
		faces[i].spriteCol = 13;
		faces[i].location = i + 1;
		faces[i].active = 0;
		faces[i].activeTime = 15;
	}
}

void happy(CUSTOMER *c) {
	int index = c->location - 1;
	faces[index].active = 1;
	faces[index].activeTime = 15;
	shadowOAM[41 + index].attr0 = faces[index].row | ATTR0_4BPP | ATTR0_TALL; 
	shadowOAM[41 + index].attr1 = faces[index].col | ATTR1_MEDIUM;
	shadowOAM[41 + index].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(faces[index].spriteRow, faces[index].spriteCol * 2);
}

void unhappy(CUSTOMER *c) {
	// NEEDS FIXING DOESNT WORK BECAUSE IT POINTS TO WRONG SPOT FOR NOW
	int index = c->location - 1;
	faces[index].active = 1;
	faces[index].activeTime = 15;
	shadowOAM[41 + index].attr0 = c->row | ATTR0_4BPP | ATTR0_SQUARE; 
	shadowOAM[41 + index].attr1 = c->col | ATTR1_SMALL;
	shadowOAM[41 + index].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(faces[index].spriteRow, faces[index].spriteCol * 2);
}

void drawFaces() {
	for (int i = 0; i < 4; i++) {
		if (!faces[i].active) {
			shadowOAM[41 + i].attr0 |= ATTR0_HIDE;
		}
	}
}

void initCustomers() {
	for (int i = 0; i < 4; i++) {
		customers[i].row = 160 - 32;
		customers[i].col = 120 - 8;
		customers[i].cdel = 1;
		customers[i].rdel = 1;
		customers[i].width = 16;
		customers[i].height = 32;
		customers[i].aniCounter = 0;
		customers[i].prevAniState = 0;
		customers[i].aniState = CUSTOMERBACK;
		customers[i].curFrame = 0;
		customers[i].numFrames = 4;
		customers[i].active = 0;
		customers[i].moveUp = 0;
		customers[i].moveDown = 0;
		customers[i].moveLeft = 0;
		customers[i].moveRight = 0;
		customers[i].waitTime = 100 + 80 * i;
		customers[i].firstSpawn = 1;
		customers[i].location = 0;
		customers[i].leaving = 0;
		customers[i].counterTime = 60;
	}
}

void updateCustomers() {
	for (int i = 0; i < 4; i++) {
		if (customers[i].aniState != CUSTOMERIDLE) {
			customers[i].prevAniState = customers[i].aniState;
			customers[i].aniState = CUSTOMERIDLE;
		}

		if (customers[i].aniCounter % 13 == 0) {
			customers[i].curFrame = (customers[i].curFrame + 1) % customers[i].numFrames;
		}

		if (!customers[i].waitTime && customers[i].firstSpawn) {
			pathing(&customers[i], i + 1);
			customers[i].firstSpawn = 0;
		} else {
			customers[i].waitTime--;
		}

		if (!customers[i].firstSpawn) {
			if (customers[i].moveUp) {
				moveUp(&customers[i]);
			} else if (customers[i].moveLeft) {
				moveLeft(&customers[i]);
			} else if (customers[i].moveRight) {
				moveRight(&customers[i]);
			} else if (customers[i].moveDown) {
				moveDown(&customers[i]);
			} else {
				customers[i].atCounter = 1;
			}
		}

		if (!customers[i].counterTime && customers[i].atCounter) {
			for (int j = 0; j < ITEMCOUNT; j++) {
				if (items[j].inUse && (items[j].location == customers[i].location) && (items[j].value + items[j].leeway >= items[j].price)) {
					items[j].active = 0;
					items[j].inUse = 0;
					shadowOAM[55 + items[j].location - 1].attr0 |= ATTR0_HIDE;
					shadowOAM[90 + items[j].location - 1].attr0 |= ATTR0_HIDE;
					items[j].location = 0;
					unitsCounter[customers[i].location - 1].active = 0;
					unitsCounter[customers[i].location - 1].value = 0;
					unitsCounter[customers[i].location - 1].spriteCol = 8;
					tensCounter[customers[i].location - 1].active = 0;
					tensCounter[customers[i].location - 1].value = 0;
					tensCounter[customers[i].location - 1].spriteCol = 8;
					player.value += items[j].price;
					customers[i].atCounter = 0;
					customers[i].location = 0;
					items[j].sold = 1;
					playSoundB(kaching, KACHINGLEN, KACHINGFREQ, 0);
					pathingOut(&customers[i], i + 1);
					break;
				}
			}
			if (customers[i].atCounter) {
				pathingOut(&customers[i], i + 1);
				customers[i].atCounter = 0;
				customers[i].location = 0;
			}
		} else if (customers[i].counterTime && customers[i].atCounter) {
			customers[i].counterTime--;
			for (int k = 0; k < ITEMCOUNT; k++) {
				if (customers[i].counterTime < 30 && customers[i].counterTime > 10 && items[k].inUse && (items[k].location == customers[i].location) && (items[k].value + items[k].leeway >= items[k].price)) {
					happy(&customers[i]);
				}
			}
		}

		if (customers[i].leaving && customers[i].row > 120) {
			customers[i].active = 0;
			customers[i].leaving = 0;
			customers[i].firstSpawn = 1;
			customers[i].waitTime = 100 + 80 * i;
			customers[i].counterTime = 60;
		}

		if (faces[i].active && faces[i].activeTime) {
			faces[i].activeTime--;
		} else if (faces[i].active && !faces[i].activeTime) {
			faces[i].active = 0;
		}

		if (customers[i].aniState == CUSTOMERIDLE) {
			customers[i].aniState = CUSTOMERBACK;
			customers[i].curFrame = 0;
		} else {
			customers[i].aniCounter++;
		}
	}
}

void drawCustomers() {
	for (int i = 0; i < 4; i++) {
		if (customers[i].active) {
			if (i & 1) {
				shadowOAM[45 + i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(customers[i].aniState * 4, (customers[i].curFrame + 4) * 2);
			} else {
				shadowOAM[45 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(customers[i].aniState * 4, customers[i].curFrame * 2);
			}
			shadowOAM[45 + i].attr0 = customers[i].row | ATTR0_4BPP | ATTR0_TALL;
			shadowOAM[45 + i].attr1 = customers[i].col | ATTR1_MEDIUM;
		} else {
			shadowOAM[45 + i].attr0 |= ATTR0_HIDE;
		}
	}
}

void checkOver() {
	if (!startedMan) {
		tempEvent = 1;
		for (int i = 0; i < ITEMCOUNT; i++) {
			if (!items[i].sold) {
				tempEvent = 0;
			}
		}	
		if (tempEvent) {
			if (currentDay == 1) {
				initMan();
				startedMan = 1;
			} else if (currentDay == 2) {
				initMan();
				startedMan = 1;
			} else if (currentDay == 3 && player.value >= 300) {
				won = 1;
			} else {
				lost = 1;
			}
		}
	}
}

void initCheat() {
	for (int i = 0; i < 4; i++) {
		cheatUnits[i].row = 50;
		cheatUnits[i].col = 103 + 16 * i;
		cheatUnits[i].spriteRow = 2;
		cheatUnits[i].spriteCol = 8;
		cheatUnits[i].height = 8;
		cheatUnits[i].width = 8;
		cheatUnits[i].value = 0;
		cheatUnits[i].active = 0;
		cheatTens[i].row = 60;
		cheatTens[i].col = 94 + 16 * i;
		cheatTens[i].spriteRow = 2;
		cheatTens[i].spriteCol = 8;
		cheatTens[i].height = 8;
		cheatTens[i].width = 8;
		cheatTens[i].value = 0;
		cheatTens[i].active = 0;
	}
}

void cheat() {
	if (cheating) {
		for (int j = 0; j < ITEMCOUNT; j++) {
			if (items[j].inUse) {
				int temp = items[j].value;
				cheatUnits[items[j].location - 1].spriteCol = 8 + temp % 10;
				temp /= 10;
				cheatTens[items[j].location - 1].spriteCol = 8 + temp % 10;

				shadowOAM[55 + (items[j].location - 1)].attr0 = items[j].row + 16 | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[55 + (items[j].location - 1)].attr1 = items[j].col | ATTR1_TINY;
				shadowOAM[55 + (items[j].location - 1)].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(cheatTens[items[j].location - 1].spriteRow, cheatTens[items[j].location - 1].spriteCol);

				shadowOAM[90 + (items[j].location - 1)].attr0 = items[j].row + 16 | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[90 + (items[j].location - 1)].attr1 = items[j].col + 8 | ATTR1_TINY;
				shadowOAM[90 + (items[j].location - 1)].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(cheatUnits[items[j].location - 1].spriteRow, cheatUnits[items[j].location - 1].spriteCol);
			}
		}
	} else {
		for (int i = 0; i < 4; i++) {
			shadowOAM[55 + i].attr0 |= ATTR0_HIDE;
			shadowOAM[90 + i].attr0 |= ATTR0_HIDE; 
		}
	}
}

void initMan() {
	man.row = 160 - 32;
	man.col = 120 - 8;
	man.cdel = 1;
	man.rdel = 1;
	man.width = 16;
	man.height = 32;
	man.aniCounter = 0;
	man.prevAniState = 0;
	man.aniState = CUSTOMERBACK;
	man.curFrame = 0;
	man.numFrames = 4;
	man.active = 1;
	man.moveUp = 0;
	man.moveDown = 0;
	man.moveLeft = 0;
	man.moveRight = 0;
	man.waitTime = 0;
	man.firstSpawn = 1;
	man.location = 0;
	man.leaving = 0;
	man.counterTime = 60;
	pathing(&man, 2);
}

void updateMan() {
	if (man.active) {
		if (man.aniState != CUSTOMERIDLE) {
			man.prevAniState = man.aniState;
			man.aniState = CUSTOMERIDLE;
		}

		if (man.aniCounter % 13 == 0) {
			man.curFrame = (man.curFrame + 1) % man.numFrames;
		}

		if (man.moveUp) {
			moveUp(&man);
		} else if (man.moveLeft) {
			moveLeft(&man);
		} else if (man.moveRight) {
			moveRight(&man);
		} else if (man.moveDown) {
			moveDown(&man);
		} else {
			man.atCounter = 1;
		}

		if (man.atCounter) {
			if (BUTTON_PRESSED(BUTTON_A)) {
				if (player.value > 125 && currentDay == 1) {
					currentDay = 2;
					player.value = player.value - 125;
					initGame();
				} else if (player.value > 300 && currentDay == 2) {
					currentDay = 3;
					player.value = player.value - 300;
					initGame();
				} else {
					lost = 1;
				}
			}
		}

		if (man.aniState == CUSTOMERIDLE) {
			man.aniState = CUSTOMERBACK;
			man.curFrame = 0;
		} else {
			man.aniCounter++;
		}
	}
}

void drawMan() {
	if (man.active) {
		shadowOAM[62].attr0 = man.row | ATTR0_4BPP | ATTR0_TALL;
		shadowOAM[62].attr1 = man.col | ATTR1_MEDIUM;
		shadowOAM[62].attr2 = ATTR2_PALROW(7) | ATTR2_TILEID(man.aniState * 4, (man.curFrame + 8) * 2);
	} else {
		shadowOAM[62].attr0 |= ATTR0_HIDE;
	}
}

void initEndGame() {
	for (int i = 0; i < 3; i++) {
		finGame[i].row = 99;
		finGame[i].col = 88 + 8 * i;
		finGame[i].spriteRow = 2;
		finGame[i].spriteCol = 8;
		finGame[i].height = 8;
		finGame[i].width = 8;
		finGame[i].value = 0;
		finGame[i].active = 1;
	}
	int temp = player.value;
	for (int i = 2; i >= 0; i--) {
		finGame[i].spriteCol = 8 + (temp % 10);
		temp /= 10;
	}
}

void endGame() {
	for (int i = 0; i < 3; i++) {
			shadowOAM[105 + i].attr0 = finGame[i].row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[105 + i].attr1 = finGame[i].col | ATTR1_TINY;
			shadowOAM[105 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(finGame[i].spriteRow, finGame[i].spriteCol);
	}
	shadowOAM[108].attr0 = 99 | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[108].attr1 = 125 | ATTR1_TINY;
	shadowOAM[108].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, 8);
}

void gameResetSprites() {
	for (int i = 0; i < 4; i++) {
			shadowOAM[105 + i].attr0 |= ATTR0_HIDE;
	}
}