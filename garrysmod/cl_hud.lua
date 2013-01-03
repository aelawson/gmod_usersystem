------------------------------------------------------------------------------------------------------------

--HEADS UP DISPLAY

------------------------------------------------------------------------------------------------------------

function myhud()

-->>local declarations<<--

local client = LocalPlayer()
local health = LocalPlayer():Health()

if not client:Alive() then return end
if (client:GetActiveWeapon() == NULL or client:GetActiveWeapon() == "Camera") then return end

-->>Health status bar<<--

draw.RoundedBox(6, 15, (ScrH() - 65), 230, 50, Color(51, 58, 51, 75))
draw.RoundedBox(4, 30, (ScrH() - 50), (health * 2), 20, Color(200, 0, 0, 150))
draw.SimpleText("Health Status:", "ScoreboardText", 30, (ScrH() - 85), Color(200, 0, 0, 255), 0, 0) 

-->>Player info box<<--

draw.RoundedBox(6, 15, 15, 300, 150, Color(51, 58, 51, 75))
draw.RoundedBox(6, 30, 30, 100, 100, Color(100, 58, 51, 75))

draw.SimpleText("John Hopkins:", "ScoreboardText", 160, 30, Color(255, 255, 255, 255), 0, 0)
draw.SimpleText("Professional", "ScoreboardText", 160, 50, Color(255, 255, 255, 255), 0, 0)
draw.SimpleText("Karma: 32", "ScoreBoardText", 160, 70, Color(0, 255, 0, 255), 0, 0)
draw.SimpleText("Cash: $4,500", "ScoreboardText", 160, 90, Color(0, 128, 0, 255), 0, 0)

end

hook.Add("HUDPaint", "myhud", myhud)

-->>Hide the original hud<<--

local tohide = -- This is a table where the keys are the HUD items to hide

{ 

	["CHudHealth"] = true,
	
	["CHudBattery"] = true,
	
}

local function HUDShouldDraw(name) -- This is a local function because all functions should be local unless another file needs to run it
	
	if (tohide[name]) then     -- If the HUD name is a key in the table
	
		return false;      -- Return false.
		
	end
	
end

hook.Add("HUDShouldDraw", "How to: HUD Example HUD hider", HUDShouldDraw)