module tb;
   bit [3:0] one_mode;
   bit [3:0] two_mode;
   bit [2:0] three_mode;

   covergroup cg;
      option.per_instance = 1;
      ONE_MODE: coverpoint one_mode {
         bins a = {[$:5]};
         bins b = {13};
      }

      TW0_MODE: coverpoint two_mode {
         bins c[4] = {[$:$]};
         ignore_bins c_i = {1, 3};
      }

      CROSS: cross ONE_MODE, TWO_MODE;

   endgroup

   initial begin
      cg cg_inst = new();
      for (int i = 0; i < 3; i++) begin
         #10
         one_mode = $random;
         two_mode = $random;
         $dispalay("[%0t] one_mode = 0x%0h, two_mode = 0x%0h", $time, one_mode, two_mode);
         cg_inst.sample();
      end
      $display("Coverage = %0.2f %%", cg_inst.get_inst_coverage());
   end
endmodule
