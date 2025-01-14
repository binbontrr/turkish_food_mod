include("shared.lua")
include("tfm_config.lua")

surface.CreateFont("ice-stand_f1", {
    font = "Arial",
    extended = false,
    size = ScrW() / 60,
    weight = 555,
})

local tfm_colors = {
    ["white"] = Color(255, 255, 255),
    ["white_fade"] = Color(255, 255, 255, 200),
    ["black"] = Color(0, 0, 0),
    ["black_fade"] = Color(0, 0, 0, 200),
}

local function TFM_ICECREEM_UI(stand)
    local button_sound = CreateSound(LocalPlayer(), Sound("fm_button1.wav"))
    local ice_creem_menu = vgui.Create("DPanel")
    local scrw, scrh = ScrW(), ScrH()
    ice_creem_menu:SetSize(scrw / 4, scrh / 2)
    ice_creem_menu:SetPos(scrw / 2 - ice_creem_menu:GetWide() / 2, scrh / 1.5)
    ice_creem_menu:MakePopup()
    ice_creem_menu:MoveTo(scrw / 2 - ice_creem_menu:GetWide() / 2, scrh / 2 - ice_creem_menu:GetTall() / 2, 1, 0, -1)

    ice_creem_menu.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(63, 36, 36))
    end

    local calsinmi = math.random(1, 4)

    if calsinmi == 1 then
        surface.PlaySound("onelan.mp3")
    end

    local close_icecreem = vgui.Create("DButton", ice_creem_menu)
    close_icecreem:SetSize(scrw * 0.02, scrh * 0.02)
    close_icecreem:SetPos(scrw * 0.22, scrh * 0.01)
    close_icecreem:SetText("x")

    close_icecreem.DoClick = function()
        ice_creem_menu:Remove()
        button_sound:Play()
    end

    close_icecreem.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6, 0, 0, w, h, Color(168, 36, 36))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end

    local report_btn = vgui.Create("DButton", ice_creem_menu)
    report_btn:SetSize(scrw * 0.05, scrh * 0.04)
    report_btn:SetPos(scrw * 0.01, scrh * 0.01)
    report_btn:SetColor(tfm_colors["white"])
    report_btn:SetText("Hata Bildir")

    report_btn.DoClick = function()
        ice_creem_menu:Remove()
        button_sound:Play()
        gui.OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=2073492700")
    end

    report_btn.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6, 0, 0, w, h, Color(255, 215, 128))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end

    local coco_buy_creem = vgui.Create("DButton", ice_creem_menu)
    coco_buy_creem:SetSize(scrw / 10, scrh / 20)
    coco_buy_creem:SetPos(scrw * 0.08, scrh * 0.02)
    coco_buy_creem:SetColor(tfm_colors["white"])
    coco_buy_creem:SetText("Çikolatalı")

    coco_buy_creem.DoClick = function()
        net.Start("tfm_icecreem_network")
        net.WriteEntity(stand)
        net.WriteUInt(1, 4)
        net.SendToServer()
        button_sound:Play()
        ice_creem_menu:Remove()
    end

    coco_buy_creem.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6, 0, 0, w, h, Color(78, 58, 40))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end

    local sade_buy_creem = vgui.Create("DButton", ice_creem_menu)
    sade_buy_creem:SetSize(scrw / 10, scrh / 20)
    sade_buy_creem:SetPos(scrw * 0.08, scrh * 0.08)
    sade_buy_creem:SetColor(tfm_colors["white"])
    sade_buy_creem:SetText("Sade")

    sade_buy_creem.DoClick = function()
        net.Start("tfm_icecreem_network")
        net.WriteEntity(stand)
        net.WriteUInt(2, 4)
        net.SendToServer()
        button_sound:Play()
        ice_creem_menu:Remove()
    end

    sade_buy_creem.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6, 0, 0, w, h, Color(255, 175, 175))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end

    local green_buy_creem = vgui.Create("DButton", ice_creem_menu)
    green_buy_creem:SetSize(scrw / 10, scrh / 20)
    green_buy_creem:SetPos(scrw * 0.08, scrh * 0.14)
    green_buy_creem:SetColor(tfm_colors["white"])
    green_buy_creem:SetText("Fıstıklı")

    green_buy_creem.DoClick = function()
        net.Start("tfm_icecreem_network")
        net.WriteEntity(stand)
        net.WriteUInt(3, 4)
        net.SendToServer()
        button_sound:Play()
        ice_creem_menu:Remove()
    end

    green_buy_creem.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6, 0, 0, w, h, Color(95, 248, 95))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end

    local berry_buy_creem = vgui.Create("DButton", ice_creem_menu)
    berry_buy_creem:SetSize(scrw / 10, scrh / 20)
    berry_buy_creem:SetPos(scrw * 0.08, scrh * 0.20)
    berry_buy_creem:SetColor(tfm_colors["white"])
    berry_buy_creem:SetText("Çilekli")

    berry_buy_creem.DoClick = function()
        net.Start("tfm_icecreem_network")
        net.WriteEntity(stand)
        net.WriteUInt(4, 4)
        net.SendToServer()
        button_sound:Play()
        ice_creem_menu:Remove()
    end

    berry_buy_creem.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6, 0, 0, w, h, Color(255, 16, 96))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end

    local erik_buy_creem = vgui.Create("DButton", ice_creem_menu)
    erik_buy_creem:SetSize(scrw / 10, scrh / 20)
    erik_buy_creem:SetPos(scrw * 0.08, scrh * 0.26)
    erik_buy_creem:SetColor(tfm_colors["white"])
    erik_buy_creem:SetText("Anjelika Erikli")

    erik_buy_creem.DoClick = function()
        net.Start("tfm_icecreem_network")
        net.WriteEntity(stand)
        net.WriteUInt(5, 4)
        net.SendToServer()
        button_sound:Play()
        ice_creem_menu:Remove()
    end

    erik_buy_creem.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6, 0, 0, w, h, Color(250, 48, 48))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end

    local muz_buy_creem = vgui.Create("DButton", ice_creem_menu)
    muz_buy_creem:SetSize(scrw / 10, scrh / 20)
    muz_buy_creem:SetPos(scrw * 0.08, scrh * 0.32)
    muz_buy_creem:SetColor(tfm_colors["white"])
    muz_buy_creem:SetText("Muzlu")

    muz_buy_creem.DoClick = function()
        net.Start("tfm_icecreem_network")
        net.WriteEntity(stand)
        net.WriteUInt(6, 4)
        net.SendToServer()
        button_sound:Play()
        ice_creem_menu:Remove()
    end

    muz_buy_creem.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(145, 145, 145))
            draw.RoundedBox(6, 0, 0, w, h, Color(255, 255, 117))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end

    local jungle_buy_creem = vgui.Create("DButton", ice_creem_menu)
    jungle_buy_creem:SetSize(scrw / 10, scrh / 20)
    jungle_buy_creem:SetPos(scrw * 0.08, scrh * 0.38)
    jungle_buy_creem:SetColor(tfm_colors["white"])
    jungle_buy_creem:SetText("Orman Meyveli")

    jungle_buy_creem.DoClick = function()
        net.Start("tfm_icecreem_network")
        net.WriteEntity(stand)
        net.WriteUInt(7, 4)
        net.SendToServer()
        button_sound:Play()
        ice_creem_menu:Remove()
    end

    jungle_buy_creem.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(187, 187, 187))
            draw.RoundedBox(6, 0, 0, w, h, Color(151, 247, 247))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end

    local kivi_buy_creem = vgui.Create("DButton", ice_creem_menu)
    kivi_buy_creem:SetSize(scrw / 10, scrh / 20)
    kivi_buy_creem:SetPos(scrw * 0.08, scrh * 0.44)
    kivi_buy_creem:SetColor(tfm_colors["white"])
    kivi_buy_creem:SetText("Kivili")

    kivi_buy_creem.DoClick = function()
        net.Start("tfm_icecreem_network")
        net.WriteEntity(stand)
        net.WriteUInt(8, 4)
        net.SendToServer()
        button_sound:Play()
        ice_creem_menu:Remove()
    end

    kivi_buy_creem.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255))
            draw.RoundedBox(6, 0, 0, w, h, Color(13, 102, 13))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6, 0, 0, w, h, Color(92, 51, 51))
        end
    end
end

function ENT:Initialize()
    self.start = false
    self.delay = 0
    self.cache = 0
    self.n = TFM.Stands["ice_stand"].time_of_icecreems or 15
    self.icecreem_name = "ERROR"
    self.icecreem_clr = Color(255, 0, 0)
end

net.Receive("tfm_icecreem_network", function(len, pl)
    local stand = net.ReadEntity()
    local read_ice_flag = net.ReadUInt(4)
    local read_ice_onstart = net.ReadUInt(4)

    if read_ice_flag == 1 then
        TFM_ICECREEM_UI(stand)
    elseif read_ice_flag == 10 and read_ice_onstart then
        stand.icecreem_name = TFM.Stands["ice_stand"].icecreem_colors[read_ice_onstart].name
        stand.icecreem_clr = TFM.Stands["ice_stand"].icecreem_colors[read_ice_onstart].clr
        stand.start = true
        stand.cache = CurTime() + stand.n
    elseif read_ice_flag >= 2 and read_ice_flag <= 9 then
        stand.start = false
        stand.delay = 0
    end
end)

local roundedboxcolor_cache, drawsimpletextcolor_cache = Color(0, 0, 0, 200), Color(255, 255, 255)

function ENT:Draw()
    self:DrawModel()

    if self.start then
        if self.delay > self.cache then return end
        self.delay = CurTime() + 1
        local ang = LocalPlayer():EyeAngles()
        local scrw, scrh, math_round = ScrW(), ScrH(), math.Round(self.cache - self.delay)
        ang = Angle(0, ang.y, 0)
        ang:RotateAroundAxis(ang:Forward(), 180)
        ang:RotateAroundAxis(ang:Right(), 90)
        ang:RotateAroundAxis(ang:Up(), 90)
        cam.Start3D2D(self:WorldSpaceCenter(), ang, 0.1)
        draw.RoundedBox(10, scrw - 1600, scrh - 1500, scrw * 0.4, scrh * 0.2, roundedboxcolor_cache)
        draw.SimpleText(self.icecreem_name .. " Aromalı Dondurma Hazırlanıyor... " .. math_round .. " saniye", "ice-stand_f1", scrw - 1350, scrh - 1450, drawsimpletextcolor_cache, 1, 1)
        draw.RoundedBox(10, scrw - 1580, scrh - 1400, (math_round) * (510 / self.n), scrh * 0.05, self.icecreem_clr)
        cam.End3D2D()
    end
end

function ENT:OnRemove()
    self.delay = 0
end