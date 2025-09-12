with Ada.Text_IO;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
package body Console.Graphics is

   Screen_Buffer : Char_Buffer_Ptr := null;

   function Buffer_Exists return Boolean is begin
      return not (Screen_Buffer = null);
   end Buffer_Exists;

   procedure Make_Buffer (Dimensions : Console_Dimensions) is begin
      Screen_Buffer :=
        new Char_Buffer (1 .. Dimensions.height, 1 .. Dimensions.width);
      for I in Screen_Buffer'Range (1) loop
         for J in Screen_Buffer'Range (2) loop
            Screen_Buffer (I, J) := '@';
         end loop;
      end loop;
   end Make_Buffer;

   procedure Render_Opening_Menu (Buff : Char_Buffer_Ptr) is
   begin
      null;
   end Render_Opening_Menu;

   procedure Render_Overworld (Buff : Char_Buffer_Ptr) is
   begin
      null;
   end Render_Overworld;

   procedure Render_Inventory (Buff : Char_Buffer_Ptr) is
   begin
      null;
   end Render_Inventory;

   procedure Draw (Mode : Game_Modes.Game_Mode) is
   begin
      case Mode is
         when Opening_Menu =>
            Render_Opening_Menu (Screen_Buffer);

         when Overworld =>
            Render_Overworld (Screen_Buffer);
      end case;

      Ada.Text_IO.Put_Line (ESC & "[2J");

      for Row in Screen_Buffer'Range (1) loop
         for Col in Screen_Buffer'Range (2) loop
            Ada.Text_IO.Put (Screen_Buffer (Row, Col));
         end loop;
         Ada.Text_IO.Put_Line ("");
      end loop;
   end Draw;

   procedure Cleanup is separate;
end Console.Graphics;
