

----------------------------------------------------------------------------------------------------------

--POLICE MENU

----------------------------------------------------------------------------------------------------------

function police_setup()

local frame = vgui.Create("DFrame")
frame:SetPos((ScrW() / 2) - 300, (ScrH() / 2) - 50) --Set Window in center of screen
frame:SetSize(600, 100)
frame:SetTitle("Choose your class:")
frame:SetVisible(true)
frame:SetDraggable(false)
frame:ShowCloseButton(false)
frame:MakePopup()

local textbox = bgui.Create("DTextEntry")
textbox:SetPos((ScrW() / 2) - 275, (ScrH() / 2) - 35)
textbox:SetTall(20)
textbox:SetWide(200)
textbox:SetEnterAllowed(true)

end