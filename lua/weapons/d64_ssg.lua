SWEP.PrintName = "Super Shotgun"
SWEP.Category = "DOOM 64"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

SWEP.WorldModel = "models/weapons/w_shotgun.mdl"

SWEP.Weight = 10
SWEP.Slot = 3
SWEP.SlotPos = 3

SWEP.HoldType = "shotgun"
SWEP.Base = "d64_base"

SWEP.Primary.Sound = Sound("DOOM64_SSG1")
SWEP.Primary.MaxAmmo = 200
SWEP.Primary.Ammo = "Buckshot"
SWEP.Primary.MinDamage = 5
SWEP.Primary.MaxDamage = 15
SWEP.Primary.Spread = 0.15
SWEP.Primary.Delay = 1.5
SWEP.BulletNum = 20
SWEP.TakeAmmo = 2
SWEP.BulletForce = 5
SWEP.ViewPunch = -3

function SWEP:SetState(State)
    if State == 1 then
        self:SetNWString("CurSprite", "v_spr/ssg/SHT2A0.png")
        self:SetNWInt("NextState", 1)
        self:SetNWFloat("NextTime", CurTime() + 0.3)
    elseif State == 2 then
        self:SetNWString("CurSprite", "v_spr/ssg/SHT2B0.png")
        self:SetNWInt("NextState", 3)
        self:SetNWFloat("NextTime", CurTime() + 0.4) 
    elseif State == 3 then
        self:SetNWString("CurSprite", "v_spr/ssg/SHT2C0.png")
        self:SetNWInt("NextState", 1)
        self:SetNWFloat("NextTime", CurTime() + 1)
        
        timer.Simple(0.8, function()
            sound.Play("DOOM64_SSG2", self.Owner:GetPos(), 75, 100, 1) 
        end)
        timer.Simple(1, function()
            sound.Play("DOOM64_SSG3", self.Owner:GetPos(), 75, 100, 1) 
        end)
    end
end