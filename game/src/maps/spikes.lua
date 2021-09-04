return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 14,
  height = 16,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 3,
  nextobjectid = 39,
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
      width = 14,
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
        1, 3, 2, 5, 4, 5, 4, 2, 3, 3, 4, 5, 3, 6,
        11, 12, 13, 14, 13, 13, 13, 14, 14, 14, 13, 13, 15, 16,
        11, 22, 7, 19, 9, 10, 8, 17, 19, 17, 8, 9, 25, 16,
        21, 22, 17, 30, 29, 19, 17, 17, 29, 18, 17, 20, 25, 36,
        11, 22, 27, 28, 7, 10, 10, 2, 2, 4, 4, 7, 5, 36,
        21, 22, 28, 27, 18, 19, 18, 7, 14, 14, 13, 14, 14, 36,
        11, 22, 8, 28, 7, 10, 29, 27, 7, 10, 20, 30, 25, 16,
        11, 22, 30, 27, 27, 7, 9, 17, 7, 17, 19, 17, 25, 26,
        21, 22, 17, 27, 18, 9, 10, 10, 20, 8, 20, 10, 25, 26,
        11, 22, 7, 18, 18, 8, 20, 17, 30, 10, 30, 8, 25, 26,
        31, 22, 8, 19, 9, 27, 20, 9, 10, 7, 18, 9, 25, 26,
        31, 4, 5, 10, 5, 3, 2, 2, 3, 5, 17, 5, 2, 26,
        44, 22, 29, 27, 30, 27, 29, 7, 27, 28, 29, 27, 25, 43,
        37, 22, 29, 9, 8, 17, 29, 7, 29, 7, 28, 29, 25, 8,
        54, 32, 33, 33, 33, 34, 34, 33, 33, 34, 34, 34, 35, 51,
        41, 43, 42, 44, 44, 44, 43, 43, 45, 45, 43, 44, 45, 46
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
          id = 23,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "Boulder",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 50,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "Tomb-GoldenKey",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "Spikes",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 16,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "Gate-RED",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "PressurePlate-RED",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "Gate-BLUE",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "PressurePlate-BLUE",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "ExitDoor",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 38,
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
        }
      }
    }
  }
}
