// Player Struct
typedef struct {
	int row;
	int col;
    int cdel;
    int rdel;
	int width;
    int height;
    int aniCounter;
    int prevAniState;
    int aniState;
    int curFrame;
    int numFrames;
    int value;
} PLAYER;

// Item Struct
typedef struct {
	int row;
	int col;
	int width;
	int height;
	int value;
	int price;
	int spriteRow;
	int spriteCol;
	int active;
	int inUse;
	int location;
	int sold;
	int activeTime;
    int leeway;
    int palrow;
    const unsigned short *tiles;
    int tilesLen;
    const unsigned short *map;
    int mapLen;
} ITEM;

// NPC Struct
typedef struct {
	int row;
	int col;
    int cdel;
    int rdel;
	int width;
    int height;
    int aniCounter;
    int prevAniState;
    int aniState;
    int curFrame;
    int numFrames;
    int active;
    int moveRight;
    int moveLeft;
    int moveUp;
    int moveDown;
    int location;
    int waitTime;
    int firstSpawn;
    int atCounter;
    int leaving;
    int counterTime;
} CUSTOMER;

// Constants
#define ITEMCOUNT 8

// Variables
extern PLAYER player;
extern ITEM items[ITEMCOUNT];
extern int selected;
extern int priced;
extern int beginSelection;
extern int won;
extern int lost;
extern int changingPrice;
extern int firstPriceChange;
extern int currentDay;
extern int placementCounter;
extern int cancel;
extern int placingInstruction;
extern int placingInstructionsCompleted;
extern int cheating;
extern CUSTOMER man;

// Custom Game Colors
#define NUMCOLORS 6

// This does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initItems();
void updatePrice(ITEM *);
void initSelecting();
void updateSelecting();
void drawSelecting();
void initPricing();
void updatePricing();
void drawPricing();
void initChangePrice();
void changePrice();
void drawChangePrice();
void initCurrency();
void initFaces();
void initCustomers();
void updateCurrency();
void updateCustomers();
void drawCurrency();
void drawRest();
void drawFaces();
void drawCustomers();
