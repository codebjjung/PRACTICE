module adder(
   input [3:0] x,
   input [3:0] y,
   input cin,
   output [4:0] sum,
   output cout
);

assign sum = x^y^cin;
assign cout = (x&&y) | (y&&cin) | (cin&&x);
endmodule

module tb;
logic [3:0] x;
logic [3:0] y;
logic cin;
logic [4:0] sum;
logic cout;

   covergroup covgrp;
      coverpoint x[3:0] {
         bins a = {[$:7]};
         bins b = {[8:$]};
      }
      coverpoint y[3:0] {
         bins c = {[$:7]};
         bins d = {[8:$]};
      }
   endgroup

   adder myadder (.x(x), .y(y), .cin(cin), .sum(sum), .cout(cout));

   initial begin
      covgrp cg = new();
      for (int i = 0; i < 5; i++) begin
         x = $random;
         y = $random;
         $display("x = %0d, y = %0d", x, y);
         cg.sample();
      end
      $display("coverage : %f%%", cg.get_coverage());
   end
endmodule
