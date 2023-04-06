local focus = false

RegisterCommand('openpausemenu', function()
    if GetPauseMenuState() == 0 and IsNuiFocused() == false then
        if focus == false then
            focus = true
            SendNUIMessage({
                active = true
            })
            DisplayRadar(false)
            SetNuiFocus(true, true)
            Wait(700)
        end
    end
end)

RegisterKeyMapping('openpausemenu', Config.Translation["keymapping_label"], 'keyboard', "ESCAPE")

Citizen.CreateThread(function()
    while true do
        Wait(0)
        SetPauseMenuActive(false)
    end
end)

RegisterNUICallback('loadtranslation', function()
    SendNUIMessage({
        type = 'loadtranslation',
        resume_button = Config.Translation["resume_button"],
        map_button = Config.Translation["map_button"],
        options_button = Config.Translation["options_button"],
        quit_button = Config.Translation["quit_button"],
        back_button = Config.Translation["back_button"],
        what_action = Config.Translation["what_action"],
        quit_from_server = Config.Translation["quit_from_server"],
        close_fivem = Config.Translation["close_fivem"],
        logo_url = Config.LogoURL,
        color1 = Config.BackgroundColors.Color1,
        color2 = Config.BackgroundColors.Color2,
        color3 = Config.BackgroundColors.Color3,
    })
end)

RegisterNUICallback('close', function()
    if focus == true then
        SetNuiFocus(false, false)
        DisplayRadar(true)
        Wait(700)
        focus = false
    end
end)

RegisterNUICallback('map', function()
    Wait(300)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1)
    while not IsFrontendReadyForControl() do Wait(0) end
    Wait(20)
    PauseMenuceptionGoDeeper(1000)
    DisplayRadar(true)
    SetNuiFocus(false, false)
    Wait(400)
    focus = false
end)

RegisterNUICallback('options', function()
    Wait(300)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1)
    DisplayRadar(true)
    SetNuiFocus(false, false)
    Wait(400)
    focus = false
end)

RegisterNUICallback('disconnect', function()
    Wait(300)
    DisplayRadar(true)
    SetNuiFocus(false, false)
    TriggerServerEvent('vs_pausemenu:disconnect')
end)

RegisterNUICallback('quit', function()
    Wait(300)
    DisplayRadar(true)
    SetNuiFocus(false, false)
    ForceSocialClubUpdate()
end)