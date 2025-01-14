AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/foods/dondurma/icecreem.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

    local kulah = ents.Create("kulah")
    kulah:SetModel("models/foods/dondurma/kulah.mdl")
    kulah:SetPos(self:GetPos())
    kulah:Spawn()
    self:SetPos(kulah:LocalToWorld(Vector(0, 0, 7)))
    self:SetAngles(kulah:LocalToWorldAngles(Angle(0, 0, 0)))
    self:SetParent(kulah)
end

hook.Add("PhysgunPickup", "TFM_AllowPlayerPickup", function(ply, ent)
    if (ent:GetClass() == "creem") then return false end
end)

function ENT:OnTakeDamage(damage)
    self:Remove()
end

function ENT:Use(act, call)
    local food_health = TFM.Foods["dondurma"].health
    if TFM.Foods["dondurma"].health > 0 then 
    act:SetHealth(math.min(act:Health() + food_health, act:GetMaxHealth() + 50))
    end 
    self:Remove()
    act:EmitSound(TFM.Foods["dondurma"].eat_sound)
end