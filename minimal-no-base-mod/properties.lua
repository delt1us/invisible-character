-- Note: None of these properties are meant for use in a normal mod,
--   because they mostly produce empty images and have no function in-game beyond being loadable.

-- All properties are based on the formats documented on the wiki: https://wiki.factorio.com/Prototype_overview

local properties = {}

properties.sound_filename = "__core__/sound/achievement-unlocked.ogg"
properties.sprite_filename = "__core__/graphics/empty.png"
properties.sprite_filename_32px = "__core__/graphics/icons/unknown.png"
properties.render_layer = "object"

-- This function is applied directly to the prototype table and adds the icon to it
properties.add_icon = function(prototype)
  prototype.icon = properties.sprite_filename
  prototype.icon_size = 1
  return prototype
end

-- Any property that is a table is returned via a function.
--   This means that everything gets a copy of the table, not a reference to the table.

properties.color = function()
  return { 1, 1, 1, 1 }
end -- white
properties.bounding_box = function()
  return { { 0, 0 }, { 0, 0 } }
end
-- splitter: bounding box width must be > 0.5, height must be > 1
properties.nonzero_bounding_box = function()
  return { { -0.95, -1.0 }, { 0.1, 0.1 } }
end
properties.vector = function()
  return { 0, 0 }
end
properties.sound = function()
  return { filename = properties.sound_filename }
end
properties.sprite = function()
  return {
    filename = properties.sprite_filename,
    size = 1,
  }
end
-- properties.sprite() is also used as SpriteVariations and Sprite4Way
properties.rotated_sprite = function()
  local sprite = properties.sprite()
  sprite.direction_count = 1
  return sprite
end
properties.rotated_sprite_custom_direction_count = function(direction_count)
  local sprite = properties.sprite()
  sprite.filename = properties.sprite_filename_32px
  sprite.direction_count = direction_count
  return sprite
end
properties.sprite_8_way = function()
  return {
    north = properties.sprite(),
    north_east = properties.sprite(),
    east = properties.sprite(),
    south_east = properties.sprite(),
    south = properties.sprite(),
    south_west = properties.sprite(),
    west = properties.sprite(),
    north_west = properties.sprite(),
  }
end
properties.animation = function()
  return properties.sprite()
end
-- properties.animation() is also used as AnimationVariations and Animation4Way
properties.rotated_animation = function()
  local animation = properties.animation()
  animation.direction_count = 1
  return animation
end
return properties
