with Ada.Text_IO;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Game_Modes; use Game_Modes;
with Opening_Settings; use Opening_Settings;

with Console.Escape_Sequences; use Console.Escape_Sequences;

package body Console.Graphics is
   Dims : Console_Dimensions;

   --  Render functions compare input Mode to Previous_Mode to determine which portions of the screen to redraw.
   Previous_Mode : Virtual_Mode := Start;

   procedure Set_Dimensions (Size : in Console_Dimensions) is
   begin
      Dims := Size;
   end;

   procedure Render_Opening_Menu (Cursor : Opening_Settings.Opening_Option) is

      Options : constant array (1..4) of Unbounded_String := [
         To_Unbounded_String  ("New Game"),
         To_Unbounded_String ("Load Game"),
         To_Unbounded_String  ("Settings"),
         To_Unbounded_String ("Exit Game")
      ];

      Vertical_Space      : Natural := (Dims.Height/2) - (Options'Length/2);
      Left_Padding_Amount : Natural := 0;
   begin

      declare
         Longest_Len         : Natural := 0;
      begin
         for Option of Options loop
            if Length (Option) > Longest_Len then
               Longest_Len    := Length (Option);
            end if;
         end loop;

         Left_Padding_Amount := Dims.Width/2 - Longest_Len/2;
      end;

      --  If Opening_Menu wasn't the previous state
      if Previous_Mode /= Opening_Menu then

         Move_Cursor (Left_Padding_Amount, Vertical_Space);


         --  Add whitespace to the left of each option type, then print
         for Option of Options loop
            Move_Col (Left_Padding_Amount);
            Ada.Text_IO.Put_Line (To_String (Option));
         end loop;
      end if;

      --  Move cursor vertically down to selected option, place cursor
      Vertical_Space := Vertical_Space + Opening_Option'Pos (Cursor);
      Move_Cursor (Left_Padding_Amount-1, Vertical_Space);
      Ada.Text_IO.Put ('*');


   end Render_Opening_Menu;

   procedure Render_Overworld is
   begin
      null;
   end Render_Overworld;

   procedure Render_Inventory is
   begin
      null;
   end Render_Inventory;

   procedure Draw (Mode : in Game_Modes.Virtual_Mode) is
   begin
      case Mode is
         When Opening_Menu =>
            null;
         When Overworld =>
            null;
         When Start =>
            Draw (
               Opening_Settings.New_Game
            );
         When Stop =>
            Cleanup;
      end case;
   end Draw;

   procedure Draw (
      Cursor : Opening_Settings.Opening_Option
   ) is
   begin
      if Previous_Mode /= Opening_Menu then
         Clear_Screen;
      end if;

      Render_Opening_Menu (Cursor);

      Previous_Mode := Opening_Menu;
   end Draw;

   --  procedure Center_Text is separate;
   --  procedure Left_Align_Text is separate;

   procedure Cleanup is separate;
end Console.Graphics;
