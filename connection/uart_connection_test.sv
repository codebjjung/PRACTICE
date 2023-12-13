`include "boot_seq.sv"

int con_pass;
int con_error;

task result_phase();
   $display("CON_PASS : %0d | CON_ERROR : %0d", con_pass, con_error);
endtask

initial begin
   boot_seq();

   force TEST_TOP.duv.xCORE.xOICBUS_TOP.xUART_WRAP.o_uart0_irq = 1'b0;
   if (TEST_TOP.duv.xCORE.xCBUS_TOP.AP_INT[51] == 1'b0) begin
      $display("PASS!! source : %0h | destination : %0h", TEST_TOP.duv.xCORE.xOICBUS_TOP.xUART_WRAP.o_uart0_irq, TEST_TOP.duv.xCORE.xCBUS_TOP.AP_INT[51]);
      con_pass++; 
   end else begin
      $display("FAIL!!");
      con_error++;
   end
end
