--!strict
--[[
    SapphireLib - Biblioteca UI Avançada para Lua/Luau
    Versão: 1.0.0
    
    Funcionalidades:
    - Interface moderna com bordas coloridas dinâmicas
    - Sistema de IA (Sapphire AI)
    - Reprodutor de mídia completo
    - Sistema de chaves de acesso
    - Ícones Lucide integrados
    - Loading screen animado
    - Sistema de save settings
    - Sistema de temas
    - Sistema de tradução
    - Discord/Site invites
    - Auto-load
    - Suporte a executores
    - Sistema de developers
    - Emojis animados
]]

local SapphireLib = {}

-- Serviços do Roblox
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local SoundService = game:GetService("SoundService")

-- ========================================
-- MÓDULO: THEMES
-- ========================================
local Themes = {}

-- Paleta de cores principal
Themes.colors = {
    -- Cores de fundo
    background = Color3.fromRGB(20, 20, 30),
    cardBackground = Color3.fromRGB(30, 30, 40),
    sidebarBackground = Color3.fromRGB(25, 25, 35),
    buttonBackground = Color3.fromRGB(40, 40, 50),
    searchBackground = Color3.fromRGB(35, 35, 45),
    
    -- Cores de texto
    textPrimary = Color3.fromRGB(255, 255, 255),
    textSecondary = Color3.fromRGB(180, 180, 180),
    
    -- Cores de destaque
    searchBorder = Color3.fromRGB(255, 80, 100),
    
    -- Cores de ícones
    iconRed = Color3.fromRGB(255, 80, 100),
    iconBlue = Color3.fromRGB(80, 150, 255),
    iconOrange = Color3.fromRGB(255, 150, 80),
    iconPurple = Color3.fromRGB(150, 80, 255),
    iconGray = Color3.fromRGB(120, 120, 120),
    
    -- Cores de toggle
    toggleOn = Color3.fromRGB(80, 200, 120),
    toggleOff = Color3.fromRGB(60, 60, 70)
}

-- Gradientes
Themes.gradients = {
    rainbow = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 165, 0)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 130, 238))
    }
}

-- Temas disponíveis
Themes.availableThemes = {
    default_colorful = {
        name = "Default Colorido",
        colors = Themes.colors
    },
    blue = {
        name = "Blue",
        colors = {
            background = Color3.fromRGB(15, 25, 40),
            cardBackground = Color3.fromRGB(25, 35, 50),
            sidebarBackground = Color3.fromRGB(20, 30, 45),
            buttonBackground = Color3.fromRGB(35, 45, 60),
            searchBackground = Color3.fromRGB(30, 40, 55),
            textPrimary = Color3.fromRGB(255, 255, 255),
            textSecondary = Color3.fromRGB(180, 190, 200),
            searchBorder = Color3.fromRGB(70, 130, 255),
            iconRed = Color3.fromRGB(70, 130, 255),
            iconBlue = Color3.fromRGB(70, 130, 255),
            iconOrange = Color3.fromRGB(70, 130, 255),
            iconPurple = Color3.fromRGB(70, 130, 255),
            iconGray = Color3.fromRGB(120, 140, 160),
            toggleOn = Color3.fromRGB(70, 130, 255),
            toggleOff = Color3.fromRGB(60, 70, 80)
        }
    },
    red = {
        name = "Red",
        colors = {
            background = Color3.fromRGB(40, 15, 15),
            cardBackground = Color3.fromRGB(50, 25, 25),
            sidebarBackground = Color3.fromRGB(45, 20, 20),
            buttonBackground = Color3.fromRGB(60, 35, 35),
            searchBackground = Color3.fromRGB(55, 30, 30),
            textPrimary = Color3.fromRGB(255, 255, 255),
            textSecondary = Color3.fromRGB(200, 180, 180),
            searchBorder = Color3.fromRGB(255, 70, 70),
            iconRed = Color3.fromRGB(255, 70, 70),
            iconBlue = Color3.fromRGB(255, 70, 70),
            iconOrange = Color3.fromRGB(255, 70, 70),
            iconPurple = Color3.fromRGB(255, 70, 70),
            iconGray = Color3.fromRGB(160, 120, 120),
            toggleOn = Color3.fromRGB(255, 70, 70),
            toggleOff = Color3.fromRGB(80, 60, 60)
        }
    },
    amethyst = {
        name = "Amethyst",
        colors = {
            background = Color3.fromRGB(30, 15, 40),
            cardBackground = Color3.fromRGB(40, 25, 50),
            sidebarBackground = Color3.fromRGB(35, 20, 45),
            buttonBackground = Color3.fromRGB(50, 35, 60),
            searchBackground = Color3.fromRGB(45, 30, 55),
            textPrimary = Color3.fromRGB(255, 255, 255),
            textSecondary = Color3.fromRGB(190, 180, 200),
            searchBorder = Color3.fromRGB(150, 70, 255),
            iconRed = Color3.fromRGB(150, 70, 255),
            iconBlue = Color3.fromRGB(150, 70, 255),
            iconOrange = Color3.fromRGB(150, 70, 255),
            iconPurple = Color3.fromRGB(150, 70, 255),
            iconGray = Color3.fromRGB(140, 120, 160),
            toggleOn = Color3.fromRGB(150, 70, 255),
            toggleOff = Color3.fromRGB(70, 60, 80)
        }
    },
    rose = {
        name = "Rose",
        colors = {
            background = Color3.fromRGB(40, 20, 30),
            cardBackground = Color3.fromRGB(50, 30, 40),
            sidebarBackground = Color3.fromRGB(45, 25, 35),
            buttonBackground = Color3.fromRGB(60, 40, 50),
            searchBackground = Color3.fromRGB(55, 35, 45),
            textPrimary = Color3.fromRGB(255, 255, 255),
            textSecondary = Color3.fromRGB(200, 180, 190),
            searchBorder = Color3.fromRGB(255, 100, 150),
            iconRed = Color3.fromRGB(255, 100, 150),
            iconBlue = Color3.fromRGB(255, 100, 150),
            iconOrange = Color3.fromRGB(255, 100, 150),
            iconPurple = Color3.fromRGB(255, 100, 150),
            iconGray = Color3.fromRGB(160, 130, 140),
            toggleOn = Color3.fromRGB(255, 100, 150),
            toggleOff = Color3.fromRGB(80, 65, 70)
        }
    },
    green = {
        name = "Green",
        colors = {
            background = Color3.fromRGB(15, 40, 20),
            cardBackground = Color3.fromRGB(25, 50, 30),
            sidebarBackground = Color3.fromRGB(20, 45, 25),
            buttonBackground = Color3.fromRGB(35, 60, 40),
            searchBackground = Color3.fromRGB(30, 55, 35),
            textPrimary = Color3.fromRGB(255, 255, 255),
            textSecondary = Color3.fromRGB(180, 200, 180),
            searchBorder = Color3.fromRGB(70, 255, 100),
            iconRed = Color3.fromRGB(70, 255, 100),
            iconBlue = Color3.fromRGB(70, 255, 100),
            iconOrange = Color3.fromRGB(70, 255, 100),
            iconPurple = Color3.fromRGB(70, 255, 100),
            iconGray = Color3.fromRGB(120, 160, 130),
            toggleOn = Color3.fromRGB(70, 255, 100),
            toggleOff = Color3.fromRGB(60, 80, 65)
        }
    }
}

-- Função para aplicar tema
function Themes.applyTheme(themeName)
    local theme = Themes.availableThemes[themeName]
    if theme then
        Themes.colors = theme.colors
        return true
    end
    return false
end

-- Função para converter HSV para RGB
function Themes.hsvToRgb(h, s, v)
    local r, g, b
    local i = math.floor(h * 6)
    local f = h * 6 - i
    local p = v * (1 - s)
    local q = v * (1 - f * s)
    local t = v * (1 - (1 - f) * s)
    
    local imod = i % 6
    if imod == 0 then
        r, g, b = v, t, p
    elseif imod == 1 then
        r, g, b = q, v, p
    elseif imod == 2 then
        r, g, b = p, v, t
    elseif imod == 3 then
        r, g, b = p, q, v
    elseif imod == 4 then
        r, g, b = t, p, v
    elseif imod == 5 then
        r, g, b = v, p, q
    end
    
    return Color3.new(r, g, b)
end

-- ========================================
-- MÓDULO: UTILS
-- ========================================
local Utils = {}

-- Função para formatar tempo em MM:SS
function Utils.formatTime(seconds)
    local minutes = math.floor(seconds / 60)
    local secs = seconds % 60
    return string.format("%d:%02d", minutes, secs)
end

-- Função para validar entrada
function Utils.validateInput(input, inputType)
    if inputType == "string" then
        return type(input) == "string" and input ~= ""
    elseif inputType == "number" then
        return type(input) == "number"
    elseif inputType == "boolean" then
        return type(input) == "boolean"
    end
    return false
end

-- Função para interpolar cores
function Utils.lerpColor(color1, color2, alpha)
    return Color3.new(
        color1.R + (color2.R - color1.R) * alpha,
        color1.G + (color2.G - color1.G) * alpha,
        color1.B + (color2.B - color1.B) * alpha
    )
end

-- Função para clonar tabela profundamente
function Utils.deepCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        if type(value) == "table" then
            copy[key] = Utils.deepCopy(value)
        else
            copy[key] = value
        end
    end
    return copy
end

-- Função para tornar um UI element arrastável
function Utils.makeDraggable(uiElement, dragHandle)
    local dragging = false
    local dragStart = nil
    local startPos = nil

    dragHandle = dragHandle or uiElement -- Se nenhum handle for fornecido, o próprio elemento é o handle

    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = uiElement.Position

            -- Para garantir que o elemento fique no topo enquanto arrasta
            uiElement.ZIndex = 10
        end
    end)

    dragHandle.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            uiElement.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    dragHandle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            uiElement.ZIndex = 1 -- Retorna ao ZIndex padrão após arrastar
        end
    end)
end

-- ========================================
-- MÓDULO: ANIMATIONS
-- ========================================
local Animations = {}

-- Função para animar gradiente de borda (rotação contínua)
function Animations.animateRainbowBorder(gradientObject)
    local connection
    local rotation = 0
    
    connection = RunService.Heartbeat:Connect(function(deltaTime)
        rotation = rotation + (deltaTime * 60) -- 60 graus por segundo
        if rotation >= 360 then
            rotation = rotation - 360
        end
        gradientObject.Rotation = rotation
    end)
    
    return connection
end

-- Função para animar múltiplas bordas rainbow
function Animations.animateMultipleRainbowBorders(gradientObjects)
    local connections = {}
    
    for i, gradientObject in ipairs(gradientObjects) do
        local connection
        local rotation = (i - 1) * 45 -- Offset inicial para cada borda
        
        connection = RunService.Heartbeat:Connect(function(deltaTime)
            rotation = rotation + (deltaTime * 60)
            if rotation >= 360 then
                rotation = rotation - 360
            end
            gradientObject.Rotation = rotation
        end)
        
        table.insert(connections, connection)
    end
    
    return connections
end

-- Função para parar animação de borda
function Animations.stopBorderAnimation(connection)
    if connection then
        connection:Disconnect()
    end
end

-- Função para animar transparência
function Animations.animateTransparency(object, targetTransparency, duration)
    local tweenInfo = TweenInfo.new(
        duration or 0.3,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(object, tweenInfo, {
        BackgroundTransparency = targetTransparency
    })
    
    tween:Play()
    return tween
end

-- ========================================
-- MÓDULO: SEARCH DATA
-- ========================================
local SearchData = {}

-- Dados mock para pesquisa
SearchData.items = {
    {
        name = "Main",
        category = "Navigation",
        description = "Página principal do SapphireLib",
        keywords = {"main", "principal", "home", "início"}
    },
    {
        name = "V4",
        category = "Navigation", 
        description = "Versão 4 do sistema",
        keywords = {"v4", "versão", "version", "sistema"}
    },
    {
        name = "Sea Events",
        category = "Navigation",
        description = "Eventos do mar e oceano",
        keywords = {"sea", "events", "mar", "oceano", "eventos"}
    },
    {
        name = "PvP",
        category = "Navigation",
        description = "Player vs Player combat",
        keywords = {"pvp", "player", "combat", "luta", "batalha"}
    },
    {
        name = "Fruit",
        category = "Navigation",
        description = "Sistema de frutas",
        keywords = {"fruit", "fruta", "frutas", "sistema"}
    },
    {
        name = "Settings",
        category = "Navigation",
        description = "Configurações do sistema",
        keywords = {"settings", "configurações", "config", "opções"}
    },
    {
        name = "UI Color",
        category = "Customization",
        description = "Seletor de cores da interface",
        keywords = {"color", "cor", "cores", "ui", "interface", "customização"}
    },
    {
        name = "Transparency",
        category = "Customization",
        description = "Controle de transparência",
        keywords = {"transparency", "transparência", "opacidade", "alpha"}
    },
    {
        name = "Sapphire AI",
        category = "AI",
        description = "Sistema de inteligência artificial",
        keywords = {"ai", "ia", "sapphire", "inteligência", "artificial", "chatbot"}
    },
    {
        name = "Key System",
        category = "Security",
        description = "Sistema de chaves de acesso",
        keywords = {"key", "chave", "sistema", "acesso", "segurança", "login"}
    },
    {
        name = "Music Player",
        category = "Media",
        description = "Reprodutor de música",
        keywords = {"music", "música", "player", "reprodutor", "audio", "som"}
    },
    {
        name = "Video Player",
        category = "Media",
        description = "Reprodutor de vídeo",
        keywords = {"video", "vídeo", "player", "reprodutor", "youtube", "mp4"}
    }
}

-- Função para pesquisar itens
function SearchData.search(query)
    if not query or query == "" then
        return {}
    end
    
    local results = {}
    local lowerQuery = string.lower(query)
    
    for _, item in ipairs(SearchData.items) do
        local found = false
        
        -- Verificar nome
        if string.find(string.lower(item.name), lowerQuery) then
            found = true
        end
        
        -- Verificar descrição
        if not found and string.find(string.lower(item.description), lowerQuery) then
            found = true
        end
        
        -- Verificar categoria
        if not found and string.find(string.lower(item.category), lowerQuery) then
            found = true
        end
        
        -- Verificar palavras-chave
        if not found then
            for _, keyword in ipairs(item.keywords) do
                if string.find(string.lower(keyword), lowerQuery) then
                    found = true
                    break
                end
            end
        end
        
        if found then
            table.insert(results, item)
        end
    end
    
    return results
end

-- Função para obter sugestões baseadas em texto parcial
function SearchData.getSuggestions(partialQuery, maxSuggestions)
    if not partialQuery or partialQuery == "" then
        return {}
    end
    
    local suggestions = {}
    local lowerQuery = string.lower(partialQuery)
    maxSuggestions = maxSuggestions or 5
    
    for _, item in ipairs(SearchData.items) do
        if #suggestions >= maxSuggestions then
            break
        end
        
        -- Verificar se o nome começa com a query
        if string.sub(string.lower(item.name), 1, #lowerQuery) == lowerQuery then
            table.insert(suggestions, item.name)
        end
    end
    
    return suggestions
end

-- ========================================
-- MÓDULO: SAPPHIRE AI
-- ========================================
local SapphireAI = {}

-- Estado da IA
local AIState = {
    isInitialized = false,
    conversationHistory = {},
    currentSession = nil,
    isProcessing = false
}

-- Mensagem inicial da Sapphire AI
local INITIAL_MESSAGE = "Olá! Sou Sapphire AI e estou aqui para te ajudar!"

-- Função para inicializar a Sapphire AI
function SapphireAI.initialize()
    if AIState.isInitialized then
        return true
    end
    
    print("Inicializando Sapphire AI...")
    
    AIState.isInitialized = true
    AIState.currentSession = HttpService:GenerateGUID(false)
    
    -- Adicionar mensagem inicial ao histórico
    table.insert(AIState.conversationHistory, {
        role = "assistant",
        content = INITIAL_MESSAGE,
        timestamp = os.time()
    })
    
    print("Sapphire AI inicializada com sucesso!")
    return true
end

-- Função para enviar mensagem para a IA
function SapphireAI.sendMessage(userMessage)
    if not AIState.isInitialized then
        SapphireAI.initialize()
    end
    
    if AIState.isProcessing then
        return nil, "IA está processando outra mensagem. Aguarde..."
    end
    
    AIState.isProcessing = true
    
    -- Adicionar mensagem do usuário ao histórico
    table.insert(AIState.conversationHistory, {
        role = "user",
        content = userMessage,
        timestamp = os.time()
    })
    
    -- Simular processamento da IA
    local response = SapphireAI.processMessage(userMessage)
    
    -- Adicionar resposta da IA ao histórico
    table.insert(AIState.conversationHistory, {
        role = "assistant",
        content = response,
        timestamp = os.time()
    })
    
    AIState.isProcessing = false
    
    return response
end

-- Função para processar mensagem (simulação de IA)
function SapphireAI.processMessage(message)
    local lowerMessage = string.lower(message)
    
    -- Respostas baseadas em palavras-chave
    if string.find(lowerMessage, "olá") or string.find(lowerMessage, "oi") then
        return "Olá! Como posso ajudá-lo hoje?"
    elseif string.find(lowerMessage, "ajuda") or string.find(lowerMessage, "help") then
        return "Claro! Posso ajudar com informações sobre a SapphireLib, suas funcionalidades, ou responder perguntas gerais. O que você gostaria de saber?"
    elseif string.find(lowerMessage, "sapphirelib") or string.find(lowerMessage, "biblioteca") then
        return "A SapphireLib é uma biblioteca UI avançada para Lua/Luau com recursos como bordas coloridas dinâmicas, sistema de IA, reprodutor de mídia e muito mais!"
    elseif string.find(lowerMessage, "cor") or string.find(lowerMessage, "color") then
        return "Você pode personalizar as cores da interface usando o seletor de cores circular. Ele suporta toda a gama de cores RGB!"
    elseif string.find(lowerMessage, "música") or string.find(lowerMessage, "music") then
        return "A SapphireLib inclui um reprodutor de música completo com suporte para YouTube e arquivos MP3. Você pode pesquisar e reproduzir suas músicas favoritas!"
    elseif string.find(lowerMessage, "tchau") or string.find(lowerMessage, "bye") then
        return "Até logo! Foi um prazer ajudar. Volte sempre que precisar!"
    else
        return "Interessante! Posso ajudar com mais informações sobre a SapphireLib ou suas funcionalidades. O que mais você gostaria de saber?"
    end
end

-- Função para obter o histórico da conversa
function SapphireAI.getConversationHistory()
    return AIState.conversationHistory
end

-- Função para limpar o histórico
function SapphireAI.clearHistory()
    AIState.conversationHistory = {}
    -- Adicionar mensagem inicial novamente
    table.insert(AIState.conversationHistory, {
        role = "assistant",
        content = INITIAL_MESSAGE,
        timestamp = os.time()
    })
end

-- ========================================
-- MÓDULO: KEY SYSTEM
-- ========================================
local KeySystem = {}

-- Configurações do sistema de chaves
local KEY_CONFIG = {
    validKeys = {
        "SAPPHIRE_DEMO_2024",
        "PREMIUM_ACCESS_KEY",
        "DEVELOPER_BETA_KEY",
        "VIP_USER_ACCESS"
    },
    keyLength = 16,
    expirationTime = 86400, -- 24 horas em segundos
    maxAttempts = 3
}

-- Estado do sistema de chaves
local KeyState = {
    isUnlocked = false,
    currentKey = nil,
    attempts = 0,
    lastAttempt = 0,
    userLevel = "free" -- free, premium, vip, developer
}

-- Função para validar uma chave
function KeySystem.validateKey(key)
    if not key or key == "" then
        return false, "Chave não pode estar vazia"
    end
    
    -- Verificar tentativas
    if KeyState.attempts >= KEY_CONFIG.maxAttempts then
        local timeSinceLastAttempt = os.time() - KeyState.lastAttempt
        if timeSinceLastAttempt < 300 then -- 5 minutos de cooldown
            return false, "Muitas tentativas. Aguarde " .. (300 - timeSinceLastAttempt) .. " segundos"
        else
            KeyState.attempts = 0 -- Reset attempts after cooldown
        end
    end
    
    KeyState.attempts = KeyState.attempts + 1
    KeyState.lastAttempt = os.time()
    
    -- Verificar se a chave é válida
    for _, validKey in ipairs(KEY_CONFIG.validKeys) do
        if key == validKey then
            KeyState.isUnlocked = true
            KeyState.currentKey = key
            KeyState.attempts = 0 -- Reset attempts on success
            
            -- Determinar nível do usuário baseado na chave
            if string.find(key, "DEVELOPER") then
                KeyState.userLevel = "developer"
            elseif string.find(key, "VIP") then
                KeyState.userLevel = "vip"
            elseif string.find(key, "PREMIUM") then
                KeyState.userLevel = "premium"
            else
                KeyState.userLevel = "premium" -- Default para chaves válidas
            end
            
            return true, "Chave válida! Acesso liberado como " .. KeyState.userLevel
        end
    end
    
    return false, "Chave inválida. Tentativas restantes: " .. (KEY_CONFIG.maxAttempts - KeyState.attempts)
end

-- Função para verificar se o sistema está desbloqueado
function KeySystem.isUnlocked()
    return KeyState.isUnlocked
end

-- Função para obter o nível do usuário
function KeySystem.getUserLevel()
    return KeyState.userLevel
end

-- Função para verificar permissões baseadas no nível
function KeySystem.hasPermission(feature)
    if not KeyState.isUnlocked then
        return false
    end
    
    local permissions = {
        free = {},
        premium = {"ui_customization", "basic_ai", "music_player"},
        vip = {"ui_customization", "basic_ai", "music_player", "video_player", "advanced_search"},
        developer = {"ui_customization", "basic_ai", "music_player", "video_player", "advanced_search", "debug_mode", "api_access"}
    }
    
    local userPermissions = permissions[KeyState.userLevel] or {}
    
    for _, permission in ipairs(userPermissions) do
        if permission == feature then
            return true
        end
    end
    
    return false
end

-- ========================================
-- MÓDULO: MEDIA PLAYER
-- ========================================
local MediaPlayer = {}

-- Estado do reprodutor
local PlayerState = {
    currentTrack = nil,
    isPlaying = false,
    isPaused = false,
    volume = 0.5,
    position = 0,
    duration = 0,
    playlist = {},
    currentIndex = 1,
    repeatMode = "none", -- none, one, all
    shuffleMode = false,
    currentSound = nil
}

-- Função para reproduzir música por URL ou ID
function MediaPlayer.playTrack(trackInfo)
    if not trackInfo then
        return false, "Informações da faixa não fornecidas"
    end
    
    -- Parar música atual se estiver tocando
    if PlayerState.currentSound then
        PlayerState.currentSound:Stop()
        PlayerState.currentSound:Destroy()
    end
    
    local sound = Instance.new("Sound")
    sound.Parent = SoundService
    
    -- Configurar som baseado no tipo de mídia
    if trackInfo.type == "roblox" then
        sound.SoundId = "rbxassetid://" .. trackInfo.id
    elseif trackInfo.type == "youtube" then
        print("YouTube playback não implementado nesta demo")
        return false, "YouTube playback não disponível na demo"
    elseif trackInfo.type == "url" then
        sound.SoundId = trackInfo.url
    end
    
    sound.Volume = PlayerState.volume
    sound.Looped = PlayerState.repeatMode == "one"
    
    -- Reproduzir
    sound:Play()
    
    PlayerState.currentSound = sound
    PlayerState.currentTrack = trackInfo
    PlayerState.isPlaying = true
    PlayerState.isPaused = false
    
    return true, "Reproduzindo: " .. trackInfo.title
end

-- Função para buscar músicas (simulação)
function MediaPlayer.searchMusic(query, source)
    source = source or "roblox"
    
    -- Resultados simulados
    local mockResults = {
        {
            id = "142376088",
            title = "Monody - TheFatRat",
            artist = "TheFatRat",
            duration = 267,
            type = "roblox",
            thumbnail = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        },
        {
            id = "1837879082",
            title = "Astronomia - Vicetone & Tony Igy",
            artist = "Vicetone",
            duration = 218,
            type = "roblox",
            thumbnail = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        },
        {
            id = "1845756489",
            title = "Invincible - DEAF KEV",
            artist = "DEAF KEV",
            duration = 245,
            type = "roblox",
            thumbnail = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        }
    }
    
    -- Filtrar resultados baseado na query
    local filteredResults = {}
    local lowerQuery = string.lower(query)
    
    for _, track in ipairs(mockResults) do
        if string.find(string.lower(track.title), lowerQuery) or 
           string.find(string.lower(track.artist), lowerQuery) then
            table.insert(filteredResults, track)
        end
    end
    
    return filteredResults
end

-- ========================================
-- MÓDULO: LUCIDE ICONS
-- ========================================
local LucideIcons = {}

-- Mapeamento de ícones Lucide para códigos Unicode ou símbolos
local ICON_MAP = {
    -- Navegação
    home = "🏠",
    menu = "☰",
    search = "🔍",
    settings = "⚙️",
    user = "👤",
    
    -- Mídia
    play = "▶️",
    pause = "⏸️",
    stop = "⏹️",
    ["skip-forward"] = "⏭️",
    ["skip-back"] = "⏮️",
    volume = "🔊",
    ["volume-off"] = "🔇",
    music = "🎵",
    video = "🎬",
    
    -- Interface
    ["chevron-right"] = "▶",
    ["chevron-left"] = "◀",
    ["chevron-up"] = "▲",
    ["chevron-down"] = "▼",
    
    -- Ações
    plus = "➕",
    minus = "➖",
    ["x"] = "❌",
    check = "✅",
    edit = "✏️",
    trash = "🗑️",
    
    -- Outros
    info = "ℹ️",
    warning = "⚠️",
    error = "❌",
    success = "✅"
}

-- Função para obter um ícone por nome
function LucideIcons.getIcon(iconName)
    return ICON_MAP[iconName] or "❓"
end

-- Função para verificar se um ícone existe
function LucideIcons.hasIcon(iconName)
    return ICON_MAP[iconName] ~= nil
end

-- ========================================
-- MÓDULO: LOADING SCREEN
-- ========================================
local LoadingScreen = {}

-- Configurações do loading screen
local LOADING_CONFIG = {
    duration = 5, -- 5 segundos
    title = "Sapphire Hub Loading",
    dotAnimationSpeed = 0.5, -- segundos por ponto
    progressBarHeight = 8,
    progressBarWidth = 400
}

-- Estado do loading
local LoadingState = {
    isLoading = false,
    currentProgress = 0,
    loadingFrame = nil,
    progressBar = nil,
    titleLabel = nil,
    dotCount = 0,
    dotConnection = nil,
    progressConnection = nil
}

-- Função para criar a interface de loading
function LoadingScreen.createLoadingInterface(parent)
    local loadingFrame = Instance.new("Frame")
    loadingFrame.Name = "SapphireLoadingScreen"
    loadingFrame.Size = UDim2.new(1, 0, 1, 0)
    loadingFrame.Position = UDim2.new(0, 0, 0, 0)
    loadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    loadingFrame.BorderSizePixel = 0
    loadingFrame.ZIndex = 1000 -- Sempre no topo
    loadingFrame.Parent = parent

    -- Logo/Ícone central
    local logoFrame = Instance.new("Frame")
    logoFrame.Name = "LogoFrame"
    logoFrame.Size = UDim2.new(0, 120, 0, 120)
    logoFrame.Position = UDim2.new(0.5, -60, 0.5, -100)
    logoFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    logoFrame.BorderSizePixel = 0
    logoFrame.Parent = loadingFrame

    -- Gradiente rainbow para o logo
    local logoGradient = Instance.new("UIGradient")
    logoGradient.Color = Themes.gradients.rainbow
    logoGradient.Rotation = 0
    logoGradient.Parent = logoFrame

    local logoCorner = Instance.new("UICorner")
    logoCorner.CornerRadius = UDim.new(0.5, 0)
    logoCorner.Parent = logoFrame

    -- Ícone do Sapphire
    local logoIcon = Instance.new("TextLabel")
    logoIcon.Name = "LogoIcon"
    logoIcon.Size = UDim2.new(1, 0, 1, 0)
    logoIcon.BackgroundTransparency = 1
    logoIcon.Text = "💎"
    logoIcon.TextColor3 = Color3.new(1, 1, 1)
    logoIcon.TextSize = 60
    logoIcon.Font = Enum.Font.GothamBold
    logoIcon.TextXAlignment = Enum.TextXAlignment.Center
    logoIcon.TextYAlignment = Enum.TextYAlignment.Center
    logoIcon.Parent = logoFrame

    -- Título com pontos animados
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(0, 400, 0, 50)
    titleLabel.Position = UDim2.new(0.5, -200, 0.5, 40)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = LOADING_CONFIG.title
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextSize = 24
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.Parent = loadingFrame

    -- Barra de progresso container
    local progressContainer = Instance.new("Frame")
    progressContainer.Name = "ProgressContainer"
    progressContainer.Size = UDim2.new(0, LOADING_CONFIG.progressBarWidth, 0, LOADING_CONFIG.progressBarHeight)
    progressContainer.Position = UDim2.new(0.5, -LOADING_CONFIG.progressBarWidth/2, 0.5, 100)
    progressContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    progressContainer.BorderSizePixel = 0
    progressContainer.Parent = loadingFrame

    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(0, 4)
    progressCorner.Parent = progressContainer

    -- Barra de progresso
    local progressBar = Instance.new("Frame")
    progressBar.Name = "ProgressBar"
    progressBar.Size = UDim2.new(0, 0, 1, 0)
    progressBar.Position = UDim2.new(0, 0, 0, 0)
    progressBar.BackgroundColor3 = Color3.new(1, 1, 1)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = progressContainer

    -- Gradiente colorido para a barra
    local progressGradient = Instance.new("UIGradient")
    progressGradient.Color = Themes.gradients.rainbow
    progressGradient.Rotation = 0
    progressGradient.Parent = progressBar

    local progressBarCorner = Instance.new("UICorner")
    progressBarCorner.CornerRadius = UDim.new(0, 4)
    progressBarCorner.Parent = progressBar

    -- Texto de porcentagem
    local percentageLabel = Instance.new("TextLabel")
    percentageLabel.Name = "PercentageLabel"
    percentageLabel.Size = UDim2.new(0, 100, 0, 30)
    percentageLabel.Position = UDim2.new(0.5, -50, 0.5, 130)
    percentageLabel.BackgroundTransparency = 1
    percentageLabel.Text = "0%"
    percentageLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    percentageLabel.TextSize = 16
    percentageLabel.Font = Enum.Font.Gotham
    percentageLabel.TextXAlignment = Enum.TextXAlignment.Center
    percentageLabel.Parent = loadingFrame

    -- Armazenar referências
    LoadingState.loadingFrame = loadingFrame
    LoadingState.progressBar = progressBar
    LoadingState.titleLabel = titleLabel
    LoadingState.percentageLabel = percentageLabel
    LoadingState.logoGradient = logoGradient

    return loadingFrame
end

-- Função para iniciar o loading
function LoadingScreen.startLoading(parent, onComplete)
    if LoadingState.isLoading then
        return false, "Loading já está em andamento"
    end

    LoadingState.isLoading = true
    LoadingState.currentProgress = 0
    LoadingState.dotCount = 0

    -- Criar interface
    local loadingFrame = LoadingScreen.createLoadingInterface(parent)

    -- Iniciar animação dos pontos
    LoadingScreen.startDotAnimation()

    -- Iniciar animação do progresso
    LoadingScreen.startProgressAnimation(onComplete)

    -- Iniciar animação do gradiente do logo
    LoadingScreen.startLogoAnimation()

    return true, "Loading iniciado"
end

-- Função para animar os pontos do título
function LoadingScreen.startDotAnimation()
    LoadingState.dotConnection = RunService.Heartbeat:Connect(function()
        if not LoadingState.isLoading then
            return
        end

        local elapsed = tick() % (LOADING_CONFIG.dotAnimationSpeed * 4)
        local dotPhase = math.floor(elapsed / LOADING_CONFIG.dotAnimationSpeed)
        
        local dots = ""
        for i = 1, dotPhase do
            dots = dots .. "."
        end

        if LoadingState.titleLabel then
            LoadingState.titleLabel.Text = LOADING_CONFIG.title .. dots
        end
    end)
end

-- Função para animar o progresso
function LoadingScreen.startProgressAnimation(onComplete)
    local startTime = tick()
    
    LoadingState.progressConnection = RunService.Heartbeat:Connect(function()
        if not LoadingState.isLoading then
            return
        end

        local elapsed = tick() - startTime
        local progress = math.min(elapsed / LOADING_CONFIG.duration, 1)
        
        LoadingState.currentProgress = progress

        -- Atualizar barra de progresso
        if LoadingState.progressBar then
            LoadingState.progressBar.Size = UDim2.new(progress, 0, 1, 0)
        end

        -- Atualizar porcentagem
        if LoadingState.percentageLabel then
            LoadingState.percentageLabel.Text = math.floor(progress * 100) .. "%"
        end

        -- Verificar se completou
        if progress >= 1 then
            LoadingScreen.completeLoading(onComplete)
        end
    end)
end

-- Função para animar o gradiente do logo
function LoadingScreen.startLogoAnimation()
    if LoadingState.logoGradient then
        local rotationTween = TweenService:Create(
            LoadingState.logoGradient,
            TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
            {Rotation = 360}
        )
        rotationTween:Play()
    end
end

-- Função para completar o loading
function LoadingScreen.completeLoading(onComplete)
    LoadingState.isLoading = false

    -- Parar animações
    if LoadingState.dotConnection then
        LoadingState.dotConnection:Disconnect()
        LoadingState.dotConnection = nil
    end

    if LoadingState.progressConnection then
        LoadingState.progressConnection:Disconnect()
        LoadingState.progressConnection = nil
    end

    -- Animação de fade out
    if LoadingState.loadingFrame then
        local fadeOutTween = TweenService:Create(
            LoadingState.loadingFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
        )

        fadeOutTween:Play()
        fadeOutTween.Completed:Connect(function()
            LoadingState.loadingFrame:Destroy()
            LoadingState.loadingFrame = nil
            
            -- Chamar callback de conclusão
            if onComplete then
                onComplete()
            end
        end)
    end
end

-- ========================================
-- MÓDULO: SAVE SYSTEM
-- ========================================
local SaveSystem = {}

-- Configurações padrão
local DEFAULT_SETTINGS = {
    theme = "default_colorful",
    language = "pt_BR",
    transparency = false,
    selectedColor = {r = 255, g = 107, b = 107},
    volume = 0.5,
    muteAudio = false,
    rememberedKey = nil,
    autoLogin = false,
    aiEnabled = true,
    autoLoad = true,
    debugMode = false,
    firstTime = true,
    lastVersion = "1.0.0",
    createdAt = 0,
    lastModified = 0
}

-- Estado do sistema de save
local SaveState = {
    currentSettings = {},
    hasUnsavedChanges = false,
    isInitialized = false
}

-- Simulação de armazenamento
local simulatedStorage = {}

-- Função para inicializar o sistema de save
function SaveSystem.initialize()
    if SaveState.isInitialized then
        return true, "Sistema já inicializado"
    end

    -- Carregar configurações salvas ou usar padrão
    local success, loadedSettings = SaveSystem.loadSettings()
    
    if success then
        SaveState.currentSettings = loadedSettings
        print("Configurações carregadas com sucesso")
    else
        SaveState.currentSettings = Utils.deepCopy(DEFAULT_SETTINGS)
        SaveState.currentSettings.createdAt = os.time()
        print("Usando configurações padrão")
    end

    SaveState.currentSettings.lastModified = os.time()
    SaveState.isInitialized = true

    return true, "Sistema de save inicializado"
end

-- Função para carregar configurações
function SaveSystem.loadSettings()
    local success, result = pcall(function()
        local savedData = simulatedStorage["SapphireLib_Settings"]
        
        if savedData then
            local decodedData = HttpService:JSONDecode(savedData)
            return SaveSystem.mergeSettings(DEFAULT_SETTINGS, decodedData)
        else
            return nil
        end
    end)

    if success and result then
        return true, result
    else
        return false, "Erro ao carregar configurações"
    end
end

-- Função para salvar configurações
function SaveSystem.saveSettings(settings)
    settings = settings or SaveState.currentSettings
    
    local success, result = pcall(function()
        settings.lastModified = os.time()
        local jsonData = HttpService:JSONEncode(settings)
        simulatedStorage["SapphireLib_Settings"] = jsonData
        SaveState.hasUnsavedChanges = false
        return true
    end)

    if success then
        print("Configurações salvas com sucesso")
        return true, "Configurações salvas"
    else
        return false, "Erro ao salvar"
    end
end

-- Função para obter uma configuração
function SaveSystem.getSetting(key, defaultValue)
    if not SaveState.isInitialized then
        SaveSystem.initialize()
    end

    local value = SaveState.currentSettings[key]
    return value ~= nil and value or defaultValue
end

-- Função para definir uma configuração
function SaveSystem.setSetting(key, value)
    if not SaveState.isInitialized then
        SaveSystem.initialize()
    end

    SaveState.currentSettings[key] = value
    SaveState.hasUnsavedChanges = true
    return true
end

-- Função para mesclar configurações
function SaveSystem.mergeSettings(default, custom)
    local merged = Utils.deepCopy(default)
    
    for key, value in pairs(custom) do
        if type(value) == "table" and type(merged[key]) == "table" then
            merged[key] = SaveSystem.mergeSettings(merged[key], value)
        else
            merged[key] = value
        end
    end
    
    return merged
end

-- ========================================
-- MÓDULO: TRANSLATION
-- ========================================
local Translation = {}

-- Idiomas suportados
local SUPPORTED_LANGUAGES = {
    pt_BR = "Português (Brasil)",
    pt_PT = "Português (Portugal)",
    en_US = "English (United States)",
    es_ES = "Español",
    vi_VN = "Tiếng Việt",
    id_ID = "Bahasa Indonesia",
    it_IT = "Italiano"
}

-- Traduções
local TRANSLATIONS = {
    pt_BR = {
        ["Sapphire Hub Loading"] = "Sapphire Hub Carregando",
        ["Main"] = "Principal",
        ["Settings"] = "Configurações",
        ["UI Color"] = "Cor da UI",
        ["Transparency"] = "Transparência",
        ["Music Player"] = "Reprodutor de Música",
        ["Video Player"] = "Reprodutor de Vídeo",
        ["Search"] = "Pesquisar",
        ["Hello! I'm Sapphire AI and I'm here to help you!"] = "Olá! Sou Sapphire AI e estou aqui para te ajudar!",
        ["Key System"] = "Sistema de Chaves",
        ["Validate Key"] = "Validar Chave",
        ["Enter your key here"] = "Digite sua chave aqui",
        ["Invalid key"] = "Chave inválida",
        ["Valid key"] = "Chave válida"
    },
    pt_PT = {
        ["Sapphire Hub Loading"] = "Sapphire Hub A Carregar",
        ["Main"] = "Principal",
        ["Settings"] = "Definições",
        ["UI Color"] = "Cor da Interface",
        ["Transparency"] = "Transparência",
        ["Music Player"] = "Leitor de Música",
        ["Video Player"] = "Leitor de Vídeo",
        ["Search"] = "Pesquisar",
        ["Hello! I'm Sapphire AI and I'm here to help you!"] = "Olá! Sou Sapphire AI e estou aqui para vos ajudar!",
        ["Key System"] = "Sistema de Chaves",
        ["Validate Key"] = "Validar Chave",
        ["Enter your key here"] = "Introduza a sua chave aqui",
        ["Invalid key"] = "Chave inválida",
        ["Valid key"] = "Chave válida"
    },
    en_US = {
        ["Sapphire Hub Loading"] = "Sapphire Hub Loading",
        ["Main"] = "Main",
        ["Settings"] = "Settings",
        ["UI Color"] = "UI Color",
        ["Transparency"] = "Transparency",
        ["Music Player"] = "Music Player",
        ["Video Player"] = "Video Player",
        ["Search"] = "Search",
        ["Hello! I'm Sapphire AI and I'm here to help you!"] = "Hello! I'm Sapphire AI and I'm here to help you!",
        ["Key System"] = "Key System",
        ["Validate Key"] = "Validate Key",
        ["Enter your key here"] = "Enter your key here",
        ["Invalid key"] = "Invalid key",
        ["Valid key"] = "Valid key"
    },
    es_ES = {
        ["Sapphire Hub Loading"] = "Sapphire Hub Cargando",
        ["Main"] = "Principal",
        ["Settings"] = "Configuración",
        ["UI Color"] = "Color de UI",
        ["Transparency"] = "Transparencia",
        ["Music Player"] = "Reproductor de Música",
        ["Video Player"] = "Reproductor de Vídeo",
        ["Search"] = "Buscar",
        ["Hello! I'm Sapphire AI and I'm here to help you!"] = "¡Hola! Soy Sapphire AI y estoy aquí para ayudarte!",
        ["Key System"] = "Sistema de Claves",
        ["Validate Key"] = "Validar Clave",
        ["Enter your key here"] = "Ingresa tu clave aquí",
        ["Invalid key"] = "Clave inválida",
        ["Valid key"] = "Clave válida"
    },
    vi_VN = {
        ["Sapphire Hub Loading"] = "Sapphire Hub Đang Tải",
        ["Main"] = "Chính",
        ["Settings"] = "Cài Đặt",
        ["UI Color"] = "Màu Giao Diện",
        ["Transparency"] = "Độ Trong Suốt",
        ["Music Player"] = "Trình Phát Nhạc",
        ["Video Player"] = "Trình Phát Video",
        ["Search"] = "Tìm Kiếm",
        ["Hello! I'm Sapphire AI and I'm here to help you!"] = "Xin chào! Tôi là Sapphire AI và tôi ở đây để giúp bạn!",
        ["Key System"] = "Hệ Thống Khóa",
        ["Validate Key"] = "Xác Thực Khóa",
        ["Enter your key here"] = "Nhập khóa của bạn ở đây",
        ["Invalid key"] = "Khóa không hợp lệ",
        ["Valid key"] = "Khóa hợp lệ"
    },
    id_ID = {
        ["Sapphire Hub Loading"] = "Sapphire Hub Memuat",
        ["Main"] = "Utama",
        ["Settings"] = "Pengaturan",
        ["UI Color"] = "Warna UI",
        ["Transparency"] = "Transparansi",
        ["Music Player"] = "Pemutar Musik",
        ["Video Player"] = "Pemutar Video",
        ["Search"] = "Cari",
        ["Hello! I'm Sapphire AI and I'm here to help you!"] = "Halo! Saya Sapphire AI dan saya di sini untuk membantu Anda!",
        ["Key System"] = "Sistem Kunci",
        ["Validate Key"] = "Validasi Kunci",
        ["Enter your key here"] = "Masukkan kunci Anda di sini",
        ["Invalid key"] = "Kunci tidak valid",
        ["Valid key"] = "Kunci valid"
    },
    it_IT = {
        ["Sapphire Hub Loading"] = "Sapphire Hub Caricamento",
        ["Main"] = "Principale",
        ["Settings"] = "Impostazioni",
        ["UI Color"] = "Colore UI",
        ["Transparency"] = "Trasparenza",
        ["Music Player"] = "Lettore Musicale",
        ["Video Player"] = "Lettore Video",
        ["Search"] = "Cerca",
        ["Hello! I'm Sapphire AI and I'm here to help you!"] = "Ciao! Sono Sapphire AI e sono qui per aiutarti!",
        ["Key System"] = "Sistema Chiavi",
        ["Validate Key"] = "Convalida Chiave",
        ["Enter your key here"] = "Inserisci la tua chiave qui",
        ["Invalid key"] = "Chiave non valida",
        ["Valid key"] = "Chiave valida"
    }
}

-- Idioma atual
local currentLanguage = "pt_BR"

-- Função para definir idioma
function Translation.setLanguage(language)
    if SUPPORTED_LANGUAGES[language] then
        currentLanguage = language
        SaveSystem.setSetting("language", language)
        return true
    end
    return false
end

-- Função para obter idioma atual
function Translation.getCurrentLanguage()
    return currentLanguage
end

-- Função para traduzir texto
function Translation.translate(key)
    local translations = TRANSLATIONS[currentLanguage]
    if translations and translations[key] then
        return translations[key]
    end
    -- Fallback para inglês se não encontrar tradução
    local englishTranslations = TRANSLATIONS["en_US"]
    if englishTranslations and englishTranslations[key] then
        return englishTranslations[key]
    end
    -- Retorna a chave original se não encontrar tradução
    return key
end

-- Função para obter idiomas suportados
function Translation.getSupportedLanguages()
    return SUPPORTED_LANGUAGES
end

-- ========================================
-- MÓDULO: COMPONENTS
-- ========================================
local Components = {}

-- Configurações globais
local CORNER_RADIUS = UDim.new(0, 12)
local PADDING = UDim.new(0, 16)

-- Função para criar o frame principal
function Components.createMainFrame(parent)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "SapphireLibMain"
    mainFrame.Size = UDim2.new(0, 800, 0, 600)
    mainFrame.Position = UDim2.new(0.5, -400, 0.5, -300)
    mainFrame.BackgroundColor3 = Themes.colors.background
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = parent

    -- Gradiente de borda rainbow (para animação)
    local borderFrame = Instance.new("Frame")
    borderFrame.Name = "BorderFrame"
    borderFrame.Size = UDim2.new(1, 8, 1, 8)
    borderFrame.Position = UDim2.new(0, -4, 0, -4)
    borderFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    borderFrame.BorderSizePixel = 0
    borderFrame.Parent = mainFrame

    local borderGradient = Instance.new("UIGradient")
    borderGradient.Color = Themes.gradients.rainbow
    borderGradient.Rotation = 45
    borderGradient.Parent = borderFrame

    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 16)
    borderCorner.Parent = borderFrame

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = CORNER_RADIUS
    mainCorner.Parent = mainFrame

    return mainFrame
end

-- Função para criar a barra de pesquisa
function Components.createSearchBar(parent)
    local searchFrame = Instance.new("Frame")
    searchFrame.Name = "SearchBar"
    searchFrame.Size = UDim2.new(0, 300, 0, 40)
    searchFrame.Position = UDim2.new(0, 20, 0, 20)
    searchFrame.BackgroundColor3 = Themes.colors.searchBackground
    searchFrame.BorderSizePixel = 0
    searchFrame.Parent = parent

    local searchBorder = Instance.new("UIStroke")
    searchBorder.Color = Themes.colors.searchBorder
    searchBorder.Thickness = 2
    searchBorder.Parent = searchFrame

    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 8)
    searchCorner.Parent = searchFrame

    -- Ícone de pesquisa
    local searchIcon = Instance.new("ImageLabel")
    searchIcon.Name = "SearchIcon"
    searchIcon.Size = UDim2.new(0, 20, 0, 20)
    searchIcon.Position = UDim2.new(0, 12, 0.5, -10)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    searchIcon.ImageColor3 = Themes.colors.iconGray
    searchIcon.Parent = searchFrame

    -- Campo de texto
    local searchBox = Instance.new("TextBox")
    searchBox.Name = "SearchBox"
    searchBox.Size = UDim2.new(1, -44, 1, 0)
    searchBox.Position = UDim2.new(0, 44, 0, 0)
    searchBox.BackgroundTransparency = 1
    searchBox.Text = ""
    searchBox.PlaceholderText = Translation.translate("Search") .. "..."
    searchBox.TextColor3 = Themes.colors.textPrimary
    searchBox.PlaceholderColor3 = Themes.colors.textSecondary
    searchBox.TextSize = 14
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    searchBox.Parent = searchFrame

    return searchFrame
end

-- Função para criar o título
function Components.createTitle(parent)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0, 300, 0, 50)
    titleLabel.Position = UDim2.new(0.5, -150, 0, 15)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "SapphireLib Hub"
    titleLabel.TextColor3 = Themes.colors.textPrimary
    titleLabel.TextSize = 32
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.Parent = parent

    return titleLabel
end

-- Função para criar botão de menu
function Components.createMenuButton(parent)
    local menuButton = Instance.new("TextButton")
    menuButton.Name = "MenuButton"
    menuButton.Size = UDim2.new(0, 50, 0, 50)
    menuButton.Position = UDim2.new(1, -70, 0, 10)
    menuButton.BackgroundColor3 = Themes.colors.buttonBackground
    menuButton.BorderSizePixel = 0
    menuButton.Text = ""
    menuButton.Parent = parent

    -- Gradiente rainbow para o botão
    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = Themes.gradients.rainbow
    buttonGradient.Rotation = 45
    buttonGradient.Parent = menuButton

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0.5, 0)
    buttonCorner.Parent = menuButton

    -- Ícone de três pontos
    local menuIcon = Instance.new("TextLabel")
    menuIcon.Name = "MenuIcon"
    menuIcon.Size = UDim2.new(1, 0, 1, 0)
    menuIcon.BackgroundTransparency = 1
    menuIcon.Text = "⋯"
    menuIcon.TextColor3 = Themes.colors.textPrimary
    menuIcon.TextSize = 20
    menuIcon.Font = Enum.Font.GothamBold
    menuIcon.TextXAlignment = Enum.TextXAlignment.Center
    menuIcon.TextYAlignment = Enum.TextYAlignment.Center
    menuIcon.Parent = menuButton

    return menuButton
end

-- Função para criar a sidebar de navegação
function Components.createSidebar(parent)
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 200, 1, -80)
    sidebar.Position = UDim2.new(0, 20, 0, 80)
    sidebar.BackgroundColor3 = Themes.colors.sidebarBackground
    sidebar.BorderSizePixel = 0
    sidebar.Parent = parent

    local sidebarCorner = Instance.new("UICorner")
    sidebarCorner.CornerRadius = CORNER_RADIUS
    sidebarCorner.Parent = sidebar

    -- Lista de itens da sidebar
    local sidebarItems = {
        {name = Translation.translate("Main"), icon = "🏠", color = Themes.colors.iconRed},
        {name = "V4", icon = "☰", color = Themes.colors.iconRed},
        {name = "Sea Events", icon = "🌊", color = Themes.colors.iconBlue},
        {name = "PvP", icon = "⚔", color = Themes.colors.iconRed},
        {name = "Fruit", icon = "🍊", color = Themes.colors.iconOrange},
        {name = Translation.translate("Settings"), icon = "⚙", color = Themes.colors.iconPurple}
    }

    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 8)
    listLayout.Parent = sidebar

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = PADDING
    padding.PaddingLeft = PADDING
    padding.PaddingRight = PADDING
    padding.PaddingBottom = PADDING
    padding.Parent = sidebar

    -- Criar cada item da sidebar
    for i, item in ipairs(sidebarItems) do
        local itemButton = Components.createSidebarItem(sidebar, item.name, item.icon, item.color)
        itemButton.LayoutOrder = i
    end

    -- Adicionar perfil do usuário no final
    local userProfile = Components.createUserProfile(sidebar)
    userProfile.LayoutOrder = #sidebarItems + 1

    return sidebar
end

-- Função para criar item da sidebar
function Components.createSidebarItem(parent, name, icon, iconColor)
    local itemButton = Instance.new("TextButton")
    itemButton.Name = name .. "Button"
    itemButton.Size = UDim2.new(1, 0, 0, 45)
    itemButton.BackgroundColor3 = Themes.colors.buttonBackground
    itemButton.BorderSizePixel = 0
    itemButton.Text = ""
    itemButton.Parent = parent

    local itemCorner = Instance.new("UICorner")
    itemCorner.CornerRadius = UDim.new(0, 8)
    itemCorner.Parent = itemButton

    -- Ícone
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "Icon"
    iconLabel.Size = UDim2.new(0, 30, 0, 30)
    iconLabel.Position = UDim2.new(0, 8, 0.5, -15)
    iconLabel.BackgroundColor3 = iconColor
    iconLabel.BorderSizePixel = 0
    iconLabel.Text = icon
    iconLabel.TextColor3 = Themes.colors.textPrimary
    iconLabel.TextSize = 16
    iconLabel.Font = Enum.Font.Gotham
    iconLabel.TextXAlignment = Enum.TextXAlignment.Center
    iconLabel.TextYAlignment = Enum.TextYAlignment.Center
    iconLabel.Parent = itemButton

    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 6)
    iconCorner.Parent = iconLabel

    -- Texto
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Text"
    textLabel.Size = UDim2.new(1, -50, 1, 0)
    textLabel.Position = UDim2.new(0, 50, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = name
    textLabel.TextColor3 = Themes.colors.textPrimary
    textLabel.TextSize = 16
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextYAlignment = Enum.TextYAlignment.Center
    textLabel.Parent = itemButton

    return itemButton
end

-- Função para criar perfil do usuário
function Components.createUserProfile(parent)
    local profileFrame = Instance.new("Frame")
    profileFrame.Name = "UserProfile"
    profileFrame.Size = UDim2.new(1, 0, 0, 60)
    profileFrame.BackgroundColor3 = Themes.colors.buttonBackground
    profileFrame.BorderSizePixel = 0
    profileFrame.Parent = parent

    local profileCorner = Instance.new("UICorner")
    profileCorner.CornerRadius = UDim.new(0, 8)
    profileCorner.Parent = profileFrame

    -- Avatar
    local avatar = Instance.new("ImageLabel")
    avatar.Name = "Avatar"
    avatar.Size = UDim2.new(0, 40, 0, 40)
    avatar.Position = UDim2.new(0, 10, 0.5, -20)
    avatar.BackgroundColor3 = Themes.colors.iconGray
    avatar.BorderSizePixel = 0
    avatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    avatar.Parent = profileFrame

    local avatarCorner = Instance.new("UICorner")
    avatarCorner.CornerRadius = UDim.new(0.5, 0)
    avatarCorner.Parent = avatar

    -- Nome do usuário
    local usernameLabel = Instance.new("TextLabel")
    usernameLabel.Name = "Username"
    usernameLabel.Size = UDim2.new(1, -60, 0, 20)
    usernameLabel.Position = UDim2.new(0, 60, 0, 8)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.Text = "velaric"
    usernameLabel.TextColor3 = Themes.colors.textPrimary
    usernameLabel.TextSize = 14
    usernameLabel.Font = Enum.Font.Gotham
    usernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    usernameLabel.Parent = profileFrame

    -- Tempo online
    local timeLabel = Instance.new("TextLabel")
    timeLabel.Name = "Time"
    timeLabel.Size = UDim2.new(1, -60, 0, 16)
    timeLabel.Position = UDim2.new(0, 60, 0, 32)
    timeLabel.BackgroundTransparency = 1
    timeLabel.Text = "20 min"
    timeLabel.TextColor3 = Themes.colors.textSecondary
    timeLabel.TextSize = 12
    timeLabel.Font = Enum.Font.Gotham
    timeLabel.TextXAlignment = Enum.TextXAlignment.Left
    timeLabel.Parent = profileFrame

    return profileFrame
end

-- Função para criar área de conteúdo principal
function Components.createContentArea(parent)
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, -240, 1, -80)
    contentArea.Position = UDim2.new(0, 240, 0, 80)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = parent
    contentArea.Visible = false -- Definir como invisível inicialmente

    -- Card de UI Color
    local colorCard = Components.createColorCard(contentArea)
    colorCard.Position = UDim2.new(0, 0, 0, 0)

    -- Card de Transparency
    local transparencyCard = Components.createTransparencyCard(contentArea)
    transparencyCard.Position = UDim2.new(0, 0, 0, 200)

    return contentArea
end

-- Função para criar card de seleção de cor
function Components.createColorCard(parent)
    local colorCard = Instance.new("Frame")
    colorCard.Name = "ColorCard"
    colorCard.Size = UDim2.new(1, -20, 0, 180)
    colorCard.BackgroundColor3 = Themes.colors.cardBackground
    colorCard.BorderSizePixel = 0
    colorCard.Parent = parent

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = CORNER_RADIUS
    cardCorner.Parent = colorCard

    -- Título
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0, 200, 0, 40)
    titleLabel.Position = UDim2.new(0, 20, 0, 20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = Translation.translate("UI Color")
    titleLabel.TextColor3 = Themes.colors.textPrimary
    titleLabel.TextSize = 24
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = colorCard

    -- Seletor de cor circular
    local colorWheel = Components.createColorWheel(colorCard)
    colorWheel.Position = UDim2.new(1, -120, 0.5, -60)

    return colorCard
end

-- Função para criar seletor de cor circular
function Components.createColorWheel(parent)
    local wheelFrame = Instance.new("Frame")
    wheelFrame.Name = "ColorWheel"
    wheelFrame.Size = UDim2.new(0, 120, 0, 120)
    wheelFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    wheelFrame.BorderSizePixel = 0
    wheelFrame.Parent = parent

    -- Gradiente rainbow circular
    local wheelGradient = Instance.new("UIGradient")
    wheelGradient.Color = Themes.gradients.rainbow
    wheelGradient.Rotation = 0
    wheelGradient.Parent = wheelFrame

    local wheelCorner = Instance.new("UICorner")
    wheelCorner.CornerRadius = UDim.new(0.5, 0)
    wheelCorner.Parent = wheelFrame

    -- Centro escuro
    local centerFrame = Instance.new("Frame")
    centerFrame.Name = "Center"
    centerFrame.Size = UDim2.new(0, 80, 0, 80)
    centerFrame.Position = UDim2.new(0.5, -40, 0.5, -40)
    centerFrame.BackgroundColor3 = Themes.colors.background
    centerFrame.BorderSizePixel = 0
    centerFrame.Parent = wheelFrame

    local centerCorner = Instance.new("UICorner")
    centerCorner.CornerRadius = UDim.new(0.5, 0)
    centerCorner.Parent = centerFrame

    return wheelFrame
end

-- Função para criar card de transparência
function Components.createTransparencyCard(parent)
    local transparencyCard = Instance.new("Frame")
    transparencyCard.Name = "TransparencyCard"
    transparencyCard.Size = UDim2.new(1, -20, 0, 100)
    transparencyCard.BackgroundColor3 = Themes.colors.cardBackground
    transparencyCard.BorderSizePixel = 0
    transparencyCard.Parent = parent

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = CORNER_RADIUS
    cardCorner.Parent = transparencyCard

    -- Título
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0, 200, 0, 40)
    titleLabel.Position = UDim2.new(0, 20, 0.5, -20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = Translation.translate("Transparency")
    titleLabel.TextColor3 = Themes.colors.textPrimary
    titleLabel.TextSize = 24
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = transparencyCard

    -- Toggle switch
    local toggleSwitch = Components.createToggleSwitch(transparencyCard)
    toggleSwitch.Position = UDim2.new(1, -80, 0.5, -15)

    return transparencyCard
end

-- Função para criar toggle switch
function Components.createToggleSwitch(parent)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = "ToggleSwitch"
    toggleFrame.Size = UDim2.new(0, 60, 0, 30)
    toggleFrame.BackgroundColor3 = Themes.colors.toggleOff
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Parent = parent

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0.5, 0)
    toggleCorner.Parent = toggleFrame

    -- Botão do toggle
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0, 26, 0, 26)
    toggleButton.Position = UDim2.new(0, 4, 0.5, -13)
    toggleButton.BackgroundColor3 = Themes.colors.textPrimary
    toggleButton.BorderSizePixel = 0
    toggleButton.Text = ""
    toggleButton.Parent = toggleFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0.5, 0)
    buttonCorner.Parent = toggleButton

    local isOn = false

    toggleButton.MouseButton1Click:Connect(function()
        isOn = not isOn
        if isOn then
            toggleFrame.BackgroundColor3 = Themes.colors.toggleOn
            toggleButton:TweenPosition(UDim2.new(0, 32, 0.5, -13), "Out", "Quad", 0.2, true)
        else
            toggleFrame.BackgroundColor3 = Themes.colors.toggleOff
            toggleButton:TweenPosition(UDim2.new(0, 4, 0.5, -13), "Out", "Quad", 0.2, true)
        end
    end)

    return toggleFrame
end

-- Função para criar um ToggleButton com imagem e borda colorida dinâmica
function Components.createImageToggleButton(parent, imageId, size, position, targetElement)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = "ImageToggleButton"
    toggleFrame.Size = size or UDim2.new(0, 50, 0, 50)
    toggleFrame.Position = position or UDim2.new(0.5, -25, 0.5, -25)
    toggleFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Parent = parent

    local borderGradient = Instance.new("UIGradient")
    borderGradient.Color = Themes.gradients.rainbow
    borderGradient.Rotation = 0
    borderGradient.Parent = toggleFrame

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0.5, 0)
    toggleCorner.Parent = toggleFrame

    local imageButton = Instance.new("ImageButton")
    imageButton.Name = "ImageButton"
    imageButton.Size = UDim2.new(1, -4, 1, -4)
    imageButton.Position = UDim2.new(0, 2, 0, 2)
    imageButton.BackgroundTransparency = 1
    imageButton.Image = "rbxassetid://" .. imageId
    imageButton.Parent = toggleFrame

    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(0.5, 0)
    imageCorner.Parent = imageButton

    local isOpen = false

    imageButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        if targetElement then
            targetElement.Visible = isOpen
            print("Target element visibility toggled to: " .. tostring(isOpen))
        end
        
        -- Animação visual do botão (ex: rotação ou escala)
        if isOpen then
            -- Exemplo: rotacionar o ícone do botão
            local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(imageButton, tweenInfo, {Rotation = 90})
            tween:Play()
        else
            local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(imageButton, tweenInfo, {Rotation = 0})
            tween:Play()
        end
    end)

    return toggleFrame
end

-- ========================================
-- MÓDULO: EVENTS
-- ========================================
local Events = {}

-- Estado global da aplicação
local AppState = {
    currentSection = "Main",
    selectedColor = Color3.fromRGB(255, 80, 100),
    transparencyEnabled = false,
    searchResults = {},
    currentSearchQuery = ""
}

-- Função para conectar eventos de navegação da sidebar
function Events.connectSidebarNavigation(sidebar)
    local buttons = {
        sidebar:FindFirstChild("MainButton"),
        sidebar:FindFirstChild("V4Button"),
        sidebar:FindFirstChild("Sea EventsButton"),
        sidebar:FindFirstChild("PvPButton"),
        sidebar:FindFirstChild("FruitButton"),
        sidebar:FindFirstChild("SettingsButton")
    }

    for _, button in ipairs(buttons) do
        if button then
            button.MouseButton1Click:Connect(function()
                local sectionName = button.Name:gsub("Button", "")
                Events.switchSection(sectionName)
                Events.updateSidebarSelection(sidebar, sectionName)
            end)
        end
    end
end

-- Função para trocar de seção
function Events.switchSection(sectionName)
    AppState.currentSection = sectionName
    print("Seção atual: " .. sectionName)
end

-- Função para conectar eventos da barra de pesquisa
function Events.connectSearchBar(searchBar)
    local searchBox = searchBar:FindFirstChild("SearchBox")
    if searchBox then
        searchBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                Events.onSearch(searchBox.Text)
            end
        end)
        
        searchBox:GetPropertyChangedSignal("Text"):Connect(function()
            Events.onSearchTextChanged(searchBox.Text)
        end)
    end
end

-- Função chamada quando uma pesquisa é realizada
function Events.onSearch(searchText)
    print("Pesquisando por: " .. searchText)
    
    local results = SearchData.search(searchText)
    AppState.searchResults = results
    AppState.currentSearchQuery = searchText
    
    if #results > 0 then
        local firstResult = results[1]
        print("Primeiro resultado: " .. firstResult.name)
        
        if firstResult.category == "Navigation" then
            Events.switchSection(firstResult.name)
        end
    else
        print("Nenhum resultado encontrado para: " .. searchText)
    end
end

-- Função chamada quando o texto de pesquisa muda
function Events.onSearchTextChanged(searchText)
    if searchText == "" then
        AppState.searchResults = {}
        AppState.currentSearchQuery = ""
        return
    end
    
    local suggestions = SearchData.getSuggestions(searchText, 3)
    print("Sugestões: " .. #suggestions)
end

-- Função para obter o estado atual da aplicação
function Events.getAppState()
    return AppState
end

-- ========================================
-- MÓDULO: EXAMPLE FRAMES (MOLDUROS)
-- ========================================
local ExampleFrames = {}

-- Função para criar uma moldura de exemplo
function ExampleFrames.createExampleFrame(config)
    -- Configurações padrão
    local defaultConfig = {
        Title = "Exemplo",
        Number = 1,
        Size = UDim2.fromOffset(400, 300),
        Position = UDim2.new(0, 0, 0, 0),
        Parent = game.Players.LocalPlayer.PlayerGui,
        ShowBorder = true,
        Theme = "default_colorful"
    }
    
    -- Mesclar configurações
    for key, value in pairs(config or {}) do
        defaultConfig[key] = value
    end
    
    -- Aplicar tema se especificado
    if defaultConfig.Theme and defaultConfig.Theme ~= "default_colorful" then
        Themes.applyTheme(defaultConfig.Theme)
    end
    
    -- Frame principal da moldura
    local exampleFrame = Instance.new("Frame")
    exampleFrame.Name = "ExampleFrame_" .. defaultConfig.Number
    exampleFrame.Size = defaultConfig.Size
    exampleFrame.Position = defaultConfig.Position
    exampleFrame.BackgroundColor3 = Themes.colors.cardBackground
    exampleFrame.BorderSizePixel = 0
    exampleFrame.Parent = defaultConfig.Parent
    
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 12)
    frameCorner.Parent = exampleFrame
    
    -- Borda colorida animada (se habilitada)
    local borderConnection = nil
    if defaultConfig.ShowBorder then
        local borderFrame = Instance.new("Frame")
        borderFrame.Name = "BorderFrame"
        borderFrame.Size = UDim2.new(1, 6, 1, 6)
        borderFrame.Position = UDim2.new(0, -3, 0, -3)
        borderFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        borderFrame.BorderSizePixel = 0
        borderFrame.Parent = exampleFrame
        
        local borderGradient = Instance.new("UIGradient")
        borderGradient.Color = Themes.gradients.rainbow
        borderGradient.Rotation = defaultConfig.Number * 45 -- Offset baseado no número
        borderGradient.Parent = borderFrame
        
        local borderCorner = Instance.new("UICorner")
        borderCorner.CornerRadius = UDim.new(0, 15)
        borderCorner.Parent = borderFrame
        
        -- Animar borda
        borderConnection = Animations.animateRainbowBorder(borderGradient)
    end
    
    -- Cabeçalho da moldura
    local headerFrame = Instance.new("Frame")
    headerFrame.Name = "Header"
    headerFrame.Size = UDim2.new(1, 0, 0, 50)
    headerFrame.Position = UDim2.new(0, 0, 0, 0)
    headerFrame.BackgroundColor3 = Themes.colors.sidebarBackground
    headerFrame.BorderSizePixel = 0
    headerFrame.Parent = exampleFrame
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 12)
    headerCorner.Parent = headerFrame
    
    -- Número do exemplo
    local numberLabel = Instance.new("TextLabel")
    numberLabel.Name = "Number"
    numberLabel.Size = UDim2.new(0, 40, 0, 40)
    numberLabel.Position = UDim2.new(0, 10, 0.5, -20)
    numberLabel.BackgroundColor3 = Themes.colors.iconBlue
    numberLabel.BorderSizePixel = 0
    numberLabel.Text = tostring(defaultConfig.Number)
    numberLabel.TextColor3 = Themes.colors.textPrimary
    numberLabel.TextSize = 18
    numberLabel.Font = Enum.Font.GothamBold
    numberLabel.TextXAlignment = Enum.TextXAlignment.Center
    numberLabel.TextYAlignment = Enum.TextYAlignment.Center
    numberLabel.Parent = headerFrame
    
    local numberCorner = Instance.new("UICorner")
    numberCorner.CornerRadius = UDim.new(0.5, 0)
    numberCorner.Parent = numberLabel
    
    -- Título do exemplo
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -120, 1, 0)
    titleLabel.Position = UDim2.new(0, 60, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = defaultConfig.Title
    titleLabel.TextColor3 = Themes.colors.textPrimary
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextYAlignment = Enum.TextYAlignment.Center
    titleLabel.Parent = headerFrame
    
    -- Ícone de exemplo
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "Icon"
    iconLabel.Size = UDim2.new(0, 30, 0, 30)
    iconLabel.Position = UDim2.new(1, -40, 0.5, -15)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = "📋"
    iconLabel.TextSize = 20
    iconLabel.Parent = headerFrame
    
    -- Área de conteúdo
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, -20, 1, -70)
    contentArea.Position = UDim2.new(0, 10, 0, 60)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = exampleFrame
    
    -- Scroll frame para conteúdo longo
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "ScrollFrame"
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.Position = UDim2.new(0, 0, 0, 0)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 6
    scrollFrame.ScrollBarImageColor3 = Themes.colors.iconBlue
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.Parent = contentArea
    
    -- Layout automático para o conteúdo
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 10)
    listLayout.Parent = scrollFrame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 10)
    padding.PaddingRight = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.Parent = scrollFrame
    
    -- Atualizar canvas size automaticamente
    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 20)
    end)
    
    -- Retornar objeto da moldura com métodos úteis
    local frameObject = {
        Frame = exampleFrame,
        ContentArea = scrollFrame,
        Header = headerFrame,
        
        -- Métodos
        SetTitle = function(title)
            titleLabel.Text = title
        end,
        
        SetNumber = function(number)
            numberLabel.Text = tostring(number)
        end,
        
        SetIcon = function(icon)
            iconLabel.Text = icon
        end,
        
        AddTextLabel = function(text, textSize, textColor)
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0, textSize and (textSize + 10) or 30)
            label.BackgroundTransparency = 1
            label.Text = text
            label.TextColor3 = textColor or Themes.colors.textPrimary
            label.TextSize = textSize or 14
            label.Font = Enum.Font.Gotham
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.TextYAlignment = Enum.TextYAlignment.Top
            label.TextWrapped = true
            label.Parent = scrollFrame
            return label
        end,
        
        AddCodeBlock = function(code)
            local codeFrame = Instance.new("Frame")
            codeFrame.Size = UDim2.new(1, 0, 0, 0) -- Altura será ajustada automaticamente
            codeFrame.BackgroundColor3 = Themes.colors.background
            codeFrame.BorderSizePixel = 0
            codeFrame.Parent = scrollFrame
            
            local codeCorner = Instance.new("UICorner")
            codeCorner.CornerRadius = UDim.new(0, 8)
            codeCorner.Parent = codeFrame
            
            local codeLabel = Instance.new("TextLabel")
            codeLabel.Size = UDim2.new(1, -20, 1, 0)
            codeLabel.Position = UDim2.new(0, 10, 0, 0)
            codeLabel.BackgroundTransparency = 1
            codeLabel.Text = code
            codeLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
            codeLabel.TextSize = 12
            codeLabel.Font = Enum.Font.Code
            codeLabel.TextXAlignment = Enum.TextXAlignment.Left
            codeLabel.TextYAlignment = Enum.TextYAlignment.Top
            codeLabel.TextWrapped = true
            codeLabel.Parent = codeFrame
            
            -- Ajustar altura do frame baseado no texto
            local textBounds = game:GetService("TextService"):GetTextSize(
                code, 12, Enum.Font.Code, Vector2.new(codeLabel.AbsoluteSize.X, math.huge)
            )
            codeFrame.Size = UDim2.new(1, 0, 0, textBounds.Y + 20)
            
            return codeFrame
        end,
        
        AddButton = function(text, callback)
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 150, 0, 35)
            button.BackgroundColor3 = Themes.colors.iconBlue
            button.BorderSizePixel = 0
            button.Text = text
            button.TextColor3 = Themes.colors.textPrimary
            button.TextSize = 14
            button.Font = Enum.Font.GothamBold
            button.Parent = scrollFrame
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 8)
            buttonCorner.Parent = button
            
            if callback then
                button.MouseButton1Click:Connect(callback)
            end
            
            return button
        end,
        
        AddSeparator = function()
            local separator = Instance.new("Frame")
            separator.Size = UDim2.new(1, 0, 0, 2)
            separator.BackgroundColor3 = Themes.colors.searchBorder
            separator.BorderSizePixel = 0
            separator.Parent = scrollFrame
            
            local separatorCorner = Instance.new("UICorner")
            separatorCorner.CornerRadius = UDim.new(0, 1)
            separatorCorner.Parent = separator
            
            return separator
        end,
        
        Show = function()
            exampleFrame.Visible = true
        end,
        
        Hide = function()
            exampleFrame.Visible = false
        end,
        
        Destroy = function()
            if borderConnection then
                borderConnection:Disconnect()
            end
            exampleFrame:Destroy()
        end,
        
        SetTheme = function(themeName)
            Themes.applyTheme(themeName)
            exampleFrame.BackgroundColor3 = Themes.colors.cardBackground
            headerFrame.BackgroundColor3 = Themes.colors.sidebarBackground
            titleLabel.TextColor3 = Themes.colors.textPrimary
            numberLabel.BackgroundColor3 = Themes.colors.iconBlue
        end
    }
    
    return frameObject
end

-- Função para criar uma demonstração completa com molduras
function ExampleFrames.createExampleShowcase(parent)
    local showcaseFrame = Instance.new("ScreenGui")
    showcaseFrame.Name = "SapphireLibExampleShowcase"
    showcaseFrame.ResetOnSpawn = false
    showcaseFrame.Parent = parent or game.Players.LocalPlayer.PlayerGui
    
    -- Título principal
    local mainTitle = Instance.new("TextLabel")
    mainTitle.Size = UDim2.new(0, 600, 0, 50)
    mainTitle.Position = UDim2.new(0.5, -300, 0, 20)
    mainTitle.BackgroundTransparency = 1
    mainTitle.Text = "🔷 SapphireLib - Exemplos de Uso 🔷"
    mainTitle.TextColor3 = Themes.colors.textPrimary
    mainTitle.TextSize = 24
    mainTitle.Font = Enum.Font.GothamBold
    mainTitle.TextXAlignment = Enum.TextXAlignment.Center
    mainTitle.Parent = showcaseFrame
    
    -- Exemplo 1: Interface Principal
    local example1 = ExampleFrames.createExampleFrame({
        Title = "Interface Principal Completa",
        Number = 1,
        Size = UDim2.fromOffset(380, 300),
        Position = UDim2.new(0, 50, 0, 100),
        Parent = showcaseFrame,
        Theme = "blue"
    })
    
    example1:AddTextLabel("Cria a interface principal da SapphireLib com loading screen, key system e sidebar:", 14)
    example1:AddCodeBlock([[local SapphireLib = require(script.SapphireLib)
SapphireLib.new(game.Players.LocalPlayer.PlayerGui)]])
    example1:AddButton("Executar Exemplo", function()
        print("Executando exemplo 1...")
    end)
    
    -- Exemplo 2: Janela Personalizada
    local example2 = ExampleFrames.createExampleFrame({
        Title = "Janela Personalizada",
        Number = 2,
        Size = UDim2.fromOffset(380, 350),
        Position = UDim2.new(0.5, 20, 0, 100),
        Parent = showcaseFrame,
        Theme = "amethyst"
    })
    
    example2:AddTextLabel("Cria uma janela personalizada com título, subtítulo e tema:", 14)
    example2:AddCodeBlock([[local myWindow = SapphireLib.CreateWindow({
    Title = "Minha Janela",
    SubTitle = "Exemplo de Uso",
    Size = UDim2.fromOffset(600, 400),
    Acrylic = true,
    Theme = "Blue"
})]])
    example2:AddSeparator()
    example2:AddTextLabel("Adicionar elementos à janela:", 14)
    example2:AddCodeBlock([[local label = Instance.new("TextLabel")
label.Text = "Olá Mundo!"
label.Parent = myWindow.ContentArea]])
    example2:AddButton("Executar Exemplo", function()
        print("Executando exemplo 2...")
    end)
    
    -- Exemplo 3: Temas e Personalização
    local example3 = ExampleFrames.createExampleFrame({
        Title = "Temas e Personalização",
        Number = 3,
        Size = UDim2.fromOffset(380, 280),
        Position = UDim2.new(0, 50, 0, 420),
        Parent = showcaseFrame,
        Theme = "rose"
    })
    
    example3:AddTextLabel("Alterar temas e personalizar a interface:", 14)
    example3:AddCodeBlock([[-- Temas disponíveis: Blue, Red, Amethyst, Rose, Green
myWindow:SetTheme("Red")
myWindow:SetTitle("Novo Título")
myWindow:SetSubTitle("Novo Subtítulo")]])
    example3:AddButton("Testar Temas", function()
        print("Testando temas...")
    end)
    
    -- Exemplo 4: Módulos Avançados
    local example4 = ExampleFrames.createExampleFrame({
        Title = "Módulos Avançados",
        Number = 4,
        Size = UDim2.fromOffset(380, 320),
        Position = UDim2.new(0.5, 20, 0, 420),
        Parent = showcaseFrame,
        Theme = "green"
    })
    
    example4:AddTextLabel("Usar módulos internos da SapphireLib:", 14)
    example4:AddCodeBlock([[-- Sistema de tradução
SapphireLib.Translation.setLanguage("en_US")

-- Sapphire AI
local response = SapphireLib.SapphireAI.sendMessage("Olá!")

-- Sistema de temas
local themes = SapphireLib.Themes.availableThemes]])
    example4:AddButton("Testar Módulos", function()
        print("Testando módulos avançados...")
    end)
    
    return showcaseFrame
end

-- ========================================
-- MÓDULO: WINDOW CREATOR
-- ========================================
local WindowCreator = {}

-- Função para criar uma janela personalizada
function WindowCreator.createWindow(config)
    -- Configurações padrão
    local defaultConfig = {
        Title = "SapphireLib Window",
        SubTitle = "Enhanced UI",
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark",
        Parent = game.Players.LocalPlayer.PlayerGui
    }
    
    -- Mesclar configurações
    for key, value in pairs(config or {}) do
        defaultConfig[key] = value
    end
    
    -- Criar ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SapphireLibWindow"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = defaultConfig.Parent
    
    -- Frame principal da janela
    local windowFrame = Instance.new("Frame")
    windowFrame.Name = "WindowFrame"
    windowFrame.Size = defaultConfig.Size
    windowFrame.Position = UDim2.new(0.5, -defaultConfig.Size.X.Offset/2, 0.5, -defaultConfig.Size.Y.Offset/2)
    windowFrame.BackgroundColor3 = Themes.colors.background
    windowFrame.BorderSizePixel = 0
    windowFrame.Parent = screenGui
    
    -- Aplicar tema se especificado
    if defaultConfig.Theme and defaultConfig.Theme ~= "Dark" then
        Themes.applyTheme(string.lower(defaultConfig.Theme))
        windowFrame.BackgroundColor3 = Themes.colors.background
    end
    
    -- Borda colorida dinâmica
    local borderFrame = Instance.new("Frame")
    borderFrame.Name = "BorderFrame"
    borderFrame.Size = UDim2.new(1, 4, 1, 4)
    borderFrame.Position = UDim2.new(0, -2, 0, -2)
    borderFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    borderFrame.BorderSizePixel = 0
    borderFrame.Parent = windowFrame
    
    local borderGradient = Instance.new("UIGradient")
    borderGradient.Color = Themes.gradients.rainbow
    borderGradient.Rotation = 0
    borderGradient.Parent = borderFrame
    
    -- Animar borda
    Animations.animateRainbowBorder(borderGradient)
    
    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 12)
    borderCorner.Parent = borderFrame
    
    local windowCorner = Instance.new("UICorner")
    windowCorner.CornerRadius = UDim.new(0, 12)
    windowCorner.Parent = windowFrame
    
    -- Efeito Acrylic (simulado com transparência e blur)
    if defaultConfig.Acrylic then
        windowFrame.BackgroundTransparency = 0.1
        
        -- Criar efeito de blur simulado
        local blurFrame = Instance.new("Frame")
        blurFrame.Name = "BlurEffect"
        blurFrame.Size = UDim2.new(1, 0, 1, 0)
        blurFrame.Position = UDim2.new(0, 0, 0, 0)
        blurFrame.BackgroundColor3 = Themes.colors.background
        blurFrame.BackgroundTransparency = 0.3
        blurFrame.BorderSizePixel = 0
        blurFrame.Parent = windowFrame
        
        local blurCorner = Instance.new("UICorner")
        blurCorner.CornerRadius = UDim.new(0, 12)
        blurCorner.Parent = blurFrame
    end
    
    -- Barra de título
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 60)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Themes.colors.cardBackground
    titleBar.BorderSizePixel = 0
    titleBar.Parent = windowFrame
    
    local titleBarCorner = Instance.new("UICorner")
    titleBarCorner.CornerRadius = UDim.new(0, 12)
    titleBarCorner.Parent = titleBar
    
    -- Título principal
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -120, 0, 30)
    titleLabel.Position = UDim2.new(0, 20, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = defaultConfig.Title
    titleLabel.TextColor3 = Themes.colors.textPrimary
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar
    
    -- Subtítulo
    local subTitleLabel = Instance.new("TextLabel")
    subTitleLabel.Name = "SubTitle"
    subTitleLabel.Size = UDim2.new(1, -120, 0, 20)
    subTitleLabel.Position = UDim2.new(0, 20, 0, 32)
    subTitleLabel.BackgroundTransparency = 1
    subTitleLabel.Text = defaultConfig.SubTitle
    subTitleLabel.TextColor3 = Themes.colors.textSecondary
    subTitleLabel.TextSize = 12
    subTitleLabel.Font = Enum.Font.Gotham
    subTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    subTitleLabel.Parent = titleBar
    
    -- Botões de controle da janela
    local controlsFrame = Instance.new("Frame")
    controlsFrame.Name = "Controls"
    controlsFrame.Size = UDim2.new(0, 100, 0, 30)
    controlsFrame.Position = UDim2.new(1, -120, 0, 15)
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.Parent = titleBar
    
    -- Botão de minimizar
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(0, 0, 0, 0)
    minimizeButton.BackgroundColor3 = Themes.colors.buttonBackground
    minimizeButton.BorderSizePixel = 0
    minimizeButton.Text = "−"
    minimizeButton.TextColor3 = Themes.colors.textPrimary
    minimizeButton.TextSize = 16
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.Parent = controlsFrame
    
    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0, 6)
    minimizeCorner.Parent = minimizeButton
    
    -- Botão de fechar
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(0, 35, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "×"
    closeButton.TextColor3 = Themes.colors.textPrimary
    closeButton.TextSize = 18
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = controlsFrame
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = closeButton
    
    -- Área de conteúdo
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, -20, 1, -80)
    contentArea.Position = UDim2.new(0, 10, 0, 70)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = windowFrame
    
    -- Funcionalidade de arrastar janela
    Utils.makeDraggable(windowFrame, titleBar)
    
    -- Eventos dos botões
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    minimizeButton.MouseButton1Click:Connect(function()
        windowFrame.Visible = not windowFrame.Visible
    end)
    
    -- Retornar objeto da janela com métodos úteis
    local windowObject = {
        Frame = windowFrame,
        ScreenGui = screenGui,
        ContentArea = contentArea,
        TitleBar = titleBar,
        
        -- Métodos
        SetTitle = function(title)
            titleLabel.Text = title
        end,
        
        SetSubTitle = function(subtitle)
            subTitleLabel.Text = subtitle
        end,
        
        SetSize = function(size)
            windowFrame.Size = size
            windowFrame.Position = UDim2.new(0.5, -size.X.Offset/2, 0.5, -size.Y.Offset/2)
        end,
        
        SetTheme = function(themeName)
            Themes.applyTheme(string.lower(themeName))
            windowFrame.BackgroundColor3 = Themes.colors.background
            titleBar.BackgroundColor3 = Themes.colors.cardBackground
            titleLabel.TextColor3 = Themes.colors.textPrimary
            subTitleLabel.TextColor3 = Themes.colors.textSecondary
        end,
        
        Show = function()
            screenGui.Enabled = true
        end,
        
        Hide = function()
            screenGui.Enabled = false
        end,
        
        Destroy = function()
            screenGui:Destroy()
        end,
        
        AddElement = function(element)
            element.Parent = contentArea
            return element
        end
    }
    
    return windowObject
end

-- ========================================
-- FUNÇÃO PRINCIPAL
-- ========================================

-- Função principal para criar a interface completa
function SapphireLib.new(parent)
    -- Inicializar sistemas
    SaveSystem.initialize()
    SapphireAI.initialize()
    
    -- Aplicar idioma salvo
    local savedLanguage = SaveSystem.getSetting("language", "pt_BR")
    Translation.setLanguage(savedLanguage)
    
    -- Aplicar tema salvo
    local savedTheme = SaveSystem.getSetting("theme", "default_colorful")
    Themes.applyTheme(savedTheme)
    
    -- Mostrar loading screen primeiro
    LoadingScreen.startLoading(parent, function()
        -- Após o loading, mostrar key system se necessário
        if not KeySystem.isUnlocked() then
            SapphireLib.showKeySystem(parent)
        else
            SapphireLib.showMainInterface(parent)
        end
    end)
    
    return true
end

-- Função para mostrar sistema de chaves
function SapphireLib.showKeySystem(parent)
    local keyFrame = Instance.new("Frame")
    keyFrame.Name = "KeySystemInterface"
    keyFrame.Size = UDim2.new(0, 350, 0, 300)
    keyFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
    keyFrame.BackgroundColor3 = Themes.colors.cardBackground
    keyFrame.BorderSizePixel = 0
    keyFrame.Parent = parent

    -- Borda colorida dinâmica
    local borderFrame = Instance.new("Frame")
    borderFrame.Name = "BorderFrame"
    borderFrame.Size = UDim2.new(1, 4, 1, 4)
    borderFrame.Position = UDim2.new(0, -2, 0, -2)
    borderFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    borderFrame.BorderSizePixel = 0
    borderFrame.Parent = keyFrame

    local borderGradient = Instance.new("UIGradient")
    borderGradient.Color = Themes.gradients.rainbow
    borderGradient.Rotation = 0
    borderGradient.Parent = borderFrame

    -- Animar borda
    Animations.animateRainbowBorder(borderGradient)

    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = CORNER_RADIUS
    borderCorner.Parent = borderFrame

    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = CORNER_RADIUS
    keyCorner.Parent = keyFrame

    -- Título
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -40, 0, 40)
    titleLabel.Position = UDim2.new(0, 20, 0, 20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "SapphireLib " .. Translation.translate("Key System")
    titleLabel.TextColor3 = Themes.colors.textPrimary
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.Parent = keyFrame

    -- Campo de entrada da chave
    local keyInputFrame = Instance.new("Frame")
    keyInputFrame.Name = "KeyInputFrame"
    keyInputFrame.Size = UDim2.new(1, -40, 0, 40)
    keyInputFrame.Position = UDim2.new(0, 20, 0, 140)
    keyInputFrame.BackgroundColor3 = Themes.colors.searchBackground
    keyInputFrame.BorderSizePixel = 0
    keyInputFrame.Parent = keyFrame

    local keyInputCorner = Instance.new("UICorner")
    keyInputCorner.CornerRadius = UDim.new(0, 8)
    keyInputCorner.Parent = keyInputFrame

    local keyInputBox = Instance.new("TextBox")
    keyInputBox.Name = "KeyInputBox"
    keyInputBox.Size = UDim2.new(1, -20, 1, 0)
    keyInputBox.Position = UDim2.new(0, 10, 0, 0)
    keyInputBox.BackgroundTransparency = 1
    keyInputBox.Text = ""
    keyInputBox.PlaceholderText = Translation.translate("Enter your key here") .. "..."
    keyInputBox.TextColor3 = Themes.colors.textPrimary
    keyInputBox.PlaceholderColor3 = Themes.colors.textSecondary
    keyInputBox.TextSize = 14
    keyInputBox.Font = Enum.Font.Gotham
    keyInputBox.TextXAlignment = Enum.TextXAlignment.Center
    keyInputBox.Parent = keyInputFrame

    -- Botão de validação
    local validateButton = Instance.new("TextButton")
    validateButton.Name = "ValidateButton"
    validateButton.Size = UDim2.new(0, 120, 0, 35)
    validateButton.Position = UDim2.new(0.5, -60, 0, 200)
    validateButton.BackgroundColor3 = Themes.colors.iconBlue
    validateButton.BorderSizePixel = 0
    validateButton.Text = Translation.translate("Validate Key")
    validateButton.TextColor3 = Themes.colors.textPrimary
    validateButton.TextSize = 14
    validateButton.Font = Enum.Font.GothamBold
    validateButton.Parent = keyFrame

    local validateCorner = Instance.new("UICorner")
    validateCorner.CornerRadius = UDim.new(0, 8)
    validateCorner.Parent = validateButton

    -- Conectar evento de validação
    validateButton.MouseButton1Click:Connect(function()
        local key = keyInputBox.Text
        local success, message = KeySystem.validateKey(key)
        
        if success then
            -- Salvar chave se auto-login estiver habilitado
            if SaveSystem.getSetting("autoLogin", false) then
                SaveSystem.setSetting("rememberedKey", key)
            end
            
            -- Fechar key system e mostrar interface principal
            keyFrame:Destroy()
            SapphireLib.showMainInterface(parent)
        else
            print("Erro de validação: " .. message)
        end
    end)
end

-- Função para mostrar interface principal
function SapphireLib.showMainInterface(parent)
    local ui = Instance.new("ScreenGui")
    ui.Parent = parent
    ui.Name = "SapphireLibUI"
    ui.ResetOnSpawn = false

    -- Criar frame principal com borda rainbow
    local mainFrame = Components.createMainFrame(ui)
    local borderFrame = mainFrame:FindFirstChild("BorderFrame")
    if borderFrame then
        local borderGradient = borderFrame:FindFirstChildOfClass("UIGradient")
        if borderGradient then
            Animations.animateRainbowBorder(borderGradient)
        end
    end
    
    -- Criar barra de pesquisa
    local searchBar = Components.createSearchBar(mainFrame)
    
    -- Criar título
    local title = Components.createTitle(mainFrame)
    
    -- Criar botão de menu
    local menuButton = Components.createMenuButton(mainFrame)
    
    -- Criar sidebar
    local sidebar = Components.createSidebar(mainFrame)
    
    -- Criar área de conteúdo
    local contentArea = Components.createContentArea(mainFrame)
    
    -- Conectar eventos
    Events.connectSidebarNavigation(sidebar)
    Events.connectSearchBar(searchBar)
    
    -- Criar ToggleButton de imagem com ID especificado
    local imageToggle = Components.createImageToggleButton(
        mainFrame, 
        "103313795004373", 
        UDim2.new(0, 60, 0, 60), 
        UDim2.new(1, -80, 1, -80),
        contentArea -- Passando contentArea como targetElement
    )
    -- Animar borda do ToggleButton
    local toggleBorderGradient = imageToggle:FindFirstChildOfClass("UIGradient")
    if toggleBorderGradient then
        Animations.animateRainbowBorder(toggleBorderGradient)
    end
    
    return ui
end

-- Função para obter informações da biblioteca
function SapphireLib.getInfo()
    return {
        name = "SapphireLib",
        version = "1.0.0",
        author = "SapphireLib Team",
        description = "Biblioteca UI avançada para Lua/Luau com funcionalidades modernas",
        features = {
            "Interface moderna com bordas coloridas dinâmicas",
            "Sistema de IA (Sapphire AI)",
            "Reprodutor de mídia completo",
            "Sistema de chaves de acesso",
            "Ícones Lucide integrados",
            "Loading screen animado",
            "Sistema de save settings",
            "Sistema de temas",
            "Sistema de tradução",
            "Discord/Site invites",
            "Auto-load",
            "Suporte a executores",
            "Sistema de developers",
            "Emojis animados"
        }
    }
end

-- Exportar módulos para acesso externo
SapphireLib.Themes = Themes
SapphireLib.Utils = Utils
SapphireLib.Animations = Animations
SapphireLib.SearchData = SearchData
SapphireLib.SapphireAI = SapphireAI
SapphireLib.KeySystem = KeySystem
SapphireLib.MediaPlayer = MediaPlayer
SapphireLib.LucideIcons = LucideIcons
SapphireLib.LoadingScreen = LoadingScreen
SapphireLib.SaveSystem = SaveSystem
SapphireLib.Translation = Translation
SapphireLib.Components = Components
SapphireLib.Events = Events
SapphireLib.CreateWindow = WindowCreator.createWindow
SapphireLib.CreateExampleFrame = ExampleFrames.createExampleFrame
SapphireLib.CreateExampleShowcase = ExampleFrames.createExampleShowcase

return SapphireLib

