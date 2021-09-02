ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Çiğköfte Tezgahı"
ENT.Category = "Turkish Food Mod Tezgahlar"
ENT.Spawnable = true

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "owning_ent")
end