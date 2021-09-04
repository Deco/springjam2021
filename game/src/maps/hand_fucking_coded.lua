return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 28,
  height = 16,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 4,
  nextobjectid = 18,
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
      imageheight = 160,
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
      tilecount = 100,
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
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 28,
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
        79, 79, 79, 31, 70, 36, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 31, 70, 36, 79, 79, 79, 79,
        11, 2, 5, 5, 37, 2, 5, 6, 79, 79, 79, 79, 1, 5, 5, 4, 3, 4, 5, 4, 4, 3, 38, 3, 3, 5, 5, 36,
        11, 12, 13, 14, 13, 14, 15, 16, 79, 79, 79, 79, 11, 12, 14, 13, 14, 13, 14, 13, 14, 13, 14, 13, 14, 13, 15, 36,
        31, 22, 17, 10, 7, 29, 25, 26, 79, 79, 79, 79, 21, 22, 20, 7, 29, 19, 9, 28, 27, 19, 18, 20, 18, 18, 25, 36,
        21, 22, 30, 30, 29, 18, 25, 36, 79, 79, 79, 79, 31, 22, 29, 8, 8, 19, 20, 7, 8, 27, 18, 17, 28, 9, 25, 36,
        11, 22, 18, 8, 29, 9, 25, 16, 79, 79, 79, 79, 11, 22, 20, 7, 18, 9, 10, 28, 19, 10, 30, 7, 7, 8, 25, 36,
        31, 22, 27, 18, 17, 28, 25, 26, 79, 79, 79, 79, 21, 22, 20, 17, 17, 10, 19, 17, 7, 9, 20, 9, 9, 18, 25, 36,
        21, 22, 8, 17, 29, 29, 25, 2, 3, 4, 5, 2, 3, 22, 19, 17, 27, 19, 17, 20, 10, 29, 30, 10, 7, 9, 25, 36,
        1, 22, 20, 20, 7, 30, 17, 28, 9, 18, 30, 8, 8, 10, 30, 10, 20, 18, 27, 19, 29, 28, 30, 20, 8, 27, 25, 36,
        11, 22, 7, 8, 20, 18, 17, 7, 8, 9, 10, 7, 8, 7, 10, 10, 51, 42, 43, 44, 45, 56, 22, 9, 8, 19, 25, 36,
        1, 22, 28, 27, 17, 19, 19, 17, 18, 19, 20, 17, 18, 27, 10, 28, 16, 79, 79, 79, 79, 21, 22, 18, 30, 18, 25, 36,
        11, 22, 27, 19, 17, 19, 7, 27, 28, 29, 30, 27, 28, 18, 28, 28, 26, 79, 79, 79, 79, 31, 22, 18, 7, 18, 25, 36,
        1, 22, 9, 30, 10, 19, 18, 7, 8, 9, 10, 7, 8, 30, 27, 8, 36, 79, 79, 79, 79, 11, 22, 27, 20, 18, 25, 36,
        21, 22, 20, 10, 18, 28, 20, 17, 18, 19, 20, 17, 18, 19, 17, 9, 16, 79, 79, 79, 79, 21, 22, 18, 27, 29, 25, 36,
        11, 32, 34, 33, 34, 33, 33, 34, 33, 33, 34, 34, 33, 34, 34, 34, 26, 79, 79, 79, 79, 31, 32, 33, 33, 34, 35, 36,
        41, 42, 45, 44, 42, 42, 43, 42, 45, 42, 44, 43, 45, 43, 42, 43, 46, 79, 79, 79, 79, 41, 43, 43, 42, 45, 44, 46
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 28,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 91, 0, 0, 0, 0, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          id = 6,
          name = "start",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "crate",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 84,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "spikes",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "spikes",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "spikes",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 93,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
