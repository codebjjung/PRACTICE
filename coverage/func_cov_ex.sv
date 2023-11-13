module add(input [3:0] x,
   input [3:0] y,
   input cin,
   output [4:0] sum,
output cout);

assign sum = x^y^cin;
assign cout = (x&&y) | (y&&z) | (z&&x);
endmodule


class myCov;
   covergroup CovGrp;
      coverpoint a {
         bins featureA = {[2:4]};
         bins featureB = {[8:$]};
      }
      coverpoint b {
         bins featureC = {[1]};
         bins featureD = {[$:$]};
      }
   endgroup

   function new();
      CovGrp = new;
   endfunction
endclass

module tb_top;
   myCov myCov0 = new();

   initial begin
      my_Cov0.CovGrp.sample ();
   end
endmodule
