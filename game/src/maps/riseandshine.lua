return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 41,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 3,
  nextobjectid = 57,
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
      width = 20,
      height = 41,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8, 9, 8, 6, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 18, 19, 18, 16, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 8, 9, 8, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 18, 19, 18, 36, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 8, 9, 8, 6, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 7, 8, 9, 16, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 17, 18, 19, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 2, 3, 4, 6, 0, 79, 27, 28, 29, 36, 0, 0, 0, 0, 0,
        0, 0, 0, 11, 2, 12, 13, 15, 2, 6, 79, 101, 101, 8, 6, 0, 0, 0, 0, 0,
        0, 0, 0, 1, 12, 8, 9, 10, 15, 16, 79, 79, 79, 101, 46, 0, 0, 0, 0, 0,
        0, 0, 1, 2, 22, 18, 19, 20, 25, 2, 6, 79, 79, 79, 79, 79, 79, 79, 0, 0,
        0, 0, 11, 12, 8, 9, 10, 7, 8, 15, 16, 79, 79, 17, 1, 2, 3, 4, 6, 0,
        0, 0, 21, 22, 18, 19, 20, 17, 18, 25, 26, 17, 79, 27, 11, 12, 8, 15, 16, 0,
        0, 0, 31, 22, 28, 29, 30, 27, 28, 25, 36, 17, 18, 17, 21, 22, 8, 25, 26, 0,
        0, 0, 41, 22, 8, 9, 10, 7, 8, 25, 2, 27, 28, 27, 2, 22, 18, 25, 36, 0,
        0, 0, 1, 22, 18, 19, 20, 17, 18, 7, 13, 17, 17, 17, 13, 9, 10, 25, 6, 0,
        0, 0, 11, 22, 28, 29, 30, 27, 28, 17, 18, 19, 20, 17, 18, 19, 20, 25, 16, 0,
        0, 0, 21, 22, 8, 9, 10, 7, 8, 27, 28, 29, 30, 27, 28, 29, 30, 25, 26, 0,
        0, 0, 31, 22, 18, 19, 20, 17, 18, 7, 8, 9, 10, 7, 8, 9, 10, 25, 36, 0,
        0, 0, 41, 22, 28, 29, 30, 27, 28, 17, 18, 19, 20, 17, 18, 19, 20, 25, 6, 0,
        0, 0, 1, 22, 8, 9, 10, 7, 8, 27, 28, 29, 30, 27, 28, 29, 30, 25, 16, 0,
        0, 0, 44, 22, 18, 19, 20, 17, 18, 7, 8, 9, 10, 7, 8, 9, 10, 25, 3, 0,
        0, 0, 37, 18, 28, 29, 30, 27, 28, 17, 18, 19, 20, 17, 18, 19, 20, 18, 8, 0,
        0, 0, 54, 32, 33, 34, 33, 34, 33, 34, 33, 10, 18, 28, 33, 34, 33, 35, 51, 0,
        0, 0, 41, 42, 43, 44, 45, 42, 43, 44, 56, 18, 19, 18, 51, 42, 43, 44, 46, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 101, 101, 101, 6, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 7, 79, 79, 16, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 17, 18, 19, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, 27, 28, 29, 36, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, 101, 101, 8, 6, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, 79, 79, 101, 46, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 79, 79, 79, 79, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 79, 79, 17, 79, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 17, 79, 27, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, 17, 18, 17, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, 27, 28, 27, 36, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 19, 27, 9, 36, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 20, 18, 9, 6, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 20, 7, 20, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 29, 10, 19, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 17, 20, 27, 16, 0, 0, 0, 0, 0
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
          id = 46,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 352,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "ExitDoor",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 352,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "Coffee",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 90,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 448,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 448,
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
          id = 54,
          name = "RotatingMirror-DR",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 256,
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
          name = "Tomb-GoldenKey",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 85,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
