local antispamsystem = {}
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("tfm_config.lua")
util.AddNetworkString("tfm_pilav_network")

function ENT:Initialize()
    self:SetModel(TFM.Stands["pilav_stand"].model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:PhysWake()
    self.making = false
end

function ENT:Use(act, call)
    if DarkRP then
        if not self.making and act:Team() == TEAM_PILAVCI then
            net.Start("tfm_pilav_network")
            net.WriteEntity(self)
            net.WriteUInt(1, 3)
            net.Send(act)
        end
    else
        if not self.making then
            net.Start("tfm_pilav_network")
            net.WriteEntity(self)
            net.WriteUInt(1, 3)
            net.Send(act)
        end
    end
end

net.Receive("tfm_pilav_network", function(len, pl)
    local stand = net.ReadEntity()
    local getpilav = net.ReadUInt(3)
    -- Entity Check
    if(stand:GetClass() != "pilav_stand") then return end

    if (antispamsystem[pl:SteamID()] or 0) > CurTime() then return end
    antispamsystem[pl:SteamID()] = CurTime() + 1

    if pl:GetPos():Distance(stand:GetPos()) < 1000 then
        if DarkRP and pl:Team() == TEAM_PILAVCI then
            if pl:canAfford(TFM.Stands["pilav_stand"].info_of_pilavs[getpilav].price) then
                pl:addMoney(-TFM.Stands["pilav_stand"].info_of_pilavs[getpilav].price)
            else
                DarkRP.notify(pl, 1, 5, "Pilavı karşılamıyorsunuz(" .. TFM.Stands["pilav_stand"].info_of_pilavs[getpilav].price .. "TL)")
            end
        end

        net.Start("tfm_pilav_network")
        net.WriteEntity(stand)
        net.WriteUInt(2, 3)
        net.WriteUInt(getpilav, 3)
        net.Send(pl)
        stand.making = true

        timer.Create("PilavSounds", 1, TFM.Stands["pilav_stand"].time_of_pilavs, function()
            pl:EmitSound("physics/metal/metal_box_impact_bullet" .. math.random(1, 3) .. ".wav")
        end)

        local bing_sound = Sound("bing.mp3")

        if getpilav == 1 then
            timer.Create("tfm_pilavstand_timer", TFM.Stands["pilav_stand"].time_of_pilavs, 1, function()
                local pilav = ents.Create("sade_pilav")
                pilav:SetModel("models/foods/pilavs/sade.mdl")
                pilav:SetPos(stand:GetPos() + stand:GetForward() * 60)
                pilav:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_pilav_network")
                net.WriteEntity(stand)
                net.WriteUInt(3, 3)
                net.Send(pl)
            end)
        elseif getpilav == 2 then
            timer.Create("tfm_pilavstand_timer", TFM.Stands["pilav_stand"].time_of_pilavs, 1, function()
                local pilav = ents.Create("nohutlu_pilav")
                pilav:SetModel("models/foods/pilavs/nohutlu.mdl")
                pilav:SetPos(stand:GetPos() + stand:GetForward() * 30)
                pilav:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_pilav_network")
                net.WriteEntity(stand)
                net.WriteUInt(4, 3)
                net.Send(pl)
            end)
        elseif getpilav == 3 then
            timer.Create("tfm_pilavstand_timer", TFM.Stands["pilav_stand"].time_of_pilavs, 1, function()
                local pilav = ents.Create("tavuklu_pilav")
                pilav:SetModel("models/foods/pilavs/tavuklu.mdl")
                pilav:SetPos(stand:GetPos() + stand:GetForward() * 30)
                pilav:Spawn()
                pl:EmitSound(bing_sound)
                net.Start("tfm_pilav_network")
                net.WriteEntity(stand)
                net.WriteUInt(5, 3)
                net.Send(pl)
            end)
        end
    end
end)

function ENT:OnRemove()
    if timer.Exists("tfm_pilavstand_timer") then
        timer.Remove("tfm_pilavstand_timer")
        timer.Remove("PilavSounds")
    end
end