// In this file you can register your mod's supervisors.


var gambler_tony = mod_get_code_globals("supervisors/example_supervisor.gml").construct()
mod_register_supervisor(gambler_tony, "example_supervisor")

global.cmod.gambler_tony_struct = gambler_tony

mod_register_autosave_save_callback(function(data) {
	var gambler_tony_index = mod_registry_get_left(global.index_registry, mod_resource_supervisor, global.cmod.gambler_tony_struct)

	if any(obj_LvlMGMT).SVID != gambler_tony_index || gambler_tony_index == undefined { // if we aren't using gambler tony
		return;
	}
	
	var instance = any(obj_LvlMGMT).SVManager;
	if (instance_exists(instance.reroll_object)) {
		data[$ "costs"] = instance.reroll_object.costs
	}
}) 
mod_register_autosave_load_callback(function(data) {
	var gambler_tony_index = mod_registry_get_left(global.index_registry, mod_resource_supervisor, global.cmod.gambler_tony_struct)

	if any(obj_LvlMGMT).SVID != gambler_tony_index || gambler_tony_index == undefined { // if we aren't using gambler tony
		return;
	}
	var instance = any(obj_LvlMGMT).SVManager;
	if (instance_exists(instance.reroll_object)) {
		if struct_exists(data, "costs") {
			instance.reroll_object.costs = data[$ "costs"];
			instance.reroll_object.skip_reset = true; // (we're entering shop, but we want to avoid resetting costs)
		}

	}
}) 
