RegisterServerEvent('vs_pausemenu:disconnect', function()
    DropPlayer(source, Config.Translation["drop_player_message"])
end)