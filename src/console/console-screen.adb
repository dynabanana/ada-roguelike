package body Console.Screen is

   --  logic translated to Ada from https://stackoverflow.com/a/53276678
   --  this function gets the current size of the console in characters as a (width,height) pair
   function Get_Size return Console_Dimensions is
      ref_csbi       : access Win_Console.CONSOLE_SCREEN_BUFFER_INFO;
      console_handle : Win_Console.Console_Handle;
      dimensions     : Console_Dimensions;
   begin
      ref_csbi := new Win_Console.Console_Screen_Buffer_Info;
      console_handle :=
        Win_Console.GetStdHandle (Win_Console.STD_OUTPUT_HANDLE);

      Win_Console.GetConsoleScreenBufferInfo (console_handle, ref_csbi);

      dimensions.Width :=
        Integer (ref_csbi.srWindow.Right - ref_csbi.srWindow.Left + 1);
      dimensions.Height :=
        Integer (ref_csbi.srWindow.Bottom - ref_csbi.srWindow.Top + 1);
      return dimensions;
   end Get_Size;
end Console.Screen;
