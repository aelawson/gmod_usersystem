include( 'cl_menu_entry.lua' )


--------------------------------------------------------------------------------------------------------

--SQL DATABASE (ACCOUNTS, SKILLS, INFO) **SERVERSIDE ONLY**

--------------------------------------------------------------------------------------------------------

function sql_value_stats(ply)
	
	money = sql.QueryValue("SELECT money from player_info WHERE username = '"..username.."'")
	ply:SetNWString("money", money)

end

function sql_value_skills(ply)

	karma = sql.QueryValue("SELECT karma FROM player_skills WHERE username = '"..username.."'")
	ply:SetNWInt("karma", karma)
	
end

function saveStat(ply)

	money = ply:GetNWInt("money")
	karma = ply:GetNWInt("karma")
	sql.Query("UPDATE player_skills SET karma = "..karma.." WHERE username = '"..username.."'")
	sql.Query("UPDATE player_info SET money = "..money.." WHERE username = '"..username.."'")
	ply:ChatPrint("Stats Updated.")
	
end

function tables_exist()

	if sql.TableExists("player_info") && sql.TableExists("player_skills") && sql.TableExists("player_accounts") then
	
		Msg("All tables exist. \n")
		
	else
		
		if (!sql.TableExists("player_info")) then
		
			query = "CREATE TABLE player_info (username varchar(255), password varchar(255), money int)"
			result = sql.Query(query)
			
			if (sql.TableExists("player_info")) then
				
				Msg("Info table created. \n")
				
			else
			
				Msg("Error in creating info table. \n")
				Msg(sql.LastError(result) .. "\n")
				
			end
			
		end
		
		if (!sql.TableExists("player_skills")) then
		
			query = "CREATE TABLE player_skills (username varchar(255), password varchar(255), karma int)"
			result = sql.Query(query)
			
			if (sql.TableExists("player_skills")) then
			
				Msg("Skills table created. \n")
				
			else
			
				Msg("Error in creating skills table. \n")
				Msg(sql.LastError(result) .. "\n")
				
			end
		
		end
		
		if (!sql.TableExists("player_accounts")) then
		
			query = "CREATE TABLE player_accounts (unique_id varchar(255), username varchar(255), password varchar(255))"
			result = sql.Query(query)
			
			if (sql.TableExists("player_accounts")) then
			
				Msg("Accounts table created. \n")
				
			else
			
				Msg("Error is creating accounts table. \n")
				Msg(sql.LastError(result) .. "\n")
				
			end
			
		end
	
	end
	
end

function new_player(ply)

	SteamID = steamID
	steamID = ply:GetNWString("SteamID")
	username = ply:GetNWString("Username_new")
	password = ply:GetNWString("Password_new")
	
	sql.Query("INSERT INTO player_accounts (`unique_id`, `username`, `password`)VALUES ('"..steamID.."', '"..username.."', '"..password.."')")
	result = sql.Query("SELECT unique_id, username, password FROM player_accounts WHERE unique_id = '"..steamID.."'")
	
	if (result) then
	
		sql.Query("INSERT INTO player_info (`username`, `password`, `money`)VALUES ('"..username.."', '"..password.."', '800')")
		result = sql.Query("SELECT username, money FROM player_info WHERE username = '"..username.."'")
		
		Msg("Created a new player's account. \n")
	
			if (result) then
	
				sql.Query("INSERT INTO player_skills (`username`, `password`, `karma`)VALUES ('"..username.."', '"..password.."', '0')")
				result = sql.Query( "SELECT username, karma FROM player_skills WHERE username = '"..username.."'")
				
				Msg("Created a new player's info. \n")
	
					if (result) then
		
						Msg("Created a new player's skills. \n")
						Msg("Account creation finished. \n")
						ply:ConCommand("say 'Account has been created!'")
						sql_value_stats(ply)
						sql_value_skills(ply)
			
					else
		
						Msg("Error in creating a new player's skills. \n")
	
					end
		
			else
	
				Msg("Error in creating a new player's info. \n")
		
			end
			
	else
	
		Msg("Error in creating a new player's account. \n")
		
	end
	
end

function player_exists(ply)

	username = ply:GetNWString("Username_new")
	password = ply:GetNWString("Password_new")
	
	result1 = sql.QueryValue("SELECT username FROM player_accounts WHERE username = '"..username.."'")
	result2 = sql.QueryValue("SELECT password FROM player_accounts WHERE password = '"..password.."'")
	
	
	if (result1 && result2) then
	
		sql_value_stats(ply)
		sql_value_skills(ply)
		
		ply:ConCommand("citizen_menu")
		entry_frame:SetVisible(false)
		
	else
	
		Msg("Your username or password is incorrect. \n")
		
	end
	
end


function Initialize()

	tables_exist()
	
end

hook.Add( "PlayerInitialSpawn", "PlayerInitialSpawn", PlayerInitialSpawn )
hook.Add( "Initialize", "Initialize", Initialize )