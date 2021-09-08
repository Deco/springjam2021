return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 36,
  height = 16,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 5,
  nextobjectid = 51,
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
      width = 36,
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
        79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 11, 4, 4, 4, 2, 3, 4, 2, 79, 79, 3, 4, 26, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 1, 7, 10, 20, 7, 8, 27, 20, 19, 18, 8, 18, 26, 79, 79, 79, 1, 2, 18, 5, 6, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 21, 7, 46, 41, 42, 45, 10, 51, 101, 101, 101, 101, 56, 3, 3, 36, 11, 10, 20, 20, 16, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 1, 17, 28, 10, 19, 29, 27, 2, 4, 2, 2, 101, 2, 19, 20, 3, 3, 9, 30, 19, 26, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 31, 27, 9, 20, 19, 18, 30, 9, 9, 8, 10, 18, 7, 7, 19, 29, 8, 10, 18, 29, 26, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 31, 28, 17, 27, 8, 10, 19, 18, 51, 44, 42, 101, 54, 18, 18, 18, 101, 29, 7, 30, 36, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 21, 2, 18, 28, 10, 28, 8, 8, 36, 79, 79, 79, 11, 18, 18, 8, 79, 20, 10, 9, 16, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 21, 8, 18, 28, 9, 28, 29, 9, 36, 79, 79, 79, 41, 42, 44, 45, 56, 2, 3, 2, 26, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 21, 10, 8, 28, 19, 9, 10, 18, 3, 4, 2, 101, 3, 2, 2, 2, 4, 18, 19, 7, 26, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 31, 19, 3, 3, 19, 55, 56, 18, 10, 18, 8, 20, 18, 10, 17, 18, 17, 30, 7, 27, 16, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 31, 27, 17, 20, 10, 26, 41, 45, 45, 45, 45, 44, 43, 42, 44, 42, 54, 28, 19, 9, 26, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 11, 9, 9, 17, 10, 16, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 41, 42, 42, 42, 46, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 21, 29, 18, 10, 19, 16, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 41, 45, 42, 43, 44, 46, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 36,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          id = 7,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "Tomb-GoldenKey",
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
          id = 21,
          name = "Gate-BLUE",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "ExitDoor",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 96,
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
          id = 26,
          name = "MovableMirror-DL",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 128,
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
          id = 28,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 96,
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
          id = 36,
          name = "MovableMirror-DL",
          type = "",
          shape = "rectangle",
          x = 144,
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
          id = 37,
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 128,
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
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 160,
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
          id = 39,
          name = "MovableMirror-DL",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 96,
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
          id = 41,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 112,
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
          id = 42,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 43,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 96,
          width = 80,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 176,
          width = 160,
          height = 15,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 80,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "medium_room",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 64,
          width = 48,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 160,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "medium_room",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 48,
          width = 112,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 176,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
