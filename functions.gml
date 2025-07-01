// This file is used in this mod to implement utility functions.

// This function is just a shorthand for "instance_find(object, 0)",
// which is used a lot in catspeak/gmlspeak, as object.variable syntax is not supported
mod_register_function("any", function(obj) {
    return instance_find(obj, 0);
})