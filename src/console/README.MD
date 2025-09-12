# Console

The packages in this folder interact with the console screen.

- Console is the root package that most packages here except win_console inherit from. It has just the screen size type Console_Dimensions used by many of the packages.

- win_console only re-exports functions and types used by the win32 console API. These are used in Console.Screen.

- The Graphics package contains procedures that populate the draw buffer (declared in the package body; can't be accessed directly). It also has a generic higher order function Draw that accepts a display function and state, and then displays the draw buffer to the console.

- The functions to be directly called externally are Console.Screen.Get_Size, Console.Graphics.Make_Buffer, and Console.Screen.Draw


# Pipeline

1. External controller calls Console.Screen.Get_Size and passes its result to Console.Graphics.Make_Buffer, which creates a buffer to hold the screen contents to be drawn

2. External controller calls Console.Graphics.Draw,passing in the game state, and one of the draw functions (Opening_Menu, Inventory, Overhead_View, etc...)

3. Console.Graphics.Draw passed the screen buffer to the draw function along with any draw function-specific metadata

4. The draw function populates the screen buffer using the input information

5. Console.Graphics.Draw prints the contents of the screen buffer.

# Design Notes

- The reason Make_Buffer and Get_Size are exposed to the external interface is because I don't want anything that changes either the internal state of the module or the state of external devices to happen implicitely