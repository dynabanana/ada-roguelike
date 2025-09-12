with Console.Graphics;
with Game_Modes; use Game_Modes;
with Console.Screen;
procedure Main is
   Mode : Game_Mode := Opening_Menu;
begin
   
   -- Create buffer to hold characters displayed on screen. See console/README.MD
   Console.Graphics.Make_Buffer(Console.Screen.Get_Size);
   Console.Graphics.Draw (Mode);

   Console.Graphics.Cleanup;
end Main;
