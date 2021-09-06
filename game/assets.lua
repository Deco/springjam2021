local assets = {
    ['src/maps/entrance.lua'] = { type = 'tiledmap' },
    ['src/maps/riseandshine.lua'] = { type = 'tiledmap' },
    ['src/maps/back_and_forth.lua'] = { type = 'tiledmap' },
    ['src/maps/pits.lua'] = { type = 'tiledmap' },
    ['src/maps/spikes.lua'] = { type = 'tiledmap' },
    ['src/maps/hand_fucking_coded.lua'] = { type = 'tiledmap' },
    ['src/maps/hallway_escape.lua'] = { type = 'tiledmap' },
    ['src/maps/ko_hand_fucking_coded.lua'] = { type = 'tiledmap' },
    ['src/maps/zigzag.lua'] = { type = 'tiledmap' },
    ['src/maps/laser_push.lua'] = { type = 'tiledmap' },
    ['src/maps/seafloor_cavern.lua'] = { type = 'tiledmap' },
    ['src/maps/lighty_mcLightface.lua'] = { type = 'tiledmap' },
    ['src/maps/pipework.lua'] = { type = 'tiledmap' },
    ['src/maps/tubular.lua'] = { type = 'tiledmap' },
    ['src/maps/hide_and_seek.lua'] = { type = 'tiledmap' },
    --['src/maps/kaffeine withdrawal.lua'] = { type = 'tiledmap' },

    ['devfont'] = { type = 'font', path = false, size = 24, create = function(info) info.handle = love.graphics.newFont() end },
    ['fonts/HelvetiPixel.ttf:24'] = { type = 'font', path = 'fonts/HelvetiPixel.ttf', size = 24 },
    ['fonts/HelvetiPixel.ttf:60'] = { type = 'font', path = 'fonts/HelvetiPixel.ttf', size = 60 },
    ['PromptFont'] = { type = 'font', path = 'fonts/HelvetiPixel.ttf', size = 60 },


    ['art/player/idle_up.png'] = { type = 'image' },
    ['art/player/idle_right.png'] = { type = 'image' },
    ['art/player/idle_down.png'] = { type = 'image' },
    ['art/player/idle_left.png'] = { type = 'image' },
    ['art/player/walking_up-sheet.png'] = { type = 'anim', frames = 4, loop = true, },
    ['art/player/walking_right-sheet.png'] = { type = 'anim', frames = 4, loop = true, },
    ['art/player/walking_down-sheet.png'] = { type = 'anim', frames = 4, loop = true, },
    ['art/player/walking_left-sheet.png'] = { type = 'anim', frames = 4, loop = true, },

    ['art/wall.png'] = { type = 'image' },

    ['art/flashlight.png'] = { type = 'image' },
    ['art/coffee.png'] = { type = 'image', scale = 0.6 },
    ['art/crate.png'] = { type = 'image', scale = 0.75 },
    ['art/gate.png'] = { type = 'image' },
    ['art/gate_open.png'] = { type = 'image' },
    ['art/golden-key.png'] = { type = 'image' },
    ['art/pressure-plate-on.png'] = { type = 'image', scale = 1.1 },
    ['art/pressure-plate-off.png'] = { type = 'image', scale = 1.1 },
    ['art/toggle-switch-on.png'] = { type = 'image', scale = 1.4 },
    ['art/toggle-switch-off.png'] = { type = 'image', scale = 1.4 },
    ['art/spikes.png'] = { type = 'image' },
    ['art/tomb.png'] = { type = 'image' },
    --['art/mirror_static.png'] = { type = 'image' },
    --['art/mirror_dynamic.png'] = { type = 'image' },
    ['art/salt.png'] = { type = 'image' },
    ['art/Boulder.png'] = { type = 'image' },
    ['art/boulder_round.png'] = { type = 'image' },
    ['art/Mirror.png'] = { type = 'image' },
    ['art/Mirror_active.png'] = { type = 'image' },
    ['art/Mirror_god.png'] = { type = 'image' },
    ['art/RotatingMirror.png'] = { type = 'image' },
    ['art/RotatingMirror_active.png'] = { type = 'image' },
    ['art/RotatingMirror_god.png'] = { type = 'image' },

    ['art/Koffeen_open.png'] = { type = 'image', scale = 1.5, },
    ['art/koffeen.png'] = { type = 'image', scale = 1.5, },
    ['art/Koffeen_open-Sheet.png'] = { type = 'anim', scale = 1.5, frames = 12, loop = true, },

    ['art/vampire.png'] = { type = 'image' },
    ['art/vampire_left.png'] = { type = 'image' },
    ['art/dust.png'] = { type = 'image' },
    ['art/light_beam-hori.png'] = { type = 'image' },
    ['art/light_beam-vert.png'] = { type = 'image' },
    ['art/godbeam.png'] = { type = 'image', scale = 25, },

    ['art/tree.png'] = { type = 'image' },
    ['art/lit.png'] = { type = 'image' },
    ['art/Morning_Gory.png'] = { type = 'image' },

    ['art/fx/explosion.png'] = { type = 'vfx', lifetime = 2.0, size = Vec(4, 4), opacity = 0.3 },

    ['sfx/Beans.ogg'] = { type = 'sfx', trim = 2.8, duration = 1.4, pitch = 0.5, volume = 0.1, },
    ['sfx/Boulder_Move_00.ogg'] = { type = 'sfx', trim = 0.1, duration = 0.2, pitch = 1.2, volume = 0.4, },
    ['sfx/Boulder_Move_01.ogg'] = { type = 'sfx', trim = 0.1, duration = 0.2, pitch = 1.2, volume = 0.4, },
    ['sfx/Boulder_Move_02.ogg'] = { type = 'sfx', trim = 0.1, duration = 0.2, pitch = 1.2, volume = 0.4, },
    ['sfx/Burn_to_Ash.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Key_Get_00.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/Key_Get_01.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/Pickup_Cup_maybe.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/Pickup_Cup_maybe2.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/Vampire_Death.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Vamp_Alert-00.ogg'] = { type = 'sfx', trim = 0.7, duration = 0.45, pitch = 0.5, volume = 0.1, },
    ['sfx/Vamp_chase_00.ogg'] = { type = 'sfx', looping = true, pitch = 2.1, volume = 0.05, },
    ['sfx/Vamp_Drink.ogg'] = { type = 'sfx', trim = 0.4, pitch = 1.3, duration = 2.0, volume = 0.1, },

    ['sfx/Pickup_Gold_00.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Pickup_Gold_01.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Pickup_Gold_02.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Pickup_Gold_03.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Pickup_Gold_04.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Dragon_Growl_00.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Dragon_Growl_01.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Trap_00.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Trap_01.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Trap_02.mp3'] = { type = 'sfx', volume = 0.2, },
    ['sfx/input.wav'] = { type = 'sfx', volume = 0.4, },
    ['sfx/input-off.wav'] = { type = 'sfx', volume = 0.45, },
    ['sfx/bottle.wav'] = { type = 'sfx', volume = 0.6, },
    ['sfx/door.wav'] = { type = 'sfx', pitch = 0.7, volume = 0.15, },
    ['sfx/burp.wav'] = { type = 'sfx', pitch = 0.7, volume = 0.05, },
    ['sfx/death.wav'] = { type = 'sfx', volume = 0.7, pitch = 0.8, },
    ['sfx/Inventory_Open_00.mp3'] = { type = 'sfx', volume = 0.3, },
    ['sfx/Inventory_Open_01.mp3'] = { type = 'sfx', volume = 0.3, },

    ['sfx/ambience.mp3'] = { type = 'sfx', sourceType = 'stream', trim = 3 },

}

for assetKey, assetDescription in pairs(assets) do
    if assetDescription.path == nil then
        assetDescription.path = assetKey
    end
end

Engine:_theseAreTheAssets(assets)





