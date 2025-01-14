include("shared.lua")
include("tfm_config.lua")

local tfm_colors = {
    ["white"] = Color(255, 255, 255),
    ["white_fade"] = Color(255, 255, 255, 200),
    ["black"] = Color(0, 0, 0),
    ["black_fade"] = Color(0, 0, 0, 200),
}

local function TFM_PILAV_UI(button_sound,stand)
    local pilav_menu = vgui.Create("DPanel")
    local scrw, scrh = ScrW(), ScrH()
    pilav_menu:SetSize(scrw / 4, scrh / 4)
    pilav_menu:Center()
    pilav_menu:MakePopup()

    pilav_menu.Paint = function(self, w, h)
        draw.RoundedBox(8,0,0,w,h,Color(63, 36, 36))
    end

    local close_pilav_menu = vgui.Create("DButton", pilav_menu)
    close_pilav_menu:SetSize(scrw * 0.02, scrh * 0.02)
    close_pilav_menu:SetPos(scrw * 0.22, scrh * 0.01)
    close_pilav_menu:SetColor(tfm_colors["white"])
    close_pilav_menu:SetText("x")

    close_pilav_menu.DoClick = function()
        pilav_menu:Remove()
        button_sound:Play()
    end

    close_pilav_menu.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6,0,0,w,h,Color(168, 36, 36))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6,0,0,w,h,Color(92, 51, 51))
        end
    end

    local report_btn = vgui.Create("DButton", pilav_menu)
    report_btn:SetSize(scrw * 0.05, scrh * 0.04)
    report_btn:SetPos(scrw * 0.01, scrh * 0.01)
    report_btn:SetText("Hata Bildir")

    report_btn.DoClick = function()
        pilav_menu:Remove()
        button_sound:Play()
        gui.OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=2073492700")
    end

    report_btn.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(255, 255, 255, 255))
            draw.RoundedBox(6,0,0,w,h,Color(255, 215, 128))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6,0,0,w,h,Color(92, 51, 51))
        end
    end

    local sade_buy = vgui.Create("DButton", pilav_menu)
    sade_buy:SetSize(scrw / 10, scrh / 20)
    sade_buy:SetPos(scrw * 0.08, scrh * 0.04)
    sade_buy:SetColor(tfm_colors["white"])
    sade_buy:SetText("Sade Pilav")

    sade_buy.DoClick = function()
        net.Start("tfm_pilav_network")
        net.WriteEntity(stand)
        net.WriteUInt(1,3)
        net.WriteEntity(stand)
        net.SendToServer()
        button_sound:Play()
        pilav_menu:Remove()
    end

    sade_buy.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(146, 146, 146))
            draw.RoundedBox(6,0,0,w,h,Color(255, 234, 190))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6,0,0,w,h,Color(92, 51, 51))
        end
    end

    local nohutlu_pilav = vgui.Create("DButton", pilav_menu)
    nohutlu_pilav:SetSize(scrw / 10, scrh / 20)
    nohutlu_pilav:SetPos(scrw * 0.08, scrh * 0.1)
    nohutlu_pilav:SetColor(tfm_colors["white"])
    nohutlu_pilav:SetText("Nohutlu Pilav")

    nohutlu_pilav.DoClick = function()
        net.Start("tfm_pilav_network")
        net.WriteEntity(stand)
        net.WriteUInt(2,3)
        net.WriteEntity(stand)
        net.SendToServer()
        button_sound:Play()
        pilav_menu:Remove()
    end

    nohutlu_pilav.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(146, 146, 146))
            draw.RoundedBox(6,0,0,w,h,Color(255, 234, 190))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6,0,0,w,h,Color(92, 51, 51))
        end
    end

    local tavuklu_pilav = vgui.Create("DButton", pilav_menu)
    tavuklu_pilav:SetSize(scrw / 10, scrh / 20)
    tavuklu_pilav:SetPos(scrw * 0.08, scrh * 0.16)
    tavuklu_pilav:SetColor(tfm_colors["white"])
    tavuklu_pilav:SetText("Tavuklu Pilav")

    tavuklu_pilav.DoClick = function()
        net.Start("tfm_pilav_network")
        net.WriteEntity(stand)
        net.WriteUInt(3,3)
        net.WriteEntity(stand)
        net.SendToServer()
        button_sound:Play()
        pilav_menu:Remove()
    end

    tavuklu_pilav.Paint = function(self, w, h)
        if self:IsHovered() then
            self:SetColor(Color(146, 146, 146))
            draw.RoundedBox(6,0,0,w,h,Color(255, 234, 190))
        else
            self:SetColor(Color(255, 255, 255, 10))
            draw.RoundedBox(6,0,0,w,h,Color(92, 51, 51))
        end
    end
end

function ENT:Initialize()
    self.start = false
    self.delay = 0
    self.cache = 0
    self.n = TFM.Stands["pilav_stand"].time_of_pilavs or 15
    self.icecreem_name = "ERROR"
end

net.Receive("tfm_pilav_network", function(len, pl)
    local stand = net.ReadEntity()
    local read_pilav_flag = net.ReadUInt(3)
    local read_pilav_name = net.ReadUInt(3)
    if read_pilav_flag == 1 then
        local button_sound = CreateSound(LocalPlayer(), Sound("fm_button1.wav"))
        TFM_PILAV_UI(button_sound,stand)
    elseif read_pilav_flag == 2 and read_pilav_name then
        stand.pilav_name = TFM.Stands["pilav_stand"].info_of_pilavs[read_pilav_name].name
        stand.start = true
        stand.cache = CurTime() + stand.n
    elseif read_pilav_flag >= 2 and read_pilav_flag <= 5 then
        stand.start = false
        stand.delay = 0
    end
end)
local drawroundedboxcolor_cache, drawsimpletextcolor_cache = Color(0, 0, 0, 200), Color(255, 255, 255)
function ENT:Draw()
    self:DrawModel()
    if self.start then
        if self.delay > self.cache then return end
        self.delay = CurTime() + 1
        local mathdelay = math.Round(self.cache - self.delay) 
        local ang = LocalPlayer():EyeAngles()
        ang = Angle(0, ang.y, 0)
        ang:RotateAroundAxis(ang:Forward(), 180)
        ang:RotateAroundAxis(ang:Right(), 90)
        ang:RotateAroundAxis(ang:Up(), 90)
        cam.Start3D2D(self:WorldSpaceCenter(), ang, 0.1)
        draw.RoundedBox(10, scrw - 1600, scrh - 1500, scrw * 0.4, scrh * 0.2, drawroundedboxcolor_cache)
        draw.SimpleText(self.pilav_name .. " Pilav Hazırlanıyor... " .. mathdelay .. " saniye", "ice-stand_f1", scrw - 1350, scrh - 1450, drawsimpletextcolor_cache, 1, 1)
        draw.RoundedBox(10, scrw - 1580, scrh - 1400,mathdelay * (510 / self.n), scrh * 0.05, tfm_colors["white"])
        cam.End3D2D()
    end
end

function ENT:OnRemove()
    self.delay = 0
end
