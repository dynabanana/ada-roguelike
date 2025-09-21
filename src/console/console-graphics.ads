with Game_Modes;
with Opening_Settings;
package Console.Graphics is

   --  Calls one of the below functions to fill the screen buffer, and then draws its contents to the console device. The screen that gets rendered depends on the state of the program. Internal persistent state in Console.Graphics should be managed by Draw and its overloaded functions.
   procedure Draw (Mode : in Game_Modes.Virtual_Mode);

   --  Draw the opening menu
   procedure Draw (
         Cursor : in Opening_Settings.Opening_Option
   );

   --  Expects the output from Console.Screen.Get_Size. Saves it into the module's internal state to be read by the render functions.
   procedure Set_Dimensions(Size : in Console_Dimensions);

   --  Deallocates module heap memory. For now this function does nothing 
   procedure Cleanup;

   private

   --  Each of these functions populate the screen buffer with visual information about the game state. The logic of what should be drawn on screen goes in here.
   procedure Render_Opening_Menu (Cursor : Opening_Settings.Opening_Option);
   procedure Render_Overworld;
   procedure Render_Inventory;
end Console.Graphics;
