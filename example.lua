-- example of my 19-line Lua class system
-- note: I don't recommend using it for anything big, because it lacks much functionality (for example classes in classes)
--       I'm working on another OOP system which will have much more features
--       I just thought it was neat that you're able to do something like this in 19 lines of Lua.

require("tinyClass")

local creature = newClass {
	class       = "creature", -- all classes have a "class" member
	species     = "undiscovered",
	existant    = false,
	power_level = 0,
	limbs       = 0,
}

-- creature is now a FUNCTION which returns an instance of the class:

local goat = creature {
	species     = "goatus danglickus",
	existant    = true,
	power_level = 2, -- or definately over 9000, depending on which games you play
	limbs       = 4, -- I think. on a good day. ?
}

-- goat is a TABLE which represents an instance of our creature class!

print(goat.species, goat.existant, goat.power_level)

-->>goatus danglickus true 2 4

local fiestyGoatFighter = newClass({
	stage_name = "asswoopa",
	agility    = 3,
	strength   = 2,
	GIQ        = 100, -- goat IQ! note: the IQ system is that 100 should be average. so this makes sense.
	health     = 100,
	kills      = 0,
	deaths     = 0,
	kdr = function(self)
		return self.kills/self.deaths
	end,
}, goat)

-- fiestyGoatFighter has all the normal members from our previously defined goat as well as some new ones.
-- we defined a function kdr which returns our fiesty little goat's kill/death ratio
-- inside the kdr function "self" is used to refer to the instance of the class
-- however, this is a regular argument. Lua just has some syntactic sugar for tab.func(tab) - tab:func()

local jane = fiestyGoatFighter {
	stage_name  = "PAIINN JANEEEE",
	power_level = 3,
	kills       = 4,
	deaths      = 2,
}

print(jane:kdr()) -- this is just syntactic sugar for jane.kdr(jane)!

-->>2
