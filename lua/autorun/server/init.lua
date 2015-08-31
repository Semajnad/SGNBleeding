local ply = FindMetaTable( "Player" )

hook.Add( "EntityTakeDamage", "startBleeding", function( ply, dmginfo )
	if !dmginfo:IsFallDamage() && dmginfo:GetDamageType() != 0 && !ply:IsBleeding() then
		ply:StartBleeding()
	end
end )

function ply:IsBleeding()
	-- Should this be if self.bleeding = 1 then return true?
	if timer.Exists( self:SteamID() .. "_CharacterBleeding" ) then
		return true
	else
		return false
	end
end

function ply:StartBleeding()
	self.bleeding = 1
	timer.Create( self:SteamID() .. "_CharacterBleeding", characterstats.bleedDelay, 0, function()
		self:TakeDamage( characterstats.bleedDamage )
	end )
end

function ply:StopBleeding()
	self.bleeding = 0
	timer.Destroy( self:SteamID() .. "_CharacterBleeding" )
end

hook.Add( "EntityTakeDamage", "startBleeding", function( ply, dmginfo )
	if !dmginfo:IsFallDamage() && dmginfo:GetDamageType() != 0 && !ply:IsBleeding() then
		ply:StartBleeding()
	end
end )