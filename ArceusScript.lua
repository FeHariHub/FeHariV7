local ArceusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/ArceusX-V3-Scripts/main/ArceusUI.lua"))()

-- Set up the UI title
ArceusUI:SetTitle("Arceus X <font color='rgb(255, 0, 0)'>|</font> MyScript")

-- Set up the script logo
ArceusUI:SetLogo("MyLogo.png", "https://mywebsite/myimage.png")

-- Adding a button
local myButton = ArceusUI:AddButton("Click Me!", function(...)
    print("Button was pressed!")
end)

-- Adding a toggle
local myToggle = ArceusUI:AddToggle("Enable Feature", function(myStatus, ...)
    print("Toggle status:", myStatus)
end, false) -- Initial status set to false

-- Adding a combo box
local myCombo = ArceusUI:AddComboBox("Choose Option", {"Option 1", "Option 2", "Option 3"}, function(myChoice, ...)
    print("Combo selection:", myChoice)
end)

-- Adding a numeric up-down
local myUpDown = ArceusUI:AddUpDown("Select Number", function(myNumericValue, ...)
    print("UpDown value:", myNumericValue)
end, 1, 1, 1, 10) -- Starts at 1, increment by 1, min 1, max 10

-- Start the UI
ArceusUI:Start()
