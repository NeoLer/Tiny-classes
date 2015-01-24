-- create a function which returns a class using "properties" as a template along
-- with inheriting everything from "derives" (if there are name collisions,
-- "properties" beats out "derives".
function newClass(properties, derives)
	return function(settings)
		local class = {class = properties.class and properties.class or "class"}
		if derives then -- inherit some class
			for key, value in pairs(derives) do
				class[key] = value
			end
		end
		for property, default in pairs(properties) do -- specific to this class
			class[property] = default
		end
		if settings then
			for property, setting in pairs(settings) do -- specific to this instance of this class
				class[property] = setting
			end
		end
		return class
	end
end
