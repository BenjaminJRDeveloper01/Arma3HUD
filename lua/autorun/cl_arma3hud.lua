if SERVER then
	resource.AddFile("resource/fonts/Lato-Light.ttf")
end

surface.CreateFont("HUD_S20",
{
	font = "Lato Light",
	size = 20,
	weight = 250,
	antialias = true,
	strikeout = true,
	additive = true,
})

surface.CreateFont("HUD_S25",
{
	font = "Lato Light",
	size = 25,
	weight = 250,
	antialias = true,
	strikeout = true,
	additive = true,
})



local backgroundColor = Color(15, 15, 15, 150)


hook.Add("HUDPaint", "ArmA3HUD", function()
	local ply = LocalPlayer()
	local wep = ply:GetActiveWeapon():GetClass()
	local amm1 = ply:GetActiveWeapon():Clip1()
	local amm2 = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
	local crouch = ply:Crouching()
	local crouchtex = Material("crouching.png")
	local standtex = Material("standing.png")
	if wep == nil then
		return false
	end
	if amm1 <= -1 then
		amm1 = "    "
	end
	if amm2 <= -1 then
		amm2 = "    "
	end
	if wep == "cw_mk11" then
		wep = "MK11"
	end
	if wep == "cw_g36c" then
		wep = "G36C"
	end
	if wep == "cw_ar15" then
		wep = "AR-15"
	end
	if wep == "cw_ak74" then
		wep = "AK-74"
	end
	if wep == "cw_scorpion_evo3" then
		wep = "Scorpion Evo 3"
	end
	if wep == "cw_frag_grenade" then
		wep = "Frag Grenade"
	end
	if wep == "cw_flash_grenade" then
		wep = "Flash Grenade"
	end
	if wep == "cw_smoke_grenade" then
		wep = "Smoke Grenade"
	end
	if wep == "cw_scarh" then
		wep = "SCAR-H"
	end
	if wep == "cw_scarl" then
		wep = "SCAR-L"
	end
	if wep == "cw_l115" then
		wep = "L115"
	end
	if wep == "cw_p99" then
		wep = "P99"
	end
	if wep == "cw_vss" then
		wep = "VSS Vintorez"
	end
	if wep == "cw_m3super90" then
		wep = "M3 Super 90"
	end
	if wep == "keys" and wep == "weapon_physgun" and wep == "gmod_tool" and wep == "gmod_camera" and wep == "garde_a_vous" then
		wep = "	"
	end
	if wep == "wep_jack_job_drpradio" then
		wep = "Radio"
	end
	if wep == "id_swep" then
		wep = "ID"
	end
	if crouch == true then
		surface.SetMaterial(crouchtex)
		surface.DrawTexturedRect(ScrW() - 100, 5, 95, 135)
	end
	if crouch == false then
		surface.SetMaterial(standtex)
		surface.DrawTexturedRect(ScrW() - 100, 5, 95, 135)
	end
	surface.SetDrawColor(15, 15, 15, 150)
	surface.DrawRect(ScrW() - 455, 5, 350, 30)
	surface.DrawRect(ScrW() - 455, 40, 350, 100)
	draw.SimpleText((" ".. tostring(wep)), "HUD_S20", ScrW() - 120, 55 - 46, Color(0, 220, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
	draw.SimpleText((tostring(amm1) .. " | " .. tostring(amm2)), "HUD_S25", ScrW() - 120, 90 -46, Color(0, 220, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
	surface.DrawRect(ScrW() - 100, 5, 95, 135)

	if ply:Health() <= 30 then
		ply:SetRunSpeed(100)
	end
	

end)



local hideHUDElements = {
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_Agenda"] = true,
	["DarkRP_HUD"] = true,
	["DarkRP_EntityDisplay"] = true,
	["DarkRP_ZombieInfo"] = true,
	["DarkRP_Hungermod"] = true,
}



hook.Add("HUDShouldDraw", "HideDefaultDarkRPHud", function(name)
	if hideHUDElements[name] then return false end
end)



local hide = {}

hide["CHudCrosshair"] = true
hide["CHudDamageIndicator"] = true
hide["CHudHintDisplay"] = true
hide["CHudPoisonDamageIndicator"] = true
hide["CHudSquadStatus"] = true
hide["CHudTrain"] = true
hide["CHudVoiceSelfStatus"] = true
hide["CHudVoiceStatus"] = true
hide["CHudHealth"] = true
hide["CHudAmmo"] = true
hide["CHudBattery"] = true
hide["CHudZoom"] =  true
hook.Add("HUDShouldDraw", "HideHUD", function(name)
	if hide[name] then
		return false
	end
end)
