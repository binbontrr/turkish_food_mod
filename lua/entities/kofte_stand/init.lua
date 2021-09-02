AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("tfm_config.lua")
AddCSLuaFile("tfm_config.lua")
util.AddNetworkString("tfm_cigkofte_network")

function ENT:Initialize()
    self:SetModel(TFM.Stands["kofte_stand"].model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:PhysWake()
end

function ENT:Use(act, call)
    if DarkRP then
        if act:Team() == TEAM_CIGKOFTECI then
            net.Start("tfm_cigkofte_network")
            net.Send(act)
        end
    else
        net.Start("tfm_cigkofte_network")
        net.Send(act)
    end
end

net.Receive("tfm_cigkofte_network", function(len, pl)
    local entityofstand = pl:GetEyeTrace().Entity
    local random_times = math.random(5, 20)
    local readhot = net.ReadUInt(2)

    if entityofstand:GetClass() == "kofte_stand" and pl:GetPos():Distance(entityofstand:GetPos()) < 1000 then
        entityofstand:SetNWString("kofte_stand_nw1", tostring(random_times))
        pl:EmitSound("ali_usta")

        if readhot == 1 then
            if DarkRP and pl:Team() == TEAM_CIGKOFTECI then
                if pl:canAfford(TFM.Stands["kofte_stand"].price_normal) then
                    pl:addMoney(-TFM.Stands["kofte_stand"].price_normal)
                else
                    DarkRP.notify(pl, 1, 5, "Sade Çiğköfteyi karşılamıyorsunuz(" .. TFM.Stands["kofte_stand"].price_normal .. "TL)")
                end
            end

            timer.Create("kofte_durum", random_times, 1, function()
                local kofte_durum = ents.Create("kofte_durum")
                if (not IsValid(kofte_durum)) then return end
                kofte_durum:SetModel("models/foods/cigkofte_durum/cigkofte_durum.mdl")
                kofte_durum:SetPos(entityofstand:GetPos() - entityofstand:GetForward() * 80)
                kofte_durum:Spawn()
                entityofstand:SetNWString("kofte_stand_nw1", "0")
                pl:StopSound("ali_usta")
                pl:EmitSound("china.mp3")
            end)
        elseif readhot == 2 then
            if DarkRP and pl:Team() == TEAM_CIGKOFTECI then
                if pl:canAfford(TFM.Stands["kofte_stand"].price_hot) then
                    pl:addMoney(-TFM.Stands["kofte_stand"].price_hot)
                else
                    DarkRP.notify(pl, 1, 5, "Acılı Çiğköfteyi karşılamıyorsunuz(" .. TFM.Stands["kofte_stand"].price_hot .. "TL)")
                end
            end
            timer.Create("kofte_durum", random_times, 1, function()
                local kofte_durum = ents.Create("kofte_durum_hot")
                if (not IsValid(kofte_durum)) then return end
                kofte_durum:SetModel("models/foods/cigkofte_durum/cigkofte_durum.mdl")
                kofte_durum:SetPos(entityofstand:GetPos() - entityofstand:GetForward() * 80)
                kofte_durum:Spawn()
                entityofstand:SetNWString("kofte_stand_nw1", "0")
                pl:StopSound("ali_usta")
                pl:EmitSound("china.mp3")
            end)
        end
    end
end)
