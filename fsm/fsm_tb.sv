module tb;
logic clk;
logic [3:0] a;
logic [3:0] b;
logic [4:0] data;

fsm fsm_0(.clk(clk), .a(a), .b(b), .data(data));

always #10 clk = ~clk;

initial begin
   #0;
   clk = 0;
   a = 10;

   #40;
   b = 10;

   #20;
   $display(%0d + %0d = %0d", a, b, data);
   $finish;
end

initial begin
   $fsdbDumpfile("dump.fsdb");
   $fsdbDumpvars;
end
endmodule
