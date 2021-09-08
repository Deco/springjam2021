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
    ['src/maps/rolling_out.lua'] = { type = 'tiledmap' },
    ['src/maps/remote_control.lua'] = { type = 'tiledmap' },
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
    ['art/light_beam-bounce.png'] = { type = 'image' },
    ['art/light_beam-bouncemask.png'] = { type = 'image' },
    ['art/godbeam.png'] = { type = 'image', scale = 25, },

    ['art/tree.png'] = { type = 'image' },
    ['art/lit.png'] = { type = 'image' },
    ['art/Morning_Gory.png'] = { type = 'image' },

    ['art/fx/explosion.png'] = { type = 'vfx', lifetime = 2.0, size = Vec(4, 4), opacity = 0.3 },

    ['sfx/Beans.ogg'] = { type = 'sfx', trim = 2.8, duration = 1.4, pitch = 0.5, volume = 0.1, },
    ['sfx/Boulder_Move_00.ogg'] = { type = 'sfx', trim = 0.1, duration = 0.2, pitch = 1.2, volume = 0.4, },
    ['sfx/Boulder_Move_01.ogg'] = { type = 'sfx', trim = 0.1, duration = 0.2, pitch = 1.2, volume = 0.4, },
    ['sfx/Boulder_Move_02.ogg'] = { type = 'sfx', trim = 0.1, duration = 0.2, pitch = 1.2, volume = 0.4, },
    ['sfx/Burn_to_Ash.ogg'] = { type = 'sfx', volume = 0.3, },
    ['sfx/Key_Get_00.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/Key_Get_01.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/Pickup_Cup_maybe.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/Pickup_Cup_maybe2.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/Vampire_Death.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Vamp_Alert-00.ogg'] = { type = 'sfx', trim = 0.7, duration = 0.45, pitch = 0.5, volume = 0.1, },
    ['sfx/Vamp_chase_00.ogg'] = { type = 'sfx', looping = true, pitch = 2.1, volume = 0.05, },
    ['sfx/Vamp_Drink.ogg'] = { type = 'sfx', trim = 0.4, pitch = 1.3, duration = 2.0, volume = 0.1, },

    ['sfx/Pickup_Gold_00.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Pickup_Gold_01.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Pickup_Gold_02.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Pickup_Gold_03.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Pickup_Gold_04.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Dragon_Growl_00.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Dragon_Growl_01.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/Trap_00.ogg'] = { type = 'sfx', volume = 0.12, },
    ['sfx/Trap_01.ogg'] = { type = 'sfx', volume = 0.12, },
    ['sfx/Trap_02.ogg'] = { type = 'sfx', volume = 0.12, },
    ['sfx/input.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/input-off.ogg'] = { type = 'sfx', volume = 0.45, },
    ['sfx/bottle.ogg'] = { type = 'sfx', volume = 0.4, },
    ['sfx/door.ogg'] = { type = 'sfx', pitch = 0.7, volume = 0.15, },
    ['sfx/burp.ogg'] = { type = 'sfx', pitch = 0.7, volume = 0.05, },
    ['sfx/death.ogg'] = { type = 'sfx', volume = 0.7, pitch = 0.8, },
    ['sfx/Inventory_Open_00.ogg'] = { type = 'sfx', volume = 0.3, },
    ['sfx/Inventory_Open_01.ogg'] = { type = 'sfx', volume = 0.3, },

    ['sfx/beans-short.ogg'] = { type = 'sfx', volume = 0.2, },

    ['sfx/slap-01.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/slap-02.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/slap-03.ogg'] = { type = 'sfx', volume = 0.2, },
    ['sfx/slap-04.ogg'] = { type = 'sfx', volume = 0.2, },

    ['sfx/salt_walk_01.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/salt_walk_02.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/salt_walk_03.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/salt_walk_04.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/salt_walk_05.ogg'] = { type = 'sfx', volume = 0.1, },

    ['sfx/robe_walk_01.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_02.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_03.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_04.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_05.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_06.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_07.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_08.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_09.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_10.ogg'] = { type = 'sfx', volume = 0.1, },
    ['sfx/robe_walk_11.ogg'] = { type = 'sfx', volume = 0.1, },

    ['sfx/ambience.mp3'] = { type = 'sfx', sourceType = 'stream', trim = 3, global = true },

    ['corridor'] = { type = 'reverb', presetName = 'REVERB_PRESET_CASTLE_LONGPASSAGE', path = false },
    ['small_room'] = { type = 'reverb', presetName = 'REVERB_PRESET_CASTLE_SMALLROOM', path = false },
    ['medium_room'] = { type = 'reverb', presetName = 'REVERB_PRESET_CASTLE_LARGEROOM', path = false },
    ['large_room'] = { type = 'reverb', presetName = 'REVERB_PRESET_CASTLE_HALL', path = false },
    ['open'] = { type = 'reverb', presetName = 'REVERB_PRESET_MOUNTAINS', path = false },

    ['shader:stencilMask'] = { type = 'shader', path = false, src = [[
           vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
              if (Texel(texture, texture_coords).rgb == vec3(0.0)) {
                 // a discarded pixel wont be applied as the stencil.
                 discard;
              }
              return vec4(1.0);
           }
    ]] },
}

for assetKey, assetDescription in pairs(assets) do
    assetDescription.key = assetKey
    if assetDescription.path == nil then
        assetDescription.path = assetKey
    end
end

Engine:_theseAreTheAssets(assets)





