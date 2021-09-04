return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 17,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 4,
  nextobjectid = 31,
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
      height = 17,
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
        79, 79, 79, 11, 5, 2, 3, 4, 5, 2, 3, 4, 5, 24, 3, 6,
        79, 79, 79, 1, 13, 14, 13, 14, 13, 14, 13, 14, 13, 25, 101, 6,
        79, 79, 79, 31, 8, 17, 29, 23, 10, 18, 9, 28, 20, 51, 79, 16,
        79, 79, 79, 11, 17, 27, 19, 55, 54, 101, 101, 101, 101, 16, 79, 26,
        79, 79, 79, 31, 101, 101, 17, 6, 1, 18, 30, 8, 8, 6, 79, 36,
        79, 79, 79, 31, 18, 27, 19, 36, 31, 30, 20, 8, 27, 16, 79, 16,
        79, 79, 79, 11, 17, 101, 101, 3, 2, 24, 24, 24, 24, 3, 79, 26,
        79, 79, 79, 11, 20, 19, 8, 7, 9, 8, 19, 28, 24, 15, 79, 36,
        79, 79, 79, 41, 45, 43, 42, 45, 45, 54, 10, 55, 56, 28, 51, 46,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 11, 19, 36, 31, 7, 16, 79,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 11, 27, 16, 11, 7, 16, 79,
        79, 79, 79, 79, 79, 79, 11, 70, 16, 11, 19, 16, 11, 9, 2, 26,
        79, 79, 79, 79, 79, 1, 2, 37, 2, 2, 24, 3, 4, 23, 14, 26,
        79, 79, 79, 79, 79, 1, 10, 18, 28, 20, 28, 19, 23, 23, 20, 36,
        79, 79, 79, 79, 79, 1, 33, 34, 33, 34, 24, 51, 54, 18, 7, 16,
        79, 79, 79, 79, 79, 41, 43, 44, 45, 42, 43, 46, 21, 18, 19, 26,
        79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 41, 45, 42, 46
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 17,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 69, 0, 0, 65, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
          id = 8,
          name = "ExitDoor",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 0,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 9,
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
          id = 13,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "Mirror",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 176,
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
          id = 22,
          name = "Mirror",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 2147483750,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpLeft"
          }
        },
        {
          id = 23,
          name = "Mirror",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpRight"
          }
        },
        {
          id = 26,
          name = "Mirror",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 2147483750,
          visible = true,
          properties = {
            ["initialFacingDir"] = "UpLeft"
          }
        },
        {
          id = 27,
          name = "Mirror",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 208,
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
          id = 28,
          name = "Mirror",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 16,
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
          id = 29,
          name = "Tomb-GoldenKey",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 16,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 224,
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
