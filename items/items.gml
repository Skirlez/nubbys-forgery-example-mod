// In this file you can register your mod's items.

// To register an item, call the mod_register_item(item_struct) function.

// For more information, see https://github.com/Skirlez/nubbys-forgery/wiki/Registering-Items

var jump_spring = mod_get_code_globals("items/example_item.gml").construct()
mod_register_item(jump_spring, "example_item")

var jump_spring_plus = mod_get_code_globals("items/example_item_upgrade.gml").construct()
mod_register_item(jump_spring_plus, "example_item_upgrade")