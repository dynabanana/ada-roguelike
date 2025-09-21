with Ada.Text_IO;

with Console.Graphics;
with Console.Screen;

with Game_Modes; use Game_Modes;
with Opening_Settings; use Opening_Settings;

with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
procedure Main is
   Mode : Game_Modes.Virtual_Mode := Start;
   Input : Character;
begin

   -- Query Windows for dimensions of the console and pass this to the graphics module
   Console.Graphics.Set_Dimensions(Console.Screen.Get_Size);

   Console.Graphics.Draw (Mode);

   --  loop: read input
   Ada.Text_IO.Get_Immediate (Input);

   --  possible main loop:
   --  pass state+input into input interpreter, get command
   --  pass command to logic module, change internal state and return new mode
   --  save new mode
   --  pass new mode to graphics module to render game state

   Mode := Stop;
   Console.Graphics.Draw (Mode);
end Main;
