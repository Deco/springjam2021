return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 25,
  height = 25,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 4,
  nextobjectid = 78,
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
      width = 25,
      height = 25,
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
        1, 4, 2, 4, 4, 4, 5, 2, 5, 3, 2, 3, 2, 3, 4, 4, 3, 4, 3, 4, 5, 3, 2, 3, 6,
        11, 18, 18, 18, 10, 29, 30, 30, 27, 10, 27, 30, 29, 29, 17, 28, 9, 17, 10, 10, 29, 28, 7, 18, 16,
        1, 18, 29, 28, 9, 29, 20, 30, 17, 30, 18, 28, 10, 29, 7, 27, 20, 27, 17, 20, 18, 30, 10, 20, 26,
        11, 7, 7, 19, 9, 27, 9, 30, 7, 27, 10, 9, 10, 8, 7, 19, 17, 20, 7, 20, 27, 17, 17, 7, 36,
        1, 20, 10, 7, 10, 29, 20, 20, 9, 17, 18, 20, 9, 29, 27, 18, 27, 30, 18, 17, 18, 29, 7, 20, 26,
        31, 8, 29, 29, 19, 19, 27, 19, 7, 29, 20, 8, 8, 7, 8, 10, 10, 17, 7, 10, 9, 19, 19, 19, 36,
        31, 9, 20, 8, 7, 9, 27, 8, 7, 20, 18, 9, 7, 28, 30, 17, 29, 28, 30, 30, 8, 17, 17, 17, 26,
        11, 19, 10, 17, 20, 10, 17, 20, 51, 43, 44, 56, 18, 55, 45, 44, 56, 10, 20, 19, 9, 10, 27, 7, 26,
        1, 28, 7, 9, 10, 17, 8, 19, 36, 1, 5, 3, 9, 2, 3, 6, 1, 10, 19, 17, 17, 27, 27, 27, 36,
        21, 30, 20, 10, 29, 10, 10, 20, 6, 21, 30, 18, 28, 18, 19, 16, 21, 27, 17, 8, 9, 18, 8, 10, 36,
        31, 7, 7, 29, 30, 19, 29, 18, 26, 31, 29, 10, 17, 17, 8, 6, 41, 43, 45, 43, 45, 43, 44, 44, 26,
        1, 18, 28, 8, 10, 9, 28, 29, 3, 2, 4, 3, 27, 2, 2, 2, 3, 4, 2, 2, 5, 5, 4, 3, 16,
        11, 9, 10, 18, 10, 19, 28, 18, 19, 18, 28, 101, 19, 27, 28, 9, 19, 8, 7, 10, 17, 20, 7, 17, 16,
        21, 7, 8, 28, 27, 19, 10, 19, 55, 56, 19, 79, 101, 101, 19, 51, 42, 45, 42, 44, 45, 56, 7, 27, 26,
        21, 10, 29, 18, 10, 29, 20, 29, 6, 31, 10, 10, 17, 8, 9, 26, 11, 3, 4, 3, 16, 21, 17, 7, 36,
        1, 27, 29, 18, 9, 10, 17, 10, 6, 41, 42, 56, 7, 55, 45, 46, 31, 29, 29, 30, 26, 31, 10, 10, 26,
        31, 28, 17, 28, 10, 17, 9, 7, 3, 2, 4, 5, 18, 5, 5, 5, 5, 20, 19, 20, 36, 1, 10, 27, 6,
        21, 30, 27, 7, 7, 30, 8, 19, 17, 20, 20, 20, 27, 19, 9, 18, 7, 27, 17, 10, 16, 21, 28, 28, 36,
        31, 9, 9, 28, 30, 30, 30, 17, 10, 27, 10, 30, 17, 55, 43, 43, 45, 43, 45, 44, 46, 11, 20, 29, 36,
        21, 17, 19, 9, 10, 10, 19, 8, 17, 20, 18, 10, 17, 16, 31, 5, 4, 5, 5, 5, 4, 4, 18, 8, 6,
        1, 8, 17, 8, 28, 20, 29, 10, 19, 9, 7, 27, 28, 16, 31, 17, 10, 9, 28, 30, 10, 30, 18, 27, 36,
        31, 8, 29, 29, 28, 27, 10, 27, 10, 8, 9, 27, 28, 16, 41, 42, 44, 44, 45, 43, 56, 10, 17, 17, 6,
        31, 29, 7, 10, 9, 17, 30, 28, 30, 18, 30, 20, 7, 2, 2, 2, 2, 3, 5, 5, 4, 20, 18, 8, 26,
        31, 20, 19, 18, 17, 19, 29, 8, 18, 9, 28, 19, 17, 20, 18, 29, 18, 9, 30, 10, 29, 19, 19, 17, 6,
        41, 43, 42, 45, 43, 43, 44, 45, 42, 45, 42, 42, 42, 44, 43, 42, 42, 42, 43, 44, 44, 43, 45, 43, 46
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
          id = 49,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 53,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 55,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "BoulderRound",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 336,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "BoulderRound",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 320,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 63,
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 176,
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
          id = 64,
          name = "Gate-BLUE",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 65,
          name = "Gate-GREEN",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 66,
          name = "Gate-PINK",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 67,
          name = "PressurePlate-PINK",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "PressurePlate-GREEN",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 70,
          name = "Tomb",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 72,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 73,
          name = "RotatingMirror-DL",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 368,
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
          id = 74,
          name = "RotatingMirror-DL",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 192,
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
          id = 75,
          name = "Crate",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 84,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 25,
      height = 25,
      id = 3,
      name = "scatter",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
