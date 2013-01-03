DeriveGamemode("sandbox")

-- The client must download these files!

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_hud.lua" )
AddCSLuaFile( "cl_menu_citizen.lua" )
AddCSLuaFile( "cl_menu_entry.lua" )
AddCSLuaFile( "cl_menu_spawn.lua" )

include( 'shared.lua' )
include( 'sql_database.lua' )

function GM:PlayerInitialSpawn( ply )

	timer.Create("Steam_ID_Delay", 1, 1, function()
	
		SteamID = ply:SteamID()	
		ply:SetNWString("SteamID", SteamID)		
	
	end)
	
	timer.Create("Spawn_Delay", 1, 1, function()
	
		ply:ConCommand("entry_menu")
	
		ply:Spectate()
		
	end)
	
end

function LogIn(ply)

	ply:SetNWString("Username", Username)
	ply:SetNWString("Password", Password)
	
	player_exists(ply)
	
end

function NewUser(ply)

	ply:SetNWString("Username_new", Username_new)
	ply:SetNWString("Password_new", Password_new)
	
	ply:ConCommand("team_1")
	
	new_player(ply)
	
end

function team_1( ply )

	ply:SetTeam(1)
	ply:Spawn()

end
 
function team_2( ply )

    ply:SetTeam(2)
	ply:Spawn()

end

function team_3( ply )

    ply:SetTeam(3)	
	ply:Spawn()
	
end

function GM:PlayerLoadout(ply)

	if ply:Team() == 1 then

		ply:Give( "weapon_physgun" )
		ply:Give( "gmod_tool" )
		ply:Give( "weapon_gravgun" )
		
	end

	if ply:Team() == 2 then

		ply:Give( "weapon_stunstick" )
		ply:Give( "weapon_physgun" )
		ply:Give( "gmod_tool" )
		ply:Give( "weapon_gravitygun" )
	
	end
		
	if ply:Team() == 3 then

		ply:Give( "weapon_physgun" )
		ply:Give( "gmod_tool" )
		ply:Give( "weapon_gravitygun" )
		
	end
	
end

function GM:ShowSpare1(ply)

	umsg.Start("spawn_menu", ply)
	umsg.End()

end


concommand.Add( "team_1", team_1 )
concommand.Add( "team_2", team_2 )
concommand.Add( "team_3", team_3 )

concommand.Add("NewUser", NewUser)
concommand.Add("LogIn", LogIn)