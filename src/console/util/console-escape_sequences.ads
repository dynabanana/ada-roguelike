package Console.Escape_Sequences is

   procedure Clear_Screen;

   --  Calls Ada.Text_IO.Put on the output of Cursor_Position
   procedure Move_Cursor (
      Horizontal : Positive;
      Vertical   : Positive
   );

   procedure Scroll_Up (N : Positive);

   procedure Move_Col (N : Positive);
   procedure Move_Row (N : Positive);
private

   --  Pair of escape sequences to place the cursor on a given position
   function Cursor_Position (
      Horizontal : Positive;
      Vertical   : Positive
   ) return String;
end Console.Escape_Sequences;
