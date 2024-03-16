---@type table

-- local SettingsButton = {
--     Rectangle = { Y = 0, Width = 420, Height = 38 },
--     Line = { X = 8, Y = 15 },
--     SelectedSprite = { Dictionary = "commonmenu", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
-- }

function RageUI.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~h~", 330 + 20 + 100, 7, 0, 0.34, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), 330 + 20 + 100, Title ~= nil and 37 or 7, 0, 0.28, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), 330 + 480 + 100, Title ~= nil and 37 or 7, 0, 0.28, 255, 255, 255, 255, 2)
    end
    RenderRectangle(330 + 10 + 100, 0, 480, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end