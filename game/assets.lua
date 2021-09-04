local assets = {
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

    ['art/bomb.png'] = { type = 'image' },
    ['art/flashlight.png'] = { type = 'image' },
    ['art/coffee.png'] = { type = 'image', scale = 0.5 },
    ['art/crate.png'] = { type = 'image' },
    ['art/gate.png'] = { type = 'image' },
    ['art/gate_open.png'] = { type = 'image' },
    ['art/golden-key.png'] = { type = 'image' },
    ['art/pressure-plate.png'] = { type = 'image' },
    ['art/toggle-switch.png'] = { type = 'image' },
    ['art/spikes.png'] = { type = 'image' },
    ['art/tomb.png'] = { type = 'image' },

    ['art/Koffeen_open.png'] = { type = 'image', scale = 1.5, },
    ['art/koffeen.png'] = { type = 'image', scale = 1.5, },
    ['art/Koffeen_open-Sheet.png'] = { type = 'anim', scale = 1.5, frames = 12, loop = true, },

    ['art/vampire.png'] = { type = 'image' },
    ['art/vampire_left.png'] = { type = 'image' },
    ['art/light_beam-hori.png'] = { type = 'image' },
    ['art/light_beam-vert.png'] = { type = 'image' },

    ['art/tree.png'] = { type = 'image' },
    ['art/lit.png'] = { type = 'image' },

    ['art/fx/explosion.png'] = { type = 'vfx', lifetime = 2.0, size = Vec(95, 90) },

    ['sfx/explosion1.wav'] = { type = 'sfx', volume = 0.6 },
    ['sfx/explosion2.wav'] = { type = 'sfx', volume = 0.8 },
    ['sfx/fuse.wav'] = { type = 'sfx', looping = true },
}

for assetKey, assetDescription in pairs(assets) do
    if assetDescription.path == nil then
        assetDescription.path = assetKey
    end
end

Engine:_theseAreTheAssets(assets)





