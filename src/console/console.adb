with Win_Console;
package body Console is

   function Size return Console_Dimensions is
         ref_csbi: access Win_Console.CONSOLE_SCREEN_BUFFER_INFO;
         console_handle: Win_Console.Console_Handle;
         dimensions : Console_Dimensions;
      begin
         ref_csbi       := new Win_Console.Console_Screen_Buffer_Info;
         console_handle := Win_Console.GetStdHandle (Win_Console.STD_OUTPUT_HANDLE);

         Win_Console.GetConsoleScreenBufferInfo (console_handle, ref_csbi);

         dimensions.width := ref_csbi.srWindow.Right - ref_csbi.srWindow.Left + 1;
         dimensions.height := ref_csbi.srWindow.Bottom - ref_csbi.srWindow.Top + 1;
      return dimensions;
   end Size;
end Console;
