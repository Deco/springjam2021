return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 29,
  height = 22,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 3,
  nextobjectid = 47,
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
      width = 29,
      height = 22,
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
        79, 79, 79, 79, 79, 79, 79, 36, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 6,
        79, 79, 79, 79, 79, 79, 79, 36, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 16,
        1, 42, 45, 42, 37, 43, 44, 46, 79, 79, 79, 79, 79, 27, 8, 30, 27, 27, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 36,
        11, 79, 79, 22, 30, 25, 3, 79, 79, 79, 27, 27, 28, 17, 20, 7, 20, 7, 8, 20, 7, 79, 79, 79, 79, 79, 79, 79, 16,
        11, 79, 79, 32, 20, 35, 2, 79, 79, 79, 19, 9, 7, 17, 10, 28, 7, 28, 28, 19, 27, 79, 79, 79, 79, 79, 79, 79, 16,
        1, 79, 79, 79, 29, 79, 79, 79, 79, 79, 19, 29, 29, 29, 28, 20, 29, 30, 17, 8, 30, 79, 79, 79, 79, 79, 79, 79, 46,
        11, 79, 79, 79, 30, 79, 79, 79, 79, 79, 8, 30, 17, 7, 29, 7, 29, 19, 9, 8, 30, 79, 79, 79, 79, 79, 79, 79, 36,
        1, 79, 79, 79, 7, 79, 79, 79, 79, 79, 8, 28, 20, 10, 8, 19, 17, 17, 30, 10, 17, 79, 79, 79, 79, 79, 79, 79, 6,
        41, 79, 79, 79, 8, 79, 79, 79, 79, 79, 9, 8, 20, 19, 10, 30, 17, 28, 8, 19, 18, 79, 79, 79, 79, 79, 79, 79, 46,
        31, 79, 79, 79, 17, 79, 79, 79, 79, 79, 101, 101, 101, 4, 10, 3, 101, 101, 101, 101, 101, 79, 79, 79, 79, 79, 79, 79, 46,
        1, 79, 79, 79, 8, 79, 79, 79, 79, 79, 79, 79, 3, 3, 7, 4, 2, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 6,
        1, 79, 79, 79, 28, 8, 19, 8, 7, 29, 17, 10, 29, 30, 18, 8, 10, 29, 7, 8, 9, 10, 7, 8, 9, 10, 7, 8, 26,
        11, 79, 79, 79, 28, 79, 79, 79, 79, 79, 79, 79, 4, 2, 19, 5, 3, 79, 17, 18, 19, 20, 17, 18, 19, 20, 17, 18, 36,
        1, 79, 79, 79, 17, 79, 79, 79, 79, 79, 79, 79, 79, 79, 10, 79, 79, 79, 27, 28, 29, 30, 27, 28, 29, 30, 27, 28, 26,
        31, 79, 79, 79, 8, 7, 8, 9, 10, 7, 8, 9, 10, 7, 8, 9, 10, 7, 7, 8, 9, 10, 7, 8, 9, 10, 7, 8, 46,
        11, 79, 79, 79, 27, 79, 79, 79, 79, 79, 79, 79, 79, 79, 19, 79, 79, 79, 17, 18, 19, 20, 17, 18, 19, 20, 17, 18, 16,
        41, 79, 79, 79, 7, 79, 79, 79, 79, 79, 79, 79, 79, 79, 18, 79, 79, 79, 27, 28, 29, 30, 27, 28, 29, 30, 27, 28, 6,
        31, 79, 79, 79, 27, 79, 79, 79, 79, 79, 79, 79, 79, 79, 20, 79, 79, 79, 7, 8, 9, 10, 7, 8, 9, 10, 7, 8, 16,
        1, 79, 79, 79, 17, 79, 79, 79, 79, 79, 79, 79, 79, 79, 18, 79, 79, 79, 17, 18, 19, 20, 17, 18, 19, 20, 17, 18, 46,
        21, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 7, 8, 9, 10, 7, 8, 9, 10, 7, 8, 46,
        1, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 17, 18, 19, 20, 17, 18, 19, 20, 17, 18, 36,
        31, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 16
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
          id = 15,
          name = "Tomb-Open",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "Tomb-Open",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "Tomb-Open",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "Vampire",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 103,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "Vampire",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 103,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "Vampire",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 103,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "Gate-BLUE",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "Gate-RED",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "Gate-PINK",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "Gate-GREEN",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "Toggle-RED",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "Toggle-PINK",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "Toggle-GREEN",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "Crate",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 84,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "Toggle-PINK",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 224,
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
          id = 38,
          name = "Mirror",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 2147483750,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpLeft"
          }
        },
        {
          id = 39,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 224,
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
          id = 40,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 256,
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
          id = 41,
          name = "MovableMirror-DL",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 3221225577,
          visible = true,
          properties = {
            ["initialFacingDir"] = "DownLeft"
          }
        },
        {
          id = 42,
          name = "RotatingMirror-UR",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpRight"
          }
        },
        {
          id = 43,
          name = "RotatingMirror-UL",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 2147483750,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpLeft"
          }
        },
        {
          id = 44,
          name = "RotatingMirror-DR",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 1073741926,
          visible = true,
          properties = {
            ["initialFacingDir"] = "DownRight"
          }
        },
        {
          id = 45,
          name = "RotatingMirror-DL",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 3221225574,
          visible = true,
          properties = {
            ["initialFacingDir"] = "DownLeft"
          }
        },
        {
          id = 46,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
