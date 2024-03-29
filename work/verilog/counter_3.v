/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = DIGIT_BITS
     DIV = DIV
     TOP = DIGITS-1
     UP = 1
*/
module counter_3 (
    input clk,
    input rst,
    output reg [1:0] value
  );
  
  localparam SIZE = 2'h2;
  localparam DIV = 7'h40;
  localparam TOP = 4'h3;
  localparam UP = 1'h1;
  
  
  reg [65:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 68'h3ffffffffffffffff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[64+1-:2];
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h1 && M_ctr_q == 68'h3ffffffffffffffff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h1 && M_ctr_q == 1'h0) begin
        M_ctr_d = 68'h3ffffffffffffffff;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
