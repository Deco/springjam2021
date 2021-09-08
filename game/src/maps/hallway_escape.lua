return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 17,
  height = 35,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 7,
  nextobjectid = 34,
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
      height = 35,
      id = 4,
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
        79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79,
        21, 4, 5, 5, 5, 5, 3, 3, 5, 2, 16, 79, 79, 79, 79, 79, 79,
        31, 7, 8, 9, 10, 7, 8, 9, 18, 14, 26, 79, 79, 79, 79, 79, 79,
        1, 17, 18, 101, 101, 101, 101, 101, 18, 7, 26, 79, 79, 79, 79, 79, 79,
        1, 27, 28, 29, 30, 27, 28, 79, 101, 27, 16, 79, 79, 79, 79, 79, 79,
        31, 7, 8, 101, 101, 7, 8, 19, 79, 9, 6, 79, 79, 79, 79, 79, 79,
        41, 101, 101, 79, 20, 17, 18, 101, 79, 7, 26, 79, 79, 79, 79, 79, 79,
        31, 18, 18, 18, 8, 101, 101, 79, 79, 30, 16, 79, 79, 79, 79, 79, 79,
        41, 101, 17, 101, 79, 79, 79, 79, 79, 7, 26, 79, 79, 79, 79, 79, 79,
        79, 79, 9, 8, 79, 79, 79, 79, 79, 28, 36, 79, 79, 79, 79, 79, 79,
        79, 79, 101, 18, 19, 79, 79, 79, 79, 7, 79, 79, 79, 79, 79, 79, 79,
        79, 10, 19, 18, 18, 10, 79, 79, 79, 7, 36, 79, 79, 79, 79, 79, 79,
        79, 9, 19, 19, 19, 8, 79, 79, 79, 8, 26, 79, 79, 79, 79, 79, 79,
        79, 8, 19, 19, 19, 30, 79, 79, 79, 8, 6, 79, 79, 79, 79, 79, 79,
        79, 101, 101, 101, 101, 101, 79, 79, 79, 27, 36, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 9, 6, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 30, 46, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 7, 36, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 28, 46, 2, 6, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 7, 18, 18, 16, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 21, 7, 36, 18, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 31, 8, 46, 44, 46, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 8, 79, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 19, 36, 79, 79, 79, 79, 79, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 27, 16, 79, 79, 79, 79, 79, 79,
        79, 79, 31, 4, 26, 79, 79, 79, 79, 19, 16, 79, 79, 79, 79, 79, 79,
        79, 79, 21, 13, 16, 79, 79, 79, 31, 20, 26, 79, 79, 79, 79, 79, 79,
        79, 79, 31, 9, 26, 79, 79, 79, 21, 17, 26, 79, 79, 79, 79, 79, 79,
        31, 3, 2, 30, 4, 5, 4, 3, 5, 19, 5, 5, 5, 2, 5, 2, 36,
        21, 8, 18, 30, 8, 28, 29, 20, 8, 30, 28, 19, 20, 19, 28, 17, 6,
        3, 20, 10, 19, 28, 27, 19, 17, 19, 10, 18, 29, 29, 27, 8, 29, 2,
        23, 13, 9, 9, 17, 19, 17, 27, 18, 19, 30, 10, 10, 20, 7, 9, 8,
        54, 20, 7, 10, 27, 27, 19, 19, 27, 17, 9, 18, 9, 8, 29, 8, 55,
        31, 20, 30, 28, 7, 27, 30, 29, 9, 20, 51, 52, 56, 29, 29, 20, 26,
        41, 45, 42, 43, 42, 45, 44, 45, 45, 42, 46, 79, 41, 42, 42, 42, 46
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 17,
      height = 35,
      id = 5,
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
        0, 0, 91, 0, 0, 0, 0, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 79, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 96, 0, 0, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0,
        0, 96, 0, 0, 78, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 91, 0, 91, 0, 0, 0, 0, 0, 0,
        0, 65, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0,
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
          id = 7,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 496,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 320,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "ExitDoor",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 496,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 528,
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
          id = 16,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 416,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 416,
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
          id = 20,
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 496,
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
          id = 21,
          name = "Tomb-GoldenKey",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 192,
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
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
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
          id = 25,
          name = "medium_room",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 464,
          width = 240,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 32,
          width = 16,
          height = 432,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "large_room",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 32,
          width = 128,
          height = 112,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "open",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 144,
          width = 80,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 496,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 416,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "small_room",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 304,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
