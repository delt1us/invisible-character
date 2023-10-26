-- @Author: striker <armin3600z@gmail.com>
-- @Date: 2023-10-26 11:20:58
-- @Last Modified by: striker <armin3600z@gmail.com>
-- @Last Modified time: 2023-10-26 13:00:43

local character = data.raw["character"]["character"]

-- Remove sprite
--  Sets filenames of animations to an empty png
if not settings.startup["dewberry-character-visible"].value then
  local properties = require("minimal-no-base-mod.properties")
  for q = 1, #character.animations do
    character.animations[q] = {
      idle = properties.rotated_animation(),
      idle_with_gun = properties.rotated_animation(),
      running = properties.rotated_animation(),
      running_with_gun = properties.rotated_sprite_custom_direction_count(18),
      mining_with_tool = properties.rotated_animation(),
    }
  end
end
