
//{{BLOCK(textBox)

//======================================================================
//
//	textBox, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 14 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 896 + 2048 = 3456
//
//	Time-stamp: 2018-04-09, 17:21:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TEXTBOX_H
#define GRIT_TEXTBOX_H

#define textBoxTilesLen 896
extern const unsigned short textBoxTiles[448];

#define textBoxMapLen 2048
extern const unsigned short textBoxMap[1024];

#define textBoxPalLen 512
extern const unsigned short textBoxPal[256];

#endif // GRIT_TEXTBOX_H

//}}BLOCK(textBox)
