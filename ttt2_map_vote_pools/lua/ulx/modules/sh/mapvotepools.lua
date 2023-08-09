local CATEGORY_NAME = "MapVotePools"

local function MVP_mapvotepools( calling_ply, votetime, should_cancel )
	if not should_cancel then
		MapVotePools.Start(votetime, nil, nil, nil)
		ulx.fancyLogAdmin( calling_ply, "#A called a mapvote pools!" )
	else
		MapVotePools.Cancel()
		ulx.fancyLogAdmin( calling_ply, "#A canceled the mapvote pools." )
	end
end

local mapvotepoolscmd = ulx.command( CATEGORY_NAME, "ulx mapvotepools", MVP_mapvotepools, "!mapvotepools" )
mapvotepoolscmd:addParam({
	type = ULib.cmds.NumArg,
	min = 0,
	default = 28,
	hint = "time",
	ULib.cmds.optional,
	ULib.cmds.round
})
mapvotepoolscmd:addParam({
	type = ULib.cmds.BoolArg,
	invisible = true
})
mapvotepoolscmd:defaultAccess( ULib.ACCESS_ADMIN )
mapvotepoolscmd:help( "Invokes the map vote pools logic." )
mapvotepoolscmd:setOpposite( "ulx unmapvotepools", {_, _, true}, "!unmapvotepools" )


if MapVotePools.CVARS.use_ulx_commands:GetBool() then
	local function MVP_requestrocking( calling_ply, should_cancel )
		if not should_cancel then
			if SERVER then
				MapVotePools.RTV.HandleClientRockingRequest(calling_ply, true)
			end
			ulx.fancyLogAdmin( calling_ply, "#A rocked the vote!" )
		else
			if SERVER then
				MapVotePools.RTV.HandleClientRockingRequest(calling_ply, false)
			end
			ulx.fancyLogAdmin( calling_ply, "#A unrocked the vote." )
		end
	end

	local requestrockingcmd = ulx.command( CATEGORY_NAME, "ulx rtv", MVP_requestrocking, "!rtv" )
	requestrockingcmd:addParam({
		type = ULib.cmds.BoolArg,
		invisible = true
	})
	requestrockingcmd:defaultAccess( ULib.ACCESS_ALL )
	requestrockingcmd:help( "Request to rock the vote, and begin a vote for changing the map at the end of the round." )
	requestrockingcmd:setOpposite( "ulx unrtv", {_, true}, "!unrtv" )
end