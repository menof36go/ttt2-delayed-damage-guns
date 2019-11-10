if SERVER then
	AddCSLuaFile()
	if file.Exists("scripts/sh_convarutil.lua", "LUA") then
		AddCSLuaFile("scripts/sh_convarutil.lua")
		print("[INFO][Delayed Damage Guns] Using the utility plugin to handle convars instead of the local version")
	else
		AddCSLuaFile("scripts/sh_convarutil_local.lua")
		print("[INFO][Delayed Damage Guns] Using the local version to handle convars instead of the utility plugin")
	end
end

if file.Exists("scripts/sh_convarutil.lua", "LUA") then
	include("scripts/sh_convarutil.lua")
else
	include("scripts/sh_convarutil_local.lua")
end

-- Must run before hook.Add
local cg = ConvarGroup("DelayedDmg", "Delayed Damage Guns")
Convar(cg, false, "ttt_dd_damage_multiplier", 2, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Multiplier for the damaged dealed", "float", 0.01, 10, 2)
Convar(cg, false, "ttt_dd_damage_delay", 15, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Delay between hit and receiving damage", "float", 1, 100, 1)
Convar(cg, false, "ttt_dd_use_special_slot", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED}, "Use the slot for special equipment instead of normal weapon slots", "bool")
--
--generateCVTable()
--