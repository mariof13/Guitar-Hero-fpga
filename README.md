# Guitar-Hero-fpga
Very basic fpga version of guitar hero. We put WAY too much time into this, and it looks like we did this in 15 minutes...
What works: Frets move and are colored. The bar at the bottom indicates the time you need to press the buttons.
Score increments when you press the buttons at the right time; the longer you hold, the more your score increments.

There's also a counter that decrements when you mess up. You can't see it cuz it's not connected to any LEDs,
but, just know, someone, somewhere, inside the fpga board, knows you're failing. Think about that.

The game even speeds up after a while! Pretend you're at a RATM concert and everything explodes. That's the power of music.

The score will increment if the program senses the bars are in the right spot. 
Careful though, the buttons are tough to work singlehandedly! Check the ucf file for the complete map.
A lot of stuff has been commented out. You can delete that. We just got lazy.

If you're in a logic design class and are trying to figure out how to make this, then feel free to take a look.
It's all good, I won't judge. It's your choice.

I mean, it won't get you an A, but, 
if you've already spent a couple hours looking online for codes to help you, then beggars really can't be choosers.

You can thank me at your graduation. Name your firstborn son after me; I'll consider us even.



