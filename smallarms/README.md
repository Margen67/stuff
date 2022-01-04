# smallarms
A script to help extract, and repack Small Arms gbd archives.

This doesn't *fully* unpack them, it merely automatically extracts the archive or adds the header for you so you don't need to add it manually.

## Requirements
* 7-Zip
  * [Windows](https://www.7-zip.org)
    * If not installed in the default location (%ProgramFiles%\7-Zip) you will prompted to input the path.
  * Linux (Ubuntu)
    * `sudo apt-get update && sudo apt-get install p7zip-full`
* Bash version 4 or later

## Usage
```sh
./smallarms.sh [e]xtract/[r]ezip file
# Example:
./smallarms.sh extract data/game.gbd
```
If ran without extra parameters you will asked what to do.

## Files:

### Small Arms (demo, might be same as retail):
  * `12.png`
  * `achievement1.png`
  * `achievement2.png`
  * `achievement3.png`
  * `achievement4.png`
  * `achievement5.png`
  * `achievement6.png`
  * `achievement7.png`
  * `achievement8.png`
  * `achievement9.png`
  * `achievement10.png`
  * `achievement11.png`
  * `achievement12.png`
  * `ArcadeInfo.xml`
  * `CERO_A.png`
  * `default.xex`
  * `ESRB_E10.PNG`
  * `ESRB_RP.png`
  * `gastronaut.png`
  * `gastronaut_small.png`
  * `icon.png`
  * `KMRB_A.png`
  * `OFLC_AU_PG.png`
  * `PEGI_11P.png`
  * `PEGI_12P.png`
  * `smallarms.png`
  * `smallarms_small.png`
  * `USK_12.png`
  * `/data/`
    * `bootstrap.gbd`
    * `game.gbd`
    * `init.gbd`
    * `/characters/`
      File name       | Character name
      ---------       | --------------
      `boss.gbd`      | Ivar/Gullarp<sup>?</sup>
      `dino.gbd`      | Tyrone
      `empty.gbd`     | Unused<sup>?</sup>
      `essie.gbd`     | Ivar/Gullarp<sup>?</sup>
      `knight.gbd`    | Lord Peet
      `log.gbd`       | Billy Ray Logg
      `marine.gbd`    | Unit 51
      `marky.gbd`     | Marky Kat
      `mouse.gbd`     | Mousey McNuts
      `professor.gbd` | Professor Von Brown
      `robot.gbd`     | ISO-7982
      `rooster.gbd`   | Pector El Pollo
      `truffles.gbd`  | Mr. Truffles
      `zoe.gbd`       | Zöe
  * `/lang/`
    File name       | Language
    ---------       | --------
    `cn.gbd`        | Chinese
    `de.gbd`        | Deutsch <sup>German</sup>
    `en.gbd`        | English 
    `es.gbd`        | Español <sup>Spanish</sup>
    `fr.gbd`        | French 
    `it.gbd`        | Italian 
    `jp.gbd`        | Japanese
    `kr.gbd`        | Korean
  * `/levels/`
    File name            | Level name
    ---------            | ----------
    `desert.gbd`         | Bazaar
    `factory.gbd`        | Sewer
    `moonbase.gbd`       | Moonbase
    `outhouse.gbd`       | Outhouse
    `targetpractice.gbd` | *?*
    `tornado.gbd`        | Tornado
    `train.gbd`          | Train
    `training.gbd`       | Training
    `volcano.gbd`        | Volcano
    `waterfall.gbd`      | Waterfall
  * `/scripts/`
    * `/base/`
      * `anim.lua`
      * `collision.lua`
      * `debug.lua`
      * `dialog.lua`
      * `items.lua`
      * `util.lua`
    * `/cinematic/`
      * `marky1.lua`
      * `marky2.lua`
      * `marky3.lua`
    * `/sounds/`
      * `config.xgs`

## File types

### dds
https://en.wikipedia.org/wiki/DirectDraw_Surface

### ga2 (Gastronaut ??)
Unknown.

### gbd (Gastronaut ??)
[bzip2](https://en.wikipedia.org/wiki/Bzip2) with 28 byte header. Game can't load it without the header present.

Only some bytes of the header are different in each file.

#### Small Arms (demo, retail might be same)
Bytes (Hex) | File (/data/)
----------- | -------------
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 7C** *00 00 00* **1C** *00 00 00 01* **00 12 46 91** | bootstrap.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **01 BA** *00 00 00* **1C** *00 00 00 01* **01 B5 B0 64** | game.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 16** *00 00 00* **1C** *00 00 00 01* **00 76 C0 64** | init.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 09** *00 00 00* **1C** *00 00 00 01* **00 0E C2 B5** | characters/boss.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0B** *00 00 00* **1C** *00 00 00 01* **00 0D 4A ED** | characters/dino.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 09** *00 00 00* **1C** *00 00 00 01* **00 07 AA B5** | characters/empty.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0B** *00 00 00* **1C** *00 00 00 01* **00 0E 72 ED** | characters/essie.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0A** *00 00 00* **1C** *00 00 00 01* **00 0C 52 ED** | characters/knight.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0B** *00 00 00* **1C** *00 00 00 01* **00 13 42 88** | characters/log.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0B** *00 00 00* **1C** *00 00 00 01* **00 0E D7 E4** | characters/marine.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0A** *00 00 00* **1C** *00 00 00 01* **00 1E 22 ED** | characters/marky.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0A** *00 00 00* **1C** *00 00 00 01* **00 18 D2 ED** | characters/mouse.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0B** *00 00 00* **1C** *00 00 00 01* **00 0C 22 C0** | characters/professor.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0A** *00 00 00* **1C** *00 00 00 01* **00 0E C2 ED** | characters/robot.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0B** *00 00 00* **1C** *00 00 00 01* **00 0D 0A ED** | characters/rooster.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0A** *00 00 00* **1C** *00 00 00 01* **00 0D FA ED** | characters/truffles.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0B** *00 00 00* **1C** *00 00 00 01* **00 0C EA ED** | characters/zoe.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 09** *00 00 00* **1C** *00 00 00 01* **00 64 DE 77** | lang/cn.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 08** *00 00 00* **1C** *00 00 00 01* **00 00 DA 4A** | lang/de.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 09** *00 00 00* **1C** *00 00 00 01* **00 00 D0 18** | lang/en.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 08** *00 00 00* **1C** *00 00 00 01* **00 00 D7 AA** | lang/es.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 08** *00 00 00* **1C** *00 00 00 01* **00 00 DB 2A** | lang/fr.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 08** *00 00 00* **1C** *00 00 00 01* **00 00 D4 2A** | lang/it.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 09** *00 00 00* **1C** *00 00 00 01* **00 1C CA 57** | lang/jp.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 09** *00 00 00* **1C** *00 00 00 01* **00 22 94 8C** | lang/kr.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 06** *00 00 00* **1C** *00 00 00 01* **00 45 AE 9D** | levels/desert.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 06** *00 00 00* **1C** *00 00 00 01* **00 4C 3F E4** | levels/factory.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 05** *00 00 00* **1C** *00 00 00 01* **00 2F 61 E2** | levels/moonbase.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 09** *00 00 00* **1C** *00 00 00 01* **00 43 DF E4** | levels/outhouse.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0F** *00 00 00* **1C** *00 00 00 01* **00 05 E5 34** | levels/targetpractice.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 05** *00 00 00* **1C** *00 00 00 01* **00 44 79 88** | levels/tornado.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 05** *00 00 00* **1C** *00 00 00 01* **00 5B 49 6A** | levels/train.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 04** *00 00 00* **1C** *00 00 00 01* **00 0E 7E 9D** | levels/training.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 0E** *00 00 00* **1C** *00 00 00 01* **00 2E AA 43** | levels/volcano.gbd
***67 64 62 64*** *00 00 00* **02** *00 00 00 20 00 00* **00 09** *00 00 00* **1C** *00 00 00 01* **00 31 7A B4** | levels/waterfall.gbd

Type                          | Amount | Description
----                          | ------ | -----------
Char                          | 4      | Header `gdbd`
Byte                          | 3      | Unknown
Int8<sup>?</sup>              |        | Version<sup>?</sup>
Byte                          | 6      | Unknown
Int16, Big Endian<sup>?</sup> |        | Number of files<sup>?</sup>
Byte                          | 3      | Unknown
Int8<sup>?</sup>              |        | Header Size<sup>?</sup>
Int32<sup>?</sup>             |        | Unknown
Int32, Big Endian<sup>?</sup> |        | Uncompressed Size

* Version varies per game:

  Version   | Game             | Year
  -------   | ----             | ----
  3         | Gel: Set & Match | 2009
  ?         | Elemental        | 2007
  2         | Small Arms       | 2006
  ?<!--1--> | Fuzzee Fever     | 2004

  gbd version 3 (Gel) cannot be opened in 7-Zip.

### ga2
Gastronaut archive 2<sup>?</sup>

### gm2
Gastronaut model 2<sup>?</sup>

### gsh
Gastronaut shader<sup>?</sup>

### lua
https://en.wikipedia.org/wiki/Lua_(programming_language)

### mpk
Unknown. Unrelated to http://wiki.xentax.com/index.php/Terminator_Dawn_Of_Fate_MPK.

### png
https://en.wikipedia.org/wiki/Portable_Network_Graphics

### xex
[Xbox 360 Executable](https://free60project.github.io/wiki/XEX).

### xgs
Unknown. Also used by:
  * [FEZ](https://github.com/fesh0r/fez-unpack/blob/master/fez_unpack.py#L33) 
  * [007 Goldeneye](https://wiki.xentax.com/index.php/List_of_games_with_unknown_file_formats)
  * *Maybe other (Xbox 360) games?*

### xml
https://en.wikipedia.org/wiki/XML

### xsb
https://wiki.xentax.com/index.php/XBOX_XSB

Can be played/converted with [vgmstream](https://github.com/vgmstream/vgmstream).

### xwb
https://wiki.xentax.com/index.php/XBOX_XWB3

Can be played/converted with [vgmstream](https://github.com/vgmstream/vgmstream).

## Additional information
* IGS 2007: Jacob Van Wingen, Don Wurster - 'Postmortem: Small Arms'
  * [archive.org](https://archive.org/details/igs-2007-small-arms-postmortem)
  * [YouTube](https://youtu.be/GwNT0a9iaxc)
