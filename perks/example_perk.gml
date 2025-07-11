construct = function() {
	// Reliable way to get your own mod ID
	var mod_id = global.cmod.mod_id

	// Create the perk struct
	var perk = {}

	// The translation key of the perk's name
	perk.display_name = mod_identifier(mod_id, "example_perk_name")

	// mod_identifier is a quick way to combine our mod ID and another string with a semicolon.
	// So in the call above, the result will be "example_mod:example_perk_name"

	// The translation key of the perk's description
	// Since this description is dynamic and gets updated using code, we might as well leave this empty.
	perk.description = mod_identifier(mod_id, "example_perk_desc")

	// The sprite that should be assigned to the perk object
	// This sprite was registered in the sprites folder
	perk.sprite = mod_get_sprite("spr_bible_perk")

	// The Game Event on which the perk triggers.
	// For a list, see here https://github.com/Skirlez/nubbys-forgery/wiki/List-of-Game-Events

	// This will use our custom Game Event, "example_mod:24Popped".
	perk.game_event = mod_identifier(mod_id, "24Popped")

	// Tiers:
	// 0 - Common
	// 1 - Rare
	// 2 - Ultra-Rare
	perk.tier = 0

	// Type
	// Common and and perks obtainable through the capsules use 0
	// Rare and perks that can only be obtained through food use 1
	// Ultra-Rare perks use 2
	perk.type = 0

	// Which pool this perk will show up in
	// 0 - Unobtainable
	// 1 - Loot Capsules
	perk.pool = 1

	// Perk trigger effect color
	// Catspeak supports colors in this format: #RRGGBB
	perk.trigger_fx_color = #FFAAEE

	// This variable controls whether or not
	// To draw an additional window under the description
	// Displaying a certain game mechanic.
	// As of now, the only possible value is 1,
	// which shows you what disabled items are.
	// It is only used by The Snakey Perk.
	perk.additional_info_type = 0


	// We're making this variable global, because if it belonged to the instance,
	// You'd have a situation where two different bible perks have a different FOCUS slot,
	// but only one is shown as of v1.3.1
	global.cmod.focused_slot = 1

	// Runs when the perk is created
	perk.on_create = function(inst) {
		with (inst) {
			// This is a function defined and called by us, not the modloader
			evaluate_description = function() {
				// This function will return an updated description for the perk

				// Our perk instance holds the perk struct in the variable `perk`
				// Get the top part of the description (trigger condition)
				var part_1 = scr_Text(perk.game_event, "\n")

				// Get the bottom part of the description filled with the current focused slot
				var part_2 = scr_Text(perk.description, "\n", global.cmod.focused_slot)
				// Join together
				return string_concat(part_1, part_2)
			}

			MyDesc = evaluate_description()

		}
	}

	// Runs when the perk is triggered
	perk.on_trigger = function(inst) {
		with (inst) {
			if (DisablePerk == false and global.GameMode == 1) {
				scr_FX_PerkFire()
				if (global.cmod.focused_slot != 7) {
					scr_ForceTrigger(global.cmod.focused_slot, 2)
					global.cmod.focused_slot += 1
				}
				else {
					global.cmod.focused_slot = 1
				}

				// Update descriptions of all instances, not just ours
				// We don't know which one the game chooses to display
				with (object_index) {
					MyDesc = evaluate_description()
				}
			}
			scr_PerkQueue()
		}
	}


	// Return our perk struct so it can be registered in perks.gml
	return perk
}