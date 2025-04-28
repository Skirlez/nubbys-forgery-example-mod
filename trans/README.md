# Translations

In this folder you will include .csv files for translations of strings in your mod.

Each line is formatted like so:
```
"key","string"
```
On the left is the translation key, and on the right is the string the key resolves to.
**You are allowed to have a trailing comma, it does not matter.**

Good practice: the key that you add should be prefixed with your mod's string ID, to avoid conflicts with other mods.

Right now the game only supports English, but in the future, you'd create a new csv for each language
your mod supports.

## Special character sequences
The game supports special character sequences that do different things:

- {a}, {b}, {c} and so on are placeholders, and are determined via code.
For example: All item descriptions have {a} at the start, and a newline character is inserted
by the game's code.

- [#ffffff] sets the color of the text after it. In this case, the text is set to white (the color is in hex format).
For example: All item descriptions start with [#ffffff] so their text is white.

## Fallback
If you don't want to bother with translations... You don't have to! If the game can't find a key, as a fallback measure it resolves the key to the key itself.

What this means is that if you just type in text instead of a translation key, the text is what will be shown. Barring placeholders, The special character sequences should still work as well.