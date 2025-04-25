local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- قائمة السكربتات (قابلة للتعديل)
local scriptsList = {
    {name = "سكربت 100 مليار", url = "https://raw.githubusercontent.com/Rxwab/Kaboos_dragoon/main/Kaboosdragoon.lua"},
    {name = "اسكربت اختراق ثغرات backdoor", url = "https://raw.githubusercontent.com/Rxwab/Script_hacker_backdor/main/Kaboos_backdoor.lua"},
    {name = "سكربت نسخ Dead Rails", url = "https://raw.githubusercontent.com/Rxwab/copy_tools_deadraills/main/DeadRails.lua"},
}

-- واجهة قائمة السكربتات
local function createScriptsUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.Name = "ScriptsUI"
    ScreenGui.ResetOnSpawn = false

    local Background = Instance.new("Frame")
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BackgroundTransparency = 0.7
    Background.Parent = ScreenGui

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 400, 0, 500)
    Frame.Position = UDim2.new(0.5, -200, 0.5, -250)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.BackgroundTransparency = 0.1
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 20)
    UICorner.Parent = Frame

    -- عنوان القائمة
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.Text = "قائمة السكربتات"
    Title.TextColor3 = Color3.fromRGB(0, 255, 0)
    Title.TextScaled = true
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBlack
    Title.Parent = Frame

    -- شريط التمرير
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Size = UDim2.new(1, -20, 0, 300)
    ScrollingFrame.Position = UDim2.new(0, 10, 0, 60)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #scriptsList * 60)
    ScrollingFrame.ScrollBarThickness = 6
    ScrollingFrame.Parent = Frame

    -- تحديث قائمة السكربتات
    local function updateScriptButtons()
        for _, child in ipairs(ScrollingFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end

        for i, scriptData in ipairs(scriptsList) do
            local ScriptButton = Instance.new("TextButton")
            ScriptButton.Size = UDim2.new(1, 0, 0, 50)
            ScriptButton.Position = UDim2.new(0, 0, 0, (i - 1) * 60)
            ScriptButton.Text = scriptData.name
            ScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            ScriptButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            ScriptButton.TextScaled = true
            ScriptButton.Font = Enum.Font.SourceSansBold
            ScriptButton.Parent = ScrollingFrame

            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 12)
            ButtonCorner.Parent = ScriptButton

            local ButtonGlow = Instance.new("UIStroke")
            ButtonGlow.Thickness = 2
            ButtonGlow.Color = Color3.fromRGB(0, 255, 0)
            ButtonGlow.Parent = ScriptButton

            ScriptButton.MouseButton1Click:Connect(function()
                local success, err = pcall(function()
                    loadstring(game:HttpGet(scriptData.url))()
                end)
                if success then
                    print("تم تنفيذ السكربت:", scriptData.name)
                else
                    warn("فشل تنفيذ السكربت:", scriptData.name, err)
                end
            end)
        end
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #scriptsList * 60)
    end

    updateScriptButtons()

    -- إدخال سكربت جديد
    local ScriptNameInput = Instance.new("TextBox")
    ScriptNameInput.Size = UDim2.new(0.45, -10, 0, 40)
    ScriptNameInput.Position = UDim2.new(0, 10, 0, 370)
    ScriptNameInput.Text = ""
    ScriptNameInput.PlaceholderText = "اسم السكربت"
    ScriptNameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScriptNameInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ScriptNameInput.TextScaled = true
    ScriptNameInput.Font = Enum.Font.SourceSans
    ScriptNameInput.Parent = Frame

    local ScriptNameCorner = Instance.new("UICorner")
    ScriptNameCorner.CornerRadius = UDim.new(0, 12)
    ScriptNameCorner.Parent = ScriptNameInput

    local ScriptUrlInput = Instance.new("TextBox")
    ScriptUrlInput.Size = UDim2.new(0.45, -10, 0, 40)
    ScriptUrlInput.Position = UDim2.new(0.45, 10, 0, 370)
    ScriptUrlInput.Text = ""
    ScriptUrlInput.PlaceholderText = "رابط السكربت"
    ScriptUrlInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScriptUrlInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ScriptUrlInput.TextScaled = true
    ScriptUrlInput.Font = Enum.Font.SourceSans
    ScriptUrlInput.Parent = Frame

    local ScriptUrlCorner = Instance.new("UICorner")
    ScriptUrlCorner.CornerRadius = UDim.new(0, 12)
    ScriptUrlCorner.Parent = ScriptUrlInput

    -- زر إضافة السكربت
    local AddScriptButton = Instance.new("TextButton")
    AddScriptButton.Size = UDim2.new(0.9, 0, 0, 50)
    AddScriptButton.Position = UDim2.new(0.05, 0, 0, 420)
    AddScriptButton.Text = "إضافة سكربت"
    AddScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    AddScriptButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    AddScriptButton.TextScaled = true
    AddScriptButton.Font = Enum.Font.GothamBold
    AddScriptButton.Parent = Frame

    local AddButtonCorner = Instance.new("UICorner")
    AddButtonCorner.CornerRadius = UDim.new(0, 12)
    AddButtonCorner.Parent = AddScriptButton

    AddScriptButton.MouseButton1Click:Connect(function()
        local name = ScriptNameInput.Text
        local url = ScriptUrlInput.Text
        if name ~= "" and url ~= "" then
            table.insert(scriptsList, {name = name, url = url})
            updateScriptButtons()
            ScriptNameInput.Text = ""
            ScriptUrlInput.Text = ""
        end
    end)

    -- زر الإغلاق (X)
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -40, 0, 10)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.TextScaled = true
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.Parent = Frame

    local CloseButtonCorner = Instance.new("UICorner")
    CloseButtonCorner.CornerRadius = UDim.new(0, 10)
    CloseButtonCorner.Parent = CloseButton

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        createCircleButton()
    end)
end

-- زر الدائرة الصغيرة
local function createCircleButton()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.Name = "CircleButtonUI"
    ScreenGui.ResetOnSpawn = false

    local CircleButton = Instance.new("TextButton")
    CircleButton.Size = UDim2.new(0, 50, 0, 50)
    CircleButton.Position = UDim2.new(1, -70, 1, -70)
    CircleButton.Text = ""
    CircleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    CircleButton.AutoButtonColor = false
    CircleButton.Parent = ScreenGui

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(1, 0)
    ButtonCorner.Parent = CircleButton

    CircleButton.MouseEnter:Connect(function()
        CircleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    end)

    CircleButton.MouseLeave:Connect(function()
        CircleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end)

    CircleButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        createScriptsUI()
    end)
end

-- تشغيل الواجهة
createScriptsUI()
