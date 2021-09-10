return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 35,
  height = 35,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 6,
  nextobjectid = 224,
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
      width = 35,
      height = 35,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 3, 4, 20, 2, 3, 6, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 79, 79, 0, 0, 79, 79, 79, 79, 79, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 101, 101, 9, 101, 101, 6, 0, 0, 0,
        0, 0, 0, 0, 0, 79, 79, 79, 79, 79, 44, 79, 79, 27, 79, 79, 79, 0, 0, 0, 0, 0, 0, 0, 0, 11, 79, 19, 27, 8, 79, 6, 0, 0, 0,
        54, 38, 51, 42, 79, 79, 43, 79, 79, 79, 79, 79, 79, 101, 79, 79, 79, 79, 3, 4, 2, 4, 3, 4, 4, 5, 30, 30, 28, 10, 27, 3, 26, 0, 0,
        31, 7, 16, 8, 79, 8, 7, 19, 30, 17, 7, 18, 7, 8, 27, 18, 27, 79, 19, 7, 19, 19, 8, 29, 7, 17, 27, 7, 7, 18, 20, 30, 36, 0, 0,
        31, 10, 6, 101, 79, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 79, 27, 55, 43, 56, 20, 55, 42, 43, 44, 56, 28, 9, 10, 18, 26, 0, 0,
        1, 17, 6, 79, 79, 11, 79, 4, 3, 4, 3, 79, 3, 2, 5, 79, 2, 79, 20, 5, 5, 3, 8, 36, 31, 5, 4, 3, 20, 55, 54, 18, 16, 0, 0,
        21, 29, 36, 79, 79, 1, 18, 18, 29, 17, 17, 29, 27, 9, 7, 30, 28, 10, 7, 7, 30, 20, 19, 6, 31, 10, 8, 20, 30, 3, 4, 10, 16, 0, 0,
        11, 10, 4, 79, 5, 4, 18, 51, 45, 43, 45, 44, 43, 9, 20, 27, 42, 42, 45, 45, 42, 56, 9, 26, 11, 18, 30, 10, 20, 19, 18, 20, 6, 0, 0,
        21, 9, 9, 8, 28, 19, 7, 3, 6, 79, 79, 29, 8, 17, 28, 7, 8, 29, 79, 79, 31, 2, 8, 26, 21, 27, 7, 18, 7, 55, 56, 7, 26, 0, 0,
        41, 44, 56, 19, 55, 56, 20, 10, 2, 6, 79, 28, 101, 101, 27, 101, 101, 19, 79, 1, 5, 8, 9, 6, 41, 42, 56, 27, 20, 26, 11, 18, 16, 0, 0,
        21, 3, 3, 18, 4, 3, 8, 29, 29, 3, 3, 28, 3, 5, 10, 2, 5, 19, 4, 4, 30, 9, 10, 5, 5, 3, 3, 20, 19, 5, 2, 29, 6, 0, 0,
        1, 7, 27, 28, 7, 10, 9, 20, 8, 7, 19, 17, 9, 17, 17, 28, 18, 27, 19, 19, 28, 10, 28, 30, 30, 8, 17, 17, 17, 20, 9, 27, 36, 110, 110,
        11, 45, 30, 8, 43, 43, 43, 42, 44, 30, 55, 8, 20, 51, 43, 44, 56, 18, 55, 45, 44, 56, 10, 20, 19, 9, 10, 27, 7, 17, 17, 17, 5, 2, 16,
        21, 79, 28, 29, 20, 28, 27, 27, 28, 10, 16, 101, 19, 36, 11, 5, 3, 9, 2, 3, 6, 1, 10, 19, 17, 17, 27, 27, 27, 20, 30, 19, 18, 7, 6,
        1, 3, 10, 101, 3, 5, 3, 4, 3, 29, 3, 21, 20, 6, 21, 30, 18, 28, 18, 19, 16, 21, 27, 17, 8, 9, 18, 8, 10, 8, 19, 18, 20, 18, 16,
        11, 9, 18, 10, 19, 10, 27, 101, 101, 30, 30, 31, 18, 6, 31, 29, 10, 17, 17, 8, 6, 41, 43, 45, 43, 45, 43, 44, 44, 43, 44, 44, 42, 44, 46,
        1, 101, 30, 9, 101, 101, 27, 3, 9, 10, 29, 21, 29, 16, 1, 4, 3, 27, 2, 2, 2, 3, 4, 2, 2, 5, 5, 4, 3, 16, 0, 0, 0, 0, 0,
        21, 18, 8, 28, 8, 28, 19, 17, 18, 10, 8, 11, 18, 26, 1, 28, 101, 19, 27, 28, 9, 19, 8, 7, 10, 17, 20, 7, 17, 16, 0, 0, 0, 0, 0,
        1, 7, 8, 101, 27, 101, 28, 101, 28, 27, 55, 31, 19, 36, 1, 19, 79, 101, 101, 19, 51, 42, 45, 42, 44, 45, 56, 20, 9, 26, 0, 0, 0, 0, 0,
        11, 101, 8, 8, 17, 20, 20, 29, 18, 10, 16, 21, 29, 6, 31, 10, 10, 17, 8, 9, 26, 11, 3, 4, 3, 16, 21, 101, 8, 36, 0, 0, 0, 0, 0,
        21, 20, 10, 4, 17, 20, 18, 101, 18, 9, 26, 11, 10, 6, 41, 42, 56, 7, 55, 45, 46, 31, 29, 29, 30, 26, 31, 7, 19, 26, 0, 109, 109, 0, 0,
        31, 10, 30, 18, 20, 19, 28, 27, 19, 10, 26, 21, 7, 3, 2, 4, 5, 18, 5, 5, 5, 5, 20, 19, 20, 36, 1, 10, 101, 6, 0, 109, 109, 0, 0,
        11, 101, 28, 101, 101, 101, 18, 101, 20, 7, 26, 11, 19, 8, 18, 27, 19, 27, 19, 9, 18, 7, 27, 17, 10, 16, 21, 8, 79, 36, 0, 0, 0, 0, 0,
        21, 17, 8, 9, 79, 28, 29, 20, 29, 30, 6, 11, 17, 4, 2, 5, 2, 29, 55, 43, 43, 45, 43, 45, 44, 46, 11, 19, 79, 36, 0, 0, 0, 0, 0,
        11, 27, 29, 101, 30, 101, 27, 101, 9, 10, 5, 5, 8, 101, 19, 20, 20, 29, 16, 31, 5, 4, 5, 5, 5, 4, 4, 27, 79, 6, 0, 0, 0, 0, 0,
        11, 29, 28, 9, 10, 10, 8, 7, 8, 28, 20, 29, 10, 10, 30, 17, 101, 7, 16, 31, 17, 10, 9, 28, 30, 10, 30, 18, 79, 36, 0, 0, 0, 0, 0,
        31, 101, 101, 19, 101, 101, 101, 101, 55, 42, 43, 42, 7, 42, 56, 19, 7, 28, 16, 41, 42, 44, 44, 45, 43, 44, 56, 30, 79, 6, 0, 0, 0, 0, 0,
        31, 79, 2, 28, 4, 5, 4, 5, 3, 3, 2, 3, 3, 3, 2, 3, 4, 20, 2, 2, 2, 2, 3, 5, 5, 4, 4, 18, 79, 26, 0, 0, 0, 0, 0,
        1, 79, 101, 20, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 17, 20, 18, 29, 18, 9, 30, 10, 29, 19, 19, 17, 6, 0, 0, 0, 0, 0,
        41, 43, 44, 44, 44, 42, 43, 42, 45, 43, 43, 44, 45, 42, 45, 42, 42, 42, 44, 43, 42, 42, 42, 43, 44, 44, 43, 45, 43, 46, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          x = 16,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 352,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "BoulderRound",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          id = 195,
          name = "BoulderRound",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 144,
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
          x = 272,
          y = 304,
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
          x = 272,
          y = 288,
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
          x = 272,
          y = 368,
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
          x = 320,
          y = 304,
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
          x = 336,
          y = 384,
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
          x = 272,
          y = 304,
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
          x = 272,
          y = 336,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 272,
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
          x = 304,
          y = 336,
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
          x = 48,
          y = 480,
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
          x = 368,
          y = 368,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 84,
          visible = true,
          properties = {}
        },
        {
          id = 78,
          name = "Vampire",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 103,
          visible = true,
          properties = {}
        },
        {
          id = 79,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 480,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 80,
          name = "ExitDoor",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 16,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 81,
          name = "RotatingMirror-DR",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 304,
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
          id = 82,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 400,
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
          id = 144,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 304,
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
          id = 88,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 480,
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
          id = 83,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 400,
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
          id = 141,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 304,
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
          id = 86,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 80,
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
          id = 84,
          name = "MovableMirror-DL",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 336,
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
          id = 142,
          name = "MovableMirror-DL",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 272,
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
          id = 140,
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 336,
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
          id = 89,
          name = "Tomb-Open",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 100,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 139,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 109,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 304,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 135,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 108,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 304,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 115,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 368,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 114,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 400,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 113,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 368,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 104,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 336,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 143,
          name = "RotatingMirror-DL",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 272,
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
          id = 146,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 147,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 148,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 149,
          name = "RotatingMirror-DR",
          type = "",
          shape = "rectangle",
          x = 496,
          y = 80,
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
          id = 151,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 152,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 158,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 159,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 167,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 496,
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
          id = 168,
          name = "Vampire",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 103,
          visible = true,
          properties = {}
        },
        {
          id = 183,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 201,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 199,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 202,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 496,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 191,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 193,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 192,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 186,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 184,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 185,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 194,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 212,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 203,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 208,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 211,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 204,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 207,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 210,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 205,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 206,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 209,
          name = "Salt",
          type = "",
          shape = "rectangle",
          x = 496,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 106,
          visible = true,
          properties = {}
        },
        {
          id = 223,
          name = "Tomb-GoldenKey",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 35,
      height = 35,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91, 0, 0, 0, 91, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 50, 0, 69, 0, 0, 0, 0, 0, 0, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 110, 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 110, 110, 0, 0, 110, 110, 0, 0, 0, 0, 0, 0, 110, 110, 110, 92, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 93, 0, 0, 0, 0, 0, 93, 110, 0, 110, 110, 110, 110, 110, 93, 110, 65, 0, 0, 110, 110, 110, 110, 110, 0, 0, 93, 0, 0, 0, 0,
        0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 110, 110, 110, 110, 110, 110, 110, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 110, 110, 110, 110, 110, 110, 0, 0, 0, 0, 66, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91, 75, 0, 75, 93, 0, 0, 0, 110, 110, 110, 110, 110, 0, 0, 78, 0, 0, 0, 0,
        0, 75, 0, 0, 0, 0, 91, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 94, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, 0, 0, 0, 0, 0, 0, 91, 0, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 78, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "reverb",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 169,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 224,
          width = 16,
          height = 239,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 170,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 400,
          width = 16,
          height = 95.833,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 171,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 416,
          width = 63.3333,
          height = 47.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 172,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 480,
          width = 176.106,
          height = 16.0909,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 173,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 319.833,
          width = 16,
          height = 159.167,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 174,
          name = "open",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 368,
          width = 16.25,
          height = 109,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 175,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 321.5,
          y = 304,
          width = 125.75,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 176,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 304,
          width = 80.75,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 177,
          name = "large_room",
          type = "",
          shape = "rectangle",
          x = 17,
          y = 225.5,
          width = 144.333,
          height = 222.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 213,
          name = "medium_room",
          type = "",
          shape = "rectangle",
          x = 369.5,
          y = 80,
          width = 175.5,
          height = 192.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 214,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 225.5,
          width = 80.75,
          height = 78.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 215,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 80,
          width = 352,
          height = 146,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 216,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 352,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 217,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 384,
          width = 143.785,
          height = 15.9453,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 218,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 432,
          width = 111.118,
          height = 15.9453,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 219,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 448,
          width = 16.7847,
          height = 46.95,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 220,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 161.333,
          y = 432,
          width = 30.4514,
          height = 15.2834,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 221,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 304,
          width = 16,
          height = 63.4997,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 222,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 32,
          width = 79.5347,
          height = 46.6667,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
