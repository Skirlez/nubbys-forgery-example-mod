# Translations

In this folder you will include .csv files for translations of strings in your mod.

Each line is formatted like so:
```
"key","string"
```
On the left is the translation key, and on the right is the string the key resolves to.
**You are allowed to have a trailing comma, it does not matter.**

Good practice: the key that you add should be prefixed with your mod's string ID, to avoid conflicts with other mods.

Right now the game only supports English, but in the future, you'd create a new .csv file for each language
your mod supports. Of course, you can stick to English.

## Special character sequences
Nubby's Number Factory uses [Scribble](https://www.jujuadams.com/Scribble/#/latest/) for text rendering.

This means you can utlilize its powerful [in-line commands](https://www.jujuadams.com/Scribble/#/latest/text-formatting) feature.
Nubby mainly uses two (but you can use any from the page linked):

- `[#ffffff]` sets the color of the text after it. In this case, the text is set to white (the color is in hex format).
For example: All item descriptions start with [#ffffff] so their text is white.

- `[sprite_name,image_index]` draws a sprite at a certain index. 
For example: `[spr_ITArrow,0]` draws the arrow sprite that every item/perk trigger has.


Not to be confused with Scribble's commands, the game also has some of its own special character sequence for placeholders:

`{a}`, `{b}`, `{c}` and so on, are placeholders, and are determined via code.
For example: All item descriptions have `{a}` at the start and after every line in their description, and a newline (`\n`) character is inserted by the game's code. 

## Fallback
If you don't want to bother with translations... You don't have to! If the game can't find a key, as a fallback measure it resolves the key to the key itself.

What this means is that if you just type in text instead of a translation key, the text is what will be shown. Scribble's in-line commands will work as well (but not placeholders, since they are unrelated to Scribble)