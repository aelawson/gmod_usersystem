-------------------------------------------------------------------------------------------------------------

--POLICE_MENU

-------------------------------------------------------------------------------------------------------------

local function police_menu()
		
	policeframe = vgui.Create("DFrame")
	
	policeframe:SetPos((ScrW() / 2) - 200, (ScrH() / 2) - 200)
	policeframe:SetSize(400, 400)
	policeframe:SetTitle("police Settings:")
	policeframe:SetVisible(true)
	policeframe:SetBackgroundBlur(true)
	policeframe:SetDraggable(false)
	policeframe:ShowCloseButton(true)
	policeframe:MakePopup()
	
----------------------------------------------------------------
	
------CHARACTER_MODEL_CODE--------------------------------------
	
	local police_model_label = vgui.Create("DLabel", policeframe)
	
	police_model_label:SetPos(30, 30)
	police_model_label:SetColor(Color(255, 255, 255, 255))
	police_model_label:SetFont("default")
	police_model_label:SetText("Model:")
	police_model_label:SizeToContents()
	
	local police_model = vgui.Create("DModelPanel", policeframe)
	
	police_model:SetSize(100, 100)
	police_model:SetPos(30, 45)
	police_model:SetModel("models/player/kleiner.mdl")
	
	

----------------------------------------------------------------
	
------CHARACTER_NAME_CODE---------------------------------------
	
	local police_name_label = vgui.Create("DLabel", policeframe)
	
	police_name_label:SetPos(160, 30)
	police_name_label:SetColor(Color(255, 255, 255, 255))
	police_name_label:SetFont("default")
	police_name_label:SetText("Character name:")
	police_name_label:SizeToContents()
	
	local police_name = vgui.Create("DTextEntry", policeframe)
	
	police_name:SetPos(160, 45)
	police_name:SetTall(20)
	police_name:SetWide(200)
	police_name:SetEnterAllowed(true)
	
-----------------------------------------------------------------------	
	
end

concommand.Add("police_menu", police_menu)

