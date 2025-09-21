package Game_Modes is
   --  Virtual_Mode represents the different interactive game states as well as certain non-interactive states that could trigger a draw, including the start and stop state of the program.
   type Virtual_Mode is (Opening_Menu, Overworld, Start, Stop);

   subtype Interactive_Mode is Virtual_Mode range
      Opening_Menu .. Overworld;
end Game_Modes;
