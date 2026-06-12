local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local function v3()
    if task.wait() then
        game:GetService('ScriptContext'):SetTimeout(math.huge)
        while true do
            print('noob')
        end
    else
        return
    end
end

local v4 = 'v19'

if LPH_OBFUSCATED then
    function print() end
    function warn() end
    local v5 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Hosvile/InfiniX/a40a158d22fd4f4733beb2f67379866ccb17906f/Library/Anti/AntiDebug/main.lua', true))()
    if type(v5) ~= 'table' then
        v3()
    end
end

repeat
    task.wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Wind UI Window
local Window = WindUI:CreateWindow({
    Title = "Rezo Hub",
    Icon = "sword",
    Author = "by lwkmash",
    Folder = "RezoHub99",
    Size = UDim2.fromOffset(580, 460),
    ToggleKey = Enum.KeyCode.RightShift,
    Theme = "Dark",
})

-- Main Tabs (no nesting)
local v9 = {
    Welcome   = Window:Tab({ Title = "Information", Icon = "info" }),
    Main      = Window:Tab({ Title = "Main",        Icon = "sword" }),
    Teleport  = Window:Tab({ Title = "Teleport",    Icon = "map-pin" }),
    Bring     = Window:Tab({ Title = "Bring Items", Icon = "package" }),
    Chest     = Window:Tab({ Title = "Chest Finder",Icon = "box" }),
    Hitbox    = Window:Tab({ Title = "Hitbox",      Icon = "crosshair" }),
    Misc      = Window:Tab({ Title = "Misc",        Icon = "wrench" }),
}

v9.Welcome:Select()

-- Sections inside Tabs (using :Section() instead of :Tab())
local u10 = {
    Welcome         = v9.Welcome:Section({ Title = "Welcome" }),
    MainFarm        = v9.Main:Section({ Title = "Farm Controls" }),
    AutoEat         = v9.Main:Section({ Title = "Auto Eat System" }),
    TeleportControls= v9.Teleport:Section({ Title = "Teleport Controls" }),
    BringItems      = v9.Bring:Section({ Title = "Item Collection" }),
    AutoDetectItems = v9.Bring:Section({ Title = "All Items" }),
    ScrapItems      = v9.Bring:Section({ Title = "Scrap Items" }),
    FuelItems       = v9.Bring:Section({ Title = "Fuel Items" }),
    ChestFinder     = v9.Chest:Section({ Title = "Chest Detection" }),
    HitboxControls  = v9.Hitbox:Section({ Title = "Hitbox Expansion" }),
    MiscFeatures    = v9.Misc:Section({ Title = "Miscellaneous" }),
    Performance     = v9.Misc:Section({ Title = "Performance" }),
}

-- Welcome paragraph
u10.Welcome:Paragraph({
    Title = "Welcome to Rezo Hub!",
    Desc = "Version: v19\n\nFeatures:\n• Kill Aura\n• Auto Eat System\n• Teleportation System\n• Item Bringing/Collection\n• Auto Detect Items\n• Scrap Items Management\n• Fuel Items Management\n• Chest Finder & Teleport\n• Hitbox Expansion\n• Speed Hack\n• FPS/Ping Display\n• Performance Optimization\n\nDiscord: discord.gg/qTAhZpvtgt",
})

u10.Welcome:Button({
    Title = "Copy Discord Link",
    Desc = "Copy the Rezo Hub discord link",
    Callback = function()
        setclipboard("https://discord.gg/qTAhZpvtgt")
        WindUI:Notify({
            Title = "Success",
            Content = "Discord link copied to clipboard!",
            Duration = 3,
        })
    end,
})

-- Services & variables
local _Players = game:GetService('Players')
local _LocalPlayer = _Players.LocalPlayer
local _CurrentCamera = workspace.CurrentCamera
local _RunService = game:GetService('RunService')
local _Workspace = game:GetService('Workspace')
local _ReplicatedStorage = game:GetService('ReplicatedStorage')
local _RequestConsumeItem = _ReplicatedStorage.RemoteEvents.RequestConsumeItem
local _RemoteEvents = _ReplicatedStorage:WaitForChild('RemoteEvents')
local _RemoteEvents2 = _ReplicatedStorage:WaitForChild('RemoteEvents')
local _LocalPlayer2 = _Players.LocalPlayer
local _HumanoidRootPart = (_LocalPlayer2.Character or _LocalPlayer2.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart')

workspace:WaitForChild('Items')

local v23 = Vector3.new(2048, 5, 2048)
local v24 = Vector3.new(0, 130, 0)
local v25 = {}
local u26 = false
local u27 = {}
local u28 = false
local u29 = 100
local u30 = {}
local u31 = {}
local u32 = false
local u33 = false
local u34 = {}
local u35 = {}
local u36 = false
local u37 = 30
local u38 = 200
local u39 = {}
local u40 = {}
local u41 = {}

for v42 = -1, 1 do
    local v43 = v42
    for v44 = -1, 1 do
        local v45 = v24 + Vector3.new(v43 * v23.X, 0, v44 * v23.Z)
        local _Part = Instance.new('Part')
        _Part.Name = 'SafeZoneBaseplate'
        _Part.Size = v23
        _Part.Position = v45
        _Part.Anchored = true
        _Part.CanCollide = true
        _Part.Transparency = 1
        _Part.Color = Color3.fromRGB(255, 255, 255)
        _Part.Parent = workspace
        table.insert(v25, _Part)
    end
end

local function u51(p47, p48)
    local _Character = game.Players.LocalPlayer.Character
    if _Character then
        local _HumanoidRootPart2 = _Character:FindFirstChild('HumanoidRootPart')
        if _HumanoidRootPart2 then
            if p48 and 0 < p48 then
                game:GetService('TweenService'):Create(_HumanoidRootPart2, TweenInfo.new(p48, Enum.EasingStyle.Linear), {CFrame = p47}):Play()
            else
                _HumanoidRootPart2.CFrame = p47
            end
        end
    end
end

local function u56(p52)
    local _ss, v54, v55 = p52:match('([^,]+),%s*([^,]+),%s*([^,]+)')
    return CFrame.new(tonumber(_ss), tonumber(v54), tonumber(v55))
end

local u57 = {
    { '[campsite] camp site', '0, 8, -0' },
    { '[safezone] safe zone', '0, 140, -0' },
}
local u58 = {
    ['Old Axe'] = '1_8982038982',
    ['Good Axe'] = '112_8982038982',
    ['Strong Axe'] = '116_8982038982',
    Chainsaw = '647_8992824875',
    Spear = '196_8999010016',
}

local function u64()
    for v61, v62 in pairs(u58) do
        local v63 = _LocalPlayer2.Inventory:FindFirstChild(v61)
        if v63 then return v63, v62 end
    end
    return nil, nil
end

local function u70()
    local _Character2 = _LocalPlayer.Character
    if _Character2 then
        for _, v69 in pairs(_Character2:GetChildren()) do
            if v69:IsA('Tool') and v69:GetAttribute('WeaponDamage') then
                return v69
            end
        end
    end
    return nil
end

local function u77()
    local v71 = {}
    local _Inventory = _Players.LocalPlayer:FindFirstChild('Inventory')
    if _Inventory then
        for _, v76 in pairs(_Inventory:GetChildren()) do
            if v76:GetAttribute('WeaponDamage') then
                table.insert(v71, v76)
            end
        end
    end
    return v71
end

local function u78()
    return _LocalPlayer:GetAttribute('Hunger') or 0
end

local function u80()
    local v79 = { 'Apple', 'Carrot', 'Berry', 'Cooked Morsel', 'Cooked Steak' }
    table.sort(v79)
    return v79
end

local function u88(p81)
    if not p81 then return {} end
    local _Items = workspace:FindFirstChild('Items')
    local v83 = {}
    if _Items then
        for _, v87 in pairs(_Items:GetChildren()) do
            if v87.Name == p81 then table.insert(v83, v87) end
        end
    end
    return v83
end

local function u100()
    task.spawn(function()
        while true do
            if not u33 then return end
            local v89 = u78()
            if v89 <= u37 and 0 < #u34 then
                while v89 < u38 and u33 do
                    local u93 = false
                    for _, v94 in ipairs(u34) do
                        local v95 = u88(v94)
                        for _, u99 in ipairs(v95) do
                            if u99 and u99.Parent then
                                pcall(function()
                                    _RequestConsumeItem:InvokeServer(u99)
                                    u93 = true
                                end)
                                task.wait(5e-7)
                                v89 = u78()
                                if u38 <= v89 then break end
                            end
                        end
                        if u38 <= v89 then break end
                    end
                    if not u93 then break end
                    task.wait(1e-6)
                end
            end
            task.wait(1e-6)
        end
    end)
end

local function u107()
    local v101 = {}
    local _Items2 = workspace:FindFirstChild('Items')
    if _Items2 then
        for _, v106 in pairs(_Items2:GetChildren()) do
            if not table.find(v101, v106.Name) then
                table.insert(v101, v106.Name)
            end
        end
    end
    table.sort(v101)
    return v101
end

local function v109()
    local v108 = {
        'UFO Junk','UFO Component','Old Car Engine','Broken Fan','Old Microwave',
        'Bolt','Log','Cultist Gem','Sheet Metal','Old Radio','Tyre','Washing Machine',
        'Cultist Experiment','Cultist Component','Gem of the Forest Fragment','Broken Microwave',
    }
    table.sort(v108)
    return v108
end

local function v111()
    local v110 = { 'Log', 'Coal', 'Fuel Canister', 'Oil Barrel', 'Biofuel' }
    table.sort(v110)
    return v110
end

local function u121()
    local v115 = {}
    local v116 = {}
    for _, v117 in pairs(workspace:GetDescendants()) do
        if v117:IsA('Model') and (v117.Name:lower():find('chest') or v117.Name:lower():find('crate') or v117.Name:lower():find('box')) then
            local v118 = v117:FindFirstChild('HumanoidRootPart') or v117:FindFirstChildWhichIsA('BasePart')
            if v118 then
                local _Position = v118.Position
                local v120 = v117.Name .. ' (' .. math.floor(_Position.X) .. ', ' .. math.floor(_Position.Y) .. ', ' .. math.floor(_Position.Z) .. ')'
                if not table.find(v115, v120) then
                    table.insert(v115, v120)
                    v116[v120] = { model = v117, position = _Position, name = v117.Name }
                end
            end
        end
    end
    table.sort(v115)
    return v115, v116
end

local function u126(p122, p123)
    if p122 and p122:IsDescendantOf(workspace) then
        local u124 = p122.PrimaryPart or p122:FindFirstChildWhichIsA('BasePart') or p122:FindFirstChild('Handle')
        if u124 then
            if not p122.PrimaryPart then
                pcall(function() p122.PrimaryPart = u124 end)
            end
            local v125 = tick()
            repeat task.wait()
            until u124:IsDescendantOf(workspace) or tick() - v125 > 3
            pcall(function() _RemoteEvents2.RequestStartDraggingItem:FireServer(p122) end)
            task.wait(0.1)
            pcall(function()
                if p122.PrimaryPart then
                    p122:SetPrimaryPartCFrame(CFrame.new(p123))
                end
            end)
            task.wait(0.1)
            pcall(function() _RemoteEvents2.StopDraggingItem:FireServer(p122) end)
        end
    end
end

local function u148(p127, p128)
    local v129 = 0
    if not p127 or #p127 == 0 or not p128 or #p128 == 0 then return 0 end
    local _Items3 = workspace:FindFirstChild('Items')
    if not _Items3 then return 0 end
    for _, v134 in ipairs(_Items3:GetChildren()) do
        for _, v138 in ipairs(p127) do
            if v134.Name == v138 then
                for _, v142 in ipairs(p128) do
                    local v143
                    if v142 == 'LocalPlayer' then
                        if not (_LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('HumanoidRootPart')) then return 0 end
                        v143 = _LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
                    elseif v142 == 'Campfire' then
                        v143 = Vector3.new(0, 19, 0)
                    elseif v142 == 'Scrapper' then
                        local _Scrapper = workspace.Map.Campground.Scrapper
                        if not (_Scrapper and _Scrapper:FindFirstChild('GlowEffect')) then return 0 end
                        v143 = _Scrapper.GlowEffect.Position + Vector3.new(0, 19, 0)
                    elseif v142 == 'Freezer' then
                        local _Structures = workspace:FindFirstChild('Structures')
                        if _Structures then _Structures = workspace.Structures:FindFirstChild('Freezer') end
                        if not (_Structures and _Structures:IsA('Model')) then return 0 end
                        local _AutoStack = _Structures:FindFirstChild('AutoStack')
                        if not _AutoStack then return 0 end
                        local _TouchZone = _AutoStack:FindFirstChild('TouchZone')
                        if not (_TouchZone and _TouchZone:IsA('BasePart')) then return 0 end
                        v143 = _TouchZone.Position + Vector3.new(0, 3, 0)
                    else
                        return 0
                    end
                    u126(v134, v143)
                    v129 = v129 + 1
                    task.wait(0.1)
                end
            end
        end
    end
    return v129
end

local function u169(p149, p150)
    if not p149 or #p149 == 0 or not p150 or #p150 == 0 then return end
    local _Items4 = workspace:FindFirstChild('Items')
    if _Items4 then
        for _, v155 in ipairs(_Items4:GetChildren()) do
            for _, v159 in ipairs(p149) do
                if v155.Name == v159 then
                    for _, v163 in ipairs(p150) do
                        local v164
                        if v163 == 'LocalPlayer' then
                            if not (_LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('HumanoidRootPart')) then return end
                            v164 = _LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)
                        elseif v163 == 'Campfire' then
                            v164 = Vector3.new(0, 19, 0)
                        elseif v163 == 'Scrapper' then
                            local _Scrapper2 = workspace.Map.Campground.Scrapper
                            if not (_Scrapper2 and _Scrapper2:FindFirstChild('GlowEffect')) then return end
                            v164 = _Scrapper2.GlowEffect.Position + Vector3.new(0, 19, 0)
                        elseif v163 == 'Freezer' then
                            local _Structures2 = workspace:FindFirstChild('Structures')
                            if _Structures2 then _Structures2 = workspace.Structures:FindFirstChild('Freezer') end
                            if not (_Structures2 and _Structures2:IsA('Model')) then return end
                            local _AutoStack2 = _Structures2:FindFirstChild('AutoStack')
                            if not _AutoStack2 then return end
                            local _TouchZone2 = _AutoStack2:FindFirstChild('TouchZone')
                            if not (_TouchZone2 and _TouchZone2:IsA('BasePart')) then return end
                            v164 = _TouchZone2.Position + Vector3.new(0, 3, 0)
                        else
                            return
                        end
                        u126(v155, v164)
                        task.wait(0.1)
                    end
                end
            end
        end
    end
end

local function u170()
    task.spawn(function()
        while u36 do
            if #u30 <= 0 or #u31 <= 0 then
                u36 = false
                break
            end
            u169(u30, u31)
            task.wait(0.1)
        end
    end)
end

local function u171()
    task.spawn(function()
        while u32 do
            if #u39 <= 0 or #u40 <= 0 then
                u32 = false
                break
            end
            u169(u39, u40)
            task.wait(0.1)
        end
    end)
end

local function u172()
    task.spawn(function()
        while u26 do
            if #u35 <= 0 or #u27 <= 0 then
                u26 = false
                break
            end
            u169(u35, u27)
            task.wait(0.1)
        end
    end)
end

local function u174(p173)
    if p173 then _RemoteEvents.EquipItemHandle:FireServer('FireAllClients', p173) end
end
local function u176(p175)
    if p175 then _RemoteEvents.UnequipItemHandle:FireServer('FireAllClients', p175) end
end

local function u186()
    while u28 do
        local _HumanoidRootPart3 = (_LocalPlayer2.Character or _LocalPlayer2.CharacterAdded:Wait()):FindFirstChild('HumanoidRootPart')
        if _HumanoidRootPart3 then
            local u178, u179 = u64()
            if u178 and u179 then
                u174(u178)
                local v180 = _Workspace.Characters:GetChildren()
                for _, u184 in ipairs(v180) do
                    if u184:IsA('Model') then
                        local _BasePart = u184:FindFirstChildWhichIsA('BasePart')
                        if _BasePart and (_BasePart.Position - _HumanoidRootPart3.Position).Magnitude <= u29 then
                            pcall(function()
                                _RemoteEvents.ToolDamageObject:InvokeServer(u184, u178, u179, CFrame.new(_BasePart.Position))
                            end)
                        end
                    end
                end
            else
                warn('No supported tool found in inventory')
                task.wait(0.03)
            end
        else
            task.wait(0.05)
        end
        task.wait(0.03)
    end
end

local u187 = {}
local u188 = false

local function u197()
    local u189 = {}
    local function v195(p190)
        for _, v194 in ipairs(p190:GetChildren()) do
            if v194:IsA('Model') and v194.Name == 'Small Tree' then
                table.insert(u189, v194)
            end
        end
    end
    local _Map = _Workspace:FindFirstChild('Map')
    if _Map then
        if _Map:FindFirstChild('Foliage') then v195(_Map.Foliage) end
        if _Map:FindFirstChild('Landmarks') then v195(_Map.Landmarks) end
    end
    return u189
end

local function u203(p198)
    for _, v202 in ipairs(p198:GetDescendants()) do
        if v202:IsA('BasePart') and v202.Name == 'Trunk' then return v202 end
    end
end

local function u210()
    local v204 = CFrame.new(_HumanoidRootPart.Position + _HumanoidRootPart.CFrame.LookVector * 10)
    for _, v208 in ipairs(u197()) do
        local v209 = u203(v208)
        if v209 then
            if not u187[v208] then u187[v208] = v209.CFrame end
            v208.PrimaryPart = v209
            v209.Anchored = false
            v209.CanCollide = false
            task.wait()
            v208:SetPrimaryPartCFrame(v204 + Vector3.new(math.random(-5, 5), 0, math.random(-5, 5)))
            v209.Anchored = true
        end
    end
    u188 = true
end

local function u216()
    for v213, v214 in pairs(u187) do
        local v215 = u203(v213)
        if v215 then
            v213.PrimaryPart = v215
            v213:SetPrimaryPartCFrame(v214)
            v215.Anchored = true
            v215.CanCollide = true
        end
    end
    u187 = {}
    u188 = false
end

-- ===================== UI ELEMENTS =====================

-- MAIN TAB
u10.MainFarm:Toggle({
    Title = 'Kill Aura',
    Desc = 'Simultaneously attack ALL nearby animals with equipped weapon',
    Value = false,
    Callback = function(p217)
        u28 = p217
        if p217 then
            task.spawn(u186)
        else
            local v218, _ = u64()
            u176(v218)
        end
    end,
})

u10.MainFarm:Slider({
    Title = 'Kill Aura Range',
    Desc = 'Range to detect and attack animals',
    Step = 1,
    Value = { Min = 5, Max = 500, Default = 100 },
    Callback = function(p219)
        u29 = p219
    end,
})

u10.MainFarm:Button({
    Title = 'Show All Weapons',
    Desc = 'Display information about all detected weapons',
    Callback = function()
        local v220 = u77()
        local v221 = u70()
        if #v220 <= 0 then
            WindUI:Notify({ Title = 'No Weapon', Content = 'No weapons with WeaponDamage found in inventory!', Duration = 4 })
        else
            local v222 = 'Found ' .. #v220 .. ' weapon(s):\n\n'
            for v225, v226 in pairs(v220) do
                local v227 = v226:GetAttribute('WeaponDamage') or 'Unknown'
                local v228 = (v221 and v221 == v226) and ' (Equipped)' or ''
                v222 = v222 .. v225 .. '. ' .. v226.Name .. ' (Damage: ' .. tostring(v227) .. ')' .. v228 .. '\n'
            end
            WindUI:Notify({ Title = 'All Weapons', Content = v222, Duration = 6 })
        end
    end,
})

autoBreakEnabled = false

u10.MainFarm:Toggle({
    Title = 'Bring All Trees',
    Desc = 'Bring all small trees to your location',
    Value = false,
    Callback = function(p229)
        autoBreakEnabled = p229
        if p229 and not u188 then
            u210()
        elseif not p229 and u188 then
            u216()
        end
    end,
})

local u230 = false

u10.MainFarm:Toggle({
    Title = 'Tween Player to Boundary Parts',
    Desc = 'Tween LocalPlayer to each boundary part one by one',
    Value = false,
    Callback = function(p231)
        u230 = p231
        if p231 then
            task.spawn(function()
                local _Boundaries = workspace:WaitForChild('Map'):WaitForChild('Boundaries')
                for _, v236 in ipairs(_Boundaries:GetDescendants()) do
                    if not u230 then break end
                    if v236:IsA('BasePart') then
                        u51(CFrame.new(v236.Position + Vector3.new(0, 5, 0)), 0.4)
                        task.wait(0.5)
                    end
                end
            end)
        end
    end,
})

-- AUTO EAT
local _FoodSelect = u10.AutoEat:Dropdown({
    Title = 'Select Food to Eat',
    Desc = 'Choose food items for auto eating',
    Values = u80(),
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(p237)
        u34 = p237 or {}
    end,
})

u10.AutoEat:Button({
    Title = 'Refresh Food List',
    Desc = 'Update the dropdown with current food items',
    Callback = function()
        local v239 = u80()
        u34 = {}
        if #v239 <= 0 then
            _FoodSelect:Refresh({})
            WindUI:Notify({ Title = 'No Food Items', Content = 'No food items found!', Duration = 3 })
        else
            _FoodSelect:Refresh(v239)
            WindUI:Notify({ Title = 'Food List Refreshed', Content = 'Found ' .. #v239 .. ' food items. Please reselect.', Duration = 3 })
        end
    end,
})

local _AutoEatToggle
_AutoEatToggle = u10.AutoEat:Toggle({
    Title = 'Auto Eat',
    Desc = 'Automatically eat selected food when hunger is low until max hunger',
    Value = false,
    Callback = function(p240)
        u33 = p240
        if p240 then
            if #u34 == 0 then
                u33 = false
                _AutoEatToggle:Set(false)
                WindUI:Notify({ Title = 'Error', Content = 'Please select at least one food item first!', Duration = 3 })
                return
            end
            u100()
            WindUI:Notify({ Title = 'Auto Eat Enabled', Content = 'Will eat when hunger drops to ' .. u37 .. ' until ' .. u38, Duration = 3 })
        end
    end,
})

u10.AutoEat:Slider({
    Title = 'Auto Eat Threshold',
    Desc = 'Hunger level to start auto eating',
    Step = 5,
    Value = { Min = 0, Max = 200, Default = 30 },
    Callback = function(p241)
        u37 = math.clamp(p241, 0, u38)
    end,
})

u10.AutoEat:Button({
    Title = 'Check Current Hunger',
    Desc = 'Display current hunger level',
    Callback = function()
        local v242 = u78()
        WindUI:Notify({
            Title = 'Hunger Status',
            Content = 'Hunger: ' .. v242 .. '/' .. u38 .. '\nThreshold: ' .. u37 .. '\nFood: ' .. table.concat(u34, ', '),
            Duration = 5,
        })
    end,
})

-- TELEPORT
u10.TeleportControls:Button({
    Title = 'Safe Zone',
    Desc = 'Teleport to Safe Zone location',
    Callback = function()
        for _, v246 in ipairs(u57) do
            if v246[1]:lower():find('safezone') then
                u51(u56(v246[2]), 0.1)
                break
            end
        end
    end,
})

u10.TeleportControls:Button({
    Title = 'Teleport to Camp',
    Desc = 'Teleport to the camp location',
    Callback = function()
        local _Character3 = _LocalPlayer.Character
        if _Character3 and _Character3:FindFirstChild('HumanoidRootPart') then
            _Character3.HumanoidRootPart.CFrame = CFrame.new(13.287363052368164, 3.999999761581421, 0.36212217807769775, 0.6022269129753113, -2.275036159460342e-8, 0.7983249425888062, 6.430457055728311e-9, 1, 2.364672191390582e-8, -0.7983249425888062, -9.1070981866892e-9, 0.6022269129753113)
        end
    end,
})

u10.TeleportControls:Button({
    Title = 'Teleport to Trader',
    Desc = 'Teleport to the trader location',
    Callback = function()
        local v250 = Vector3.new(-37.08, 3.98, -16.33)
        ;(_LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart').CFrame = CFrame.new(v250)
    end,
})

u10.TeleportControls:Button({
    Title = 'TP to Random Tree',
    Desc = 'Teleport to a random tree',
    Callback = function()
        local _LocalPlayer3 = game:GetService('Players').LocalPlayer
        local _HumanoidRootPart4 = (_LocalPlayer3.Character or _LocalPlayer3.CharacterAdded:Wait()):FindFirstChild('HumanoidRootPart', 3)
        if _HumanoidRootPart4 then
            local _Map2 = workspace:FindFirstChild('Map')
            if _Map2 then
                local v254 = _Map2:FindFirstChild('Foliage') or _Map2:FindFirstChild('Landmarks')
                if v254 then
                    local v258 = {}
                    for _, v259 in ipairs(v254:GetChildren()) do
                        if v259.Name == 'Small Tree' and v259:IsA('Model') then
                            local v260 = v259:FindFirstChild('Trunk') or v259.PrimaryPart
                            if v260 then table.insert(v258, v260) end
                        end
                    end
                    if #v258 > 0 then
                        local _CFrame = v258[math.random(1, #v258)].CFrame
                        local v263 = _CFrame.Position + _CFrame.RightVector * 3
                        _HumanoidRootPart4.CFrame = CFrame.new(v263)
                    end
                end
            end
        end
    end,
})

-- BRING ITEMS
u10.BringItems:Button({
    Title = 'Bring Everything',
    Desc = 'Bring all items to your location',
    Callback = function()
        local v267 = 0
        for _, v268 in ipairs(workspace.Items:GetChildren()) do
            u126(v268, _LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
            v267 = v267 + 1
            task.wait(0.1)
        end
        WindUI:Notify({ Title = 'Success', Content = 'Brought ' .. v267 .. ' items to your location!', Duration = 3 })
    end,
})

u10.BringItems:Button({
    Title = 'Auto Cook Meat',
    Desc = 'Bring meat to campfire for cooking',
    Callback = function()
        local v272 = Vector3.new(1.87, 4.33, -3.67)
        local v276 = 0
        for _, v277 in pairs(workspace.Items:GetChildren()) do
            if (v277:IsA('Model') or v277:IsA('BasePart')) and v277.Name:lower():find('meat') then
                u126(v277, v272 + Vector3.new(math.random(-2, 2), 0.5, math.random(-2, 2)))
                v276 = v276 + 1
                task.wait(0.1)
            end
        end
        WindUI:Notify({ Title = 'Success', Content = 'Brought ' .. v276 .. ' meat items to campfire!', Duration = 3 })
    end,
})

u10.BringItems:Button({
    Title = 'Bring Lost Child',
    Desc = 'Bring lost child NPCs',
    Callback = function()
        local v281 = 0
        for _, v282 in ipairs(workspace:GetDescendants()) do
            if v282:IsA('Model') and v282.Name:lower():find('lost') and v282:FindFirstChild('HumanoidRootPart') then
                u126(v282, _LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0))
                v281 = v281 + 1
                task.wait(0.1)
            end
        end
    end,
})

-- AUTO DETECT ITEMS
local _ItemSelect = u10.AutoDetectItems:Dropdown({
    Title = 'Select Items to Bring',
    Desc = 'Choose items from workspace.Items',
    Values = u107(),
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(p283)
        u30 = p283 or {}
    end,
})

u10.AutoDetectItems:Dropdown({
    Title = 'Select Destinations',
    Desc = 'Choose where to bring the selected items',
    Values = { 'LocalPlayer', 'Campfire', 'Scrapper', 'Freezer' },
    Value = { 'LocalPlayer' },
    Multi = true,
    Callback = function(p285)
        u31 = p285 or { 'LocalPlayer' }
    end,
})

local _AutoDragToggle
_AutoDragToggle = u10.AutoDetectItems:Toggle({
    Title = 'Auto Drag Items',
    Desc = 'Automatically drag and drop selected items to chosen positions',
    Value = false,
    Callback = function(p286)
        u36 = p286
        if p286 then
            if #u30 == 0 or #u31 == 0 then
                u36 = false
                _AutoDragToggle:Set(false)
                WindUI:Notify({ Title = 'Error', Content = 'Please select at least one item and position first!', Duration = 3 })
                return
            end
            u170()
        end
    end,
})

u10.AutoDetectItems:Button({
    Title = 'Refresh Item List',
    Desc = 'Update the dropdown with current items in workspace',
    Callback = function()
        local v287 = u107()
        u30 = {}
        if #v287 <= 0 then
            _ItemSelect:Refresh({})
            WindUI:Notify({ Title = 'No Items', Content = 'No items found!', Duration = 3 })
        else
            _ItemSelect:Refresh(v287)
            WindUI:Notify({ Title = 'Items Refreshed', Content = 'Found ' .. #v287 .. ' items. Please reselect.', Duration = 3 })
        end
    end,
})

u10.AutoDetectItems:Button({
    Title = 'Bring Selected Items',
    Desc = 'Bring all instances of the selected items to selected positions',
    Callback = function()
        if #u30 <= 0 or #u31 <= 0 then
            WindUI:Notify({ Title = 'Error', Content = 'Please select at least one item and position first!', Duration = 3 })
        else
            local v291 = u148(u30, u31)
            WindUI:Notify({ Title = 'Success', Content = 'Brought ' .. v291 .. ' items to ' .. table.concat(u31, ', ') .. '!', Duration = 3 })
        end
    end,
})

-- SCRAP ITEMS
local _ScrapSelect = u10.ScrapItems:Dropdown({
    Title = 'Select Scrappable Items',
    Desc = 'Choose scrappable items from workspace.Items',
    Values = v109(),
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(p295)
        u39 = p295 or {}
    end,
})

u10.ScrapItems:Dropdown({
    Title = 'Select Destinations',
    Desc = 'Choose where to bring the scrappable items',
    Values = { 'Scrapper' },
    Value = { 'Scrapper' },
    Multi = true,
    Callback = function(p297)
        u40 = p297 or { 'Scrapper' }
    end,
})

local _AutoDragScrapToggle
_AutoDragScrapToggle = u10.ScrapItems:Toggle({
    Title = 'Auto Drag Scrap Items',
    Desc = 'Automatically drag and drop selected scrap items to chosen positions',
    Value = false,
    Callback = function(p298)
        u32 = p298
        if p298 then
            if #u39 == 0 or #u40 == 0 then
                u32 = false
                _AutoDragScrapToggle:Set(false)
                WindUI:Notify({ Title = 'Error', Content = 'Please select at least one scrap item and position first!', Duration = 3 })
                return
            end
            u171()
        end
    end,
})

u10.ScrapItems:Button({
    Title = 'Bring Selected Scrap Items',
    Desc = 'Bring all instances of the selected scrappable items',
    Callback = function()
        if #u39 <= 0 or #u40 <= 0 then
            WindUI:Notify({ Title = 'Error', Content = 'Please select at least one scrappable item and position first!', Duration = 3 })
        else
            local v304 = u148(u39, u40)
            WindUI:Notify({ Title = 'Success', Content = 'Brought ' .. v304 .. ' scrappable items!', Duration = 3 })
        end
    end,
})

-- FUEL ITEMS
local _FuelSelect = u10.FuelItems:Dropdown({
    Title = 'Select Fuel Items',
    Desc = 'Choose fuel items from workspace.Items',
    Values = v111(),
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(p308)
        u35 = p308 or {}
    end,
})

u10.FuelItems:Dropdown({
    Title = 'Select Destinations',
    Desc = 'Choose where to bring the fuel items',
    Values = { 'Campfire', 'Scrapper' },
    Value = { 'Campfire' },
    Multi = true,
    Callback = function(p310)
        u27 = p310 or { 'Campfire' }
    end,
})

local _AutoDragFuelToggle
_AutoDragFuelToggle = u10.FuelItems:Toggle({
    Title = 'Auto Drag Fuel Items',
    Desc = 'Automatically drag and drop selected fuel items to chosen positions',
    Value = false,
    Callback = function(p311)
        u26 = p311
        if p311 then
            if #u35 == 0 or #u27 == 0 then
                u26 = false
                _AutoDragFuelToggle:Set(false)
                WindUI:Notify({ Title = 'Error', Content = 'Please select at least one fuel item and position first!', Duration = 3 })
                return
            end
            u172()
        end
    end,
})

u10.FuelItems:Button({
    Title = 'Bring Selected Fuel Items',
    Desc = 'Bring all instances of the selected fuel items',
    Callback = function()
        if #u35 <= 0 or #u27 <= 0 then
            WindUI:Notify({ Title = 'Error', Content = 'Please select at least one fuel item and position first!', Duration = 3 })
        else
            local v317 = u148(u35, u27)
            WindUI:Notify({ Title = 'Success', Content = 'Brought ' .. v317 .. ' fuel items!', Duration = 3 })
        end
    end,
})

-- CHEST FINDER
local u321 = {}
local _ChestSelect = u10.ChestFinder:Dropdown({
    Title = 'Select Chests to Teleport',
    Desc = 'Choose chests from workspace to teleport to',
    Values = {},
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(p322)
        u41 = p322 or {}
    end,
})

u10.ChestFinder:Button({
    Title = 'Refresh Chest List',
    Desc = 'Update the dropdown with current chests in workspace',
    Callback = function()
        local v324, v325 = u121()
        u321 = v325
        u41 = {}
        if #v324 <= 0 then
            _ChestSelect:Refresh({})
            WindUI:Notify({ Title = 'No Chests', Content = 'No chests found in workspace!', Duration = 3 })
        else
            _ChestSelect:Refresh(v324)
            WindUI:Notify({ Title = 'Chests Refreshed', Content = 'Found ' .. #v324 .. ' chests. Please select.', Duration = 3 })
        end
    end,
})

u10.ChestFinder:Button({
    Title = 'Teleport to Selected Chests',
    Desc = 'Teleport to the selected chest locations',
    Callback = function()
        if #u41 <= 0 or not u321[u41[1]] then
            WindUI:Notify({ Title = 'Error', Content = 'Please select at least one chest first!', Duration = 3 })
        else
            local _Character4 = _LocalPlayer.Character
            if _Character4 and _Character4:FindFirstChild('HumanoidRootPart') then
                for _, v330 in ipairs(u41) do
                    local v331 = u321[v330]
                    if v331 and v331.position then
                        _Character4.HumanoidRootPart.CFrame = CFrame.new(v331.position + Vector3.new(0, 2, 3))
                        task.wait(0.5)
                    end
                end
                WindUI:Notify({ Title = 'Success', Content = 'Teleported to selected chests!', Duration = 3 })
            else
                WindUI:Notify({ Title = 'Error', Content = 'Character not found!', Duration = 3 })
            end
        end
    end,
})

u10.ChestFinder:Button({
    Title = 'Teleport to Nearest Chest',
    Desc = 'Automatically teleport to the closest chest',
    Callback = function()
        local _Character5 = _LocalPlayer.Character
        if _Character5 and _Character5:FindFirstChild('HumanoidRootPart') then
            local _Position2 = _Character5.HumanoidRootPart.Position
            local _huge = math.huge
            local v339 = nil
            for _, v340 in pairs(workspace:GetDescendants()) do
                if v340:IsA('Model') and (v340.Name:lower():find('chest') or v340.Name:lower():find('crate') or v340.Name:lower():find('box')) then
                    local v341 = v340:FindFirstChild('HumanoidRootPart') or v340:FindFirstChildWhichIsA('BasePart')
                    if v341 then
                        local _Magnitude = (v341.Position - _Position2).Magnitude
                        if _Magnitude < _huge then
                            v339 = { model = v340, position = v341.Position, name = v340.Name }
                            _huge = _Magnitude
                        end
                    end
                end
            end
            if v339 then
                _Character5.HumanoidRootPart.CFrame = CFrame.new(v339.position + Vector3.new(0, 2, 3))
                WindUI:Notify({ Title = 'Success', Content = 'Teleported to: ' .. v339.name .. ' (' .. math.floor(_huge) .. ' studs)', Duration = 3 })
            else
                WindUI:Notify({ Title = 'Error', Content = 'No chests found in workspace!', Duration = 3 })
            end
        else
            WindUI:Notify({ Title = 'Error', Content = 'Character not found!', Duration = 3 })
        end
    end,
})

-- HITBOX
local u344 = { Wolf = false, Bunny = false, Cultist = false, Show = false, Size = 10 }

local function u348(p345)
    local _HumanoidRootPart5 = p345:FindFirstChild('HumanoidRootPart')
    if _HumanoidRootPart5 then
        local v347 = p345.Name:lower()
        if u344.Wolf and (v347:find('wolf') or v347:find('alpha'))
            or u344.Bunny and v347:find('bunny')
            or u344.Cultist and (v347:find('cultist') or v347:find('cross')) then
            _HumanoidRootPart5.Size = Vector3.new(u344.Size, u344.Size, u344.Size)
            _HumanoidRootPart5.Transparency = u344.Show and 0.5 or 1
            _HumanoidRootPart5.Color = Color3.fromRGB(255, 255, 255)
            _HumanoidRootPart5.Material = Enum.Material.Neon
            _HumanoidRootPart5.CanCollide = false
        end
    end
end

task.spawn(function()
    for _, v352 in ipairs(workspace:GetDescendants()) do
        if v352:IsA('Model') and v352:FindFirstChild('HumanoidRootPart') then
            u348(v352)
        end
    end
    task.wait(2)
end)

u10.HitboxControls:Toggle({
    Title = 'Expand Wolf Hitbox',
    Desc = 'Expand wolf enemy hitboxes',
    Value = false,
    Callback = function(p353) u344.Wolf = p353 end,
})
u10.HitboxControls:Toggle({
    Title = 'Expand Bunny Hitbox',
    Desc = 'Expand bunny enemy hitboxes',
    Value = false,
    Callback = function(p354) u344.Bunny = p354 end,
})
u10.HitboxControls:Toggle({
    Title = 'Expand Cultist Hitbox',
    Desc = 'Expand cultist enemy hitboxes',
    Value = false,
    Callback = function(p355) u344.Cultist = p355 end,
})
u10.HitboxControls:Slider({
    Title = 'Hitbox Size',
    Desc = 'Size of expanded hitboxes',
    Step = 1,
    Value = { Min = 2, Max = 30, Default = 10 },
    Callback = function(p356) u344.Size = p356 end,
})
u10.HitboxControls:Toggle({
    Title = 'Show Hitbox',
    Desc = 'Make hitboxes visible',
    Value = false,
    Callback = function(p357) u344.Show = p357 end,
})

-- MISC
getgenv().speedEnabled = false
getgenv().speedValue = 28

u10.MiscFeatures:Toggle({
    Title = 'Speed Hack',
    Desc = 'Increase movement speed',
    Value = false,
    Callback = function(p358)
        getgenv().speedEnabled = p358
        local _Humanoid = (_LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()):FindFirstChild('Humanoid')
        if _Humanoid then
            _Humanoid.WalkSpeed = p358 and getgenv().speedValue or 16
        end
    end,
})

u10.MiscFeatures:Slider({
    Title = 'Speed Value',
    Desc = 'Speed multiplier value',
    Step = 1,
    Value = { Min = 16, Max = 600, Default = 28 },
    Callback = function(p360)
        getgenv().speedValue = p360
        if getgenv().speedEnabled then
            local _Character6 = _LocalPlayer.Character
            if _Character6 then
                local _Hum = _Character6:FindFirstChild('Humanoid')
                if _Hum then _Hum.WalkSpeed = p360 end
            end
        end
    end,
})

-- PERFORMANCE
local u362 = true
local u363 = true
local _Text = Drawing.new('Text')
local _Text2 = Drawing.new('Text')
local v366 = Vector2.new(_CurrentCamera.ViewportSize.X - 100, 10)
local v367 = Color3.fromRGB(0, 255, 0)

_Text.Visible = u362
_Text.Outline = true
_Text.Center = false
_Text.Color = v367
_Text.Position = v366
_Text.Size = 16

local v368 = Vector2.new(_CurrentCamera.ViewportSize.X - 100, 30)
local v369 = Color3.fromRGB(0, 255, 0)

_Text2.Visible = u363
_Text2.Outline = true
_Text2.Center = false
_Text2.Color = v369
_Text2.Position = v368
_Text2.Size = 16

local u370 = 0
local u371 = tick()

_RunService.RenderStepped:Connect(function()
    u370 = u370 + 1
    if tick() - u371 >= 1 then
        if u362 then
            _Text.Text = 'FPS: ' .. tostring(u370)
            _Text.Visible = true
        else
            _Text.Visible = false
        end
        if u363 then
            local _DataPing = game:GetService('Stats').Network.ServerStatsItem['Data Ping']
            local v373 = _DataPing and math.floor(_DataPing:GetValue()) or 0
            _Text2.Text = 'Ping: ' .. v373 .. ' ms'
            if v373 <= 60 then
                _Text2.Color = Color3.fromRGB(0, 255, 0)
            elseif v373 <= 120 then
                _Text2.Color = Color3.fromRGB(255, 165, 0)
            else
                _Text2.Color = Color3.fromRGB(255, 0, 0)
            end
            _Text2.Visible = true
        else
            _Text2.Visible = false
        end
        u370 = 0
        u371 = tick()
    end
end)

u10.Performance:Toggle({
    Title = 'Show FPS',
    Desc = 'Display FPS counter',
    Value = true,
    Callback = function(p374)
        u362 = p374
        _Text.Visible = p374
    end,
})

u10.Performance:Toggle({
    Title = 'Show Ping (ms)',
    Desc = 'Display ping counter',
    Value = true,
    Callback = function(p375)
        u363 = p375
        _Text2.Visible = p375
    end,
})

u10.Performance:Button({
    Title = 'FPS Boost',
    Desc = 'Apply performance optimizations',
    Callback = function()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            local _Lighting = game:GetService('Lighting')
            _Lighting.Brightness = 0
            _Lighting.FogEnd = 100
            _Lighting.GlobalShadows = false
            _Lighting.EnvironmentDiffuseScale = 0
            _Lighting.EnvironmentSpecularScale = 0
            _Lighting.ClockTime = 14
            _Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
            local _Terrain = workspace:FindFirstChildOfClass('Terrain')
            if _Terrain then
                _Terrain.WaterWaveSize = 0
                _Terrain.WaterWaveSpeed = 0
                _Terrain.WaterReflectance = 0
                _Terrain.WaterTransparency = 1
            end
            for _, v381 in ipairs(_Lighting:GetDescendants()) do
                if v381:IsA('PostEffect') or v381:IsA('BloomEffect') or v381:IsA('ColorCorrectionEffect') or v381:IsA('SunRaysEffect') or v381:IsA('BlurEffect') then
                    v381.Enabled = false
                end
            end
            for _, v385 in ipairs(game:GetDescendants()) do
                if v385:IsA('ParticleEmitter') or v385:IsA('Trail') then
                    v385.Enabled = false
                elseif v385:IsA('Texture') or v385:IsA('Decal') then
                    v385.Transparency = 1
                end
            end
            for _, v389 in ipairs(workspace:GetDescendants()) do
                if v389:IsA('BasePart') then
                    v389.CastShadow = false
                end
            end
        end)
        WindUI:Notify({ Title = 'Success', Content = 'FPS Boost applied successfully!', Duration = 3 })
    end,
})
