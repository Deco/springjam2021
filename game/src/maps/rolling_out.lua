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
  nextlayerid = 4,
  nextobjectid = 146,
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
        54, 38, 51, 42, 79, 42, 79, 43, 45, 45, 79, 43, 45, 79, 79, 44, 79, 79, 79, 42, 44, 1, 5, 2, 2, 5, 4, 5, 5, 6,
        31, 7, 16, 8, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 8, 29, 7, 17, 27, 7, 7, 6,
        31, 10, 6, 101, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 21, 20, 10, 18, 8, 30, 8, 28, 36,
        1, 17, 6, 79, 79, 11, 4, 4, 3, 4, 3, 79, 3, 2, 5, 4, 2, 79, 79, 5, 5, 3, 8, 20, 28, 29, 19, 20, 18, 36,
        21, 29, 36, 79, 79, 1, 18, 18, 29, 17, 17, 29, 27, 9, 7, 30, 28, 10, 7, 7, 30, 20, 19, 29, 9, 10, 8, 20, 30, 26,
        11, 10, 4, 79, 5, 4, 18, 29, 28, 9, 29, 20, 30, 17, 30, 18, 28, 10, 29, 7, 27, 8, 9, 8, 20, 18, 30, 10, 20, 6,
        21, 9, 9, 8, 28, 19, 7, 7, 19, 9, 29, 18, 30, 28, 28, 17, 7, 20, 20, 8, 18, 28, 8, 7, 20, 27, 17, 17, 7, 36,
        41, 44, 56, 19, 55, 56, 20, 10, 7, 10, 19, 8, 20, 8, 19, 7, 18, 30, 18, 8, 8, 8, 9, 18, 17, 18, 29, 7, 20, 26,
        21, 3, 3, 18, 4, 3, 8, 29, 29, 19, 28, 30, 19, 19, 29, 29, 30, 9, 10, 8, 30, 9, 10, 7, 10, 9, 19, 19, 19, 36,
        1, 7, 27, 28, 7, 10, 9, 20, 8, 7, 19, 17, 9, 17, 17, 28, 18, 27, 19, 19, 28, 10, 28, 30, 30, 8, 17, 17, 17, 26,
        11, 45, 30, 8, 43, 43, 44, 44, 44, 20, 55, 56, 20, 51, 43, 44, 56, 18, 55, 45, 44, 56, 10, 20, 19, 9, 10, 27, 7, 26,
        21, 79, 28, 29, 20, 28, 27, 27, 28, 10, 16, 1, 19, 36, 11, 5, 3, 9, 2, 3, 6, 1, 10, 19, 17, 17, 27, 27, 27, 36,
        1, 3, 10, 101, 3, 5, 3, 4, 3, 29, 3, 21, 20, 6, 21, 30, 18, 28, 18, 19, 16, 21, 27, 17, 8, 9, 18, 8, 10, 36,
        11, 9, 18, 10, 19, 10, 27, 101, 101, 30, 30, 31, 18, 6, 31, 29, 10, 17, 17, 8, 6, 41, 43, 45, 43, 45, 43, 44, 44, 26,
        1, 101, 30, 9, 101, 101, 27, 3, 9, 10, 29, 21, 29, 16, 1, 4, 3, 27, 2, 2, 2, 3, 4, 2, 2, 5, 5, 4, 3, 16,
        21, 18, 8, 28, 8, 28, 19, 17, 18, 10, 8, 11, 18, 26, 1, 28, 101, 19, 27, 28, 9, 19, 8, 7, 10, 17, 20, 7, 17, 16,
        1, 7, 8, 101, 27, 101, 28, 101, 28, 27, 55, 31, 19, 36, 1, 19, 79, 101, 101, 19, 51, 42, 45, 42, 44, 45, 56, 20, 9, 26,
        11, 101, 8, 8, 17, 20, 20, 29, 18, 10, 16, 21, 29, 6, 31, 10, 10, 17, 8, 9, 26, 11, 3, 4, 3, 16, 21, 101, 8, 36,
        21, 20, 10, 101, 17, 20, 18, 101, 18, 9, 26, 11, 10, 6, 41, 42, 56, 7, 55, 45, 46, 31, 29, 29, 30, 26, 31, 7, 19, 26,
        31, 10, 30, 18, 20, 19, 28, 27, 19, 10, 26, 21, 7, 3, 2, 4, 5, 18, 5, 5, 5, 5, 20, 19, 20, 36, 1, 10, 101, 6,
        11, 101, 28, 101, 101, 101, 18, 101, 20, 7, 26, 11, 19, 8, 18, 27, 19, 27, 19, 9, 18, 7, 27, 17, 10, 16, 21, 8, 79, 36,
        21, 17, 8, 9, 79, 28, 29, 20, 29, 30, 6, 11, 17, 4, 2, 5, 2, 29, 55, 43, 43, 45, 43, 45, 44, 46, 11, 19, 79, 36,
        11, 27, 29, 101, 30, 101, 27, 101, 9, 10, 5, 5, 8, 101, 19, 20, 20, 29, 16, 31, 5, 4, 5, 5, 5, 4, 4, 27, 79, 6,
        11, 29, 28, 9, 10, 10, 8, 7, 8, 28, 20, 29, 10, 10, 30, 17, 101, 7, 16, 31, 17, 10, 9, 28, 30, 10, 30, 18, 79, 36,
        31, 101, 101, 19, 101, 101, 101, 101, 55, 42, 43, 42, 7, 42, 56, 19, 7, 28, 16, 41, 42, 44, 44, 45, 43, 44, 56, 30, 79, 6,
        31, 79, 2, 28, 4, 5, 4, 5, 3, 3, 2, 3, 3, 3, 2, 3, 4, 20, 2, 2, 2, 2, 3, 5, 5, 4, 4, 18, 79, 26,
        1, 79, 101, 20, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 17, 20, 18, 29, 18, 9, 30, 10, 29, 19, 19, 17, 6,
        41, 43, 44, 44, 44, 42, 43, 42, 45, 43, 43, 44, 45, 42, 45, 42, 42, 42, 44, 43, 42, 42, 42, 43, 44, 44, 43, 45, 43, 46,
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
          id = 49,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 16,
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
          y = 288,
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
          x = 176,
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
          y = 240,
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
          id = 64,
          name = "Gate-BLUE",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 304,
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
          y = 240,
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
          y = 320,
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
          y = 240,
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
          y = 272,
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
          x = 400,
          y = 176,
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
          x = 304,
          y = 208,
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
          y = 272,
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
          y = 416,
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
          y = 304,
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
          y = 368,
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
          y = 416,
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
          x = 400,
          y = 0,
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
          id = 82,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 336,
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
          y = 240,
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
          y = 416,
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
          y = 336,
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
          y = 240,
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
          y = 16,
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
          id = 142,
          name = "MovableMirror-DL",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 208,
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
          y = 272,
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
          y = 368,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 91,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 160,
          width = 16,
          height = 239,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 93,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 320,
          width = 16,
          height = 112.333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 352,
          width = 63.3333,
          height = 47.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 416,
          width = 159.773,
          height = 16.0909,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 96,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 240,
          width = 16,
          height = 175,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 97,
          name = "open",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 305.75,
          width = 16.25,
          height = 109,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 98,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 321.333,
          y = 227.667,
          width = 111.25,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 99,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 240,
          width = 80.75,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 100,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 160,
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
          y = 368,
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
          y = 240,
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
          y = 368,
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
          y = 240,
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
          y = 304,
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
          y = 336,
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
          y = 304,
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
          y = 272,
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
          y = 208,
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
          id = 145,
          name = "large_room",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 144,
          width = 144.333,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 30,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 0, 0, 69, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91, 75, 0, 75, 93, 0, 0, 0, 69, 0, 0, 0, 78, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
