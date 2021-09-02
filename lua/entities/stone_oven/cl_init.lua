include("shared.lua")
include("tfm_config.lua")
OVENS = OVENS or {}

function ENT:Initialize()
    self.csModel = ClientsideModel("models/stands/stoneoven/stoneoven.mdl")
    self.csModel:SetPos(self:GetPos())
    self.csModel:SetAngles(self:GetAngles())
    self.csModel:SetParent(self)
    self.csModel:SetNoDraw(true)
    OVENS[self:EntIndex()] = self
    self.making = false
end

local function TFM_OVEN_UI(oven)
    local bg = vgui.Create("DPanel")
    bg:SetSize(ScrW(), ScrH())
    bg:Dock(FILL)

    bg.Paint = function(self, w, h)
        surface.SetDrawColor(0, 0, 0, 200)
        surface.DrawRect(0, 0, w, h)
    end

    local MainOvenMenu = vgui.Create("DFrame", bg)
    MainOvenMenu:SetSize(ScrW() / 2, ScrH() / 2)
    MainOvenMenu:Center()
    MainOvenMenu:SetTitle("")
    MainOvenMenu:MakePopup()
    MainOvenMenu:ShowCloseButton()

    MainOvenMenu.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(41, 37, 37, 255))
    end

    MainOvenMenu.OnClose = function()
        bg:Remove()
    end

    local close_MainOvenMenu = vgui.Create("DButton", MainOvenMenu)
    close_MainOvenMenu:SetSize(ScrW() / 20, ScrH() / 30)
    close_MainOvenMenu:SetPos(ScrW() * 0.43, ScrH() * 0.43)
    close_MainOvenMenu:SetText("Kapat")

    close_MainOvenMenu.DoClick = function()
        MainOvenMenu:Remove()
        bg:Remove()
    end

    close_MainOvenMenu.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255))
            draw.RoundedBox(8, 0, 0, w, h, Color(233, 116, 116, 100))
        else
            self:SetColor(Color(83, 83, 83))
            draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255, 10))
        end
    end

    local ekmek_bg = vgui.Create("DPanel", MainOvenMenu)
    ekmek_bg:SetPos(ScrW() * 0.05, ScrH() * 0.05)
    ekmek_bg:SetSize(150, 150)

    ekmek_bg.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255, 10))
    end

    local ekmek_mdl = vgui.Create("DModelPanel", ekmek_bg)
    ekmek_mdl:SetSize(350, 350)
    ekmek_mdl:SetPos(-100, -220)
    ekmek_mdl:SetModel("models/foods/ekmek/ekmek.mdl")
    local pide_bg = vgui.Create("DPanel", MainOvenMenu)
    pide_bg:SetPos(ScrW() * 0.2, ScrH() * 0.05)
    pide_bg:SetSize(150, 150)

    pide_bg.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255, 10))
    end

    local pide_mdl = vgui.Create("DModelPanel", pide_bg)
    pide_mdl:SetSize(350, 350)
    pide_mdl:SetPos(-100, -220)
    pide_mdl:SetModel("models/foods/pide/pide.mdl")
    local lahmacun_bg = vgui.Create("DPanel", MainOvenMenu)
    lahmacun_bg:SetPos(ScrW() * 0.35, ScrH() * 0.05)
    lahmacun_bg:SetSize(150, 150)

    lahmacun_bg.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255, 10))
    end

    local lahmacun_mdl = vgui.Create("DModelPanel", lahmacun_bg)
    lahmacun_mdl:SetSize(350, 350)
    lahmacun_mdl:SetPos(-100, -220)
    lahmacun_mdl:SetModel("models/foods/lahmacun/lahmacun.mdl")
    local buy_ekmek = vgui.Create("DButton", MainOvenMenu)
    buy_ekmek:SetSize(ScrW() / 15, ScrH() / 30)
    buy_ekmek:SetPos(ScrW() * 0.075, ScrH() * 0.3)
    buy_ekmek:SetText(TFM.Stands["stone_oven"].info_of_foods[1].price .. " TL")

    buy_ekmek.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(79, 255, 93))
            draw.RoundedBox(8, 0, 0, w, h, Color(128, 252, 159, 100))
        else
            self:SetColor(Color(114, 114, 114))
            draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255, 10))
        end
    end

    local buy_pide = vgui.Create("DButton", MainOvenMenu)
    buy_pide:SetSize(ScrW() / 15, ScrH() / 30)
    buy_pide:SetPos(ScrW() * 0.225, ScrH() * 0.3)
    buy_pide:SetText(TFM.Stands["stone_oven"].info_of_foods[2].price .. " TL")

    buy_pide.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(79, 255, 93))
            draw.RoundedBox(8, 0, 0, w, h, Color(128, 252, 159, 100))
        else
            self:SetColor(Color(114, 114, 114))
            draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255, 10))
        end
    end

    local buy_lahmacun = vgui.Create("DButton", MainOvenMenu)
    buy_lahmacun:SetSize(ScrW() / 15, ScrH() / 30)
    buy_lahmacun:SetPos(ScrW() * 0.375, ScrH() * 0.3)
    buy_lahmacun:SetText(TFM.Stands["stone_oven"].info_of_foods[3].price .. " TL")

    buy_lahmacun.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(79, 255, 93))
            draw.RoundedBox(8, 0, 0, w, h, Color(128, 252, 159, 100))
        else
            self:SetColor(Color(114, 114, 114))
            draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255, 10))
        end
    end

    buy_ekmek.DoClick = function()
        net.Start("tfm_stone_oven_network")
        net.WriteEntity(oven)
        net.WriteUInt(1, 2)
        net.SendToServer()
        bg:Remove()
    end

    buy_pide.DoClick = function()
        net.Start("tfm_stone_oven_network")
        net.WriteEntity(oven)
        net.WriteUInt(2, 2)
        net.SendToServer()
        bg:Remove()
    end

    buy_lahmacun.DoClick = function()
        net.Start("tfm_stone_oven_network")
        net.WriteEntity(oven)
        net.WriteUInt(3, 2)
        net.SendToServer()
        bg:Remove()
    end
end

net.Receive("tfm_stone_oven_network", function(len, pl)
    local oven = net.ReadEntity()
    local read_oven_flags = net.ReadUInt(3)

    if read_oven_flags == 1 then
        TFM_OVEN_UI(oven)
    elseif read_oven_flags == 2 then
        oven.making = true
    elseif read_oven_flags >= 3 or read_oven_flags <= 5 then
        oven.making = false
    end
end)

hook.Add("PreDrawTranslucentRenderables", "StoneOvenStencil", function(depth, skybox)
    if skybox then return end

    for k, s in pairs(OVENS) do
        if not IsValid(s) then continue end
        s.csModel:DrawModel()
        render.ClearStencil()
        render.SetStencilEnable(true)
        render.SetStencilWriteMask(255)
        render.SetStencilTestMask(255)
        render.SetStencilReferenceValue(57)
        render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS)
        render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
        local angle = s:GetAngles()
        angle:RotateAroundAxis(angle:Right(), -90)
        angle:RotateAroundAxis(angle:Forward(), -90)
        cam.Start3D2D(s:GetPos() - (s:GetAngles():Up() * -10) + (s:GetAngles():Forward() * 5) + (s:GetAngles():Right() * -4), angle, 0.5)
        draw.NoTexture()
        draw.RoundedBox(0, -73 / 2, -114 / 2, 56, 115, Color(255, 255, 255, 1))
        cam.End3D2D()
        render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
        render.SuppressEngineLighting(true)
        --render.DepthRange(0, 0.9999)
        render.OverrideDepthEnable(true, false)
        cam.IgnoreZ(true)
        s.csModel:DrawModel()
        cam.IgnoreZ(false)
        render.OverrideDepthEnable(false, false)
        render.SuppressEngineLighting(false)
        render.OverrideDepthEnable(false, true)
    end

    render.SetStencilEnable(false)
end)

function ENT:Draw()
    if self.making then
        for k, s in pairs(OVENS) do
            s.dlight = DynamicLight(s:EntIndex())

            if (s.dlight) then
                s.dlight.pos = s:GetPos() + (s:GetAngles():Forward() * 10) + (s:GetAngles():Up() * 10)
                s.dlight.r = 255
                s.dlight.g = 100
                s.dlight.b = 0
                s.dlight.brightness = 8
                s.dlight.Decay = 0
                s.dlight.Size = 100
                s.dlight.DieTime = CurTime() + 0.5
            end
        end
    end
end