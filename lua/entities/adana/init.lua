AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("tfm_config.lua")

function ENT:Initialize()
    self:SetModel(TFM.Foods["adana"].model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:PhysWake()
end

function ENT:Use(act, call)
    local food_health = TFM.Foods["adana"].health
    if TFM.Foods["adana"].health > 0 then 
    act:SetHealth(math.min(act:Health() + food_health, act:GetMaxHealth() + 50))
    end
    self:Remove()
    act:EmitSound(TFM.Foods["adana"].eat_sound)
end