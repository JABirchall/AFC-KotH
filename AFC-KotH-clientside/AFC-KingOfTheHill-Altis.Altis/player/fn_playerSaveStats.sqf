_xp = player_stats select 0;
if(_xp > 1) then
{
    // Only update if stats have changed
    if(_xp != player_prev_xp) then
    {
        player_prev_xp = _xp;
        pvar_onPlayerSaveStats = [player, player_stats];
        publicvariableServer "pvar_onPlayerSaveStats";
        diag_log "KOTH: Saving stats";
    };
};
