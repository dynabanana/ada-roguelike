
with Ada.Unchecked_Deallocation;

separate(Console.Graphics)

procedure Cleanup is

   procedure Free_Screen_Buffer is new Ada.Unchecked_Deallocation(
      Object => Char_Buffer,
      Name   => Char_Buffer_Ptr
   );

begin

   Free_Screen_Buffer (Screen_Buffer);
end Cleanup;