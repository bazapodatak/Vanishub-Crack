-- DEOBFUCATED BY TBA - TOUCHEDBYAGENTS

-- SKID IT IF U WANT

-- discord.gg/crackedclients

getgenv().SCRIPT_KEY = "keyless"
local VALID_KEY = "VANISH-2HHw8gZ4DT"
local DISCORD_INVITE_CODE = "vanishrbx"
local DISCORD_INVITE_URL = "https://discord.gg/" .. DISCORD_INVITE_CODE
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local ACCENT_PURPLE = Color3.fromRGB(124, 77, 255)
local ACCENT_BLUE = Color3.fromRGB(88, 101, 242)
local BACKGROUND_DARK = Color3.fromRGB(13, 12, 22)
local BACKGROUND_INPUT = Color3.fromRGB(20, 19, 34)
local BACKGROUND_PANEL = Color3.fromRGB(26, 24, 42)
local BORDER_COLOR = Color3.fromRGB(42, 38, 66)
local BORDER_PURPLE = Color3.fromRGB(92, 64, 190)
local TEXT_COLOR = Color3.fromRGB(240, 240, 248)
local MUTED_TEXT_COLOR = Color3.fromRGB(150, 146, 175)
local LIGHT_PURPLE = Color3.fromRGB(150, 110, 255)
local SUCCESS_GREEN = Color3.fromRGB(80, 220, 140)
local ERROR_RED = Color3.fromRGB(255, 85, 100)
local function tween(instanceToTween, duration, goalProperties, easingStyle)
    local activeTween = TweenService:Create(instanceToTween, TweenInfo.new(duration, easingStyle or Enum.EasingStyle.Quint, Enum.EasingDirection.Out), goalProperties)
    activeTween:Play()
    return activeTween
end
local function addCorner(parent, cornerRadius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius or 10)
    corner.Parent = parent
    return corner
end
local function addStroke(parent, strokeColor, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = strokeColor
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = parent
    return stroke
end
local function createInstance(className, properties, parent)
    local instance = Instance.new(className)
    for propertyName, propertyValue in pairs(properties) do
        instance[propertyName] = propertyValue
    end
    instance.Parent = parent
    return instance
end
local function createTextLabel(parent, labelProperties)
    local label = createInstance("TextLabel", {
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextColor3 = TEXT_COLOR,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left
    }, parent)
    for propertyName, propertyValue in pairs(labelProperties) do
        label[propertyName] = propertyValue
    end
    return label
end
local function createDivider(parent, yOffset, height)
    return createInstance("Frame", {
        Position = UDim2.fromOffset(0, yOffset),
        Size = UDim2.new(1, 0, 0, height or 1),
        BackgroundColor3 = BORDER_COLOR,
        BorderSizePixel = 0
    }, parent)
end
local function createLogo(parent, position, size, logoTextSize)
    local logoFrameInstance = createInstance("Frame", {
        Position = position,
        Size = size,
        BackgroundColor3 = Color3.fromRGB(34, 26, 70)
    }, parent)
    addCorner(logoFrameInstance, 6)
    addStroke(logoFrameInstance, BORDER_PURPLE, 1, 0.3)
    local logoText = createTextLabel(logoFrameInstance, {
        Size = UDim2.fromScale(1, 1),
        Text = "V",
        Font = Enum.Font.GothamBlack,
        TextSize = logoTextSize or 18,
        TextXAlignment = Enum.TextXAlignment.Center
    })
    local gradient = createInstance("UIGradient", {
        Color = ColorSequence.new(Color3.fromRGB(205, 180, 255), ACCENT_PURPLE),
        Rotation = 90
    }, logoText)
    return logoFrameInstance, gradient
end
local keySystemGui = Instance.new("ScreenGui")
keySystemGui.Name = "VanishKeySystem"
keySystemGui.ResetOnSpawn = false
keySystemGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
keySystemGui.IgnoreGuiInset = true
pcall(function()
    if syn and syn.protect_gui then
        syn.protect_gui(keySystemGui)
    end
end)
local guiParentedSuccessfully = pcall(function()
    keySystemGui.Parent = (gethui and gethui()) or CoreGui
end)
if not guiParentedSuccessfully or not keySystemGui.Parent then
    keySystemGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end
local backgroundOverlay = createInstance("Frame", {
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.new(0, 0, 0),
    BackgroundTransparency = 1,
    BorderSizePixel = 0
}, keySystemGui)
local mainWindow = createInstance("CanvasGroup", {
    Name = "Main",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.55),
    Size = UDim2.fromOffset(602, 416),
    BackgroundTransparency = 1,
    GroupTransparency = 1,
    BorderSizePixel = 0,
    Active = true,
    Draggable = true
}, keySystemGui)
local uiScale = createInstance("UIScale", {}, mainWindow)
local function updateUiScale()
    local camera = workspace.CurrentCamera
    if not camera then
        return
    end
    local viewportSize = camera.ViewportSize
    uiScale.Scale = math.min(1, (viewportSize.X - 24) / 602, (viewportSize.Y - 24) / 416)
end
updateUiScale()
pcall(function()
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateUiScale)
end)
local function createPanel(position, size)
    local panel = createInstance("Frame", {
        Position = position,
        Size = size,
        BackgroundColor3 = BACKGROUND_DARK,
        BorderSizePixel = 0,
        ClipsDescendants = true
    }, mainWindow)
    addCorner(panel, 8)
    addStroke(panel, BORDER_PURPLE, 1.5, 0)
    return panel
end
local function createCloseButton(parent)
    local closeButton = createInstance("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Size = UDim2.fromOffset(20, 20),
        BackgroundTransparency = 1,
        Text = "",
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        TextColor3 = MUTED_TEXT_COLOR,
        AutoButtonColor = false
    }, parent)
    addCorner(closeButton, 10)
    addStroke(closeButton, MUTED_TEXT_COLOR, 1.2, 0.2)
    for rotationIndex, rotation in ipairs({
        45,
        -45
    }) do
        createInstance("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(9, 1.5),
            Rotation = rotation,
            BackgroundColor3 = MUTED_TEXT_COLOR,
            BorderSizePixel = 0
        }, closeButton)
    end
    return closeButton
end
local userInfoPanel = createPanel(UDim2.fromOffset(1, 1), UDim2.fromOffset(180, 360))
createTextLabel(userInfoPanel, {
    Position = UDim2.fromOffset(12, 14),
    Size = UDim2.fromOffset(16, 22),
    Text = "👤",
    TextColor3 = LIGHT_PURPLE,
    TextSize = 14
})
createTextLabel(userInfoPanel, {
    Position = UDim2.fromOffset(32, 14),
    Size = UDim2.fromOffset(120, 22),
    Text = "User Info",
    TextSize = 15
})
local userInfoCloseButton = createCloseButton(userInfoPanel)
userInfoCloseButton.Position = UDim2.new(1, -14, 0, 25)
createDivider(userInfoPanel, 50)
local avatarFrame = createInstance("Frame", {
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 82),
    Size = UDim2.fromOffset(62, 62),
    BackgroundColor3 = Color3.fromRGB(70, 55, 140)
}, userInfoPanel)
addCorner(avatarFrame, 6)
addStroke(avatarFrame, ACCENT_PURPLE, 2, 0)
local avatarImage = createInstance("ImageLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Image = ""
}, avatarFrame)
addCorner(avatarImage, 6)
task.spawn(function()
    local thumbnailLoaded, thumbnailUrl = pcall(function()
        return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    end)
    if thumbnailLoaded then
        avatarImage.Image = thumbnailUrl
    end
end)
createTextLabel(userInfoPanel, {
    Position = UDim2.fromOffset(6, 150),
    Size = UDim2.new(1, -12, 0, 18),
    Text = "Welcome, " .. LocalPlayer.Name,
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextTruncate = Enum.TextTruncate.AtEnd
})
createDivider(userInfoPanel, 172, 2)
local executorName = "Unknown"
pcall(function()
    if identifyexecutor then
        executorName = (identifyexecutor())
    end
end)
local deviceType = (UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled) and "Mobile" or "PC"
local function createInfoRow(yPosition, rowTitle, rowValue, valueColor)
    createTextLabel(userInfoPanel, {
        Position = UDim2.fromOffset(9, yPosition),
        Size = UDim2.fromOffset(150, 12),
        Text = rowTitle,
        TextSize = 9,
        TextColor3 = MUTED_TEXT_COLOR
    })
    return createTextLabel(userInfoPanel, {
        Position = UDim2.fromOffset(9, yPosition + 13),
        Size = UDim2.new(1, -18, 0, 14),
        Text = rowValue,
        TextSize = 11,
        TextColor3 = valueColor or LIGHT_PURPLE,
        TextTruncate = Enum.TextTruncate.AtEnd
    })
end
local hardwareId = "unknown"
pcall(function()
    hardwareId = (gethwid and gethwid()) or game:GetService("RbxAnalyticsService"):GetClientId()
end)
hardwareId = tostring(hardwareId)
createInfoRow(180, "Executor", tostring(executorName))
createInfoRow(212, "Device", deviceType)
local hardwareIdLabel = createInfoRow(244, "HWID", hardwareId)
hardwareIdLabel.Size = UDim2.new(1, -38, 0, 14)
hardwareIdLabel.TextSize = 10
local copyHardwareIdButton = createInstance("TextButton", {
    Position = UDim2.new(1, -26, 0, 254),
    Size = UDim2.fromOffset(18, 18),
    BackgroundTransparency = 1,
    Text = "📋",
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = MUTED_TEXT_COLOR
}, userInfoPanel)
local ipAddressLabel = createInfoRow(276, "IP", "Loading...")
task.spawn(function()
    local ipRequestSucceeded, fetchedIpAddress = pcall(function()
        return game:HttpGet("https://api.ipify.org")
    end)
    ipAddressLabel.Text = (ipRequestSucceeded and fetchedIpAddress and fetchedIpAddress:match("^[%d%.:a-fA-F]+$")) and fetchedIpAddress or "Unavailable"
end)
createDivider(userInfoPanel, 308, 2)
local clockLabel = createTextLabel(userInfoPanel, {
    Position = UDim2.fromOffset(0, 314),
    Size = UDim2.new(1, 0, 0, 22),
    Text = "",
    TextSize = 15,
    TextColor3 = LIGHT_PURPLE,
    TextXAlignment = Enum.TextXAlignment.Center
})
local dateLabel = createTextLabel(userInfoPanel, {
    Position = UDim2.fromOffset(0, 337),
    Size = UDim2.new(1, 0, 0, 14),
    Text = "",
    TextSize = 10,
    TextColor3 = Color3.fromRGB(200, 200, 215),
    TextXAlignment = Enum.TextXAlignment.Center
})
local function updateClock()
    clockLabel.Text = "⏱  " .. os.date("%I:%M:%S %p"):gsub("^0", "")
    dateLabel.Text = os.date("%b %d, %Y")
end
updateClock()
local keyPanel = createPanel(UDim2.fromOffset(193, 1), UDim2.fromOffset(400, 414))
local logoFrame, logoGradient = createLogo(keyPanel, UDim2.fromOffset(16, 13), UDim2.fromOffset(26, 26), 17)
local titleLabel = createTextLabel(keyPanel, {
    Position = UDim2.fromOffset(52, 10),
    Size = UDim2.fromOffset(250, 32),
    Text = "Vanish",
    TextSize = 24
})
local keyPanelCloseButton = createCloseButton(keyPanel)
keyPanelCloseButton.Position = UDim2.new(1, -16, 0, 26)
createDivider(keyPanel, 51)
local keyPromptFrame = createInstance("Frame", {
    Position = UDim2.fromOffset(11, 60),
    Size = UDim2.new(1, -22, 0, 60),
    BackgroundColor3 = BACKGROUND_PANEL
}, keyPanel)
addCorner(keyPromptFrame, 6)
addStroke(keyPromptFrame, BORDER_COLOR, 1, 0)
createTextLabel(keyPromptFrame, {
    Position = UDim2.fromOffset(16, 0),
    Size = UDim2.fromOffset(24, 60),
    Text = "🔒",
    TextSize = 18,
    TextColor3 = LIGHT_PURPLE
})
createTextLabel(keyPromptFrame, {
    Position = UDim2.fromOffset(52, 0),
    Size = UDim2.new(1, -60, 1, 0),
    Text = "Enter your key to continue",
    TextSize = 16,
    TextColor3 = LIGHT_PURPLE,
    Font = Enum.Font.GothamMedium
})
local keyTextBox = createInstance("TextBox", {
    Position = UDim2.fromOffset(11, 130),
    Size = UDim2.new(1, -22, 0, 56),
    BackgroundColor3 = BACKGROUND_INPUT,
    ClearTextOnFocus = false,
    Font = Enum.Font.GothamMedium,
    PlaceholderText = "Enter your key...",
    PlaceholderColor3 = MUTED_TEXT_COLOR,
    Text = "",
    TextSize = 16,
    TextColor3 = TEXT_COLOR,
    TextXAlignment = Enum.TextXAlignment.Left
}, keyPanel)
addCorner(keyTextBox, 6)
local keyTextBoxDefaultStrokeColor = BORDER_COLOR
local keyTextBoxStroke = addStroke(keyTextBox, keyTextBoxDefaultStrokeColor, 1.2)
createInstance("UIPadding", {
    PaddingLeft = UDim.new(0, 12),
    PaddingRight = UDim.new(0, 12)
}, keyTextBox)
keyTextBox.Focused:Connect(function()
    tween(keyTextBoxStroke, 0.2, {
        Color = ACCENT_PURPLE
    })
end)
keyTextBox.FocusLost:Connect(function()
    tween(keyTextBoxStroke, 0.2, {
        Color = keyTextBoxDefaultStrokeColor
    })
end)
createDivider(keyPanel, 198, 3)
local function createActionButton(buttonText, iconText, buttonColor, yPosition)
    local actionButton = createInstance("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, yPosition),
        Size = UDim2.fromOffset(300, 42),
        BackgroundColor3 = buttonColor,
        Font = Enum.Font.GothamBold,
        Text = iconText .. "   " .. buttonText,
        TextSize = 14,
        TextColor3 = Color3.new(1, 1, 1),
        AutoButtonColor = false
    }, keyPanel)
    addCorner(actionButton, 4)
    local baseButtonColor = buttonColor
    actionButton.MouseEnter:Connect(function()
        tween(actionButton, 0.15, {
            BackgroundColor3 = baseButtonColor:Lerp(Color3.new(1, 1, 1), 0.12)
        })
    end)
    actionButton.MouseLeave:Connect(function()
        tween(actionButton, 0.15, {
            BackgroundColor3 = baseButtonColor
        })
    end)
    actionButton.MouseButton1Down:Connect(function()
        tween(actionButton, 0.08, {
            Size = UDim2.fromOffset(294, 39)
        })
    end)
    actionButton.MouseButton1Up:Connect(function()
        tween(actionButton, 0.15, {
            Size = UDim2.fromOffset(300, 42)
        })
    end)
    return actionButton
end
local getKeyButton = createActionButton("Get Key", "🔑", BACKGROUND_PANEL, 212)
local redeemKeyButton = createActionButton("Redeem Key", "🛡️", ACCENT_PURPLE, 259)
local discordLinkLabel = createTextLabel(keyPanel, {
    Position = UDim2.fromOffset(16, 305),
    Size = UDim2.new(1, -32, 0, 16),
    Text = "discord.gg/" .. DISCORD_INVITE_CODE,
    TextSize = 11,
    TextColor3 = MUTED_TEXT_COLOR,
    Font = Enum.Font.GothamMedium,
    TextXAlignment = Enum.TextXAlignment.Center
})
local function createSmallButton(buttonText, horizontalOffset, textColor)
    return createInstance("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, horizontalOffset, 0, 324),
        Size = UDim2.fromOffset(24, 22),
        BackgroundTransparency = 1,
        Text = buttonText,
        Font = Enum.Font.GothamBold,
        TextSize = 15,
        TextColor3 = textColor
    }, keyPanel)
end
local copyDiscordLinkButton = createSmallButton("📋", -22, MUTED_TEXT_COLOR)
local openDiscordButton = createSmallButton("💬", 22, ACCENT_BLUE)
createDivider(keyPanel, 356)
local footerFrame = createInstance("Frame", {
    Position = UDim2.fromOffset(0, 357),
    Size = UDim2.new(1, 0, 0, 57),
    BackgroundTransparency = 1
}, keyPanel)
createLogo(footerFrame, UDim2.fromOffset(14, 11), UDim2.fromOffset(34, 34), 20)
createTextLabel(footerFrame, {
    Position = UDim2.fromOffset(58, 11),
    Size = UDim2.fromOffset(200, 16),
    Text = "Vanish Hub",
    TextSize = 13
})
createTextLabel(footerFrame, {
    Position = UDim2.fromOffset(58, 30),
    Size = UDim2.fromOffset(220, 14),
    Text = "Free key • Join the Discord",
    TextSize = 10,
    TextColor3 = MUTED_TEXT_COLOR,
    Font = Enum.Font.GothamMedium
})
local joinDiscordButton = createInstance("TextButton", {
    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -14, 0.5, 0),
    Size = UDim2.fromOffset(62, 30),
    BackgroundColor3 = ACCENT_PURPLE,
    Text = "Join",
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    TextColor3 = Color3.new(1, 1, 1),
    AutoButtonColor = false
}, footerFrame)
addCorner(joinDiscordButton, 4)
local notificationGui = createInstance("ScreenGui", {
    Name = "VanishNotify",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    DisplayOrder = 100
}, keySystemGui.Parent)
local notificationContainer = createInstance("Frame", {
    AnchorPoint = Vector2.new(1, 1),
    Position = UDim2.new(1, -16, 1, -16),
    Size = UDim2.fromOffset(372, 600),
    BackgroundTransparency = 1
}, notificationGui)
createInstance("UIListLayout", {
    VerticalAlignment = Enum.VerticalAlignment.Bottom,
    HorizontalAlignment = Enum.HorizontalAlignment.Right,
    SortOrder = Enum.SortOrder.LayoutOrder,
    Padding = UDim.new(0, 8)
}, notificationContainer)
createInstance("UIScale", {
    Scale = uiScale.Scale
}, notificationContainer)
local notificationTypes = {
    success = {
        icon = "✅",
        color = SUCCESS_GREEN
    },
    error = {
        icon = "❌",
        color = ERROR_RED
    },
    info = {
        icon = "ℹ️",
        color = ACCENT_PURPLE
    },
    discord = {
        icon = "💬",
        color = ACCENT_BLUE
    }
}
local notificationLayoutOrder = 0
local function showNotification(notificationTitle, notificationMessage, notificationType, displayDuration)
    local notificationStyle = notificationTypes[notificationType] or notificationTypes.info
    displayDuration = displayDuration or 3.5
    notificationLayoutOrder = notificationLayoutOrder - 1
    local notificationEntry = createInstance("Frame", {
        Size = UDim2.fromOffset(372, 0),
        BackgroundTransparency = 1,
        LayoutOrder = notificationLayoutOrder,
        ClipsDescendants = false
    }, notificationContainer)
    local notificationCard = createInstance("CanvasGroup", {
        Position = UDim2.fromOffset(400, 0),
        Size = UDim2.fromOffset(372, 76),
        BackgroundColor3 = BACKGROUND_DARK,
        GroupTransparency = 1,
        BorderSizePixel = 0
    }, notificationEntry)
    addCorner(notificationCard, 6)
    addStroke(notificationCard, BORDER_PURPLE, 1.2, 0)
    local notificationIconFrame = createInstance("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 16, 0.5, -2),
        Size = UDim2.fromOffset(46, 46),
        BackgroundColor3 = notificationStyle.color,
        BackgroundTransparency = 0.85
    }, notificationCard)
    addCorner(notificationIconFrame, 23)
    addStroke(notificationIconFrame, notificationStyle.color, 2, 0)
    createTextLabel(notificationIconFrame, {
        Size = UDim2.fromScale(1, 1),
        Text = notificationStyle.icon,
        TextSize = 20,
        TextXAlignment = Enum.TextXAlignment.Center
    })
    createTextLabel(notificationCard, {
        Position = UDim2.fromOffset(78, 14),
        Size = UDim2.new(1, -92, 0, 20),
        Text = notificationTitle,
        TextSize = 15
    })
    createTextLabel(notificationCard, {
        Position = UDim2.fromOffset(78, 36),
        Size = UDim2.new(1, -92, 0, 26),
        Text = notificationMessage,
        TextSize = 12,
        TextColor3 = MUTED_TEXT_COLOR,
        TextWrapped = true,
        TextYAlignment = Enum.TextYAlignment.Top
    })
    local progressTrack = createInstance("Frame", {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(1, 0, 0, 3),
        BackgroundColor3 = BORDER_COLOR,
        BorderSizePixel = 0
    }, notificationCard)
    local progressBar = createInstance("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = ACCENT_PURPLE,
        BorderSizePixel = 0
    }, progressTrack)
    tween(notificationEntry, 0.25, {
        Size = UDim2.fromOffset(372, 76)
    })
    tween(notificationCard, 0.4, {
        Position = UDim2.fromOffset(0, 0),
        GroupTransparency = 0
    })
    TweenService:Create(progressBar, TweenInfo.new(displayDuration, Enum.EasingStyle.Linear), {
        Size = UDim2.fromScale(0, 1)
    }):Play()
    task.delay(displayDuration, function()
        tween(notificationCard, 0.35, {
            Position = UDim2.fromOffset(400, 0),
            GroupTransparency = 1
        }).Completed:Wait()
        tween(notificationEntry, 0.2, {
            Size = UDim2.fromOffset(372, 0)
        }).Completed:Wait()
        notificationEntry:Destroy()
    end)
end
local function setStatusText(statusMessage, statusColor)
    discordLinkLabel.Text = statusMessage
    discordLinkLabel.TextColor3 = statusColor
    discordLinkLabel.TextTransparency = 1
    tween(discordLinkLabel, 0.25, {
        TextTransparency = 0
    })
end
local function shakeMainWindow()
    local originalPosition = mainWindow.Position
    for shakeStep = 1, 6 do
        mainWindow.Position = originalPosition + UDim2.fromOffset((shakeStep % 2 == 0) and 6 or-6, 0)
        task.wait(0.03)
    end
    mainWindow.Position = originalPosition
end
local function closeKeySystem(onClosed)
    tween(backgroundOverlay, 0.3, {
        BackgroundTransparency = 1
    })
    tween(mainWindow, 0.35, {
        Position = UDim2.fromScale(0.5, 0.45),
        GroupTransparency = 1
    }).Completed:Wait()
    keySystemGui:Destroy()
    if onClosed then
        onClosed()
    end
end
copyHardwareIdButton.MouseButton1Click:Connect(function()
    if setclipboard then
        pcall(setclipboard, tostring(hardwareId))
        setStatusText("HWID copied to clipboard!", ACCENT_BLUE)
        showNotification("Copied", "Your HWID was copied to clipboard.", "success")
    end
end)
copyDiscordLinkButton.MouseButton1Click:Connect(function()
    if setclipboard then
        pcall(setclipboard, DISCORD_INVITE_URL)
        setStatusText("Invite link copied to clipboard!", ACCENT_BLUE)
        showNotification("Copied", "Discord invite copied to clipboard.", "success")
    end
end)
userInfoCloseButton.MouseButton1Click:Connect(function()
    userInfoPanel.Visible = false
    keyPanel.Position = UDim2.fromOffset(101, 1)
end)
local function openDiscord()
    local httpRequest = (syn and syn.request)
    or (http and http.request) or http_request or request or (fluxus and fluxus.request)
    local discordRequestSucceeded = false
    if httpRequest then
        discordRequestSucceeded = pcall(function()
            httpRequest({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    nonce = HttpService:GenerateGUID(false),
                    args = {
                        code = DISCORD_INVITE_CODE
                    }
                })
            })
        end)
    end
    if setclipboard then
        pcall(setclipboard, DISCORD_INVITE_URL)
    end
    if discordRequestSucceeded then
        setStatusText("Opening Discord... (link also copied)", ACCENT_BLUE)
        showNotification("Discord", "Opening the Vanish server... link copied too.", "discord")
    elseif setclipboard then
        setStatusText("Invite link copied to clipboard!", ACCENT_BLUE)
        showNotification("Discord", "Invite link copied — paste it in your browser.", "discord")
    else
        setStatusText(DISCORD_INVITE_URL, ACCENT_BLUE)
    end
end
local SCRIPT_DOWNLOAD_URL_TEMPLATE = ""
local SUPPORTED_PLACE_IDS = {
    [3351674303] = "527d32d0445fbd834480d1db8051b64a9e7f9af993b5139a5658f9931e5e7c57"
}
local SUPPORTED_GAME_IDS = {
    [66654135] = "8aa4ecf11ff75820cd23b1c72e93ca0d5d10dabbda58c711e26bbed8b8c5b4fa",
    [4049246711] = "0af7a426cb44769b1784cf7cbd7d3c685f467c9108de6d0dfa3a4a24dc180ca6",
    [6035872082] = "fd5b5d8e1c7d47788bce3437365bf909204e398a6a863a7f4bc9dbec5c29d423",
    [10765288803] = "74382b9df345339e2ac5f877eef1c08a3beb8d70a04b038ea131a46d1a2dc27f",
    [7633926880] = "8e5e1e0183aef6e9b864fd5c2bbf4b2d7eafda043fcfb194417a5624e0565cc9"
}
local function loadGamePayload()
    local scriptAssetId = SUPPORTED_PLACE_IDS[game.PlaceId] or SUPPORTED_GAME_IDS[game.GameId]
    if not scriptAssetId then
        warn("[Vanish] This game is not supported.")
        return
    end
    local payloadLoadSucceeded, payloadLoadError = pcall(function()
        loadstring(game:HttpGet(SCRIPT_DOWNLOAD_URL_TEMPLATE:format(scriptAssetId)))()
    end)
    if not payloadLoadSucceeded then
        warn("[Vanish] Failed to load script: " .. tostring(payloadLoadError))
    end
end
if not (SUPPORTED_PLACE_IDS[game.PlaceId] or SUPPORTED_GAME_IDS[game.GameId]) then
    keySystemGui:Destroy()
    showNotification("Unsupported", "Vanish doesn't support this game yet.", "error", 5)
    warn("[Vanish] This game is not supported.")
    return
end
local savedKey = type(_G.key) == "string" and _G.key:gsub("^%s+", ""):gsub("%s+$", "") or nil
if savedKey == VALID_KEY then
    keySystemGui:Destroy()
    loadGamePayload()
    return
end
local isVerifyingKey = false
local function verifyKey()
    if isVerifyingKey then
        return
    end
    local submittedKey = keyTextBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
    if submittedKey == "" then
        setStatusText("Please enter a key.", ERROR_RED)
        showNotification("No key", "Please enter a key first.", "error")
        task.spawn(shakeMainWindow)
        return
    end
    isVerifyingKey = true
    setStatusText("Verifying...", MUTED_TEXT_COLOR)
    task.wait(0.6)
    if submittedKey == VALID_KEY then
        setStatusText("✓ Key valid! Loading Vanish...", SUCCESS_GREEN)
        showNotification("Key accepted", "Loading Vanish...", "success")
        tween(keyTextBoxStroke, 0.2, {
            Color = SUCCESS_GREEN
        })
        task.wait(0.8)
        closeKeySystem(loadGamePayload)
    else
        setStatusText("✕ Invalid key. Join the Discord to get it.", ERROR_RED)
        showNotification("Invalid key", "Join the Discord to get a valid key.", "error")
        tween(keyTextBoxStroke, 0.2, {
            Color = ERROR_RED
        })
        task.spawn(shakeMainWindow)
        isVerifyingKey = false
    end
end
redeemKeyButton.MouseButton1Click:Connect(verifyKey)
keyTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        verifyKey()
    end
end)
getKeyButton.MouseButton1Click:Connect(openDiscord)
openDiscordButton.MouseButton1Click:Connect(openDiscord)
joinDiscordButton.MouseButton1Click:Connect(openDiscord)
keyPanelCloseButton.MouseEnter:Connect(function()
    tween(keyPanelCloseButton, 0.15, {
        TextColor3 = ERROR_RED
    })
end)
keyPanelCloseButton.MouseLeave:Connect(function()
    tween(keyPanelCloseButton, 0.15, {
        TextColor3 = MUTED_TEXT_COLOR
    })
end)
keyPanelCloseButton.MouseButton1Click:Connect(function()
    showNotification("Goodbye", "See you next time!", "error")
    closeKeySystem()
end)
showNotification("Welcome", "Hey " .. LocalPlayer.DisplayName .. ", enter your key to continue.", "info")
tween(backgroundOverlay, 0.4, {
    BackgroundTransparency = 0.45
})
tween(mainWindow, 0.5, {
    Position = UDim2.fromScale(0.5, 0.5),
    GroupTransparency = 0
}, Enum.EasingStyle.Back)
if savedKey and savedKey ~= "" then
    keyTextBox.Text = savedKey
    task.delay(0.5, verifyKey)
end
task.spawn(function()
    while keySystemGui.Parent do
        logoGradient.Rotation = (logoGradient.Rotation + 2) % 360
        updateClock()
        task.wait(0.05)
    end
end)
