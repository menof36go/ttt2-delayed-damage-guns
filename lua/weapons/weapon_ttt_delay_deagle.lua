if SERVER then
   AddCSLuaFile()
   resource.AddFile("materials/VGUI/ttt/icon_delayed_damage_deagle_64.jpg")
end

SWEP.HoldType = "pistol"
SWEP.PrintName = "Delayed Deagle"
SWEP.Slot = 6
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 54
SWEP.EquipMenuData = {
   type = "item_weapon",
   desc = "Does more damage than a standard deagle,\n but the damage is delayed"
};
SWEP.Icon = "vgui/ttt/icon_delayed_damage_deagle_64.jpg"
SWEP.Base = "weapon_tttbase"
if GetConVar("ttt_dd_use_special_slot"):GetBool() then
   SWEP.Kind = WEAPON_EQUIP1
else
   SWEP.Kind = WEAPON_PISTOL
end
SWEP.Primary.Ammo = "AlyxGun" 
SWEP.Primary.Recoil = 6
SWEP.Primary.Damage = 37
SWEP.Primary.Delay = 0.6
SWEP.Primary.Cone = 0.02
SWEP.Primary.ClipSize = 8
SWEP.Primary.ClipMax = 36
SWEP.Primary.DefaultClip = 8
SWEP.Primary.Automatic = true
SWEP.Primary.Sound = Sound("Weapon_Deagle.Single")
SWEP.HeadshotMultiplier = 4
SWEP.AmmoEnt = "item_ammo_revolver_ttt"
SWEP.CanBuy = {ROLE_TRAITOR}
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cstrike/c_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"
SWEP.IronSightsPos = Vector(-6.361, -3.701, 2.15)
SWEP.IronSightsAng = Vector(0, 0, 0)