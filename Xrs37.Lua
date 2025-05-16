local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/XZuuyaX/Wind/refs/heads/main/WindUI/dist/main.lua"))()

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "Welcome to XZuyaX's HUB!",
    Icon = "info",
    Content = "Thanks for Using".. gradient(" XZuyaX's HUB", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")) .. "!" ,
    Buttons = {
        {
            Title = "Cancel",
            --Icon = "",
            Callback = function() end,
            Variant = "Tertiary", -- Primary, Secondary, Tertiary
        },
        {
            Title = "Continue",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary", -- Primary, Secondary, Tertiary
        }
    }
})


repeat wait() until Confirmed

--

local Window = WindUI:CreateWindow({
    Title = gradient("XZuyaX's HUB", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")), 
    Icon = "crown",
    Author = "Zuya",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(435, 345),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    --Background = "rbxassetid://13511292247", -- rbxassetid only
    HasOutline = false,
})


Window:EditOpenButton({
    Title = gradient("XZuyaX's HUB", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")),
    Icon = "crown",
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    --Enabled = false,
    Draggable = true,
})


local Tabs = {
    InfoTab = Window:Tab({ Title = "Home", Icon = "house", Desc = "Information about the creator." }),
    ButtonTab = Window:Tab({ Title = "Main", Icon = "computer", Desc = "Contains interactive buttons for various actions." }),
    ToggleTab = Window:Tab({ Title = "Rollback", Icon = "refresh-cw", Desc = "Rollback for Inf Spin." }),
    BallTab = Window:Tab({ Title = "Ball hack", Icon = "circle-play", Desc = "Hack ball content." }),
    MiscTab = Window:Tab({ Title = "Misc", Icon = "align-justify", Desc = "Subscribe to XZuyaX! " }),
    EventTab = Window:Tab({ Title = "Event", Icon = "gift", Desc = "this is just a trigger to open the event menu." }),
    b = Window:Divider(),
    ServerTab = Window:Tab({ Title = "Server", Icon = "server", Desc = "Subscribe to XZuyaX! " }),
    WindowTab = Window:Tab({ Title = "Window and File Configuration", Icon = "settings", Desc = "Manage window settings and file configurations." }),
    CreateThemeTab = Window:Tab({ Title = "Create Theme", Icon = "palette", Desc = "Design and apply custom themes." }),
    be = Window:Divider(),
}

Window:SelectTab(1)

-- GUI Draggable
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StyleChangerGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 180)
Frame.Position = UDim2.new(0.5, -100, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Visible = false
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Judul
local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Choose Style"
titleLabel.Size = UDim2.new(1, 0, 0, 25)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.Parent = Frame

-- Container buat button style
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, 0, 1, -30)
ButtonContainer.Position = UDim2.new(0, 0, 0, 30)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ButtonContainer
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

local styles = { "Kaiser", "Kurona", "King" }

for _, styleName in ipairs(styles) do
    local btn = Instance.new("TextButton")
    btn.Text = styleName
    btn.Size = UDim2.new(0, 160, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = ButtonContainer

    btn.MouseButton1Click:Connect(function()
        local stats = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerStats")
        if stats and stats:FindFirstChild("Style") then
            stats.Style.Value = styleName

            WindUI:Notify({
                Title = "Style Changed",
                Content = "Now using style: " .. styleName,
                Icon = "sparkles",
                Duration = 5,
            })
        end
    end)
end

Tabs.ButtonTab:Section({ Title = "AUTO GOAL & MONEY FARM" })

-- Listener global hapus Attachment/Attachment1 kapanpun bola muncul
task.spawn(function()
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")

    while true do
        -- Cek bola di Workspace
        local football = Workspace:FindFirstChild("Football")
        if football then
            for _, name in {"Attachment", "Attachment1"} do
                local att = football:FindFirstChild(name)
                if att then att:Destroy() end
            end
        end

        -- Cek bola di semua karakter pemain
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character then
                local fb = plr.Character:FindFirstChild("Football")
                if fb then
                    for _, name in {"Attachment", "Attachment1"} do
                        local att = fb:FindFirstChild(name)
                        if att then att:Destroy() end
                    end
                end
            end
        end
        task.wait(0.2)
    end
end)

-- Tombol Auto Goal
Tabs.ButtonTab:Toggle({
    Title = "Auto Goal",
    Desc = "OP but still have Bug",
    Icon = "target",
    Default = false,
    Callback = function(value)
        _G.AutoCombo = value

        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")
        local player = Players.LocalPlayer
        local BallService = ReplicatedStorage.Packages.Knit.Services.BallService.RE
        local Goals = ReplicatedStorage:WaitForChild("Goals")
        local TweenService = game:GetService("TweenService")
        local lastGoalValue = {Away = Goals.Away.Value, Home = Goals.Home.Value}
        local waitingAfterGoal = false

        -- Noclip function
        local function toggleNoclip(state)
            local RunService = game:GetService("RunService")
            if state then
                _G.NoclipConnection = RunService.Stepped:Connect(function()
                    if player.Character then
                        for _, part in pairs(player.Character:GetDescendants()) do
                            if part:IsA("BasePart") and part.CanCollide then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
            elseif _G.NoclipConnection then
                _G.NoclipConnection:Disconnect()
                _G.NoclipConnection = nil
                -- Balikin CanCollide = true
                if player.Character then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end
        end

        -- Fungsi bantu lainnya
        local function waitForCharacter()
            repeat task.wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            return player.Character, player.Character:FindFirstChild("HumanoidRootPart")
        end

        local function getTeam()
            return player.Team and player.Team.Name or "Unknown"
        end

        local function getGoalCFrame()
            if getTeam() == "Home" then
                return CFrame.new(-242.376602, 10.8505239, -49.222084)
            else
                return CFrame.new(319.823425, 10.8505239, -49.222084)
            end
        end

        local function findFootball()
            for _, plr in pairs(Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("Football") then
                    return plr.Character.Football, plr
                end
            end
            local fb = Workspace:FindFirstChild("Football")
            if fb then return fb, nil end
            return nil, nil
        end

        local function tweenToGoalThenTeleport()
    local goalPos = getGoalCFrame().Position + Vector3.new(0, 1.2, 0)

    -- Step 1: Nendang dulu sebanyak 3 kali
    for i = 1, 3 do
        BallService.Shoot:FireServer(110, nil, Vector3.zero)
        task.wait(0.05)
    end

    -- Step 2: Langsung teleport bola ke gawang meskipun belum pindah ke Workspace
    for i = 1, 5 do
        local fb, _ = findFootball()
        if fb then
            fb.CFrame = CFrame.new(goalPos)
        end
        task.wait(0.05)
    end
end

        if value then
            toggleNoclip(false)
            _G.ComboThread = task.spawn(function()
                while _G.AutoCombo do
                    local character, root = waitForCharacter()
                    local football, owner = findFootball()

                    if Goals.Away.Value ~= lastGoalValue.Away or Goals.Home.Value ~= lastGoalValue.Home then
                        waitingAfterGoal = true
                        lastGoalValue.Away = Goals.Away.Value
                        lastGoalValue.Home = Goals.Home.Value
                        task.delay(9, function()
                            waitingAfterGoal = false
                        end)
                    end

                    if football then
                        if football:IsDescendantOf(character) then
                            tweenToGoalThenTeleport()
                        end

                        local charValue = football:FindFirstChild("Char")
                        local shouldTeleport = false

                        if football.Parent == Workspace then
                            if (not charValue) or (charValue.Value ~= character) then
                                shouldTeleport = true
                            elseif charValue.Value == character and not waitingAfterGoal then
                                shouldTeleport = true
                            end
                        elseif owner and owner.Team ~= player.Team then
                            local enemyHRP = owner.Character and owner.Character:FindFirstChild("HumanoidRootPart")
                            if enemyHRP and not waitingAfterGoal then
                                root.CFrame = CFrame.new(enemyHRP.Position + Vector3.new(0, 0.8, 0))
                                BallService.Slide:FireServer(owner)
                            end
                        end

                        if shouldTeleport and not waitingAfterGoal and not football:IsDescendantOf(character) then
                            root.CFrame = CFrame.new(football.Position + Vector3.new(0, 1.2, 0))
                        end
                    end

                    task.wait(0.1)
                end
            end)
        else
            if _G.ComboThread then
                task.cancel(_G.ComboThread)
                _G.ComboThread = nil
            end
            toggleNoclip(false)
        end
    end
})

Tabs.ButtonTab:Button({
    Title = "Money Farm",
    Desc = "Must Have Reo/Kurona | Use at ur own Risk.", 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XZuuyaX/MoneyFarm/refs/heads/main/script.lua"))()
    end
})

Tabs.ButtonTab:Section({ Title = "Main" })

Tabs.ButtonTab:Toggle({
    Title = "Infinite Awakening",
    Icon = "infinity", 
    Desc = "Must have Reo",
    Default = false,
    Callback = function(enabled)
        local player = game:GetService("Players").LocalPlayer
        local stats = player:FindFirstChild("PlayerStats")
        if not stats then return end

        local inAwakening = stats:FindFirstChild("InAwakening")
        local style = stats:FindFirstChild("Style")
        if not inAwakening or not style then return end

        -- Aktifkan atau nonaktifkan Awakening
        inAwakening.Value = enabled
        Frame.Visible = enabled

        -- Selalu tampilkan notifikasi saat toggle ON
        if enabled then
            task.delay(0.1, function()
                WindUI:Notify({
                    Title = "Heads Up!",
                    Content = "Infinite Awakening only works on: Kaiser, Kurona and King.",
                    Icon = "circle-alert",
                    Duration = 6,
                })
            end)
        end
    end
})

Tabs.ButtonTab:Button({
    Title = "Infinite Stamina",
    Desc = "Activate Infinite Stamina",
    Callback = function()
        task.spawn(function()
            local player = game:GetService("Players").LocalPlayer
            while task.wait() do
                if player and player:FindFirstChild("PlayerStats") then
                    local stats = player.PlayerStats
                    if stats:FindFirstChild("Stamina") then
                        stats.Stamina.Value = math.huge
                    end
                end
            end
        end)
        print("Infinite Stamina activated!")
    end
})

Tabs.ButtonTab:Button({
    Title = "No Cooldown",
    Desc = "Only works on some executors",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XZuuyaX/NoCD/refs/heads/main/Main", true))() end
})

Tabs.ButtonTab:Toggle({
    Title = "Get Flow Buff | Inf Flow",
    Icon = "flame",
    Default = false, -- Saat toggle awalnya mati
    Callback = function(state)
        local player = game:GetService("Players").LocalPlayer
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("InFlow") then
            player.PlayerStats.InFlow.Value = state
        end
    end
})

Tabs.ButtonTab:Dropdown({
    Title = "STYLE CHANGER",
    Desc = "Must have Reo", 
    Values = { "Kaiser", "NEL Isagi", "NEL Rin", "Sae", "Don Lorenzo", "NEL Bachira", "King", "Kunigami", "Rin", "Aiku", "Shidou", "Yukimiya", "Karasu", "Reo", "Nagi", "Igaguri", "Kurona", "Bachira", "Otoya", "Gagamaru", "Hiori", "Isagi", "Chigiri"},
    Value = "Default",
    Callback = function(option)
        local player = game:GetService("Players").LocalPlayer
        if player and player:FindFirstChild("PlayerStats") then
            player.PlayerStats.Style.Value = option
            print("Style Changed To:", option)
        else
            warn("PlayerStats not found!")
        end
    end
})

Tabs.ButtonTab:Dropdown({
    Title = "FLOW CHANGER",
    Desc = "Must have Reo", 
    Values = { "Awakened Genius", "Destructive Impulses", "Emperor", "Soul Harvester", "Prodigy", "Dribbler", "Bee Freestyle", "Snake", "Trap", "Wild Card", "Chameleon", "Demon Wings", "Crow", "King's Instinct", "Monster", "Buddha's Blessing", "Genius", "Gale Burst", "Lightning", "Ice", "Puzzle"},
    Value = "Default",
    Callback = function(option)
        local player = game:GetService("Players").LocalPlayer
        if player and player:FindFirstChild("PlayerStats") then
            player.PlayerStats.Flow.Value = option
            print("Flow Changed To:", option)
        else
            warn("PlayerStats not found!")
        end
    end
})

local AutoDribbleLoaded = false

Tabs.ButtonTab:Toggle({
    Title = "Auto Dribble",
    Desc = "Not Perfect!",
    Default = false,
    Callback = function(state)
        if state then
            if not AutoDribbleLoaded then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XZuuyaX/Auto-Dribble/refs/heads/main/Main.lua", true))()
                AutoDribbleLoaded = true
            end
            getgenv().AutoDribbleSettings.Enabled = true
        else
            getgenv().AutoDribbleSettings.Enabled = false
        end
        print("Auto Dribble: " .. tostring(getgenv().AutoDribbleSettings.Enabled))
    end
})

Tabs.ButtonTab:Input({
    Title = "Dribble Range",
    Default = "22",
    Values = "Enter Dribble Range",
    PlaceholderText = "Enter Dribble Range",
    Callback = function(input)
        getgenv().AutoDribbleSettings.range = tonumber(input) or 22
        print("Range changed to: " .. getgenv().AutoDribbleSettings.range)
    end
})

Tabs.ButtonTab:Section({ Title = "POWER SHOOT | MOBILE " })

local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local shootButton = player.PlayerGui.Mobile.Ball.Shoot

local maxPower = 180
local toggleEnabled = false
local shootConnection -- buat nyimpen koneksi

-- Input Power
Tabs.ButtonTab:Input({
    Title = "Input Power",
    Desc = "Default: 180",
    Default = "",
    PlaceholderText = "Enter number (ex: 500)",
    Callback = function(input)
        local num = tonumber(input)
        if num then
            maxPower = num
            print("Max power set to:", maxPower)
        end
    end
})

-- Toggle Power Shoot
Tabs.ButtonTab:Toggle({
    Title = "Add Power | Mobile",
    Desc = "Turn on to use the Power Shoot",
    Default = false,
    Callback = function(state)
        toggleEnabled = state

        -- Hapus koneksi lama
        if shootConnection then
            shootConnection:Disconnect()
            shootConnection = nil
        end

        if toggleEnabled then
            print("Custom shoot enabled")

            shootConnection = shootButton.MouseButton1Click:Connect(function()
                local shootDirection = Vector3.new(1, 0, 0) -- arah default
                local args = {
                    [1] = maxPower,
                    [4] = shootDirection
                }

                ReplicatedStorage.Packages.Knit.Services.BallService.RE.Shoot:FireServer(unpack(args))
                print("Shoot with power:", maxPower)
            end)
        else
            print("Custom shoot disabled (button won't shoot)")
        end
    end
})

Tabs.ButtonTab:Section({ Title = "POWER SHOOT | PC " })

local UIS = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("Replicated
