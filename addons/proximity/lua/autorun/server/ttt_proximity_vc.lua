-- modified version of olive delights' TTT Proximity Chat
-- https://steamcommunity.com/sharedfiles/filedetails/?id=2495705141

CreateConVar( "ttt_voice_range", 800, FCVAR_ARCHIVE, "Set the range for voice chat." )
-- CreateConVar( "ttt_text_range", 800, FCVAR_ARCHIVE, "Set the range for text chat." )

hook.Add ( "PlayerCanHearPlayersVoice", "TTT Voice Range", function ( listener, talker )
	if GetRoundState() != ROUND_ACTIVE then
		return true

	elseif listener:Team() == TEAM_SPEC and
	talker:Team() == TEAM_SPEC then
		return true

	elseif listener:IsActiveTraitor() and
	talker:IsActiveTraitor() and
	talker.traitor_gvoice == false then
		return true

	-- cagematch addition, detectives are always audible
	elseif talker:IsActiveDetective() then
		return true

	elseif tonumber( listener:GetPos():Distance( talker:GetPos() ) ) > tonumber( GetConVar("ttt_voice_range"):GetInt() ) then
		return false
	end
end )

--[[
hook.Add ( "PlayerCanSeePlayersChat", "TTT Text Range", function ( text, teamOnly, listener, talker )
	if GetRoundState() != ROUND_ACTIVE then
		return true

	elseif listener:Team() == TEAM_SPEC and
	talker:Team() == TEAM_SPEC then
		return true

	elseif messagemode2 == true then
		return true

	elseif tonumber( listener:GetPos():Distance( talker:GetPos() ) ) > tonumber( GetConVar("ttt_text_range"):GetInt() ) then
		return false
	end
end )
]]