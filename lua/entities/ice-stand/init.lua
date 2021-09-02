local antispamsystem = {}
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("tfm_config.lua")
util.AddNetworkString("tfm_icecreem_network")

function ENT:Initialize()
    self:SetModel(TFM.Stands["ice_stand"].model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:PhysWake()
    self.making = false
end

function ENT:Use(act, call)
    if DarkRP then
        if not self.making and act:Team() == TEAM_DONDURMACI then
            net.Start("tfm_icecreem_network")
            net.WriteEntity(self)
            net.WriteUInt(1, 4)
            net.Send(act)
        end
    else
        if not self.making then
            net.Start("tfm_icecreem_network")
            net.WriteEntity(self)
            net.WriteUInt(1, 4)
            net.Send(act)
        end
    end
end

net.Receive("tfm_icecreem_network", function(len, pl)
    local stand = net.ReadEntity()
    local read_ice_flag = net.ReadUInt(4)
    if (antispamsystem[pl:SteamID()] or 0) > CurTime() then return end
    antispamsystem[pl:SteamID()] = CurTime() + 1

    if pl:GetPos():Distance(stand:GetPos()) < 1000 then
        if DarkRP and pl:Team() == TEAM_DONDURMACI then
            if pl:canAfford(TFM.Stands["ice_stand"].price_of_icecreems) then
                pl:addMoney(TFM.Stands["ice_stand"].price_of_icecreems)
            else
                pl:ChatPrint("Dondurmayı karşılamıyorsunuz! (" .. TFM.Stands["ice_stand"].price_of_icecreems .. "TL)")
            end
        end

        stand.making = true
        net.Start("tfm_icecreem_network")
        net.WriteEntity(stand)
        net.WriteUInt(10, 4)
        net.WriteUInt(read_ice_flag, 4)
        net.Send(pl)

        timer.Create("IceSounds", 1, TFM.Stands["ice_stand"].time_of_icecreems, function()
            pl:EmitSound("physics/metal/metal_box_impact_bullet" .. math.random(1, 3) .. ".wav")
        end)

        local bing_sound = Sound("bing.mp3")

        if read_ice_flag == 1 then
            timer.Create("tr_icecreem_timer", TFM.Stands["ice_stand"].time_of_icecreems, 1, function()
                local icecreem = ents.Create("creem")
                icecreem:SetModel("models/foods/dondurma/icecreem.mdl")
                icecreem:SetPos(stand:GetPos() + stand:GetForward() * 30)
                icecreem:SetColor(TFM.Stands["ice_stand"].icecreem_colors[read_ice_flag].clr)
                icecreem:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_icecreem_network")
                net.WriteEntity(stand)
                net.WriteUInt(2, 4)
                net.Send(pl)
                stand.making = false
            end)
        elseif read_ice_flag == 2 then
            timer.Create("tr_icecreem_timer", TFM.Stands["ice_stand"].time_of_icecreems, 1, function()
                local icecreem = ents.Create("creem")
                icecreem:SetModel("models/foods/dondurma/icecreem.mdl")
                icecreem:SetPos(stand:GetPos() + stand:GetForward() * 30)
                icecreem:SetColor(TFM.Stands["ice_stand"].icecreem_colors[read_ice_flag].clr)
                icecreem:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_icecreem_network")
                net.WriteEntity(stand)
                net.WriteUInt(3, 4)
                net.Send(pl)
                stand.making = false
            end)
        elseif read_ice_flag == 3 then
            timer.Create("tr_icecreem_timer", TFM.Stands["ice_stand"].time_of_icecreems, 1, function()
                local icecreem = ents.Create("creem")
                icecreem:SetModel("models/foods/dondurma/icecreem.mdl")
                icecreem:SetPos(stand:GetPos() + stand:GetForward() * 30)
                icecreem:SetColor(TFM.Stands["ice_stand"].icecreem_colors[read_ice_flag].clr)
                icecreem:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_icecreem_network")
                net.WriteEntity(stand)
                net.WriteUInt(4, 4)
                net.Send(pl)
                stand.making = false
            end)
        elseif read_ice_flag == 4 then
            timer.Create("tr_icecreem_timer", TFM.Stands["ice_stand"].time_of_icecreems, 1, function()
                local icecreem = ents.Create("creem")
                icecreem:SetModel("models/foods/dondurma/icecreem.mdl")
                icecreem:SetPos(stand:GetPos() + stand:GetForward() * 30)
                icecreem:SetColor(TFM.Stands["ice_stand"].icecreem_colors[read_ice_flag].clr)
                icecreem:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_icecreem_network")
                net.WriteEntity(stand)
                net.WriteUInt(5, 4)
                net.Send(pl)
                stand.making = false
            end)
        elseif read_ice_flag == 5 then
            timer.Create("tr_icecreem_timer", TFM.Stands["ice_stand"].time_of_icecreems, 1, function()
                local icecreem = ents.Create("creem")
                icecreem:SetModel("models/foods/dondurma/icecreem.mdl")
                icecreem:SetPos(stand:GetPos() + stand:GetForward() * 30)
                icecreem:SetColor(TFM.Stands["ice_stand"].icecreem_colors[read_ice_flag].clr)
                icecreem:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_icecreem_network")
                net.WriteEntity(stand)
                net.WriteUInt(6, 4)
                net.Send(pl)
                stand.making = false
            end)
        elseif read_ice_flag == 6 then
            timer.Create("tr_icecreem_timer", TFM.Stands["ice_stand"].time_of_icecreems, 1, function()
                local icecreem = ents.Create("creem")
                icecreem:SetModel("models/foods/dondurma/icecreem.mdl")
                icecreem:SetPos(stand:GetPos() + stand:GetForward() * 30)
                icecreem:SetColor(TFM.Stands["ice_stand"].icecreem_colors[read_ice_flag].clr)
                icecreem:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_icecreem_network")
                net.WriteEntity(stand)
                net.WriteUInt(7, 4)
                net.Send(pl)
                stand.making = false
            end)
        elseif read_ice_flag == 7 then
            timer.Create("tr_icecreem_timer", TFM.Stands["ice_stand"].time_of_icecreems, 1, function()
                local icecreem = ents.Create("creem")
                icecreem:SetModel("models/foods/dondurma/icecreem.mdl")
                icecreem:SetPos(stand:GetPos() + stand:GetForward() * 30)
                icecreem:SetColor(TFM.Stands["ice_stand"].icecreem_colors[read_ice_flag].clr)
                icecreem:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_icecreem_network")
                net.WriteEntity(stand)
                net.WriteUInt(8, 4)
                net.Send(pl)
                stand.making = false
            end)
        elseif read_ice_flag == 8 then
            timer.Create("tr_icecreem_timer", TFM.Stands["ice_stand"].time_of_icecreems, 1, function()
                local icecreem = ents.Create("creem")
                icecreem:SetModel("models/foods/dondurma/icecreem.mdl")
                icecreem:SetPos(stand:GetPos() + stand:GetForward() * 30)
                icecreem:SetColor(TFM.Stands["ice_stand"].icecreem_colors[read_ice_flag].clr)
                icecreem:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_icecreem_network")
                net.WriteEntity(stand)
                net.WriteUInt(9, 4)
                net.Send(pl)
                stand.making = false
            end)
        end
    end
end)

function ENT:OnRemove()
    if timer.Exists("tr_icecreem_timer") then
        timer.Remove("tr_icecreem_timer")
        timer.Remove("IceSounds")
    end
end