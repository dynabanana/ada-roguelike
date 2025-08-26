with Ada.Text_IO;
with Win_Console;
with Win_Types; use type Win_Types.SHORT;

procedure Main is
   ref_csbi: access Win_Console.CONSOLE_SCREEN_BUFFER_INFO;
   console_handle: Win_Console.Console_Handle;
   width: Win_Types.SHORT;
   height: Win_Types.SHORT;
begin

   ref_csbi       := new Win_Console.Console_Screen_Buffer_Info;
   console_handle := Win_Console.GetStdHandle (Win_Console.STD_OUTPUT_HANDLE);

   Win_Console.GetConsoleScreenBufferInfo (console_handle, ref_csbi);
   
   width := ref_csbi.srWindow.Right - ref_csbi.srWindow.Left + 1;
   height := ref_csbi.srWindow.Bottom - ref_csbi.srWindow.Top + 1;
   Ada.Text_IO.Put_Line ("width: " & width'Image);
   Ada.Text_IO.Put_Line ("height: " & height'Image);
   
end Main;
