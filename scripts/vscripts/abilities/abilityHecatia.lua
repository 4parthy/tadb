function OnHecatia01SpellStart(keys)
	local caster = EntIndexToHScript(keys.caster_entindex)
	local targetPoint = keys.target_points[1]

	if caster.thtd_hecatia_ball_table == nil then
		caster.thtd_hecatia_ball_table = {}
		caster.thtd_hecatia_ball_table["earth"] = nil
		caster.thtd_hecatia_ball_table["moon"] = nil
		caster.thtd_hecatia_ball_table["otherworld"] = nil
	end
	if caster.thtd_hecatia_ball_table["earth"] == nil then
		local effectIndex = ParticleManager:CreateParticle("particles/heroes/thtd_hecatia/ability_hecatia_01_earth.vpcf", PATTACH_CUSTOMORIGIN, caster)
		ParticleManager:SetParticleControl(effectIndex, 0, targetPoint + Vector(0,0,128))
		ParticleManager:SetParticleControl(effectIndex, 1, Vector(0.4,0,0))
		ParticleManager:SetParticleControl(effectIndex, 2, Vector(200,0,0))

		caster.thtd_hecatia_ball_table["earth"] = 
		{
			["Vector"] = targetPoint + Vector(0,0,128),
			["EffectIndex"] = effectIndex
		}
	else
		caster.thtd_hecatia_ball_table["earth"]["Vector"] = targetPoint + Vector(0,0,128)
	end
end

function OnHecatia02SpellStart(keys)
	local caster = EntIndexToHScript(keys.caster_entindex)
	local targetPoint = keys.target_points[1]

	if caster.thtd_hecatia_ball_table == nil then
		caster.thtd_hecatia_ball_table = {}
		caster.thtd_hecatia_ball_table["earth"] = nil
		caster.thtd_hecatia_ball_table["moon"] = nil
		caster.thtd_hecatia_ball_table["otherworld"] = nil
	end

	if caster.thtd_hecatia_ball_table["moon"] == nil then
		local effectIndex = ParticleManager:CreateParticle("particles/heroes/thtd_hecatia/ability_hecatia_01_moon.vpcf", PATTACH_CUSTOMORIGIN, caster)
		ParticleManager:SetParticleControl(effectIndex, 0, targetPoint + Vector(0,0,128))
		ParticleManager:SetParticleControl(effectIndex, 1, Vector(0.3,0,0))
		ParticleManager:SetParticleControl(effectIndex, 2, Vector(150,0,0))

		caster.thtd_hecatia_ball_table["moon"] = 
		{
			["Vector"] = targetPoint + Vector(0,0,128),
			["EffectIndex"] = effectIndex
		}
	else
		caster.thtd_hecatia_ball_table["moon"]["Vector"] = targetPoint + Vector(0,0,128)
	end
end

function OnHecatia03SpellStart(keys)
	local caster = EntIndexToHScript(keys.caster_entindex)
	local targetPoint = keys.target_points[1]

	if caster.thtd_hecatia_ball_table == nil then
		caster.thtd_hecatia_ball_table = {}
		caster.thtd_hecatia_ball_table["earth"] = nil
		caster.thtd_hecatia_ball_table["moon"] = nil
		caster.thtd_hecatia_ball_table["otherworld"] = nil
	end
	
	if caster.thtd_hecatia_ball_table["otherworld"] == nil then
		local effectIndex = ParticleManager:CreateParticle("particles/heroes/thtd_hecatia/ability_hecatia_01_otherworld.vpcf", PATTACH_CUSTOMORIGIN, caster)
		ParticleManager:SetParticleControl(effectIndex, 0, targetPoint + Vector(0,0,128))
		ParticleManager:SetParticleControl(effectIndex, 1, Vector(0.4,0,0))
		ParticleManager:SetParticleControl(effectIndex, 2, Vector(200,0,0))

		caster.thtd_hecatia_ball_table["otherworld"] = 
		{
			["Vector"] = targetPoint + Vector(0,0,128),
			["EffectIndex"] = effectIndex,
		}
	else
		caster.thtd_hecatia_ball_table["otherworld"]["Vector"] = targetPoint + Vector(0,0,128)
	end
end

function HecatiaRemoveAllBall(keys)
	local caster = EntIndexToHScript(keys.caster_entindex)

	if caster.thtd_hecatia_ball_table == nil then
		caster.thtd_hecatia_ball_table = {}
		caster.thtd_hecatia_ball_table["earth"] = nil
		caster.thtd_hecatia_ball_table["moon"] = nil
		caster.thtd_hecatia_ball_table["otherworld"] = nil
	end

	if caster.thtd_hecatia_ball_table["earth"] ~= nil then
		local effectIndex = caster.thtd_hecatia_ball_table["earth"]["EffectIndex"]
		ParticleManager:DestroyParticleSystem(effectIndex,true)
	end
	if caster.thtd_hecatia_ball_table["moon"] ~= nil then
		local effectIndex = caster.thtd_hecatia_ball_table["moon"]["EffectIndex"]
		ParticleManager:DestroyParticleSystem(effectIndex,true)
	end
	if caster.thtd_hecatia_ball_table["otherworld"] ~= nil then
		local effectIndex = caster.thtd_hecatia_ball_table["otherworld"]["EffectIndex"]
		ParticleManager:DestroyParticleSystem(effectIndex,true)
	end

	caster.thtd_hecatia_ball_table = {}
end

function OnHecatia01Think(keys)
	local caster = EntIndexToHScript(keys.caster_entindex)

	if caster.thtd_hecatia_ball_table == nil then
		caster.thtd_hecatia_ball_table = {}
		caster.thtd_hecatia_ball_table["earth"] = nil
		caster.thtd_hecatia_ball_table["moon"] = nil
		caster.thtd_hecatia_ball_table["otherworld"] = nil
	end

	if caster.thtd_hecatia_01_think_count == nil then
		caster.thtd_hecatia_01_think_count = 0
	end

	if caster.thtd_hecatia_01_think_count < 360 then
		caster.thtd_hecatia_01_think_count = caster.thtd_hecatia_01_think_count + 1
	else
		caster.thtd_hecatia_01_think_count = 0
	end

	if caster==nil or caster:IsNull()==true or caster:IsAlive()==false or caster:THTD_IsHidden() then
		HecatiaRemoveAllBall(keys)
	end

	if caster.thtd_hecatia_ball_table ~= nil then
		if caster.thtd_hecatia_ball_table["earth"] ~= nil then
			if caster.thtd_hecatia_ball_table["otherworld"] ~= nil then
				local effectIndex = caster.thtd_hecatia_ball_table["earth"]["EffectIndex"]
				local distance = math.max(300,GetDistanceBetweenTwoVec2D(caster.thtd_hecatia_ball_table["earth"]["Vector"], 
															caster.thtd_hecatia_ball_table["otherworld"]["Vector"]))

				local midOrigin = (caster.thtd_hecatia_ball_table["earth"]["Vector"] + caster.thtd_hecatia_ball_table["otherworld"]["Vector"])/2
				local point = midOrigin + 
					Vector(
						math.cos(caster.thtd_hecatia_01_think_count * math.pi/180)*distance,
						math.sin(caster.thtd_hecatia_01_think_count * math.pi/180)*distance,
						0)

				ParticleManager:SetParticleControl(effectIndex, 0, point)
				caster.thtd_hecatia_ball_table["earth"]["CurPoint"] = point
			else
				local effectIndex = caster.thtd_hecatia_ball_table["earth"]["EffectIndex"]
				local distance = GetDistanceBetweenTwoVec2D(caster:GetOrigin(), caster.thtd_hecatia_ball_table["earth"]["Vector"])

				local point = caster:GetOrigin() + 
					Vector(
						math.cos(caster.thtd_hecatia_01_think_count * math.pi/180)*distance,
						math.sin(caster.thtd_hecatia_01_think_count * math.pi/180)*distance,
						0)

				ParticleManager:SetParticleControl(effectIndex, 0, point)
				caster.thtd_hecatia_ball_table["earth"]["CurPoint"] = point
			end
		end
		if caster.thtd_hecatia_ball_table["moon"] ~= nil then
			if caster.thtd_hecatia_ball_table["earth"] ~= nil then
				local effectIndex = caster.thtd_hecatia_ball_table["moon"]["EffectIndex"]
				local distance = math.max(300,GetDistanceBetweenTwoVec2D(caster.thtd_hecatia_ball_table["earth"]["Vector"], 
															caster.thtd_hecatia_ball_table["moon"]["Vector"]))
				local curPoint = caster.thtd_hecatia_ball_table["earth"]["Vector"]

				if caster.thtd_hecatia_ball_table["earth"]["CurPoint"] ~= nil then
					curPoint = caster.thtd_hecatia_ball_table["earth"]["CurPoint"]
				end

				local point = curPoint + 
					Vector(
						math.cos(caster.thtd_hecatia_01_think_count * math.pi/90)*distance,
						math.sin(caster.thtd_hecatia_01_think_count * math.pi/90)*distance,
						0)

				ParticleManager:SetParticleControl(effectIndex, 0, point)
				caster.thtd_hecatia_ball_table["moon"]["CurPoint"] = point
			else
				local effectIndex = caster.thtd_hecatia_ball_table["moon"]["EffectIndex"]
				local distance = GetDistanceBetweenTwoVec2D(caster:GetOrigin(), caster.thtd_hecatia_ball_table["moon"]["Vector"])

				local point = caster:GetOrigin() + 
					Vector(
						math.cos(caster.thtd_hecatia_01_think_count * math.pi/90)*distance,
						math.sin(caster.thtd_hecatia_01_think_count * math.pi/90)*distance,
						0)

				ParticleManager:SetParticleControl(effectIndex, 0, point)
				caster.thtd_hecatia_ball_table["moon"]["CurPoint"] = point
			end
		end
		if caster.thtd_hecatia_ball_table["otherworld"] ~= nil then
			if caster.thtd_hecatia_ball_table["earth"] ~= nil then
				local effectIndex = caster.thtd_hecatia_ball_table["otherworld"]["EffectIndex"]
				local distance = math.max(300,GetDistanceBetweenTwoVec2D(caster.thtd_hecatia_ball_table["earth"]["Vector"], 
															caster.thtd_hecatia_ball_table["otherworld"]["Vector"]))

				local midOrigin = (caster.thtd_hecatia_ball_table["earth"]["Vector"] + caster.thtd_hecatia_ball_table["otherworld"]["Vector"])/2
				local point = midOrigin + 
					Vector(
						math.cos((caster.thtd_hecatia_01_think_count + 180) * math.pi/180)*distance,
						math.sin((caster.thtd_hecatia_01_think_count + 180) * math.pi/180)*distance,
						0)

				ParticleManager:SetParticleControl(effectIndex, 0, point)
				caster.thtd_hecatia_ball_table["otherworld"]["CurPoint"] = point
			else
				local effectIndex = caster.thtd_hecatia_ball_table["otherworld"]["EffectIndex"]
				local distance = GetDistanceBetweenTwoVec2D(caster:GetOrigin(), caster.thtd_hecatia_ball_table["otherworld"]["Vector"])

				local point = caster:GetOrigin() + 
					Vector(
						math.cos((caster.thtd_hecatia_01_think_count + 180) * math.pi/180)*distance,
						math.sin((caster.thtd_hecatia_01_think_count + 180) * math.pi/180)*distance,
						0)

				ParticleManager:SetParticleControl(effectIndex, 0, point)
				caster.thtd_hecatia_ball_table["otherworld"]["CurPoint"] = point
			end
		end
	end
end