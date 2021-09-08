return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 30,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 3,
  nextobjectid = 100,
  properties = {},
  tilesets = {
    {
      name = "dungeon-tileset",
      firstgid = 1,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 10,
      image = "../../art/tilesets/dungeon.png",
      imagewidth = 160,
      imageheight = 176,
      objectalignment = "topleft",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 110,
      tiles = {
        {
          id = 0,
          type = "wall"
        },
        {
          id = 1,
          type = "wall"
        },
        {
          id = 2,
          type = "wall"
        },
        {
          id = 3,
          type = "wall"
        },
        {
          id = 4,
          type = "wall"
        },
        {
          id = 5,
          type = "wall"
        },
        {
          id = 6,
          type = "floor"
        },
        {
          id = 7,
          type = "floor"
        },
        {
          id = 8,
          type = "floor"
        },
        {
          id = 9,
          type = "floor"
        },
        {
          id = 10,
          type = "wall"
        },
        {
          id = 11,
          type = "floor"
        },
        {
          id = 12,
          type = "floor"
        },
        {
          id = 13,
          type = "floor"
        },
        {
          id = 14,
          type = "floor"
        },
        {
          id = 15,
          type = "wall"
        },
        {
          id = 16,
          type = "floor"
        },
        {
          id = 17,
          type = "floor"
        },
        {
          id = 18,
          type = "floor"
        },
        {
          id = 19,
          type = "floor"
        },
        {
          id = 20,
          type = "wall"
        },
        {
          id = 21,
          type = "floor"
        },
        {
          id = 22,
          type = "floor"
        },
        {
          id = 23,
          type = "floor"
        },
        {
          id = 24,
          type = "floor"
        },
        {
          id = 25,
          type = "wall"
        },
        {
          id = 26,
          type = "floor"
        },
        {
          id = 27,
          type = "floor"
        },
        {
          id = 28,
          type = "floor"
        },
        {
          id = 29,
          type = "floor"
        },
        {
          id = 30,
          type = "wall"
        },
        {
          id = 31,
          type = "floor"
        },
        {
          id = 32,
          type = "floor"
        },
        {
          id = 33,
          type = "floor"
        },
        {
          id = 34,
          type = "floor"
        },
        {
          id = 35,
          type = "wall"
        },
        {
          id = 36,
          type = "wall"
        },
        {
          id = 37,
          type = "wall"
        },
        {
          id = 40,
          type = "wall"
        },
        {
          id = 41,
          type = "wall"
        },
        {
          id = 42,
          type = "wall"
        },
        {
          id = 43,
          type = "wall"
        },
        {
          id = 44,
          type = "wall"
        },
        {
          id = 45,
          type = "wall"
        },
        {
          id = 50,
          type = "wall"
        },
        {
          id = 51,
          type = "wall"
        },
        {
          id = 52,
          type = "wall"
        },
        {
          id = 53,
          type = "wall"
        },
        {
          id = 54,
          type = "wall"
        },
        {
          id = 55,
          type = "wall"
        },
        {
          id = 60,
          type = "floor"
        },
        {
          id = 61,
          type = "floor"
        },
        {
          id = 62,
          type = "floor"
        },
        {
          id = 63,
          type = "floor"
        },
        {
          id = 70,
          type = "floor"
        },
        {
          id = 71,
          type = "floor"
        },
        {
          id = 72,
          type = "floor"
        },
        {
          id = 73,
          type = "floor"
        },
        {
          id = 78,
          type = "pit"
        },
        {
          id = 100,
          type = "pit"
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 30,
      id = 1,
      name = "map",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 3, 2, 5, 4, 5, 4, 3, 46, 79, 79, 79, 4, 5, 2, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 4, 17, 20, 19, 27, 30, 17, 30, 20, 79, 79, 79, 101, 20, 27, 28, 3, 3, 79, 79, 79, 41, 5, 26, 0, 0,
        0, 0, 0, 0, 37, 17, 9, 29, 30, 7, 9, 8, 29, 19, 9, 7, 7, 7, 10, 7, 4, 29, 9, 17, 79, 101, 101, 4, 0, 0,
        0, 0, 0, 0, 54, 7, 29, 29, 29, 27, 30, 27, 7, 7, 27, 20, 27, 17, 27, 7, 7, 27, 7, 7, 7, 29, 24, 24, 0, 0,
        0, 0, 0, 0, 11, 19, 28, 7, 18, 29, 20, 101, 30, 30, 28, 101, 3, 22, 10, 25, 4, 3, 18, 8, 101, 101, 101, 55, 0, 0,
        0, 0, 0, 0, 21, 8, 20, 19, 29, 18, 101, 79, 101, 20, 101, 79, 43, 44, 42, 101, 53, 101, 8, 7, 51, 44, 45, 46, 0, 0,
        0, 0, 0, 0, 11, 28, 101, 27, 101, 101, 79, 79, 79, 27, 79, 79, 79, 79, 79, 79, 79, 79, 8, 10, 16, 0, 0, 0, 0, 0,
        0, 0, 2, 2, 2, 4, 79, 24, 79, 4, 79, 79, 79, 27, 79, 79, 79, 79, 79, 27, 17, 10, 20, 25, 16, 0, 0, 0, 0, 0,
        0, 0, 2, 30, 101, 18, 18, 24, 18, 7, 17, 8, 29, 28, 9, 20, 28, 8, 79, 18, 8, 9, 10, 25, 36, 0, 0, 0, 0, 0,
        0, 0, 2, 7, 79, 10, 101, 18, 18, 4, 101, 19, 18, 28, 30, 19, 30, 27, 79, 19, 19, 29, 29, 25, 26, 0, 0, 0, 0, 0,
        0, 0, 2, 101, 79, 28, 79, 101, 101, 101, 79, 28, 7, 29, 18, 10, 29, 7, 79, 3, 28, 7, 9, 19, 16, 0, 0, 0, 0, 0,
        0, 0, 2, 79, 79, 29, 79, 79, 79, 79, 79, 8, 7, 8, 29, 17, 10, 29, 79, 2, 27, 9, 27, 18, 26, 0, 0, 0, 0, 0,
        0, 0, 2, 79, 79, 30, 79, 79, 79, 79, 79, 19, 30, 17, 30, 30, 7, 9, 8, 10, 9, 10, 29, 7, 26, 0, 0, 0, 0, 0,
        0, 0, 2, 79, 79, 19, 79, 79, 41, 28, 79, 8, 17, 7, 20, 28, 19, 10, 101, 3, 29, 10, 9, 7, 26, 0, 0, 0, 0, 0,
        0, 0, 2, 29, 18, 29, 17, 9, 7, 17, 79, 29, 28, 30, 19, 30, 19, 29, 79, 56, 29, 20, 28, 25, 26, 0, 0, 0, 0, 0,
        0, 0, 2, 28, 101, 101, 101, 28, 19, 30, 79, 101, 101, 101, 101, 101, 101, 101, 79, 41, 5, 19, 29, 29, 26, 0, 0, 0, 0, 0,
        0, 0, 2, 27, 27, 19, 79, 30, 30, 30, 79, 79, 79, 79, 8, 46, 79, 79, 79, 79, 101, 19, 29, 19, 26, 0, 0, 0, 0, 0,
        0, 0, 2, 18, 19, 10, 2, 2, 20, 2, 51, 79, 17, 30, 10, 17, 7, 18, 3, 2, 7, 7, 4, 20, 26, 0, 0, 0, 0, 0,
        0, 0, 2, 2, 20, 20, 7, 7, 8, 9, 6, 79, 19, 30, 27, 18, 30, 8, 8, 28, 30, 17, 2, 10, 4, 3, 2, 4, 4, 46,
        0, 0, 0, 21, 20, 20, 17, 17, 18, 19, 3, 4, 19, 20, 29, 101, 101, 101, 44, 56, 2, 29, 5, 28, 101, 7, 7, 7, 8, 0,
        0, 0, 0, 41, 56, 28, 9, 27, 30, 19, 7, 7, 8, 28, 20, 79, 79, 79, 79, 21, 9, 9, 18, 27, 55, 45, 43, 45, 45, 46,
        0, 0, 0, 0, 41, 43, 42, 44, 44, 44, 43, 44, 4, 4, 5, 4, 45, 43, 43, 45, 45, 43, 44, 45, 46, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "entities",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "ExitDoor",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "Tomb-GoldenKey",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "PressurePlate-RED",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "PressurePlate-GREEN",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "PressurePlate-PINK",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 53,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 1073741929,
          visible = true,
          properties = {
            ["initialFacingDir"] = "DownRight"
          }
        },
        {
          id = 55,
          name = "Tomb",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "Gate-GREEN",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "Gate-BLUE",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 336,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 62,
          name = "Gate-RED",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 63,
          name = "Gate-PINK",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 320,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 64,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 65,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 2147483753,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpLeft"
          }
        },
        {
          id = 66,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 1073741929,
          visible = true,
          properties = {
            ["initialFacingDir"] = "DownRight"
          }
        },
        {
          id = 67,
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 304,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 105,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpRight"
          }
        },
        {
          id = 87,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 88,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 2147483753,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpLeft"
          }
        },
        {
          id = 94,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 2147483753,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpLeft"
          }
        },
        {
          id = 95,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 96,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 97,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 99,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
