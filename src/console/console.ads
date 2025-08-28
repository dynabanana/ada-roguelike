--  This file exports types and function definitions used to interact with the console. 

with Win_Types; use type Win_Types.SHORT;
with Win_Console;

package Console is

   type Console_Dimensions is record
      width  : Integer;
      height : Integer;
   end record;

   --  Queries the win32 API for information about the console screen. It returns a width/height pair which represents the width and height of the console. Calling code may be written: `Console.Size`.
   function Size return Console_Dimensions;
end Console;
