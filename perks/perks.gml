// In this file you can register your mod's perks.

// To register an item, call the mod_register_perk(perk_struct, perk_id) function.
// It will register the perk struct, and set its ID to be "mod_id:perk_id".


var bible_perk = mod_get_code_globals("perks/example_perk.gml").construct()
mod_register_perk(bible_perk, "example_perk")


// Below is code made for the Bible Perk's 24 Pegs Popped Trigger condition
popped24 = 0
var mod_id = global.cmod.mod_id

// name our event example_mod:24Popped to not potentially interfere with other mods
game_event_name = mod_identifier(mod_id, "24Popped");

// Subscribe to the PegPop event and start counting
// Once we reach 24, trigger "example_mod:24Popped"
mod_subscribe_to_game_event("PegPop", function() {
	popped24 += 1
	if (popped24 == 24) {
		scr_GameEv(game_event_name)
		popped24 = 0
	}
})

mod_subscribe_to_game_event("NubbyLaunchPerk", function() {
	// Reset our count
	popped24 = 0
})


// save focused slot
mod_register_autosave_save_callback(function(data) {
	data[$ "focused_slot"] = global.cmod.focused_slot;
})
mod_register_autosave_load_callback(function(data) {
	global.cmod.focused_slot = data[$ "focused_slot"];
})