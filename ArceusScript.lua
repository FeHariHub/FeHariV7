local ArceusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/ArceusX-V3-Scripts/main/ArceusUI.lua"))()

-- Título Do Script
ArceusUI:SetTitle("FeHari Hub <font color='rgb(255, 0, 0)'>|</font> Corridas")

-- Logo Do Script
ArceusUI:SetLogo("MyLogo.png", "https://mywebsite/myimage.png")

-- Função para ativar corridas automáticas
local function ToggleAutoRaces(Value)
    AutoRaces = Value
    if AutoRaces then
        spawn(function()
            while AutoRaces do
                pcall(function()
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    task.wait()
                    local part = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(game.Workspace.raceMaps:GetDescendants()) do 
                        if v.Name == "Decal" and v.Parent then
                            firetouchinterest(part, v.Parent, 0)
                            wait()
                            firetouchinterest(part, v.Parent, 1)
                        end
                    end
                end)
                task.wait()
            end
        end)
    end
end

-- Variável para controlar o estado do farming
local isFarming = false

-- Função de farming
local function HoopFarm()
    local Chr = game.Players.LocalPlayer.Character
    if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
        for _, v in next, game:GetService("Workspace").Hoops:GetDescendants() do
            if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                task.wait()
                firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 1)
            end
        end
    end
end

-- Variável para controlar o estado do farming V2
local isFarmingV2 = false

-- Função de farming V2
local function HoopFarmV2()
    local Chr = game.Players.LocalPlayer.Character
    if Chr and Chr.Parent and Chr:FindFirstChild("HumanoidRootPart") then
        local children = workspace.Hoops:GetChildren()
        for _, child in ipairs(children) do
            if child.Name == "Hoop" then
                child.CFrame = Chr.HumanoidRootPart.CFrame
            end    
        end
    end
end

-- Variável para controlar o estado das corridas automáticas
local AutoRaces = false


local function ToggleAutoRaces(Value)
    AutoRaces = Value
    if AutoRaces then
        spawn(function()
            while AutoRaces do
                pcall(function()
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    task.wait()
                    local part = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(game.Workspace.raceMaps:GetDescendants()) do 
                        if v.Name == "Decal" and v.Parent then
                            firetouchinterest(part, v.Parent, 0)
                            wait()
                            firetouchinterest(part, v.Parent, 1)
                        end
                    end
                end)
                task.wait()
            end
        end)
    end
end

-- Variável para controlar o estado das corridas automáticas solo
local AutoRacesSolo = false


local function ToggleAutoRacesSolo(Value)
    AutoRacesSolo = Value
    if AutoRacesSolo then
        spawn(function()
            while AutoRacesSolo do
                pcall(function()
                    local playerHead = game.Players.LocalPlayer.Character.Head
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    wait(0.00)
                end)
                task.wait()
            end
        end)
    end
end

-- Variável para controlar o estado do AntiKick
local isAntiKickActive = false

-- Função AntiKick
local function AntiKick()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

-- Info Corridas
local myButton = ArceusUI:AddButton("Farmar Corridas ↓", function(...)
    print("Button was pressed!")
end)

-- Corridas Automáticas
local raceToggle = ArceusUI:AddToggle("Corridas Automáticas", function(myStatus, ...)
    AutoRaces = myStatus 
    ToggleAutoRaces(myStatus) 
    print("Status do Toggle de Corridas:", myStatus)
end, false) 

-- Toggle para corridas automáticas solo
local soloRaceToggle = ArceusUI:AddToggle("Bloquear Corridas", function(myStatus, ...)
    AutoRacesSolo = myStatus 
    ToggleAutoRacesSolo(myStatus) 
    print("Status do Toggle de Corridas Solo:", myStatus)
end, false) 

-- Info Aros
local myButton = ArceusUI:AddButton("Farmar Aros ↓", function(...)
    print("Button was pressed!")
end)

-- Aros V1
local myToggle = ArceusUI:AddToggle("Aros V1", function(myStatus, ...)
    isFarming = myStatus
    print("Status do Toggle:", myStatus)

    -- Iniciar ou parar o farming 
    if isFarming then
        while isFarming do
            HoopFarm()
            task.wait(0.5) -- Ajuste o atraso conforme necessário
        end
    end
end, false) -- Status inicial definido como falso

-- Aros V2
local farmingV2Toggle = ArceusUI:AddToggle("Ativar Farming V2", function(myStatus, ...)
    isFarmingV2 = myStatus -- Atualiza a variável isFarmingV2
    print("Status do Toggle de Farming V2:", myStatus)

    -- Iniciar ou parar o farming 
    if isFarmingV2 then
        while isFarmingV2 do
            HoopFarmV2()
            task.wait(0.5) -- Ajuste o atraso conforme necessário
        end
    end
end, false) 

-- Botão para ativar o AntiKick
local myButton = ArceusUI:AddButton("Ativar AntiKick", function(...)
    isAntiKickActive = not isAntiKickActive -- Alterna o estado
    print("AntiKick status:", isAntiKickActive)

    if isAntiKickActive then
        AntiKick() -- Chama a função se ativado
    end
end)

-- Iniciar a UI Arceus X
ArceusUI:Start()
