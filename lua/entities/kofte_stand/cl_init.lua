sound.Add({
    name = "ali_usta",
    channel = CHAN_STATIC,
    volume = 1.0,
    level = 80,
    pitch = {100, 100},
    sound = "ali_usta.mp3"
})

include("shared.lua")
include("tfm_config.lua")

surface.CreateFont("kofte_durum_f1", {
    font = "Arial",
    extended = false,
    size = ScrW() / 60,
    weight = 555,
})

local function TFM_CIFKOFTE_UI()
    local kofte_stand = vgui.Create("DPanel")
    kofte_stand:SetSize(ScrW() / 4, ScrH() / 4)
    kofte_stand:MakePopup()
    kofte_stand:Center()

    kofte_stand.Paint = function(self, w, h)
        draw.RoundedBox(8,0,0,w,h,Color(63, 36, 36))
    end

    local calsinmi = math.random(1, 6)

    if calsinmi == 1 then
        surface.PlaySound("ali_usta_detone.mp3")
    end

    local kofte_durum_create = vgui.Create("DButton", kofte_stand)
    kofte_durum_create:SetSize(ScrW() / 5, ScrH() / 15)
    kofte_durum_create:SetPos(kofte_stand:GetWide() / 10, kofte_stand:GetTall() / 6)
    kofte_durum_create:SetColor(Color(255, 255, 255))
    kofte_durum_create:SetText("Sade Dürüm " .. TFM.Stands["kofte_stand"].price_normal .. " TL")
    kofte_durum_create:SetFont("kofte_durum_f1")

    kofte_durum_create.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6,0,0,w,h,Color(255, 150, 0, 255))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6,0,0,w,h,Color(92, 51, 51))
        end
    end

    kofte_durum_create.DoClick = function()
        net.Start("tfm_cigkofte_network")
        net.WriteUInt(1,2)
        net.SendToServer()
        kofte_stand:Remove()
    end

    local hot_kofte_durum_create = vgui.Create("DButton", kofte_stand)
    hot_kofte_durum_create:SetSize(ScrW() / 5, ScrH() / 15)
    hot_kofte_durum_create:SetPos(kofte_stand:GetWide() / 10, kofte_stand:GetTall() / 2)
    hot_kofte_durum_create:SetColor(Color(255, 255, 255))
    hot_kofte_durum_create:SetText("Acılı Dürüm " .. TFM.Stands["kofte_stand"].price_normal .. " TL")
    hot_kofte_durum_create:SetFont("kofte_durum_f1")

    hot_kofte_durum_create.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6,0,0,w,h,Color(255, 0, 0, 255))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6,0,0,w,h,Color(92, 51, 51))
        end
    end

    hot_kofte_durum_create.DoClick = function()
        net.Start("tfm_cigkofte_network")
        net.WriteUInt(2,2)
        net.SendToServer()
        kofte_stand:Remove()
    end

    local kofte_stand_close = vgui.Create("DButton", kofte_stand)
    kofte_stand_close:SetSize(ScrW() * 0.02, ScrH() * 0.02)
    kofte_stand_close:SetPos(ScrW() * 0.225,ScrH() * 0.01)
    kofte_stand_close:SetText("x")

    kofte_stand_close.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(4,0,0,w,h,Color(168, 36, 36))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(4,0,0,w,h,Color(92, 51, 51))
        end
    end

    kofte_stand_close.DoClick = function()
        kofte_stand:Remove()
    end
end

net.Receive("tfm_cigkofte_network", function(len, pl)
    TFM_CIFKOFTE_UI()
end)

ENT.ilerkisure = 0

function ENT:Draw()
    self:DrawModel()

    if self:GetNWString("kofte_stand_nw1", "0") ~= "0" then
        --net.Start("kofte_stand_freezeowner_true")
        --net.SendToServer()
        if self.ilerkisure == 0 then
            self.ilerkisure = CurTime() + tonumber(self:GetNWString("kofte_stand_nw1", "0"))
        end

        local ang = LocalPlayer():EyeAngles()
        ang = Angle(0, ang.y, 0)
        --local random_times = math.Remap(60, 7, 60, 7, 20)
        local sure = math.Remap(tonumber(self:GetNWString("kofte_stand_nw1", "0")) - (self.ilerkisure - CurTime()), 0, tonumber(self:GetNWString("kofte_stand_nw1", "0")), 0, 10) * 50
        ang:RotateAroundAxis(ang:Forward(), 180)
        ang:RotateAroundAxis(ang:Right(), 90)
        ang:RotateAroundAxis(ang:Up(), 90)
        cam.Start3D2D(self:WorldSpaceCenter() + Vector(0, 0, -7), ang, 0.1)
        draw.RoundedBox(10, ScrW() - 1600, ScrH() - 1500, ScrW() * 0.4, ScrH() * 0.2, Color(0, 0, 0, 200))
        draw.SimpleText("Dürüm Hazırlanıyor..." .. self:GetNWString("kofte_stand_nw1", "0") .. " saniye", "kofte_durum_f1", ScrW() - 1300, ScrH() - 1450, Color(255, 255, 255, 255), 1, 1)
        draw.RoundedBox(10, ScrW() - 1580, ScrH() - 1400, sure, ScrH() * 0.05, Color(255, 0, 0))
        cam.End3D2D()
    else
        self.ilerkisure = 0
        --net.Start("kofte_stand_freezeowner_false")
        --net.SendToServer()
    end
end
