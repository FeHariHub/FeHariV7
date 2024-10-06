local ArceusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/ArceusX-V3-Scripts/main/ArceusUI.lua"))()

-- Título Do Script
ArceusUI:SetTitle("FeHari Hub <font color='rgb(255, 0, 0)'>|</font> LOS⚡")

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

-- Botão
local myButton = ArceusUI:AddButton("Click Me!", function(...)
    print("Button was pressed!")
end)

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

-- Criando um novo Frame fora do Arceus UI
local uiPath = ArceusUI:Parent() -- Obtendo o ScreenGui
local myNewFrame = Instance.new("Frame") -- Criando um novo Frame
myNewFrame.Size = UDim2.new(0, 300, 0, 200) -- Definindo o tamanho do frame
myNewFrame.Position = UDim2.new(0.5, -150, 0.5, -100) -- Definindo a posição do frame
myNewFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Cor de fundo do frame
myNewFrame.Parent = uiPath -- Adicionando o frame ao ScreenGui

-- Iniciar a UI Arceus X
ArceusUI:Start()
