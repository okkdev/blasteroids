require 'player'
require 'bullet'
require 'asteroid'
require 'ui'

function collision_update()
  --collision detection
  for i, ab in ipairs(asteroidBig) do
	for j, b in ipairs(bullets) do
		if CheckCollision(ab.x, ab.y, asteroidBigCanvas:getWidth(), asteroidBigCanvas:getHeight(), b.x, b.y, bulletcanvas:getWidth(), bulletcanvas:getHeight()) then
			table.insert(dead_bullets, table.remove(bullets, j))
			asteroidBigDies(i, true, ab)
      score = score + 1
		end
	end
  end
end

-- Collision detection taken function from http://love2d.org/wiki/BoundingBox.lua
-- Returns true if two boxes overlap, false if they don't
-- x1,y1 are the left-top coords of the first box, while w1,h1 are its width and height
-- x2,y2,w2 & h2 are the same, but for the second box
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
