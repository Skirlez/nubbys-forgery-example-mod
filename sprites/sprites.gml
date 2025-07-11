// In this file you will register your mods' sprites.

// You should use the mod_register_sprite(sprite, name) function provided.
// That way, you can access your sprite again with mod_get_sprite(mod_id, name), and it will
// be cleaned up for you automatically when your mod is unloaded.



// In this case, my sprites are spritesheets, so I will add them with sprite_add().
// Since it is a gamemaker function, it wants the full path to the sprite. We will obtain it
// using mod_get_path().



var spring_sprite_path = mod_get_path("sprites/spr_spring_item.png");
// My spritesheet has 16 subimages. Origin is set to (48, 48), as is standard for 96x96 item sprites
var spring_sprite = sprite_add(spring_sprite_path, 16, false, false, 48, 48);

mod_register_sprite(spring_sprite, "spr_spring_item")

var spring_upgrade_sprite_path = mod_get_path("sprites/spr_spring_item_upgrade.png");
var spring_upgrade_sprite = sprite_add(spring_upgrade_sprite_path, 16, false, false, 48, 48);

mod_register_sprite(spring_upgrade_sprite, "spr_spring_item_upgrade")


// Origin at (58, 70), as is standard for 117x141 perk sprites
var bible_sprite_path = mod_get_path("sprites/spr_bible_perk.png");
bible_sprite = sprite_add(bible_sprite_path, 36, false, false, 58, 70);
// Standard speed for perk sprites
sprite_set_speed(bible_sprite, 20, spritespeed_framespersecond)

mod_register_sprite(bible_sprite, "spr_bible_perk")


// Supervisor preview sprites (ones shown on selection screen) are 275x275, origin set to (137, 137) as is standard
// Splitting calls into multiple lines
var gambler_tony_preview_sprite = sprite_add(mod_get_path("sprites/spr_gambler_tony_preview.png"), 2, false, false, 137, 137)

// Standard speed for all supervisor sprites
sprite_set_speed(gambler_tony_preview_sprite, 12, spritespeed_framespersecond)

mod_register_sprite(gambler_tony_preview_sprite, "spr_gambler_tony_preview")

// My supervisor sprite is 123x143. Origin set to (61, 71) as is standard
var gambler_tony_idle_neutral = sprite_add(mod_get_path("sprites/spr_gambler_tony_idle_neutral.png"), 2, false, false, 61, 71)

sprite_set_speed(gambler_tony_idle_neutral, 12, spritespeed_framespersecond)

mod_register_sprite(gambler_tony_idle_neutral, "spr_gambler_tony_idle_neutral")