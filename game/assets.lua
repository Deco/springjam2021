local assets = {
    ['devfont'] = { type = 'font', path = false, size = 24, create = function(info) info.handle = love.graphics.newFont() end },
    ['fonts/HelvetiPixel.ttf:24'] = { type = 'font', path = 'fonts/HelvetiPixel.ttf', size = 24 },
    ['fonts/HelvetiPixel.ttf:60'] = { type = 'font', path = 'fonts/HelvetiPixel.ttf', size = 60 },

    ['art/tree.png'] = { type = 'image' },
    ['art/bomb.png'] = { type = 'image' },
    ['art/player/idle.png'] = { type = 'image' },
    ['art/player/walking.png'] = { type = 'image' },

    ['art/fx/explosion.png'] = { type = 'vfx', lifetime = 2.0, size = Vec(95, 90) },

    ['sfx/explosion1.wav'] = { type = 'sfx' },
    ['sfx/fuse.wav'] = { type = 'sfx', looping = true },
}

for assetKey, assetDescription in pairs(assets) do
    if assetDescription.path == nil then
        assetDescription.path = assetKey
    end
end

Engine:_theseAreTheAssets(assets)


