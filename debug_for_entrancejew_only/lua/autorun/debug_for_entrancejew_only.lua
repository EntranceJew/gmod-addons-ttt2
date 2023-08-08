AddCSLuaFile()
local DIR = "debug_for_entrancejew_only/"
-- bingbong e
local Files = {
    -- server
    spawn_bots_after_player = {file = "spawn_bots_after_player.lua", on = "server"},

    -- shared
	revert_cvars = {file = "revert_cvars.lua", on = "shared"},
}

if SERVER then
	for _, inc in pairs(Files) do
		local path = DIR .. inc.on .. "/" .. inc.file
		if inc.on == "client" or inc.on == "shared" then
			AddCSLuaFile(path)
		end
        if inc.on == "server" or inc.on == "shared" then
			include(path)
		end
	end
else
    for _, inc in pairs(Files) do
		local path = DIR .. inc.on .. "/" .. inc.file
		if inc.on == "client" or inc.on == "shared" then
			include(path)
		end
	end
end