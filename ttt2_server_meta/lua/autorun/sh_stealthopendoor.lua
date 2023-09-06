-- @TODO: cvars cvars cvars
AddCSLuaFile()

if CLIENT then
hook.Remove( "Initialize", "StealthOpenDoors_Initialize")
hook.Add( "Initialize", "StealthOpenDoors_Initialize", function()
	LANG.AddToLanguage("en", "door_open", "Press [{usekey}] to open door, press [{walkkey} + {usekey}] for quiet open.")
	LANG.AddToLanguage("en", "door_close", "Press [{usekey}] to close door, press [{walkkey} + {usekey}] for quiet close.")
end )
end

if SERVER then
local entMeta = FindMetaTable( "Entity" )

function entMeta:StealthOpenDoor()
	if not self.stealthopen then
		self.stealthopen = true
		self.oldspeed = self:GetInternalVariable( "Speed" )
		self:SetSaveValue( "Speed", self.oldspeed / 2 )

		local uniqueIdent = self:EntIndex() and self:EntIndex() or tostring( self:GetPos() )

		timer.Create( "resetdoorstealthval" .. uniqueIdent, 4 * ( self:GetInternalVariable( "speed" ) / ( self:GetClass() == "prop_door_rotating" and self:GetInternalVariable( "distance" ) or self:GetInternalVariable( "m_flMoveDistance" ) ) ), 1, function()
			if self:GetSaveTable().m_eDoorState != 1 and self:GetSaveTable().m_eDoorState != 3 then
				self:SetSaveValue( "Speed", self.oldspeed )
				self.stealthopen = false
			else
				timer.Create( "checkfordoorreset" .. uniqueIdent, 0.1, 0, function()
					if self:GetSaveTable().m_eDoorState != 1 and self:GetSaveTable().m_eDoorState != 3 then
						self:SetSaveValue( "Speed", self.oldspeed )
						self.stealthopen = false
						timer.Remove( "checkfordoorreset" .. uniqueIdent )
					end
				end )
			end
		end )
	end
end

function entMeta:SDOIsDoor()
	return self:GetClass() == "prop_door_rotating" or self:GetClass() == "func_door_rotating"
end

hook.Add( "AcceptInput", "StealthOpenDoors", function( ent, inp, act, ply, val )
	if inp == "Use" and ent:SDOIsDoor() and ply:KeyDown( IN_WALK ) then
		ent:StealthOpenDoor()
		if ent:GetInternalVariable( "slavename" ) then
			for k,v in pairs( ents.FindByName( ent:GetInternalVariable( "slavename" ) ) ) do
				v:StealthOpenDoor()
			end
		end
		for k,v in pairs( ents.GetAll() ) do
			if ent == v:GetInternalVariable( "m_hMaster" ) then
				v:StealthOpenDoor()
			end
		end
		if ent:GetInternalVariable( "m_hMaster" ) and IsValid( ent:GetInternalVariable( "m_hMaster" ) ) and ent:GetInternalVariable( "m_hMaster" ):SDOIsDoor() then
			ent:GetInternalVariable( "m_hMaster" ):StealthOpenDoor()
		end
	end
end )

hook.Add( "EntityEmitSound", "StealthOpenDoors_EmitSound", function( data )
	if IsValid( data.Entity ) and data.Entity:SDOIsDoor() and data.Entity.stealthopen then
		data.Volume = data.Volume * 0.25
		return true
	end
end )
end