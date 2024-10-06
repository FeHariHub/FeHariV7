local ArceusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/ArceusX-V3-Scripts/main/ArceusUI.lua"))()

-- Título Do Script
ArceusUI:SetTitle("FeHari Hub <font color='rgb(255, 0, 0)'>|</font> V-Corridas 💀 ")

-- Logo Do Script
ArceusUI:SetLogo("MyLogo.png", "https://mywebsite/myimage.png")

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

local function ToggleAutoRaces(Value)
    AutoRaces = Value
    if AutoRaces then
        spawn(function()
            while AutoRaces do
                pcall(function()
                    ReplicatedStorage.rEvents.raceEvent:FireServer("joinRace")
                    task.wait()
                    local part = Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(Workspace.raceMaps:GetDescendants()) do 
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

-- Botão
local myButton = ArceusUI:AddButton("Farmar Corridas >", function(...)
    print("Button was pressed!")
end)

-- Toggle para corridas automáticas
local raceToggle = ArceusUI:AddToggle("Corridas Automáticas", function(myStatus, ...)
    ToggleAutoRaces(myStatus)
    print("Status do Toggle de Corridas:", myStatus)
end, false) -- Status inicial definido como falso

-- Toggle
local myToggle = ArceusUI:AddToggle("Aros V1", function(myStatus, ...)
    isFarming = myStatus
    print("Status do Toggle:", myStatus)

    -- Iniciar ou parar o farming com base no status do toggle
    if isFarming then
        while isFarming do
            HoopFarm()
            task.wait(0.5) -- Ajuste o atraso conforme necessário
        end
    end
end, false) -- Status inicial definido como falso

-- Combo box
local myCombo = ArceusUI:AddComboBox("Choose Option", {"Option 1", "Option 2", "Option 3"}, function(myChoice, ...)
    print("Combo selection:", myChoice)
end)

-- Up-Down
local myUpDown = ArceusUI:AddUpDown("Select Number", function(myNumericValue, ...)
    print("UpDown value:", myNumericValue)
end, 1, 1, 1, 10) -- Starts at 1, increment by 1, min 1, max 10

-- Iniciar a UI Arceus X
ArceusUI:Start()
