# fibCarpet
Automated generation of **Fibonacci carpet peseudofractals**, a concept created by [Nathan Grimes](http://nathangrimesfineart.com/).

![Fiboacci carpet pseudofractal, n = 13.](fibcarpet13/fibCarpet13_loop.gif)

Grimes was drawing these Fibonacci carpets by hand in Paint, pixel by pixel. The center square is some square whose side length is some Fibonacci number `F(n)`. Each successive set of squares is drawn adject to the previous square's corners, and their side length is Fibonacci number `F(n-1)`. I figured that I could automate it. In my presentation of the idea I animated the process by which my code generated the carpets. Fun stuff.

This code is quick, dirty, and WET. But it worked.

Example output from the code is included in the [fibCarpet13](/fibcarpet13) folder.
