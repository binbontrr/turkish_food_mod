ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Pilavcı Tezgahı"
ENT.Category = "Turkish Food Mod Tezgahlar"
ENT.Spawnable = true
ENT.MaxHealth = 150

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "owning_ent")
end
