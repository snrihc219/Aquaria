-- Copyright (C) 2007, 2010 - Bit-Blot
--
-- This file is part of Aquaria.
--
-- Aquaria is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

-- ================================================================================================
-- S P O R E  G E N E R A T O R
-- ================================================================================================

-- ================================================================================================
-- L O C A L  V A R I A B L E S 
-- ================================================================================================

v.delay = 1.0

-- ================================================================================================
-- F U N C T I O N S
-- ================================================================================================

function init(me)
	setupEntity(me)
	entity_setEntityType(me, ET_ENEMY)
	entity_setAllDamageTargets(me, false)
	
	entity_initSkeletal(me, "sporeplant")

	--entity_generateCollisionMask(me)
	--entity_setCollideRadius(me, 32)
	
	entity_setState(me, STATE_IDLE)
	
	entity_setHealth(me, 3)
	entity_setDropChance(me, 20, 1)
	
	entity_setDeathParticleEffect(me, "TinyRedExplode")
	entity_setUpdateCull(me, 4000)
end

function postInit(me)
	v.n = getNaija()
	--entity_setTarget(me, v.n)
end

function update(me, dt)

	if v.delay > 0 then
		v.delay = v.delay - dt
	else
		local ent = createEntity("SongSpore", "", entity_x(me) + math.random(100) - math.random(100), entity_y(me) + math.random(100) - math.random(100))
		entity_rotate(ent, entity_getRotation(me))
		v.delay = math.random(3)+4
	end
end

function enterState(me)

end

function exitState(me)
end

function damage(me, attacker, bone, damageType, dmg)
	return true
end

function animationKey(me, key)
end

function hitSurface(me)
	--debugLog("HIT")
end

function songNote(me, note)
end

function songNoteDone(me, note)
end

function song(me, song)
end

function activate(me)
end

