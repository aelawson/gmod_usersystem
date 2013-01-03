include( 'cl_menu_citizen.lua' )
include( 'sql_database.lua' )

----------------------------------------------------------------------------------------------------------

--ENTRY FRAME

----------------------------------------------------------------------------------------------------------

function entry_menu(ply)

	local entry_frame = vgui.Create("DFrame")
	entry_frame:SetBackgroundBlur(true)
	entry_frame:SetVisible(true)
	entry_frame:MakePopup()
	entry_frame:SetDraggable(false)
	entry_frame:ShowCloseButton(false)
	entry_frame:SetPos((ScrW() / 2) - 200, (ScrH() / 2) - 200)
	entry_frame:SetSize(400, 400)
	entry_frame:SetTitle("User Database System")
		
	local entry_sheet = vgui.Create("DPropertySheet", entry_frame)	
	entry_sheet:SetPos(20, 30)
	entry_sheet:SetSize(360, 340)
	
------------------------------------------------------------------------------------

--LOG IN PANEL

------------------------------------------------------------------------------------
	
	local login_panel = vgui.Create("DPanel")
	login_panel:SetPos(30, 30)
	login_panel:SetSize(300, 200)
		
		local username = vgui.Create("DTextEntry", login_panel)		
		username:SetPos(30, 45)
		username:SetSize(200, 20)
		username:SetEditable(true)
		username:SetEnterAllowed(true)
				
		local username_label = vgui.Create("DLabel", login_panel)				
		username_label:SetPos(30, 30)
		username_label:SetFont("default")
		username_label:SetText("Username:")
		username_label:SetTextColor(Color(255, 255, 255, 255))
		username_label:SizeToContents()

		local password = vgui.Create("DTextEntry", login_panel)		
		password:SetPos(30, 90)
		password:SetSize(200, 20)
		password:SetEditable(true)
		password:SetEnterAllowed(true)
	
		local password_label = vgui.Create("DLabel", login_panel)				
		password_label:SetPos(30, 75)
		password_label:SetFont("default")
		password_label:SetText("Password:")
		password_label:SetTextColor(Color(255, 255, 255, 255))
		password_label:SizeToContents()
		
		login_button = vgui.Create("DButton", login_panel)
		login_button:SetPos(30, 120)
		login_button:SetSize(75, 30)
		login_button:SetText("Log In")
		login_button.DoClick = function(ply)
		
			username_value = username:GetValue()
			Username = username_value
		
			password_value = password:GetValue()
			Password = password_value
			
			surface.PlaySound("ui/buttonclickrelease.wav") 
			
			ply:ConCommand("LogIn")
			
			-- timer.Create("SaveStat", 10, 0, function() saveStat(ply) end)
			
		end	
		
------------------------------------------------------------------------------------

--NEW USER PANEL

------------------------------------------------------------------------------------
		
	local new_panel = vgui.Create("DPanel")
	new_panel:SetPos(30, 30)
	new_panel:SetSize(300, 200)

		local username_new = vgui.Create("DTextEntry", new_panel)		
		username_new:SetPos(30, 45)
		username_new:SetSize(200, 20)
		username_new:SetEditable(true)
		username_new:SetEnterAllowed(true)
				
		local username_new_label = vgui.Create("DLabel", new_panel)				
		username_new_label:SetPos(30, 30)
		username_new_label:SetFont("default")
		username_new_label:SetText("Username:")
		username_new_label:SetTextColor(Color(255, 255, 255, 255))
		username_new_label:SizeToContents()

		local password_new = vgui.Create("DTextEntry", new_panel)		
		password_new:SetPos(30, 90)
		password_new:SetSize(200, 20)
		password_new:SetEditable(true)
		password_new:SetEnterAllowed(true)
	
		local password_new_label = vgui.Create("DLabel", new_panel)				
		password_new_label:SetPos(30, 75)
		password_new_label:SetFont("default")
		password_new_label:SetText("Password:")
		password_new_label:SetTextColor(Color(255, 255, 255, 255))
		password_new_label:SizeToContents()
		
		create_button = vgui.Create("DButton", new_panel)
		create_button:SetPos(30, 120)
		create_button:SetSize(75, 30)
		create_button:SetText("Register")
		create_button.DoClick = function()
		
			username_new_value = username_new:GetValue()
			Username_new = username_new_value
					
			password_new_value = password_new:GetValue()
			Password_new = password_new_value
						
			surface.PlaySound("ui/buttonclickrelease.wav") 
						
			ply:ConCommand("NewUser")
			ply:ConCommand("citizen_menu")
			
			entry_frame:SetVisible(false)
			-- timer.Create("SaveStat", 10, 0, function() saveStat(ply) end)
			
		end	

--Add tabs to top of property sheets				
	
	entry_sheet:AddSheet("Log In", login_panel, "gui/silkicons/group", true, true, "Existing users.")
	entry_sheet:AddSheet("New User", new_panel, "gui/silkicons/user", true, true, "New users.")

end

concommand.Add("entry_menu", entry_menu)