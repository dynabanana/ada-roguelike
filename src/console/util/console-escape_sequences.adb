with Ada.Text_IO;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;

--  imports To_Str
with String_Util; use String_Util;
package body Console.Escape_Sequences is

   CSI      : constant String := ESC & "[";
   CLR_SCRN : constant String := CSI & "2J" & CSI;


   function Cursor_Position (
      Horizontal : Positive;
      Vertical   : Positive
   ) return String is
      Command : constant String :=
                                CSI &
                   To_Str(Vertical) &
                                ';' &
                 To_Str(Horizontal) &
                                'f' ;
   begin
      return Command;
   end Cursor_Position;

   procedure Clear_Screen is begin
      Ada.Text_IO.Put (CLR_SCRN);
   end Clear_Screen;

   procedure Move_Cursor (
      Horizontal : Positive;
      Vertical   : Positive
   ) is begin
      Ada.Text_IO.Put(Cursor_Position(Horizontal, Vertical));
   end Move_Cursor;

   procedure Scroll_Up (N : Positive) is
      Command : constant String :=
                                CSI &
                          To_Str(N) &
                                'S' ;
   begin
      Ada.Text_IO.Put(Command);
   end Scroll_Up;

   procedure Move_Col (N : Positive) is
      Command : constant String :=
                                CSI &
                         To_Str (N) &
                                'G' ;
   begin
      Ada.Text_IO.Put(Command);
   end Move_Col;

   procedure Move_Row (N : Positive) is
      Command : constant String :=
                                CSI &
                         To_Str (N) &
                                'G' ;
   begin
      Ada.Text_IO.Put(Command);
   end Move_Row;
end Console.Escape_Sequences;
