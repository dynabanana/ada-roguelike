--  Ada implementations of Windows data types:
-- https://learn.microsoft.com/en-us/windows/win32/winprog/windows-data-types

--  only features a subset of types actually used in the project

--  with the gnat compiler there's no need to use convention => C
--  on Ada types because this is the compiler default:
--  https://docs.adacore.com/gnat_rm-docs/html/gnat_rm/gnat_rm/interfacing_to_other_languages.html
--  some data types have this anyway for clarity of intent. 

--  only features a subset of windows data types: only those
--  actually used in the project

--  with the gnat compiler there's no need to use pragma convention C
--  on Ada types because this is the compiler default:
--  https://docs.adacore.com/gnat_rm-docs/html/gnat_rm/gnat_rm/interfacing_to_other_languages.html

-- Ada Interface.C documentation:
-- https://en.wikibooks.org/wiki/Ada_Programming/Libraries/Interfaces.C
with Interfaces; use Interfaces;

package Win_Types is

   -- names taken directly from the windows documentation share the same
   -- all-caps spelling

   -- basic windows integral types
   
   type WORD is new Unsigned_16;

   type SHORT is new Integer_16;

   type DWORD is new Unsigned_32;

   -- in the windows type system, BOOL is declared as:
   -- typedef int BOOL;
   type BOOL is new Integer;

   -- don't want to directly create null records so Void is private
   -- used to create a void pointer in PVOID.
   type Void is private;

   -- PVOID shouldn't be used directly;
   -- instead, 'with'ing packages should redefine it to refer to specific objectss
   type PVOID is access all Void with Convention => C;

   -- handles refer to a resource loaded into memory
   -- the Windows data type documentation defines them as:
   --  typedef PVOID HANDLE;
   type HANDLE is new PVOID;
   
   type LPVOID is new PVOID;

   -- simple structures used by many win32 functions

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
