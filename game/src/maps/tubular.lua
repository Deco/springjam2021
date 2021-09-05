return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 17,
  height = 16,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 4,
  nextobjectid = 67,
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
      width = 17,
      height = 16,
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
        1, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5, 2, 4, 3, 6,
        11, 28, 27, 29, 8, 19, 8, 28, 18, 9, 27, 19, 9, 28, 28, 7, 6,
        21, 18, 7, 7, 8, 8, 19, 18, 8, 7, 29, 19, 17, 9, 21, 9, 16,
        31, 8, 18, 27, 7, 19, 27, 7, 18, 20, 30, 8, 7, 18, 11, 9, 26,
        11, 19, 27, 7, 17, 7, 30, 9, 19, 29, 8, 8, 28, 29, 31, 8, 36,
        21, 18, 19, 18, 7, 8, 19, 29, 18, 17, 29, 29, 18, 29, 21, 9, 16,
        31, 29, 7, 20, 27, 28, 8, 17, 17, 30, 8, 19, 19, 27, 21, 27, 26,
        11, 28, 17, 19, 18, 7, 18, 29, 7, 10, 27, 20, 19, 18, 21, 27, 36,
        21, 18, 18, 9, 9, 9, 27, 8, 8, 19, 28, 10, 17, 19, 31, 27, 16,
        31, 27, 29, 8, 27, 8, 17, 9, 18, 8, 19, 8, 29, 19, 21, 7, 26,
        11, 17, 26, 7, 7, 29, 29, 29, 18, 10, 28, 7, 18, 19, 31, 7, 36,
        21, 53, 29, 28, 28, 8, 27, 28, 29, 19, 19, 28, 27, 29, 11, 9, 16,
        31, 8, 79, 79, 79, 79, 28, 28, 27, 63, 62, 63, 29, 19, 27, 19, 26,
        11, 27, 27, 27, 27, 27, 27, 18, 18, 1, 29, 6, 7, 17, 27, 9, 36,
        1, 19, 9, 8, 29, 28, 7, 18, 7, 31, 17, 36, 19, 27, 29, 29, 16,
        41, 42, 43, 44, 45, 42, 42, 44, 45, 42, 43, 44, 45, 42, 45, 43, 46
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 17,
      height = 16,
      id = 3,
      name = "scatter",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          id = 37,
          name = "BoulderRound",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 16,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "PressurePlate-GREEN",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "Gate-GREEN",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "BoulderRound",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "PressurePlate-GREEN",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 192,
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
          id = 47,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 192,
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
          id = 48,
          name = "Gate-BLUE-NAND",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "MovableMirror-DL",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 32,
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
          id = 50,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 50,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "BoulderRound",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          id = 52,
          name = "PressurePlate-RED",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 53,
          name = "PressurePlate-RED",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 54,
          name = "RotatingMirror-DR",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 96,
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
          id = 56,
          name = "Gate-RED",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "Tomb-GoldenKey",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "Vampire",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 103,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "PressurePlate-PINK",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 64,
          name = "Gate-PINK",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 65,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 16,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 66,
          name = "ExitDoor",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
