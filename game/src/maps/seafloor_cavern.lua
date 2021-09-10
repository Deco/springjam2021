return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 16,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 5,
  nextobjectid = 44,
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
      width = 16,
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
        1, 2, 3, 4, 5, 2, 3, 8, 5, 2, 3, 4, 5, 2, 6, 0,
        11, 12, 13, 14, 101, 101, 13, 14, 13, 101, 101, 14, 13, 14, 6, 0,
        21, 22, 7, 8, 79, 79, 101, 8, 101, 79, 79, 101, 101, 10, 16, 0,
        31, 22, 17, 18, 79, 79, 17, 18, 19, 79, 79, 79, 19, 20, 26, 0,
        11, 22, 29, 8, 79, 30, 28, 17, 10, 17, 79, 79, 29, 101, 79, 0,
        21, 22, 27, 20, 79, 7, 9, 17, 7, 9, 79, 79, 9, 79, 79, 0,
        31, 22, 20, 20, 79, 20, 20, 8, 29, 19, 79, 30, 19, 79, 79, 0,
        79, 22, 20, 20, 79, 29, 27, 20, 10, 7, 79, 9, 101, 79, 79, 0,
        79, 101, 18, 19, 79, 7, 9, 27, 8, 7, 79, 29, 79, 79, 16, 0,
        79, 79, 101, 19, 79, 30, 20, 29, 8, 27, 79, 101, 79, 79, 26, 0,
        79, 79, 18, 19, 17, 17, 17, 8, 27, 27, 18, 10, 29, 30, 36, 0,
        21, 22, 7, 8, 9, 10, 7, 8, 9, 10, 7, 8, 9, 10, 16, 0,
        31, 22, 17, 18, 19, 20, 17, 18, 19, 20, 17, 18, 19, 20, 26, 0,
        11, 22, 27, 28, 29, 30, 27, 28, 29, 30, 2, 3, 4, 5, 36, 0,
        1, 32, 33, 101, 33, 34, 33, 34, 33, 34, 13, 14, 13, 14, 16, 0,
        41, 42, 43, 79, 101, 42, 43, 44, 45, 42, 43, 44, 45, 42, 46, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
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
        0, 0, 0, 0, 0, 0, 91, 0, 91, 0, 0, 0, 0, 0, 0, 0,
        0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 78, 0, 0, 0, 0, 0, 78, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, 76, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 107,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "Tomb-GoldenKey",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "ExitDoor",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 0,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 80,
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
          id = 40,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 2147483753,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpLeft"
          }
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
          id = 41,
          name = "large_room",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 16,
          width = 208,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "corridor",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 224,
          width = 64,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "large_room",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 208,
          width = 144,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
