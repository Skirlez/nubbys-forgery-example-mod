construct = function() {
	// Reliable way to get your own mod ID
	var mod_id = global.cmod.mod_id

	// Create the item struct
	var item = {}

	// The translation key of the item's name
	item.display_name = mod_identifier(mod_id, "example_item_name")

	// mod_identifier is a quick way to combine our mod ID and another string with a semicolon.
	// So in the call above, the result will be "example_mod:example_item_name"

	// The translation key of the item's description
	item.description = mod_identifier(mod_id, "example_item_desc")

	// The sprite that should be assigned to the item's object
	// This sprite was registered in the sprites folder
	item.sprite = mod_get_sprite("spr_spring_item")

	// The game event on which the item triggers.
	// For a list, see here https://github.com/Skirlez/nubbys-forgery/wiki/List-of-Game-Events
	item.game_event = "1andHalfSecond"

	// Alternate Game Event for mutant tony
	item.alt_game_event = "HitWall3"

	// 1 is used for normal items, 2 is used for upgraded items
	item.level = 1
	
	// Tiers:
	// 0 - Common
	// 1 - Rare
	// 2 - Ultra-Rare
	item.tier = 0

	// Augments:
	// Normal items use "none"
	// Corrupted items use "corrupted"
	item.augment = "none"

	// effect is a string describing what the item does
	// It is only used for identification by other objects in code,
	// for example the The Eggy Perk, the perk that retriggers summoning items,
	// checks this variable so it knows what to retrigger.
	// For a list of base game effects see TODO
	item.effect = "nubby_speed_changer"

	// Which pool this item will show up in
	// 0 - Unobtainable
	// 1 - Nubby-Mart
	// 2 - Black Market
	// 3 - Café Nubby

	// Do not set it to 3.
	item.pool = 1

	// Price added to the item's base rarity price (can be negative)
	// Base rarity prices:
	// Common - 5
	// Rare, Ultra-Rare - 10
	item.offset_price = 0

	// Pair item's ID
	// Essentially this is the upgraded item's ID
	item.pair_id = mod_identifier(mod_id, "example_item_upgrade")

	// odds that affect the item's chance of appearing in early, mid, and endgame.
	item.odds_weight_early = 5
	item.odds_weight_mid = 5
	item.odds_weight_end = 5

	// Event functions
	// These functions are going to be called by the modloader!
	// In all event functions, self is the instance of the item running this code

	// Runs when the item is created
	item.on_create = function(inst) {
		
	}

	// Runs when triggered
	item.on_trigger = function(inst) {
		with (inst) {
			if (DisableItem == false and global.GameMode == 1) {
				with (obj_ParNubby) {
					if (vspeed > 0) {
						vspeed = 0
					}
					vspeed -= 20
				}
				scr_FX_ItemFire(au_ItemFireGrl)
				scr_TrackFire()
				scr_PositionalEv()
			}
			scr_ItemQueue()
		}
	}


	// Return our item struct so it can be registered in items.gml
	return item;
}

