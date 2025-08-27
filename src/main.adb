with Ada.Text_IO;
with Win_Types; use type Win_Types.SHORT;
with Console; use type Console.Console_Dimensions;

procedure Main is
   dimensions : Console.Console_Dimensions;
begin

   dimensions := Console.Size;
   Ada.Text_IO.Put_Line ("width: " & dimensions.width'Image);
   Ada.Text_IO.Put_Line ("height: " & dimensions.height'Image);
   
end Main;
