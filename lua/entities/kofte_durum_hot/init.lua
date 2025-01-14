AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("tfm_config.lua")

function ENT:Initialize()
    self:SetModel(TFM.Foods["kofte_durum_hot"].model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:PhysWake()
end

function ENT:Use(act,call)
    local chance = math.random(1,4)
    self:Remove()
    act:EmitSound(TFM.Foods["kofte_durum_hot"].eat_sound)

    if chance == 1 then
        timer.Simple(5,function()
            act:ChatPrint("YANIYORSUN !!! Ali usta çiğköftene çok acı atmış çabuk ayran iç.")
            act:EmitSound("hot.mp3")
            act:Ignite(3)
            timer.Create("kofte_durum_hot_timer", 1, 3, function()
                if not IsValid(act) then return end
                act:EmitSound("player/pl_burnpain" .. math.random(1,3) .. ".wav")
            end)
        end)
    end
end

