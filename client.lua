ESX = exports["es_extended"]:getSharedObject()

function OpenMenuSuperette()

    local mainSuperette = RageUI.CreateMenu(Config.Menu, Config.MenuDescription)
    mainSuperette:SetRectangleBanner(Config.ColorMenuR, Config.ColorMenuG, Config.ColorMenuB)

    RageUI.Visible(mainSuperette, not RageUI.Visible(mainSuperette))

    while mainSuperette do
        
        Citizen.Wait(0)

        RageUI.IsVisible(mainSuperette,true,true,true,function()

            RageUI.Separator('~h~~g~Votre ID : '..GetPlayerServerId(PlayerId()))
        
            for k, v in pairs(PrixSuperette.superetteprix) do 
            RageUI.ButtonWithStyle(v.name, nil, {RightLabel = v.prixaffiche}, true, function(Hovered, Active, Selected)
                if Selected then 
                    TriggerServerEvent('achatitem', v)
                end
            end)
        end
        end, function()
        end)

        if not RageUI.Visible(mainSuperette) then
            mainSuperette=RMenu:DeleteType("Menu Superette", false)
        end

    end

end

Citizen.CreateThread(function()
    while true do 
        local interval = 750
        local playerPos = GetEntityCoords(PlayerPedId())

        for k, v in pairs(Position.positionsuperette) do
            local dist = #(v.pos - playerPos)

            if dist <= 3.0 then
                interval = 0
                
                -- Dessiner le marqueur visuel
                DrawMarker(Config.Markers, v.pos.x, v.pos.y, v.pos.z - 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, Config.OpacityMarkers1, Config.OpacityMarkers2, Config.OpacityMarkers3, Config.ColorsMarkers1, Config.ColorsMarkers2, Config.ColorsMarkers3, Config.OpacityColorsMarkers, 0, 0, 0, 0, nil, nil, 0)
                
                -- Dessiner le texte en 3D
                Draw3DText(v.pos.x, v.pos.y, v.pos.z + 1.0, Config.MarkersD)

                if dist <= 1.5 then 
                    if IsControlJustPressed(1, 51) then
                        OpenMenuSuperette()
                    end
                end
            end
        end

        Citizen.Wait(interval)
    end
end)



function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local scale = 0.35
    local font = 4

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

CreateThread(function()
	for k,v in pairs(Position.positionsuperette) do
		local blip = AddBlipForCoord(v.pos)

		SetBlipSprite(blip, Config.Blips.Sprite)
		SetBlipScale (blip, Config.Blips.Scale)
		SetBlipColour(blip, Config.Blips.Color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Supérette")
		EndTextCommandSetBlipName(blip)
   end
end)
