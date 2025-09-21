# Console

The packages in this folder interact with the console screen.

- Console is the root package that most packages here except win_console inherit from. It has just the screen size type Console_Dimensions used by many of the packages.

- win_console only re-exports functions and types used by the win32 console API. These are used in Console.Screen.

- The Graphics package contains rendering procedures that Draw each game mode directly (all private). It also has a polymorphic function Draw that accepts a state, and then calls the corresponding render function.

- The functions to be directly called externally are Console.Screen.Get_Size and the different versions of Console.Screen.Draw


# Pipeline

1. External controller calls Console.Screen.Get_Size and passes its result to Console.Graphics.Set_Dimensions, which holds the current screen size.

2. External controller calls Console.Graphics.Draw, passing in the necessary game state

3. Console.Graphics.Draw calls the corresponding render function

4. The render function prints any necessary changes to the game state to the console

# Design Notes

- The reason Set_Dimensions and Get_Size are exposed to the external interface is because I don't want anything that changes either the internal state of the module or the state of external devices to happen implicitely