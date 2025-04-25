-- سكربت واجهة القائمة الرئيسية الفاخرة
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- إعدادات السكربتات
local scripts = {
    {name = "سكربت الفلوس (100 مليار)", url = "https://raw.githubusercontent.com/Rxwab/Kaboos_dragoon/main/Kaboosdragoon.lua"},
    {name = "سكربت ماب القطار", url = "https://raw.githubusercontent.com/Rxwab/Kaboos_Dead-Rails/main/DeadRailsDeltaHackUI_Kaboos.lua"}
}

-- دالة لإنشاء أنيميشن الخط المتحرك
local function createBorderAnimation(parent, borderColor)
    local Border = Instance.new("Frame")
    Border.Size = UDim2.new(1, 4, 1, 4)
    Border.Position = UDim2.new(0, -2, 0, -2)
    Border.BackgroundTransparency = 1
    Border.Parent = parent

    local Top = Instance.new("Frame")
    Top.Size = UDim2.new(0, 0, 0, 4)
    Top.Position = UDim2.new(0, 0, 0, -2)
    Top.BackgroundColor3 = borderColor
    Top.Parent = Border

    local Bottom = Instance.new("Frame")
    Bottom.Size = UDim2.new(0, 0, 0, 4)
    Bottom.Position = UDim2.new(1, 0, 1, -2)
    Bottom.BackgroundColor3 = borderColor
    Bottom.Parent = Border

    local Left = Instance.new("Frame")
    Left.Size = UDim2.new(0, 4, 0, 0)
    Left.Position = UDim2.new(0, -2, 0, 0)
    Left.BackgroundColor3 = borderColor
    Left.Parent = Border

    local Right = Instance.new("Frame")
    Right.Size = UDim2.new(0, 4, 0, 0)
    Right.Position = UDim2.new(1, -2, 1, 0)
    Right.BackgroundColor3 = borderColor
    Right.Parent = Border

    local function animateBorder()
        while true do
            TweenService:Create(Top, TweenInfo.new(1, Enum.EasingStyle.Sine), {Size = UDim2.new(1, 0, 0, 4)}):Play()
            wait(1)
            TweenService:Create(Right, TweenInfo.new(1, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 4, 1, 0)}):Play()
            wait(1)
            TweenService:Create(Bottom, TweenInfo.new(1, Enum.EasingStyle.Sine), {Size = UDim2.new(1, 0, 0, 4), Position = UDim2.new(0, 0, 1, -2)}):Play()
            wait(1)
            TweenService:Create(Left, TweenInfo.new(1, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 4, 1, 0)}):Play()
            wait(1)
            TweenService:Create(Top, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 4)}):Play()
            TweenService:Create(Right, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 4, 0, 0)}):Play()
            TweenService:Create(Bottom, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 4)}):Play()
            TweenService:Create(Left, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 4, 0, 0)}):Play()
            wait(0.5)
        end
    end
    spawn(animateBorder)
end

-- دالة لإنشاء القائمة الرئيسية
local function createMainMenu()
    print("Creating Main Menu")
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = PlayerGui
    ScreenGui.Name = "MainMenuUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 400, 0, 300)
    Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.Parent = ScreenGui
    Frame.Visible = true

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))
    })
    Gradient.Parent = Frame

    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 12)
    FrameCorner.Parent = Frame

    createBorderAnimation(Frame, Color3.fromRGB(0, 255, 0))

    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextScaled = true
    CloseButton.Parent = Frame

    local CloseButtonCorner = Instance.new("UICorner")
    CloseButtonCorner.CornerRadius = UDim.new(0, 8)
    CloseButtonCorner.Parent = CloseButton

    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 50, 50)}):Play()
    end)
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
    end)

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = "قايمة السكربتات الفاخرة"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBlack
    Title.TextScaled = true
    Title.BackgroundTransparency = 1
    Title.TextStrokeTransparency = 0.8
    Title.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
    Title.Parent = Frame

    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Size = UDim2.new(0.9, 0, 0.6, 0)
    ScrollingFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.ScrollBarThickness = 8
    ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 120, 255)
    ScrollingFrame.Parent = Frame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 10)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = ScrollingFrame

    for i, script in ipairs(scripts) do
        print("Creating Button for Script: " .. script.name)
        local ScriptButton = Instance.new("TextButton")
        ScriptButton.Size = UDim2.new(1, 0, 0, 40)
        ScriptButton.Text = script.name
        ScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        ScriptButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        ScriptButton.Font = Enum.Font.GothamBold
        ScriptButton.TextScaled = true
        ScriptButton.Parent = ScrollingFrame

        local ScriptButtonCorner = Instance.new("UICorner")
        ScriptButtonCorner.CornerRadius = UDim.new(0, 8)
        ScriptButtonCorner.Parent = ScriptButton

        ScriptButton.MouseEnter:Connect(function()
            TweenService:Create(ScriptButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 150, 255)}):Play()
        end)
        ScriptButton.MouseLeave:Connect(function()
            TweenService:Create(ScriptButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 120, 255)}):Play()
        end)

        ScriptButton.MouseButton1Click:Connect(function()
            print("Executing Script: " .. script.name)
            local success, result = pcall(function()
                loadstring(game:HttpGet(script.url))()
            end)
            if success then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "تم التشغيل",
                    Text = "تم تشغيل " .. script.name,
                    Duration = 3
                })
            else
                game.StarterGui:SetCore("SendNotification", {
                    Title = "خطأ",
                    Text = "فشل تشغيل " .. script.name .. ": " .. tostring(result),
                    Duration = 5
                })
            end
        end)
    end

    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #scripts * 50)

    local FloatingButton = Instance.new("TextButton")
    FloatingButton.Size = UDim2.new(0, 50, 0, 50)
    FloatingButton.Position = UDim2.new(0, 10, 0, 10)
    FloatingButton.Text = "🔧"
    FloatingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    FloatingButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    FloatingButton.Font = Enum.Font.GothamBold
    FloatingButton.TextScaled = true
    FloatingButton.Visible = false
    FloatingButton.Parent = ScreenGui

    local FloatingButtonCorner = Instance.new("UICorner")
    FloatingButtonCorner.CornerRadius = UDim.new(1, 0)
    FloatingButtonCorner.Parent = FloatingButton

    local function rotateColors()
        while true do
            for i = 0, 1, 0.01 do
                FloatingButton.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
                wait(0.05)
            end
        end
    end
    spawn(rotateColors)

    CloseButton.MouseButton1Click:Connect(function()
        print("Closing Main Menu")
        Frame.Visible = false
        FloatingButton.Visible = true
    end)

    FloatingButton.MouseButton1Click:Connect(function()
        print("Opening Main Menu")
        Frame.Visible = true
        FloatingButton.Visible = false
    end)
end

-- تشغيل الواجهة الرئيسية
createMainMenu()
