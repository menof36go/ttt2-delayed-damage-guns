local timers = {}
local dDeagle = nil
local dShotgun = nil
local dRifle = nil

local function ValidateOrCreateAppropriateSWEP()
	dDeagle = IsValid(dDeagle) and dDeagle or ents.Create("weapon_ttt_delay_deagle")
	dShotgun = IsValid(dShotgun) and dShotgun or ents.Create("weapon_ttt_delay_shotgun")
	dRifle = IsValid(dRifle) and dRifle or ents.Create("weapon_ttt_delay_rifle")
end

hook.Add("EntityTakeDamage", "ttt_dd_damage", function(target, dmginfo)
	local attacker = dmginfo:GetAttacker()
	local inflictor = dmginfo:GetInflictor()
	if IsValid(target) and target:IsPlayer() and target:Alive() and IsValid(attacker) and attacker:IsPlayer() then
		local w = attacker:GetActiveWeapon()
		if IsValid(inflictor) then
			if (inflictor:IsWeapon()) then
				w = inflictor
			end
		end
		if IsValid(w) and w.GetClass then
			local wep = w:GetClass()
			if wep == "weapon_ttt_delay_deagle" or wep == "weapon_ttt_delay_shotgun" or wep == "weapon_ttt_delay_rifle" then
				ValidateOrCreateAppropriateSWEP() -- In most cases this should be entirely unnecessary
				if !(w == dDeagle) and !(w == dShotgun) and !(w == dRifle) then
					local multiplier = GetConVar("ttt_dd_damage_multiplier"):GetFloat()
					local delay = GetConVar("ttt_dd_damage_delay"):GetFloat()
					local dmg = dmginfo:GetDamage() * multiplier
					local steamID = attacker:SteamID64()
					dmginfo:SetDamage(0)
					local id = "ttt_dd_delay_" .. steamID .. tostring(CurTime())
					timer.Create(id, delay, 1, function() 
						local newdmginfo = DamageInfo()
						local p = player.GetBySteamID64(steamID)
						newdmginfo:SetDamage(dmg)
						if p then
							if wep == "weapon_ttt_delay_deagle" then
								newdmginfo:SetInflictor(dDeagle)
							elseif wep == "weapon_ttt_delay_shotgun" then
								newdmginfo:SetInflictor(dShotgun)
							else
								newdmginfo:SetInflictor(dRifle)
							end
							newdmginfo:SetAttacker(p)
							target:TakeDamageInfo(newdmginfo)
						end
					end)
					timers[id] = true
				end
			end
		end
	end
end)

hook.Add("TTTPrepareRound", "ttt_dd_end", function(result)
	ValidateOrCreateAppropriateSWEP()
	for i,t in pairs(timers) do
		timer.Stop(i)
	end
	timers = {}
end)
