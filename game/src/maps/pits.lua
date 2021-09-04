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
  nextobjectid = 12,
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
        1, 3, 2, 5, 4, 5, 4, 2, 3, 2, 5, 4, 5, 3, 2, 3, 3, 4, 5, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 12, 14, 14, 13, 13, 14, 14, 14, 13, 4, 13, 101, 13, 13, 13, 101, 13, 14, 15, 16, 0, 0, 0, 0, 0, 0, 0, 0,
        37, 22, 7, 8, 9, 10, 7, 8, 9, 10, 7, 8, 79, 10, 101, 8, 79, 10, 101, 25, 16, 0, 0, 0, 0, 0, 0, 0, 0,
        21, 22, 17, 18, 19, 20, 17, 18, 19, 20, 4, 18, 19, 20, 79, 18, 19, 20, 79, 25, 36, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 22, 27, 28, 29, 30, 27, 28, 29, 30, 4, 101, 101, 101, 79, 101, 101, 101, 79, 25, 36, 0, 0, 0, 0, 0, 0, 0, 0,
        21, 22, 7, 8, 9, 10, 7, 8, 9, 10, 4, 8, 9, 10, 7, 8, 9, 10, 7, 25, 36, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 22, 17, 18, 19, 20, 17, 18, 19, 20, 4, 18, 101, 101, 101, 101, 101, 101, 101, 101, 16, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 22, 27, 28, 29, 30, 27, 28, 29, 30, 4, 28, 29, 30, 27, 28, 29, 30, 27, 25, 16, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 22, 7, 8, 9, 10, 7, 8, 9, 10, 4, 101, 101, 101, 101, 101, 101, 23, 101, 25, 36, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 22, 17, 18, 19, 20, 17, 18, 19, 20, 4, 18, 19, 20, 17, 18, 19, 20, 17, 25, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        31, 22, 27, 28, 29, 30, 27, 28, 29, 30, 4, 28, 101, 101, 101, 101, 101, 101, 101, 101, 16, 0, 0, 0, 0, 0, 0, 0, 0,
        31, 22, 7, 8, 9, 10, 7, 8, 9, 10, 4, 8, 9, 10, 7, 8, 9, 10, 7, 25, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        21, 22, 17, 18, 19, 20, 17, 18, 19, 20, 4, 101, 101, 101, 101, 101, 101, 101, 101, 25, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 22, 27, 28, 29, 30, 27, 28, 29, 30, 4, 28, 29, 30, 27, 28, 29, 30, 27, 25, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        21, 22, 7, 8, 9, 10, 7, 8, 9, 10, 4, 8, 101, 101, 101, 101, 101, 101, 101, 101, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 22, 17, 18, 19, 20, 17, 18, 19, 20, 4, 18, 19, 20, 17, 18, 19, 20, 17, 25, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        31, 22, 27, 28, 29, 30, 27, 28, 29, 30, 4, 101, 101, 101, 101, 101, 101, 101, 101, 25, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        31, 22, 7, 8, 9, 10, 7, 8, 9, 10, 4, 8, 9, 10, 7, 8, 9, 10, 7, 25, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        31, 22, 17, 18, 19, 20, 17, 18, 19, 20, 4, 18, 101, 101, 101, 101, 101, 101, 101, 101, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        31, 22, 27, 28, 29, 30, 27, 28, 29, 30, 27, 28, 29, 30, 27, 28, 29, 30, 27, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0,
        11, 32, 33, 34, 33, 34, 22, 33, 34, 33, 4, 35, 34, 32, 33, 33, 34, 34, 34, 35, 16, 0, 0, 0, 0, 0, 0, 0, 0,
        41, 43, 42, 44, 44, 44, 43, 44, 44, 43, 44, 42, 45, 43, 43, 45, 45, 43, 44, 45, 46, 0, 0, 0, 0, 0, 0, 0, 0
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
          x = 32,
          y = 32,
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
          id = 6,
          name = "Tomb",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 304,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "Gate",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 304,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "ToggleSwitch",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 304,
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
