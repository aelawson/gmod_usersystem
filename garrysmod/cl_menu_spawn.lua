function menu_props()

    local prop = {}
 
    prop[1] = "models/props_junk/wood_pallet001a.mdl"
	prop[2] = "models/props_debris/metal_panel02a.mdl"
	prop[3] = "models/props_debris/metal_panel01a.mdl"
	prop[4] = "models/props_junk/iBeam01a.mdl"
	prop[5] = "models/props_c17/door01_left.mdl"
	prop[6] = "models/props_c17/concrete_barrier001a.mdl"
	prop[7] = "models/props_wasteland/wood_fence02a.mdl"
	prop[8] = "models/props_wasteland/wood_fence01a.mdl"
 
    local frame = vgui.Create("DFrame")
	frame:Center()
	frame:SetSize(400, 400)
	frame:SetTitle("Props")
	frame:MakePopup()
	
	local iconlist = vgui.Create("DPanelList", frame) 
 	iconlist:EnableVerticalScrollbar(true) 
 	iconlist:EnableHorizontal(true) 
 	iconlist:SetPadding(4) 
	iconlist:SetPos(10, 30)
	iconlist:SetSize(400, 400)
 
	for k, v in pairs(prop) do
	
		local icon = vgui.Create("SpawnIcon", iconlist) 
		icon:SetModel(v)
		iconlist:AddItem(icon)
		icon.DoClick = function(icon) 
	
			surface.PlaySound("ui/buttonclickrelease.wav") 
			RunConsoleCommand("gm_spawn", v)
	
		end 

	end
	
end

concommand.Add("spawn_menu", menu_props)
usermessage.Hook("spawn_menu", menu_props)