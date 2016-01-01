# Guitar-Hero-fpga
Very basic fpga version of guitar hero. 
What works: Frets move and are colored. The bar at the bottom indicates the time you need to press the buttons.
Score increments when you press the buttons at the right time; the longer you hold, the more your score increments.

There's also a counter that decrements when an incorrect button is hit. You cannot see it since the output is not connected to the LEDs, but had there been a 'fail threshold' for the game, this would come in handy.

The game even speeds up after a while (about 26 seconds or so). You can alter the new speed or the time it takes for the speed up to occur by working with the clocks in the code.

The score will increment if the program senses the bars are in the right spot. 
Careful though, the buttons are tough to work singlehandedly! Check the ucf file for the complete map.




