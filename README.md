multimount
==========

MultiMount is a World of Warcraft add-on that will intelligently select a mount based on your surroundings. 

Most of what MultiMount does could be accomplished with regular macros using conditionals such as

* flyable
* indoors
* outdoors
* mounted
* nomounted
* swimming

The one thing that MultiMount provides on-top is the implied conditional that splits 'swimming' into 

* swimming under water
* bobbing at the surface

This allows you to make use of aquatic mounts easily, but when it's time to get out of the water
you can rise to the surface and summon a flyable mount to get out of the water.

usage
==========

Customize the mounts by editing MultiMount.lua

    UNDERWATER_MOUNT="Subdued Seahorse"
    BOBBING_IN_WATER_MOUNT="Sandstone Drake"
    FLYING_MOUNT="Bronze Drake Mount"
    GROUND_MOUNT="Pinto"

Use the slash commands in chatbox or macro

    /mm
    /multimount

MultiMount will also honor conditionals 

     /mm [nomounted,nocombat]
     
More advanced uses could include compensation for failure to mount. As an example, I have 
a [Goblin Glider](http://www.wowhead.com/spell=126392/goblin-glider "Goblin Glider") on all 
my cloaks. If I get dismounted, I can hit my mount macro and it'll deploy automatically.

This takes advantage of the fact that  [Goblin Glider](http://www.wowhead.com/spell=126392/goblin-glider "Goblin Glider")
won't deploy if you're on the ground as standing or running on the ground both prevent 
it from deploying.

    /mm [nomounted,nocombat]
    /use [nomounted,outdoors] 10

