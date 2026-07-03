local plz = require("../plz")

local anchored_part = Instance.new("Part")
anchored_part.Anchored = true
anchored_part.Position = Vector3.new(0, 10, 0)
anchored_part.Size = Vector3.new(2, 2, 2)

local Part = plz.allocate(anchored_part)
local Highlight = plz.allocate(Instance.new("Highlight"))

local pen = plz.pen()

script:SetAttribute("pos", true)
script:SetAttribute("length", 20)

while true do
    for i2 = 1, script:GetAttribute("length") do
        for i = 1, script:GetAttribute("length") do
            local cube = pen:node(Part)
            cube.Name = `The Plz {i}`
            cube.Parent = workspace

            if (i2 + math.round(os.clock())) % 2 == 1 then
                local highlight = pen:node(Highlight)
                highlight.Adornee = cube
                highlight.Parent = cube
            end

            if script:GetAttribute("pos") then
                cube.Position = Vector3.new(i * 4, 10 + (math.sin(os.clock() + i + i2) * 4), i2 * 4)
            end
        end
    end

	pen:render()
	task.wait(1 / 20)
end
