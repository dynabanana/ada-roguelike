with Win_Console;
with Win_Types; use type Win_Types.SHORT;
--  This package is responsible for interfacing with the operating system and console device
package Console.Screen is

   --  Queries the operating system for information about the currently displayed console screen. It returns a width/height pair which represents the width and height of the console, which will almost always be a virtual console. The size returned depends on the size at which the user is currently keeping the screen.
   function Get_Size return Console_Dimensions;

end Console.Screen;
