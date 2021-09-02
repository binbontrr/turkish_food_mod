AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/foods/dondurma/kulah.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:PhysWake()
end

hook.Add("PhysgunPickup", "AllowPlayerPickup", function(ply, ent)
    if (ply:IsPlayer()) and (ent:GetClass() == "kulah") then return false end
end)