-------------------------------------------------------------------------------------------------------------

--CITIZEN_MENU

-------------------------------------------------------------------------------------------------------------

local function citizen_menu()
		
	citizenframe = vgui.Create("DFrame")
	
	citizenframe:SetPos((ScrW() / 2) - 200, (ScrH() / 2) - 200)
	citizenframe:SetSize(400, 400)
	citizenframe:SetTitle("Citizen Settings:")
	citizenframe:SetVisible(true)
	citizenframe:SetBackgroundBlur(true)
	citizenframe:SetDraggable(false)
	citizenframe:ShowCloseButton(true)
	citizenframe:MakePopup()
	
-------------------------------------------------------------------------------------------------------------
	
--CHARACTER_MODEL_CODE

-------------------------------------------------------------------------------------------------------------

	local model = {}
	
		model[1] = "models/humans/group01/male_04.mdl"
		model[2] = "models/humans/group01/male_03.mdl"
		model[3] = "models/humans/group01/female_01.mdl"
		model[4] = "models/humans/group01/female_03.mdl"
	
	local model_list = vgui.Create("DPanelList", citizenframe)	
	model_list:EnableVerticalScrollbar(true) 
 	model_list:EnableHorizontal(false) 
 	model_list:SetPadding(5) 
	model_list:SetPos(30, 45)
	model_list:SetSize(100, 200)
	
	for k, v in pairs(model) do
	
		local model_icon = vgui.Create("SpawnIcon", model_list) 
		model_icon:SetModel(v)
		model_list:AddItem(icon)
		model_icon.DoClick = function(ply) 
	
			ply:SetModel(v)
	
		end 
	end
	
	local citizen_model_label = vgui.Create("DLabel", citizenframe)
	
	citizen_model_label:SetPos(30, 30)
	citizen_model_label:SetColor(Color(255, 255, 255, 255))
	citizen_model_label:SetFont("default")
	citizen_model_label:SetText("Model:")
	citizen_model_label:SizeToContents()
	
	-- local citizen_model = vgui.Create("DModelPanel", citizenframe)
	
	-- citizen_model:SetSize(100, 100)
	-- citizen_model:SetPos(30, 45)
	-- citizen_model:SetModel("models/player/kleiner.mdl")
	
	

----------------------------------------------------------------
	
------CHARACTER_NAME_CODE---------------------------------------
	
	local citizen_name_label = vgui.Create("DLabel", citizenframe)
	
	citizen_name_label:SetPos(160, 30)
	citizen_name_label:SetColor(Color(255, 255, 255, 255))
	citizen_name_label:SetFont("default")
	citizen_name_label:SetText("Character name:")
	citizen_name_label:SizeToContents()
	
	local citizen_name = vgui.Create("DTextEntry", citizenframe)
	
	citizen_name:SetPos(160, 45)
	citizen_name:SetTall(20)
	citizen_name:SetWide(200)
	citizen_name:SetEnterAllowed(true)
	
-----------------------------------------------------------------------	
	
end

concommand.Add("citizen_menu", citizen_menu)