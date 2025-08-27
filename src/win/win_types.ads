--  Ada implementations of Windows data types: https://learn.microsoft.com/en-us/windows/win32/winprog/windows-data-types

--  only features a subset of types actually used in the project

--  wWth the gnat compiler there's no need to use `convention => C` on Ada types because this is the compiler default: https://docs.adacore.com/gnat_rm-docs/html/gnat_rm/gnat_rm/interfacing_to_other_languages.html
--  Some data types have this anyway for clarity of intent. 

--  Only features a subset of windows data types: only those actually used in the project

--  with the gnat compiler there's no need to use pragma Convention C on Ada types because this is the compiler default:
--  https://docs.adacore.com/gnat_rm-docs/html/gnat_rm/gnat_rm/interfacing_to_other_languages.html

-- Ada Interface.C documentation:
-- https://en.wikibooks.org/wiki/Ada_Programming/Libraries/Interfaces.C
with Interfaces; use Interfaces;

package Win_Types is

   -- Names taken directly from the windows documentation share the Same all-caps spelling.

   -- Basic windows integral types.

   type WORD is new Unsigned_16;

   type SHORT is new Integer_16;

   type DWORD is new Unsigned_32;

   -- In the windows type system, BOOL is declared as: typedef int BOOL;
   type BOOL is new Integer;

   -- Void is private to prevent programmers from directly using it. This type is used to create a void pointer, PVOID.
   type Void is private;

   -- PVOID shouldn't be used directly. Instead, 'with'ing packages should redefine it to refer to specific objects.
   type PVOID is access all Void with Convention => C;

   -- Handles refer to a resource loaded into memory. The Windows data type documentation defines them as: typedef PVOID HANDLE;
   type HANDLE is new PVOID;

   type LPVOID is new PVOID;

   -- Simple structures used by many win32 functions.

   type COORD is record
      X : SHORT;
      Y : SHORT;
   end record;

   type SMALL_RECT is record
      Left   : SHORT;
      Top    : SHORT;
      Right  : SHORT;
      Bottom : SHORT;
   end record;

private
   type Void is null record with Convention => C;
end Win_Types;
