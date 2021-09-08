local presets = {}

function presets:GetReverbPreset(label)
    local preset = self.REVERB_PRESET[label]
    local output = {
        type = "reverb"
    }
    for idx, key in pairs(self.REVERB_KEYS_TO_LOVE) do
        if key == 'highlimit' then
            output[key] = preset[idx] == 1
        else
            output[key] = preset[idx]
        end
    end

    return output
end

presets.REVERB_KEYS_TO_LOVE = {
    "density",  -- flDensity
    "diffusion",    -- flDiffusion
    "gain", -- flGain
    "highgain", -- flGainHF
    nil,  -- flGainLF
    "decaytime",    -- flDecayTime
    "decayhighratio",   -- flDecayHFRatio
    nil,  -- flDecayLFRatio
    "earlygain",    -- flReflectionsGain
    "earlydelay",   -- flReflectionsDelay
    nil,  -- flReflectionsPan
    "lategain", -- flLateReverbGain
    "latedelay",    -- flLateReverbDelay
    nil,  -- flLateReverbPan
    nil,  -- flEchoTime
    nil,  -- flEchoDepth
    nil,  -- flModulationTime
    nil,  -- flModulationDepth
    "airabsorption",    -- flAirAbsorptionGainHF
    nil,  -- flHFReference
    nil,  -- flLFReference
    "roomrolloff",  -- flRoomRolloffFactor
    "highlimit",    -- iDecayHFLimit
}

presets.REVERB_PRESET = {
    REVERB_PRESET_GENERIC = { 1.0000, 1.0000, 0.3162, 0.8913, 1.0000, 1.4900, 0.8300, 1.0000, 0.0500, 0.0070, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_PADDEDCELL = { 0.1715, 1.0000, 0.3162, 0.0010, 1.0000, 0.1700, 0.1000, 1.0000, 0.2500, 0.0010, { 0.0000, 0.0000, 0.0000 }, 1.2691, 0.0020, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_ROOM = { 0.4287, 1.0000, 0.3162, 0.5929, 1.0000, 0.4000, 0.8300, 1.0000, 0.1503, 0.0020, { 0.0000, 0.0000, 0.0000 }, 1.0629, 0.0030, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_BATHROOM = { 0.1715, 1.0000, 0.3162, 0.2512, 1.0000, 1.4900, 0.5400, 1.0000, 0.6531, 0.0070, { 0.0000, 0.0000, 0.0000 }, 3.2734, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_LIVINGROOM = { 0.9766, 1.0000, 0.3162, 0.0010, 1.0000, 0.5000, 0.1000, 1.0000, 0.2051, 0.0030, { 0.0000, 0.0000, 0.0000 }, 0.2805, 0.0040, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_STONEROOM = { 1.0000, 1.0000, 0.3162, 0.7079, 1.0000, 2.3100, 0.6400, 1.0000, 0.4411, 0.0120, { 0.0000, 0.0000, 0.0000 }, 1.1003, 0.0170, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_AUDITORIUM = { 1.0000, 1.0000, 0.3162, 0.5781, 1.0000, 4.3200, 0.5900, 1.0000, 0.4032, 0.0200, { 0.0000, 0.0000, 0.0000 }, 0.7170, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_CONCERTHALL = { 1.0000, 1.0000, 0.3162, 0.5623, 1.0000, 3.9200, 0.7000, 1.0000, 0.2427, 0.0200, { 0.0000, 0.0000, 0.0000 }, 0.9977, 0.0290, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_CAVE = { 1.0000, 1.0000, 0.3162, 1.0000, 1.0000, 2.9100, 1.3000, 1.0000, 0.5000, 0.0150, { 0.0000, 0.0000, 0.0000 }, 0.7063, 0.0220, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_ARENA = { 1.0000, 1.0000, 0.3162, 0.4477, 1.0000, 7.2400, 0.3300, 1.0000, 0.2612, 0.0200, { 0.0000, 0.0000, 0.0000 }, 1.0186, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_HANGAR = { 1.0000, 1.0000, 0.3162, 0.3162, 1.0000, 10.0500, 0.2300, 1.0000, 0.5000, 0.0200, { 0.0000, 0.0000, 0.0000 }, 1.2560, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_CARPETEDHALLWAY = { 0.4287, 1.0000, 0.3162, 0.0100, 1.0000, 0.3000, 0.1000, 1.0000, 0.1215, 0.0020, { 0.0000, 0.0000, 0.0000 }, 0.1531, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_HALLWAY = { 0.3645, 1.0000, 0.3162, 0.7079, 1.0000, 1.4900, 0.5900, 1.0000, 0.2458, 0.0070, { 0.0000, 0.0000, 0.0000 }, 1.6615, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_STONECORRIDOR = { 1.0000, 1.0000, 0.3162, 0.7612, 1.0000, 2.7000, 0.7900, 1.0000, 0.2472, 0.0130, { 0.0000, 0.0000, 0.0000 }, 1.5758, 0.0200, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_ALLEY = { 1.0000, 0.3000, 0.3162, 0.7328, 1.0000, 1.4900, 0.8600, 1.0000, 0.2500, 0.0070, { 0.0000, 0.0000, 0.0000 }, 0.9954, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.1250, 0.9500, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_FOREST = { 1.0000, 0.3000, 0.3162, 0.0224, 1.0000, 1.4900, 0.5400, 1.0000, 0.0525, 0.1620, { 0.0000, 0.0000, 0.0000 }, 0.7682, 0.0880, { 0.0000, 0.0000, 0.0000 }, 0.1250, 1.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_CITY = { 1.0000, 0.5000, 0.3162, 0.3981, 1.0000, 1.4900, 0.6700, 1.0000, 0.0730, 0.0070, { 0.0000, 0.0000, 0.0000 }, 0.1427, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_MOUNTAINS = { 1.0000, 0.2700, 0.3162, 0.0562, 1.0000, 1.4900, 0.2100, 1.0000, 0.0407, 0.3000, { 0.0000, 0.0000, 0.0000 }, 0.1919, 0.1000, { 0.0000, 0.0000, 0.0000 }, 0.2500, 1.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_QUARRY = { 1.0000, 1.0000, 0.3162, 0.3162, 1.0000, 1.4900, 0.8300, 1.0000, 0.0000, 0.0610, { 0.0000, 0.0000, 0.0000 }, 1.7783, 0.0250, { 0.0000, 0.0000, 0.0000 }, 0.1250, 0.7000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_PLAIN = { 1.0000, 0.2100, 0.3162, 0.1000, 1.0000, 1.4900, 0.5000, 1.0000, 0.0585, 0.1790, { 0.0000, 0.0000, 0.0000 }, 0.1089, 0.1000, { 0.0000, 0.0000, 0.0000 }, 0.2500, 1.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_PARKINGLOT = { 1.0000, 1.0000, 0.3162, 1.0000, 1.0000, 1.6500, 1.5000, 1.0000, 0.2082, 0.0080, { 0.0000, 0.0000, 0.0000 }, 0.2652, 0.0120, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_SEWERPIPE = { 0.3071, 0.8000, 0.3162, 0.3162, 1.0000, 2.8100, 0.1400, 1.0000, 1.6387, 0.0140, { 0.0000, 0.0000, 0.0000 }, 3.2471, 0.0210, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_UNDERWATER = { 0.3645, 1.0000, 0.3162, 0.0100, 1.0000, 1.4900, 0.1000, 1.0000, 0.5963, 0.0070, { 0.0000, 0.0000, 0.0000 }, 7.0795, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 1.1800, 0.3480, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_DRUGGED = { 0.4287, 0.5000, 0.3162, 1.0000, 1.0000, 8.3900, 1.3900, 1.0000, 0.8760, 0.0020, { 0.0000, 0.0000, 0.0000 }, 3.1081, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 1.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_DIZZY = { 0.3645, 0.6000, 0.3162, 0.6310, 1.0000, 17.2300, 0.5600, 1.0000, 0.1392, 0.0200, { 0.0000, 0.0000, 0.0000 }, 0.4937, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.2500, 1.0000, 0.8100, 0.3100, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_PSYCHOTIC = { 0.0625, 0.5000, 0.3162, 0.8404, 1.0000, 7.5600, 0.9100, 1.0000, 0.4864, 0.0200, { 0.0000, 0.0000, 0.0000 }, 2.4378, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 4.0000, 1.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_CASTLE_SMALLROOM = { 1.0000, 0.8900, 0.3162, 0.3981, 0.1000, 1.2200, 0.8300, 0.3100, 0.8913, 0.0220, { 0.0000, 0.0000, 0.0000 }, 1.9953, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 },
    REVERB_PRESET_CASTLE_SHORTPASSAGE = { 1.0000, 0.8900, 0.3162, 0.3162, 0.1000, 2.3200, 0.8300, 0.3100, 0.8913, 0.0070, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0230, { 0.0000, 0.0000, 0.0000 }, 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 },
    REVERB_PRESET_CASTLE_MEDIUMROOM = { 1.0000, 0.9300, 0.3162, 0.2818, 0.1000, 2.0400, 0.8300, 0.4600, 0.6310, 0.0220, { 0.0000, 0.0000, 0.0000 }, 1.5849, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.1550, 0.0300, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 },
    REVERB_PRESET_CASTLE_LARGEROOM = { 1.0000, 0.8200, 0.3162, 0.2818, 0.1259, 2.5300, 0.8300, 0.5000, 0.4467, 0.0340, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0160, { 0.0000, 0.0000, 0.0000 }, 0.1850, 0.0700, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 },
    REVERB_PRESET_CASTLE_LONGPASSAGE = { 1.0000, 0.8900, 0.3162, 0.3981, 0.1000, 3.4200, 0.8300, 0.3100, 0.8913, 0.0070, { 0.0000, 0.0000, 0.0000 }, 1.4125, 0.0230, { 0.0000, 0.0000, 0.0000 }, 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 },
    REVERB_PRESET_CASTLE_HALL = { 1.0000, 0.8100, 0.3162, 0.2818, 0.1778, 3.1400, 0.7900, 0.6200, 0.1778, 0.0560, { 0.0000, 0.0000, 0.0000 }, 1.1220, 0.0240, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 },
    REVERB_PRESET_CASTLE_CUPBOARD = { 1.0000, 0.8900, 0.3162, 0.2818, 0.1000, 0.6700, 0.8700, 0.3100, 1.4125, 0.0100, { 0.0000, 0.0000, 0.0000 }, 3.5481, 0.0070, { 0.0000, 0.0000, 0.0000 }, 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 },
    REVERB_PRESET_CASTLE_COURTYARD = { 1.0000, 0.4200, 0.3162, 0.4467, 0.1995, 2.1300, 0.6100, 0.2300, 0.2239, 0.1600, { 0.0000, 0.0000, 0.0000 }, 0.7079, 0.0360, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.3700, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_CASTLE_ALCOVE = { 1.0000, 0.8900, 0.3162, 0.5012, 0.1000, 1.6400, 0.8700, 0.3100, 1.0000, 0.0070, { 0.0000, 0.0000, 0.0000 }, 1.4125, 0.0340, { 0.0000, 0.0000, 0.0000 }, 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 },
    REVERB_PRESET_FACTORY_SMALLROOM = { 0.3645, 0.8200, 0.3162, 0.7943, 0.5012, 1.7200, 0.6500, 1.3100, 0.7079, 0.0100, { 0.0000, 0.0000, 0.0000 }, 1.7783, 0.0240, { 0.0000, 0.0000, 0.0000 }, 0.1190, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 },
    REVERB_PRESET_FACTORY_SHORTPASSAGE = { 0.3645, 0.6400, 0.2512, 0.7943, 0.5012, 2.5300, 0.6500, 1.3100, 1.0000, 0.0100, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0380, { 0.0000, 0.0000, 0.0000 }, 0.1350, 0.2300, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 },
    REVERB_PRESET_FACTORY_MEDIUMROOM = { 0.4287, 0.8200, 0.2512, 0.7943, 0.5012, 2.7600, 0.6500, 1.3100, 0.2818, 0.0220, { 0.0000, 0.0000, 0.0000 }, 1.4125, 0.0230, { 0.0000, 0.0000, 0.0000 }, 0.1740, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 },
    REVERB_PRESET_FACTORY_LARGEROOM = { 0.4287, 0.7500, 0.2512, 0.7079, 0.6310, 4.2400, 0.5100, 1.3100, 0.1778, 0.0390, { 0.0000, 0.0000, 0.0000 }, 1.1220, 0.0230, { 0.0000, 0.0000, 0.0000 }, 0.2310, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 },
    REVERB_PRESET_FACTORY_LONGPASSAGE = { 0.3645, 0.6400, 0.2512, 0.7943, 0.5012, 4.0600, 0.6500, 1.3100, 1.0000, 0.0200, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0370, { 0.0000, 0.0000, 0.0000 }, 0.1350, 0.2300, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 },
    REVERB_PRESET_FACTORY_HALL = { 0.4287, 0.7500, 0.3162, 0.7079, 0.6310, 7.4300, 0.5100, 1.3100, 0.0631, 0.0730, { 0.0000, 0.0000, 0.0000 }, 0.8913, 0.0270, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 },
    REVERB_PRESET_FACTORY_CUPBOARD = { 0.3071, 0.6300, 0.2512, 0.7943, 0.5012, 0.4900, 0.6500, 1.3100, 1.2589, 0.0100, { 0.0000, 0.0000, 0.0000 }, 1.9953, 0.0320, { 0.0000, 0.0000, 0.0000 }, 0.1070, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 },
    REVERB_PRESET_FACTORY_COURTYARD = { 0.3071, 0.5700, 0.3162, 0.3162, 0.6310, 2.3200, 0.2900, 0.5600, 0.2239, 0.1400, { 0.0000, 0.0000, 0.0000 }, 0.3981, 0.0390, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.2900, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 },
    REVERB_PRESET_FACTORY_ALCOVE = { 0.3645, 0.5900, 0.2512, 0.7943, 0.5012, 3.1400, 0.6500, 1.3100, 1.4125, 0.0100, { 0.0000, 0.0000, 0.0000 }, 1.0000, 0.0380, { 0.0000, 0.0000, 0.0000 }, 0.1140, 0.1000, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 },
    REVERB_PRESET_ICEPALACE_SMALLROOM = { 1.0000, 0.8400, 0.3162, 0.5623, 0.2818, 1.5100, 1.5300, 0.2700, 0.8913, 0.0100, { 0.0000, 0.0000, 0.0000 }, 1.4125, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.1640, 0.1400, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_ICEPALACE_SHORTPASSAGE = { 1.0000, 0.7500, 0.3162, 0.5623, 0.2818, 1.7900, 1.4600, 0.2800, 0.5012, 0.0100, { 0.0000, 0.0000, 0.0000 }, 1.1220, 0.0190, { 0.0000, 0.0000, 0.0000 }, 0.1770, 0.0900, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_ICEPALACE_MEDIUMROOM = { 1.0000, 0.8700, 0.3162, 0.5623, 0.4467, 2.2200, 1.5300, 0.3200, 0.3981, 0.0390, { 0.0000, 0.0000, 0.0000 }, 1.1220, 0.0270, { 0.0000, 0.0000, 0.0000 }, 0.1860, 0.1200, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_ICEPALACE_LARGEROOM = { 1.0000, 0.8100, 0.3162, 0.5623, 0.4467, 3.1400, 1.5300, 0.3200, 0.2512, 0.0390, { 0.0000, 0.0000, 0.0000 }, 1.0000, 0.0270, { 0.0000, 0.0000, 0.0000 }, 0.2140, 0.1100, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_ICEPALACE_LONGPASSAGE = { 1.0000, 0.7700, 0.3162, 0.5623, 0.3981, 3.0100, 1.4600, 0.2800, 0.7943, 0.0120, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0250, { 0.0000, 0.0000, 0.0000 }, 0.1860, 0.0400, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_ICEPALACE_HALL = { 1.0000, 0.7600, 0.3162, 0.4467, 0.5623, 5.4900, 1.5300, 0.3800, 0.1122, 0.0540, { 0.0000, 0.0000, 0.0000 }, 0.6310, 0.0520, { 0.0000, 0.0000, 0.0000 }, 0.2260, 0.1100, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_ICEPALACE_CUPBOARD = { 1.0000, 0.8300, 0.3162, 0.5012, 0.2239, 0.7600, 1.5300, 0.2600, 1.1220, 0.0120, { 0.0000, 0.0000, 0.0000 }, 1.9953, 0.0160, { 0.0000, 0.0000, 0.0000 }, 0.1430, 0.0800, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_ICEPALACE_COURTYARD = { 1.0000, 0.5900, 0.3162, 0.2818, 0.3162, 2.0400, 1.2000, 0.3800, 0.3162, 0.1730, { 0.0000, 0.0000, 0.0000 }, 0.3162, 0.0430, { 0.0000, 0.0000, 0.0000 }, 0.2350, 0.4800, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_ICEPALACE_ALCOVE = { 1.0000, 0.8400, 0.3162, 0.5623, 0.2818, 2.7600, 1.4600, 0.2800, 1.1220, 0.0100, { 0.0000, 0.0000, 0.0000 }, 0.8913, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.1610, 0.0900, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_SPACESTATION_SMALLROOM = { 0.2109, 0.7000, 0.3162, 0.7079, 0.8913, 1.7200, 0.8200, 0.5500, 0.7943, 0.0070, { 0.0000, 0.0000, 0.0000 }, 1.4125, 0.0130, { 0.0000, 0.0000, 0.0000 }, 0.1880, 0.2600, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 },
    REVERB_PRESET_SPACESTATION_SHORTPASSAGE = { 0.2109, 0.8700, 0.3162, 0.6310, 0.8913, 3.5700, 0.5000, 0.5500, 1.0000, 0.0120, { 0.0000, 0.0000, 0.0000 }, 1.1220, 0.0160, { 0.0000, 0.0000, 0.0000 }, 0.1720, 0.2000, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 },
    REVERB_PRESET_SPACESTATION_MEDIUMROOM = { 0.2109, 0.7500, 0.3162, 0.6310, 0.8913, 3.0100, 0.5000, 0.5500, 0.3981, 0.0340, { 0.0000, 0.0000, 0.0000 }, 1.1220, 0.0350, { 0.0000, 0.0000, 0.0000 }, 0.2090, 0.3100, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 },
    REVERB_PRESET_SPACESTATION_LARGEROOM = { 0.3645, 0.8100, 0.3162, 0.6310, 0.8913, 3.8900, 0.3800, 0.6100, 0.3162, 0.0560, { 0.0000, 0.0000, 0.0000 }, 0.8913, 0.0350, { 0.0000, 0.0000, 0.0000 }, 0.2330, 0.2800, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 },
    REVERB_PRESET_SPACESTATION_LONGPASSAGE = { 0.4287, 0.8200, 0.3162, 0.6310, 0.8913, 4.6200, 0.6200, 0.5500, 1.0000, 0.0120, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0310, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.2300, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 },
    REVERB_PRESET_SPACESTATION_HALL = { 0.4287, 0.8700, 0.3162, 0.6310, 0.8913, 7.1100, 0.3800, 0.6100, 0.1778, 0.1000, { 0.0000, 0.0000, 0.0000 }, 0.6310, 0.0470, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.2500, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 },
    REVERB_PRESET_SPACESTATION_CUPBOARD = { 0.1715, 0.5600, 0.3162, 0.7079, 0.8913, 0.7900, 0.8100, 0.5500, 1.4125, 0.0070, { 0.0000, 0.0000, 0.0000 }, 1.7783, 0.0180, { 0.0000, 0.0000, 0.0000 }, 0.1810, 0.3100, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 },
    REVERB_PRESET_SPACESTATION_ALCOVE = { 0.2109, 0.7800, 0.3162, 0.7079, 0.8913, 1.1600, 0.8100, 0.5500, 1.4125, 0.0070, { 0.0000, 0.0000, 0.0000 }, 1.0000, 0.0180, { 0.0000, 0.0000, 0.0000 }, 0.1920, 0.2100, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 },
    REVERB_PRESET_WOODEN_SMALLROOM = { 1.0000, 1.0000, 0.3162, 0.1122, 0.3162, 0.7900, 0.3200, 0.8700, 1.0000, 0.0320, { 0.0000, 0.0000, 0.0000 }, 0.8913, 0.0290, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_WOODEN_SHORTPASSAGE = { 1.0000, 1.0000, 0.3162, 0.1259, 0.3162, 1.7500, 0.5000, 0.8700, 0.8913, 0.0120, { 0.0000, 0.0000, 0.0000 }, 0.6310, 0.0240, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_WOODEN_MEDIUMROOM = { 1.0000, 1.0000, 0.3162, 0.1000, 0.2818, 1.4700, 0.4200, 0.8200, 0.8913, 0.0490, { 0.0000, 0.0000, 0.0000 }, 0.8913, 0.0290, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_WOODEN_LARGEROOM = { 1.0000, 1.0000, 0.3162, 0.0891, 0.2818, 2.6500, 0.3300, 0.8200, 0.8913, 0.0660, { 0.0000, 0.0000, 0.0000 }, 0.7943, 0.0490, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_WOODEN_LONGPASSAGE = { 1.0000, 1.0000, 0.3162, 0.1000, 0.3162, 1.9900, 0.4000, 0.7900, 1.0000, 0.0200, { 0.0000, 0.0000, 0.0000 }, 0.4467, 0.0360, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_WOODEN_HALL = { 1.0000, 1.0000, 0.3162, 0.0794, 0.2818, 3.4500, 0.3000, 0.8200, 0.8913, 0.0880, { 0.0000, 0.0000, 0.0000 }, 0.7943, 0.0630, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_WOODEN_CUPBOARD = { 1.0000, 1.0000, 0.3162, 0.1413, 0.3162, 0.5600, 0.4600, 0.9100, 1.1220, 0.0120, { 0.0000, 0.0000, 0.0000 }, 1.1220, 0.0280, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_WOODEN_COURTYARD = { 1.0000, 0.6500, 0.3162, 0.0794, 0.3162, 1.7900, 0.3500, 0.7900, 0.5623, 0.1230, { 0.0000, 0.0000, 0.0000 }, 0.1000, 0.0320, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_WOODEN_ALCOVE = { 1.0000, 1.0000, 0.3162, 0.1259, 0.3162, 1.2200, 0.6200, 0.9100, 1.1220, 0.0120, { 0.0000, 0.0000, 0.0000 }, 0.7079, 0.0240, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 },
    REVERB_PRESET_SPORT_EMPTYSTADIUM = { 1.0000, 1.0000, 0.3162, 0.4467, 0.7943, 6.2600, 0.5100, 1.1000, 0.0631, 0.1830, { 0.0000, 0.0000, 0.0000 }, 0.3981, 0.0380, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_SPORT_SQUASHCOURT = { 1.0000, 0.7500, 0.3162, 0.3162, 0.7943, 2.2200, 0.9100, 1.1600, 0.4467, 0.0070, { 0.0000, 0.0000, 0.0000 }, 0.7943, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.1260, 0.1900, 0.2500, 0.0000, 0.9943, 7176.8999, 211.2000, 0.0000, 0x1 },
    REVERB_PRESET_SPORT_SMALLSWIMMINGPOOL = { 1.0000, 0.7000, 0.3162, 0.7943, 0.8913, 2.7600, 1.2500, 1.1400, 0.6310, 0.0200, { 0.0000, 0.0000, 0.0000 }, 0.7943, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.1790, 0.1500, 0.8950, 0.1900, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_SPORT_LARGESWIMMINGPOOL = { 1.0000, 0.8200, 0.3162, 0.7943, 1.0000, 5.4900, 1.3100, 1.1400, 0.4467, 0.0390, { 0.0000, 0.0000, 0.0000 }, 0.5012, 0.0490, { 0.0000, 0.0000, 0.0000 }, 0.2220, 0.5500, 1.1590, 0.2100, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_SPORT_GYMNASIUM = { 1.0000, 0.8100, 0.3162, 0.4467, 0.8913, 3.1400, 1.0600, 1.3500, 0.3981, 0.0290, { 0.0000, 0.0000, 0.0000 }, 0.5623, 0.0450, { 0.0000, 0.0000, 0.0000 }, 0.1460, 0.1400, 0.2500, 0.0000, 0.9943, 7176.8999, 211.2000, 0.0000, 0x1 },
    REVERB_PRESET_SPORT_FULLSTADIUM = { 1.0000, 1.0000, 0.3162, 0.0708, 0.7943, 5.2500, 0.1700, 0.8000, 0.1000, 0.1880, { 0.0000, 0.0000, 0.0000 }, 0.2818, 0.0380, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_SPORT_STADIUMTANNOY = { 1.0000, 0.7800, 0.3162, 0.5623, 0.5012, 2.5300, 0.8800, 0.6800, 0.2818, 0.2300, { 0.0000, 0.0000, 0.0000 }, 0.5012, 0.0630, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.2000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_PREFAB_WORKSHOP = { 0.4287, 1.0000, 0.3162, 0.1413, 0.3981, 0.7600, 1.0000, 1.0000, 1.0000, 0.0120, { 0.0000, 0.0000, 0.0000 }, 1.1220, 0.0120, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_PREFAB_SCHOOLROOM = { 0.4022, 0.6900, 0.3162, 0.6310, 0.5012, 0.9800, 0.4500, 0.1800, 1.4125, 0.0170, { 0.0000, 0.0000, 0.0000 }, 1.4125, 0.0150, { 0.0000, 0.0000, 0.0000 }, 0.0950, 0.1400, 0.2500, 0.0000, 0.9943, 7176.8999, 211.2000, 0.0000, 0x1 },
    REVERB_PRESET_PREFAB_PRACTISEROOM = { 0.4022, 0.8700, 0.3162, 0.3981, 0.5012, 1.1200, 0.5600, 0.1800, 1.2589, 0.0100, { 0.0000, 0.0000, 0.0000 }, 1.4125, 0.0110, { 0.0000, 0.0000, 0.0000 }, 0.0950, 0.1400, 0.2500, 0.0000, 0.9943, 7176.8999, 211.2000, 0.0000, 0x1 },
    REVERB_PRESET_PREFAB_OUTHOUSE = { 1.0000, 0.8200, 0.3162, 0.1122, 0.1585, 1.3800, 0.3800, 0.3500, 0.8913, 0.0240, { 0.0000, 0.0000, -0.0000 }, 0.6310, 0.0440, { 0.0000, 0.0000, 0.0000 }, 0.1210, 0.1700, 0.2500, 0.0000, 0.9943, 2854.3999, 107.5000, 0.0000, 0x0 },
    REVERB_PRESET_PREFAB_CARAVAN = { 1.0000, 1.0000, 0.3162, 0.0891, 0.1259, 0.4300, 1.5000, 1.0000, 1.0000, 0.0120, { 0.0000, 0.0000, 0.0000 }, 1.9953, 0.0120, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_DOME_TOMB = { 1.0000, 0.7900, 0.3162, 0.3548, 0.2239, 4.1800, 0.2100, 0.1000, 0.3868, 0.0300, { 0.0000, 0.0000, 0.0000 }, 1.6788, 0.0220, { 0.0000, 0.0000, 0.0000 }, 0.1770, 0.1900, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x0 },
    REVERB_PRESET_PIPE_SMALL = { 1.0000, 1.0000, 0.3162, 0.3548, 0.2239, 5.0400, 0.1000, 0.1000, 0.5012, 0.0320, { 0.0000, 0.0000, 0.0000 }, 2.5119, 0.0150, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x1 },
    REVERB_PRESET_DOME_SAINTPAULS = { 1.0000, 0.8700, 0.3162, 0.3548, 0.2239, 10.4800, 0.1900, 0.1000, 0.1778, 0.0900, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0420, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.1200, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x1 },
    REVERB_PRESET_PIPE_LONGTHIN = { 0.2560, 0.9100, 0.3162, 0.4467, 0.2818, 9.2100, 0.1800, 0.1000, 0.7079, 0.0100, { 0.0000, 0.0000, 0.0000 }, 0.7079, 0.0220, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x0 },
    REVERB_PRESET_PIPE_LARGE = { 1.0000, 1.0000, 0.3162, 0.3548, 0.2239, 8.4500, 0.1000, 0.1000, 0.3981, 0.0460, { 0.0000, 0.0000, 0.0000 }, 1.5849, 0.0320, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x1 },
    REVERB_PRESET_PIPE_RESONANT = { 0.1373, 0.9100, 0.3162, 0.4467, 0.2818, 6.8100, 0.1800, 0.1000, 0.7079, 0.0100, { 0.0000, 0.0000, 0.0000 }, 1.0000, 0.0220, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x0 },
    REVERB_PRESET_OUTDOORS_BACKYARD = { 1.0000, 0.4500, 0.3162, 0.2512, 0.5012, 1.1200, 0.3400, 0.4600, 0.4467, 0.0690, { 0.0000, 0.0000, -0.0000 }, 0.7079, 0.0230, { 0.0000, 0.0000, 0.0000 }, 0.2180, 0.3400, 0.2500, 0.0000, 0.9943, 4399.1001, 242.9000, 0.0000, 0x0 },
    REVERB_PRESET_OUTDOORS_ROLLINGPLAINS = { 1.0000, 0.0000, 0.3162, 0.0112, 0.6310, 2.1300, 0.2100, 0.4600, 0.1778, 0.3000, { 0.0000, 0.0000, -0.0000 }, 0.4467, 0.0190, { 0.0000, 0.0000, 0.0000 }, 0.2500, 1.0000, 0.2500, 0.0000, 0.9943, 4399.1001, 242.9000, 0.0000, 0x0 },
    REVERB_PRESET_OUTDOORS_DEEPCANYON = { 1.0000, 0.7400, 0.3162, 0.1778, 0.6310, 3.8900, 0.2100, 0.4600, 0.3162, 0.2230, { 0.0000, 0.0000, -0.0000 }, 0.3548, 0.0190, { 0.0000, 0.0000, 0.0000 }, 0.2500, 1.0000, 0.2500, 0.0000, 0.9943, 4399.1001, 242.9000, 0.0000, 0x0 },
    REVERB_PRESET_OUTDOORS_CREEK = { 1.0000, 0.3500, 0.3162, 0.1778, 0.5012, 2.1300, 0.2100, 0.4600, 0.3981, 0.1150, { 0.0000, 0.0000, -0.0000 }, 0.1995, 0.0310, { 0.0000, 0.0000, 0.0000 }, 0.2180, 0.3400, 0.2500, 0.0000, 0.9943, 4399.1001, 242.9000, 0.0000, 0x0 },
    REVERB_PRESET_OUTDOORS_VALLEY = { 1.0000, 0.2800, 0.3162, 0.0282, 0.1585, 2.8800, 0.2600, 0.3500, 0.1413, 0.2630, { 0.0000, 0.0000, -0.0000 }, 0.3981, 0.1000, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.3400, 0.2500, 0.0000, 0.9943, 2854.3999, 107.5000, 0.0000, 0x0 },
    REVERB_PRESET_MOOD_HEAVEN = { 1.0000, 0.9400, 0.3162, 0.7943, 0.4467, 5.0400, 1.1200, 0.5600, 0.2427, 0.0200, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0290, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0800, 2.7420, 0.0500, 0.9977, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_MOOD_HELL = { 1.0000, 0.5700, 0.3162, 0.3548, 0.4467, 3.5700, 0.4900, 2.0000, 0.0000, 0.0200, { 0.0000, 0.0000, 0.0000 }, 1.4125, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.1100, 0.0400, 2.1090, 0.5200, 0.9943, 5000.0000, 139.5000, 0.0000, 0x0 },
    REVERB_PRESET_MOOD_MEMORY = { 1.0000, 0.8500, 0.3162, 0.6310, 0.3548, 4.0600, 0.8200, 0.5600, 0.0398, 0.0000, { 0.0000, 0.0000, 0.0000 }, 1.1220, 0.0000, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.4740, 0.4500, 0.9886, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_DRIVING_COMMENTATOR = { 1.0000, 0.0000, 0.3162, 0.5623, 0.5012, 2.4200, 0.8800, 0.6800, 0.1995, 0.0930, { 0.0000, 0.0000, 0.0000 }, 0.2512, 0.0170, { 0.0000, 0.0000, 0.0000 }, 0.2500, 1.0000, 0.2500, 0.0000, 0.9886, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_DRIVING_PITGARAGE = { 0.4287, 0.5900, 0.3162, 0.7079, 0.5623, 1.7200, 0.9300, 0.8700, 0.5623, 0.0000, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0160, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.1100, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_DRIVING_INCAR_RACER = { 0.0832, 0.8000, 0.3162, 1.0000, 0.7943, 0.1700, 2.0000, 0.4100, 1.7783, 0.0070, { 0.0000, 0.0000, 0.0000 }, 0.7079, 0.0150, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10268.2002, 251.0000, 0.0000, 0x1 },
    REVERB_PRESET_DRIVING_INCAR_SPORTS = { 0.0832, 0.8000, 0.3162, 0.6310, 1.0000, 0.1700, 0.7500, 0.4100, 1.0000, 0.0100, { 0.0000, 0.0000, 0.0000 }, 0.5623, 0.0000, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10268.2002, 251.0000, 0.0000, 0x1 },
    REVERB_PRESET_DRIVING_INCAR_LUXURY = { 0.2560, 1.0000, 0.3162, 0.1000, 0.5012, 0.1300, 0.4100, 0.4600, 0.7943, 0.0100, { 0.0000, 0.0000, 0.0000 }, 1.5849, 0.0100, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10268.2002, 251.0000, 0.0000, 0x1 },
    REVERB_PRESET_DRIVING_FULLGRANDSTAND = { 1.0000, 1.0000, 0.3162, 0.2818, 0.6310, 3.0100, 1.3700, 1.2800, 0.3548, 0.0900, { 0.0000, 0.0000, 0.0000 }, 0.1778, 0.0490, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10420.2002, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_DRIVING_EMPTYGRANDSTAND = { 1.0000, 1.0000, 0.3162, 1.0000, 0.7943, 4.6200, 1.7500, 1.4000, 0.2082, 0.0900, { 0.0000, 0.0000, 0.0000 }, 0.2512, 0.0490, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10420.2002, 250.0000, 0.0000, 0x0 },
    REVERB_PRESET_DRIVING_TUNNEL = { 1.0000, 0.8100, 0.3162, 0.3981, 0.8913, 3.4200, 0.9400, 1.3100, 0.7079, 0.0510, { 0.0000, 0.0000, 0.0000 }, 0.7079, 0.0470, { 0.0000, 0.0000, 0.0000 }, 0.2140, 0.0500, 0.2500, 0.0000, 0.9943, 5000.0000, 155.3000, 0.0000, 0x1 },
    REVERB_PRESET_CITY_STREETS = { 1.0000, 0.7800, 0.3162, 0.7079, 0.8913, 1.7900, 1.1200, 0.9100, 0.2818, 0.0460, { 0.0000, 0.0000, 0.0000 }, 0.1995, 0.0280, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.2000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_CITY_SUBWAY = { 1.0000, 0.7400, 0.3162, 0.7079, 0.8913, 3.0100, 1.2300, 0.9100, 0.7079, 0.0460, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0280, { 0.0000, 0.0000, 0.0000 }, 0.1250, 0.2100, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_CITY_MUSEUM = { 1.0000, 0.8200, 0.3162, 0.1778, 0.1778, 3.2800, 1.4000, 0.5700, 0.2512, 0.0390, { 0.0000, 0.0000, -0.0000 }, 0.8913, 0.0340, { 0.0000, 0.0000, 0.0000 }, 0.1300, 0.1700, 0.2500, 0.0000, 0.9943, 2854.3999, 107.5000, 0.0000, 0x0 },
    REVERB_PRESET_CITY_LIBRARY = { 1.0000, 0.8200, 0.3162, 0.2818, 0.0891, 2.7600, 0.8900, 0.4100, 0.3548, 0.0290, { 0.0000, 0.0000, -0.0000 }, 0.8913, 0.0200, { 0.0000, 0.0000, 0.0000 }, 0.1300, 0.1700, 0.2500, 0.0000, 0.9943, 2854.3999, 107.5000, 0.0000, 0x0 },
    REVERB_PRESET_CITY_UNDERPASS = { 1.0000, 0.8200, 0.3162, 0.4467, 0.8913, 3.5700, 1.1200, 0.9100, 0.3981, 0.0590, { 0.0000, 0.0000, 0.0000 }, 0.8913, 0.0370, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.1400, 0.2500, 0.0000, 0.9920, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_CITY_ABANDONED = { 1.0000, 0.6900, 0.3162, 0.7943, 0.8913, 3.2800, 1.1700, 0.9100, 0.4467, 0.0440, { 0.0000, 0.0000, 0.0000 }, 0.2818, 0.0240, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.2000, 0.2500, 0.0000, 0.9966, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_DUSTYROOM = { 0.3645, 0.5600, 0.3162, 0.7943, 0.7079, 1.7900, 0.3800, 0.2100, 0.5012, 0.0020, { 0.0000, 0.0000, 0.0000 }, 1.2589, 0.0060, { 0.0000, 0.0000, 0.0000 }, 0.2020, 0.0500, 0.2500, 0.0000, 0.9886, 13046.0000, 163.3000, 0.0000, 0x1 },
    REVERB_PRESET_CHAPEL = { 1.0000, 0.8400, 0.3162, 0.5623, 1.0000, 4.6200, 0.6400, 1.2300, 0.4467, 0.0320, { 0.0000, 0.0000, 0.0000 }, 0.7943, 0.0490, { 0.0000, 0.0000, 0.0000 }, 0.2500, 0.0000, 0.2500, 0.1100, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 },
    REVERB_PRESET_SMALLWATERROOM = { 1.0000, 0.7000, 0.3162, 0.4477, 1.0000, 1.5100, 1.2500, 1.1400, 0.8913, 0.0200, { 0.0000, 0.0000, 0.0000 }, 1.4125, 0.0300, { 0.0000, 0.0000, 0.0000 }, 0.1790, 0.1500, 0.8950, 0.1900, 0.9920, 5000.0000, 250.0000, 0.0000, 0x0 },
}

return presets