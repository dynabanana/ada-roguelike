with Game_Modes; use Game_Modes;
package Console.Graphics is

   type Char_Buffer is array (Integer range <>, Integer range <>) of Character;
   type Char_Buffer_Ptr is access Char_Buffer;

   --  Queries whether the internal character buffer has been generated
   function Buffer_Exists return Boolean;

   procedure Make_Buffer (Dimensions : Console_Dimensions) with
      Pre  => not Buffer_Exists,
      Post => Buffer_Exists;

   --  Calls one of the below functions to fill the screen buffer, and then draws its contents to the console device.
   procedure Draw (Mode : in Game_Modes.Game_Mode)
      with Pre => Buffer_Exists;


   procedure Cleanup
      with Pre => Buffer_Exists;

   private

   --  Each of these functions populate the screen buffer with visual information about the game state. The logic of what should be drawn on screen goes in here.
   procedure Render_Opening_Menu (Buff : Char_Buffer_Ptr);
   procedure Render_Overworld    (Buff : Char_Buffer_Ptr);
   procedure Render_Inventory    (Buff : Char_Buffer_Ptr);
end Console.Graphics;
