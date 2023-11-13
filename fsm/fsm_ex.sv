`timescale 1ns/1ps

module fsm(clk, a, b, data);
   input clk;
   input [3:0] a;
   input [3:0] b;
   output reg [4:0] data;

   always @(posedge clk)
      data <= a + b;

   typedef enum bit [1:0] {idle = 0, tr = 1, ready = 2} state_type;
   state_type state = idle

   always @(posedge clk)
   case (state)
      idle :
      if(a)
         state <= tr;
      else
         state <= idle;

      tr :
      if(b)
         state <= ready;
      else
         state <= tr;

      ready :
      if(data)
         state <= idle;
      else
         state <= ready;
   endcase
endmodule
