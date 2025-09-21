with Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
package body String_Util is
   function To_Str (I : Integer) return String is
      Raw   : String := I'Image;
      Fixed : String := Trim(Raw, Ada.Strings.Left);
   begin
      return Fixed;
   end To_Str;
end String_Util;