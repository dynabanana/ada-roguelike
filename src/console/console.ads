with Win_Types; use type Win_Types.SHORT;
with Win_Console;

package Console is
   type Console_Dimensions is record
      width  : Win_Types.SHORT;
      height : Win_Types.SHORT;
   end record;

   function Size return Console_Dimensions;
end Console;
