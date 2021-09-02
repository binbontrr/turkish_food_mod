ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "kulah"
ENT.Category = "Turkish Food Mode"
ENT.Spawnable = false

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "owning_ent")
end