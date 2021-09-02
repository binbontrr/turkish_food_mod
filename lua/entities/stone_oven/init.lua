AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("tfm_config.lua")
util.AddNetworkString("tfm_stone_oven_network")

function ENT:Initialize()
    self:SetModel("models/stands/stoneoven/stoneoven.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:PhysWake()

    self.making = false
end

function ENT:Use(act,call)
    if DarkRP then
        if not self.making and act:Team() == TEAM_FIRINCI then
            net.Start("tfm_stone_oven_network")
            net.WriteEntity(self)
            net.WriteUInt(1,3)
            net.Send(act)
        end
    else
        if not self.making then
            net.Start("tfm_stone_oven_network")
            net.WriteEntity(self)
            net.WriteUInt(1,3)
            net.Send(act)
        end
    end
end

net.Receive("tfm_stone_oven_network" , function(len,ply)
    local oven = net.ReadEntity()
    local read_flags = net.ReadUInt(2)

    -- Entity check
    if(oven:GetClass() != "stone_oven") then return end
    -- Players can spam network for creating mass entities
    -- So we need to dont allow while baking.
    if(oven.making == true) then return end
    
    net.Start("tfm_stone_oven_network")
    net.WriteEntity(oven)
    net.WriteUInt(2,3)
    net.Send(ply)

    



    ply:EmitSound("fire.mp3")

    timer.Create("tfm_oven_sounds",TFM.Stands["stone_oven"].time_of_foods,1,function()
        ply:StopSound("fire.mp3")
    end)

    if DarkRP and ply:Team() == TEAM_FIRINCI then
        if ply:canAfford(TFM.Stands["stone_oven"].info_of_foods[read_flags].price) then
            ply:addMoney(-TFM.Stands["stone_oven"].info_of_foods[read_flags].price)
        else
            DarkRP.notify(ply, 0, 3,TFM.Stands["stone_oven"].info_of_foods[read_flags].name .. " yapmak için " .. TFM.Stands["stone_oven"].info_of_foods[read_flags].price .. "TL gerekiyor.")
        end
    end

    if read_flags == 1 then
        oven.making = true
        timer.Create("tfm_stone_oven_timer",TFM.Stands["stone_oven"].time_of_foods,1,function()
            local ekmek = ents.Create("ekmek")
            ekmek:SetModel("models/foods/ekmek/ekmek.mdl")
            ekmek:SetPos(oven:GetPos() + oven:GetRight() * 16)
            ekmek:Spawn()

            net.Start("tfm_stone_oven_network")
            net.WriteEntity(oven)
            net.WriteUInt(3,3)
            net.Send(ply)

            oven.making = false
        end)
    elseif read_flags == 2 then
        oven.making = true
        timer.Create("tfm_stone_oven_timer",TFM.Stands["stone_oven"].time_of_foods,1,function()
            local pide = ents.Create("pide")
            pide:SetModel("models/foods/pide/pide.mdl")
            pide:SetPos(oven:GetPos() + oven:GetRight() * 16)
            pide:Spawn()

            net.Start("tfm_stone_oven_network")
            net.WriteEntity(oven)
            net.WriteUInt(4,3)
            net.Send(ply)

            oven.making = false
        end)
    elseif read_flags == 3 then
        oven.making = true
        timer.Create("tfm_stone_oven_timer",TFM.Stands["stone_oven"].time_of_foods,1,function()
            local lahmacun = ents.Create("lahmacun")
            lahmacun:SetModel("models/foods/lahmacun/lahmacun.mdl")
            lahmacun:SetPos(oven:GetPos() + oven:GetRight() * 16)
            lahmacun:Spawn()

            net.Start("tfm_stone_oven_network")
            net.WriteEntity(oven)
            net.WriteUInt(5,3)
            net.Send(ply)

            oven.making = false
        end)
    end
end)