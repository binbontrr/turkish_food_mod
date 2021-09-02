AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("tfm_config.lua")

function ENT:Initialize()
    self:SetModel(TFM.Foods["sade_pilav"].model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:PhysWake()
end

function ENT:Use(act, call)
    local food_health = TFM.Foods["sade_pilav"].health
    if TFM.Foods["sade_pilav"].health < 0 then return end
    act:SetHealth(math.min(act:Health() + food_health, act:GetMaxHealth() + 50))
    self:Remove()
    act:EmitSound(TFM.Foods["sade_pilav"].eat_sound)
end