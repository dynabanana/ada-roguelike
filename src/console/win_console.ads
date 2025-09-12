--  If not compiling with GNAT, the interfacing aspect: `Convention => C` should be added to all of the imported objects in this file.

--  This file imports definitions from the win32 console API which are used in the Console package.
with Interfaces;
with Win_Types ; use Win_Types;
with Ada.Text_IO;
package Win_Console is

   type Console_Screen_Buffer_Info is
      record
         dwSize              : COORD;
         dwCursorPosition    : COORD;
         wAttributes         : WORD;
         srWindow            : SMALL_RECT;
         dwMaximumWindowSize : COORD;
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
