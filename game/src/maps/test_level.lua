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
  nextobjectid = 61,
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
        19, 28, 18, 20, 17, 29, 19, 28, 20, 29, 17, 17, 20, 30, 20, 17, 9, 29, 29, 20, 19, 7, 20, 20, 8, 7, 19, 7, 27,
        17, 27, 29, 8, 10, 18, 10, 18, 7, 29, 20, 19, 30, 29, 29, 18, 19, 7, 10, 20, 28, 28, 10, 7, 7, 20, 29, 27, 18,
        9, 28, 18, 27, 8, 18, 28, 30, 18, 30, 20, 19, 10, 28, 8, 7, 10, 7, 8, 27, 30, 29, 18, 27, 19, 19, 30, 18, 27,
        28, 10, 17, 27, 29, 28, 29, 8, 10, 10, 20, 8, 19, 9, 27, 18, 17, 17, 10, 20, 19, 27, 10, 29, 20, 7, 7, 18, 30,
        20, 7, 28, 27, 10, 29, 7, 27, 28, 18, 27, 7, 8, 30, 17, 10, 30, 19, 9, 10, 7, 17, 30, 18, 17, 19, 29, 7, 8,
        9, 17, 17, 10, 19, 19, 9, 17, 8, 30, 17, 18, 9, 30, 7, 28, 7, 29, 17, 20, 18, 18, 19, 8, 9, 7, 27, 20, 30,
        18, 30, 7, 10, 20, 18, 18, 30, 9, 29, 9, 19, 29, 9, 27, 8, 8, 8, 10, 30, 29, 29, 19, 27, 30, 10, 30, 10, 17,
        20, 8, 29, 9, 10, 10, 8, 20, 8, 9, 18, 8, 7, 20, 7, 8, 7, 20, 10, 17, 8, 18, 27, 18, 27, 9, 9, 8, 27,
        30, 8, 20, 30, 17, 30, 9, 28, 8, 18, 19, 17, 28, 8, 29, 18, 9, 7, 10, 17, 9, 9, 7, 28, 20, 20, 8, 18, 19,
        28, 28, 9, 18, 18, 28, 7, 9, 30, 29, 9, 9, 28, 17, 29, 8, 7, 7, 19, 18, 30, 17, 7, 30, 30, 8, 17, 27, 30,
        19, 17, 29, 20, 19, 19, 19, 27, 19, 8, 17, 28, 20, 27, 7, 20, 20, 9, 17, 29, 7, 9, 19, 29, 27, 17, 9, 30, 9,
        27, 20, 10, 17, 29, 7, 7, 29, 9, 19, 9, 20, 18, 30, 8, 19, 18, 8, 29, 17, 17, 17, 7, 30, 30, 20, 18, 30, 9,
        18, 30, 7, 20, 8, 7, 30, 19, 10, 28, 27, 10, 17, 29, 28, 8, 10, 27, 27, 17, 20, 27, 17, 10, 28, 19, 8, 30, 20,
        30, 30, 29, 29, 30, 18, 30, 18, 20, 10, 8, 9, 10, 9, 17, 8, 18, 17, 7, 19, 30, 18, 29, 28, 17, 27, 30, 20, 7,
        7, 9, 27, 7, 29, 28, 7, 28, 10, 8, 19, 20, 9, 8, 29, 30, 10, 30, 18, 30, 8, 29, 20, 29, 8, 27, 30, 20, 7,
        29, 7, 10, 30, 27, 18, 8, 20, 29, 18, 7, 30, 19, 17, 28, 20, 27, 19, 18, 17, 8, 19, 7, 18, 30, 8, 18, 30, 27,
        7, 19, 20, 29, 18, 17, 30, 20, 30, 8, 27, 10, 27, 19, 10, 30, 30, 7, 27, 19, 9, 10, 7, 29, 17, 10, 7, 29, 27,
        27, 7, 20, 7, 17, 28, 30, 18, 18, 29, 17, 17, 29, 27, 9, 7, 30, 28, 10, 7, 7, 30, 8, 17, 20, 19, 30, 28, 30,
        8, 27, 29, 29, 27, 18, 9, 19, 8, 18, 27, 8, 20, 18, 10, 20, 20, 7, 17, 20, 29, 20, 8, 7, 29, 8, 29, 20, 7,
        28, 9, 17, 7, 8, 28, 28, 7, 29, 28, 8, 27, 18, 30, 28, 9, 17, 17, 10, 29, 10, 20, 27, 27, 10, 7, 30, 20, 27,
        28, 8, 8, 19, 27, 10, 9, 27, 17, 19, 17, 29, 29, 17, 19, 29, 9, 9, 30, 10, 19, 18, 30, 30, 19, 18, 17, 20, 20,
        29, 30, 17, 29, 20, 29, 17, 10, 27, 17, 29, 17, 8, 9, 29, 29, 30, 30, 20, 18, 19, 9, 9, 17, 30, 19, 30, 8, 28
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
          id = 47,
          name = "PlayerStart",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "MovableMirror-DR",
          type = "",
          shape = "rectangle",
          x = 144,
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
          id = 51,
          name = "RotatingMirror-UR",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 160,
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
          id = 52,
          name = "MovableMirror-UL",
          type = "",
          shape = "rectangle",
          x = 144,
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
          id = 53,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 54,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "MovableMirror-DL",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 160,
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
          id = 58,
          name = "MovableMirror-UR",
          type = "",
          shape = "rectangle",
          x = 64,
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
          id = 59,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 87,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "Light",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 160,
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
