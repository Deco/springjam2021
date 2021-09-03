local assets = {
    ['devfont'] = { type = 'font', path = false, size = 24, create = function(info) info.handle = love.graphics.newFont() end },
    ['fonts/HelvetiPixel.ttf:24'] = { type = 'font', path = 'fonts/HelvetiPixel.ttf', size = 24 },
    ['fonts/HelvetiPixel.ttf:60'] = { type = 'font', path = 'fonts/HelvetiPixel.ttf', size = 60 },

    ['art/player/idle_up.png'] = { type = 'image' },
    ['art/player/idle_right.png'] = { type = 'image' },
    ['art/player/idle_down.png'] = { type = 'image' },
    ['art/player/idle_left.png'] = { type = 'image' },

    ['art/wall.png'] = { type = 'image' },

    ['art/bomb.png'] = { type = 'image' },
    ['art/coffee.png'] = { type = 'image' },
    ['art/crate.png'] = { type = 'image' },
    ['art/gate.png'] = { type = 'image' },
    ['art/gate_open.png'] = { type = 'image' },
    ['art/key.png'] = { type = 'image' },
    ['art/pressure-plate.png'] = { type = 'image' },
    ['art/spikes.png'] = { type = 'image' },
    ['art/tomb.png'] = { type = 'image' },
    ['art/vampire.png'] = { type = 'image' },

    ['art/tree.png'] = { type = 'image' },

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



