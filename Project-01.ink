/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

// Global Variables
VAR health = 5
VAR sprite_name = ""
VAR swords = 0
VAR treasure_found = false
VAR courage = 0
VAR visited_memory = false
VAR visited_forest = false
VAR visited_east_path = false
VAR visited_west_path = false

== memory ==
{ visited_memory == false:
    ~ visited_memory = true
}
Before you stands the forest of Golden. You wish you had a sprite with you now—the forest might seem less scary then.

What was your pet's name?
+ [Feyliya] -> set_sprite_name("Feyliya")
+ [Luna] -> set_sprite_name("Luna")
+ [Cirno] -> set_sprite_name("Cirno")

== set_sprite_name(name) ==
~ sprite_name = name
-> forest_entrance

== forest_entrance ==
{ visited_forest == false:
    ~ visited_forest = true
}
You stand at the edge of the forest of Golden. The trees and flickering light play tricks on your eyes—but with {sprite_name} by your side, you feel a bit of comfort.

What do you do?
+ [Pick up a sword on the ground] -> sword_pickup
+ [Take the east path] -> east_path
+ [Take the west path] -> west_path

== sword_pickup ==
You pick up a silver sword.
~ swords += 1
-> forest_entrance

== east_path ==
{ visited_east_path == false:
    ~ visited_east_path = true
}
You walk down the east path. The trail is narrow and shadowed. Soon, you see something on the rock wall.

What do you do?
+ [Examine the runes] -> runes
+ [Return to the forest entrance] -> forest_entrance

== runes ==
The runes seem to stimulate your energy. You feel your courage rising.
~ courage += 1
-> forest_entrance

== west_path ==
{ visited_west_path == false:
    ~ visited_west_path = true
}
You take the west path and soon discover a room with a mysterious treasure chest inside an old oak.

What do you do?
+ [Open the treasure chest] -> treasure
+ [Return to the forest entrance] -> forest_entrance

== treasure ==
You open the shining box and find HP recovery potions.
~ treasure_found = true
~ health += 2
-> forest_entrance

