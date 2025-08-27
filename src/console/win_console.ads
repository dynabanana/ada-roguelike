-- if not using GNAT, the interfacing aspect: Convention => C
-- should be added to all of the imported objects in this file

-- this file only imports objects from the win32 console API.
-- console_size.ads/adb encapsulate these resources into a single
with Interfaces;
with Win_Types ; use Win_Types;

package Win_Console is

   type Console_Screen_Buffer_Info is
      record
         dwSize: COORD;
         dwCursorPosition: COORD;
         wAttributes: WORD;
         srWindow: SMALL_RECT;
         dwMaximumWindowSize: COORD;
      end record;
   
   type Console_Handle is new HANDLE;

   procedure GetConsoleScreenBufferInfo
     (hConsoleOutput            : Console_Handle;
      lpConsoleScreenBufferInfo : access Console_Screen_Buffer_Info)
   with 
      Import        => True,
      External_Name => "GetConsoleScreenBufferInfo";
   
   STD_OUTPUT_HANDLE : constant DWORD
   with
      import        => True,
      External_Name => "ffi_STD_OUTPUT_HANDLE";

   function GetStdHandle (nStdHandle: DWORD) return Console_Handle
   with
      Import        => True,
      External_Name => "GetStdHandle";
end Win_Console;
