
//{{BLOCK(title)

//======================================================================
//
//	title, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 250 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 16000 + 2048 = 18560
//
//	Time-stamp: 2018-04-13, 15:28:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TITLE_H
#define GRIT_TITLE_H

#define titleTilesLen 16000
extern const unsigned short titleTiles[8000];

#define titleMapLen 2048
extern const unsigned short titleMap[1024];

#define titlePalLen 512
extern const unsigned short titlePal[256];

#endif // GRIT_TITLE_H

//}}BLOCK(title)
