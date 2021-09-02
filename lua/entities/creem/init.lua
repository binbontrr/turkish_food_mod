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

hook.Add("PhysgunPickup", "AllowPlayerPickup", function(ply, ent)
    if (ply:IsPlayer()) and (ent:GetClass() == "creem") then return false end
end)

function ENT:OnTakeDamage(damage)
    self:Remove()
end

function ENT:Use(act, call)
    local random_hp = math.random(1, 5)
    act:SetHealth(math.min(act:Health() + random_hp, act:GetMaxHealth() + 50))
    self:Remove()
    self:GetParent():Remove()
    act:EmitSound(Sound("lick.mp3"))
end