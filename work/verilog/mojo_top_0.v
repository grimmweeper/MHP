/*
   This file was generated automatically by Alchitry Labs version 1.1.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    output reg spi_miso,
    output reg [3:0] spi_channel,
    output reg avr_rx,
    input [4:0] io_button,
    input [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    output reg inputA,
    output reg inputB,
    output reg carryin
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_2 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  localparam IDLE_state = 4'd0;
  localparam S0_state = 4'd1;
  localparam S1_state = 4'd2;
  localparam S2_state = 4'd3;
  localparam S3_state = 4'd4;
  localparam S4_state = 4'd5;
  localparam S5_state = 4'd6;
  localparam S6_state = 4'd7;
  localparam S7_state = 4'd8;
  localparam ERROR_state = 4'd9;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  reg [29:0] M_counter_d, M_counter_q = 1'h0;
  
  localparam X = 5'h1b;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_seg = 8'hff;
    io_sel = 4'hf;
    inputA = 1'h0;
    inputB = 1'h0;
    carryin = 1'h0;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    M_seg_values = 16'hffff;
    
    case (M_state_q)
      IDLE_state: begin
        M_counter_d = 1'h0;
        led[0+0-:1] = 8'hff;
        M_seg_values = 16'hfff9;
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = S0_state;
        end
      end
      S0_state: begin
        M_counter_d = M_counter_q + 1'h1;
        inputA = 1'h0;
        inputB = 1'h0;
        carryin = 1'h0;
        M_seg_values = 16'hfff0;
        if (io_led[0+0+0-:1] == 1'h0 && io_led[0+1+0-:1] == 1'h0 && M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = S1_state;
          M_counter_d = 1'h0;
        end else begin
          if ((io_led[0+0+0-:1] != 1'h0 || io_led[0+1+0-:1] != 1'h0) && M_counter_q[27+0-:1] == 1'h1) begin
            M_state_d = ERROR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      S1_state: begin
        M_counter_d = M_counter_q + 1'h1;
        inputA = 1'h1;
        inputB = 1'h0;
        carryin = 1'h0;
        M_seg_values = 16'hfff1;
        if (io_led[0+0+0-:1] == 1'h0 && io_led[0+1+0-:1] != 1'h0 && M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = S2_state;
          M_counter_d = 1'h0;
        end else begin
          if ((io_led[0+0+0-:1] != 1'h0 || io_led[0+1+0-:1] == 1'h0) && M_counter_q[27+0-:1] == 1'h1) begin
            M_state_d = ERROR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      S2_state: begin
        M_counter_d = M_counter_q + 1'h1;
        inputA = 1'h0;
        inputB = 1'h1;
        carryin = 1'h0;
        M_seg_values = 16'hfff2;
        if (io_led[0+0+0-:1] == 1'h0 && io_led[0+1+0-:1] != 1'h0 && M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = S3_state;
          M_counter_d = 1'h0;
        end else begin
          if ((io_led[0+0+0-:1] != 1'h0 || io_led[0+1+0-:1] == 1'h0) && M_counter_q[27+0-:1] == 1'h1) begin
            M_state_d = ERROR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      S3_state: begin
        M_counter_d = M_counter_q + 1'h1;
        inputA = 1'h1;
        inputB = 1'h1;
        carryin = 1'h0;
        M_seg_values = 16'hfff3;
        if (io_led[0+0+0-:1] != 1'h0 && io_led[0+1+0-:1] == 1'h0 && M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = S4_state;
          M_counter_d = 1'h0;
        end else begin
          if ((io_led[0+0+0-:1] == 1'h0 || io_led[0+1+0-:1] != 1'h0) && M_counter_q[27+0-:1] == 1'h1) begin
            M_state_d = ERROR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      S4_state: begin
        M_counter_d = M_counter_q + 1'h1;
        inputA = 1'h0;
        inputB = 1'h0;
        carryin = 1'h1;
        M_seg_values = 16'hfff4;
        if (io_led[0+0+0-:1] == 1'h0 && io_led[0+1+0-:1] != 1'h0 && M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = S5_state;
          M_counter_d = 1'h0;
        end else begin
          if ((io_led[0+0+0-:1] != 1'h0 || io_led[0+1+0-:1] == 1'h0) && M_counter_q[27+0-:1] == 1'h1) begin
            M_state_d = ERROR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      S5_state: begin
        M_counter_d = M_counter_q + 1'h1;
        inputA = 1'h1;
        inputB = 1'h0;
        carryin = 1'h1;
        M_seg_values = 16'hfff5;
        if (io_led[0+0+0-:1] != 1'h0 && io_led[0+1+0-:1] == 1'h0 && M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = S6_state;
          M_counter_d = 1'h0;
        end else begin
          if ((io_led[0+0+0-:1] == 1'h0 || io_led[0+1+0-:1] != 1'h0) && M_counter_q[27+0-:1] == 1'h1) begin
            M_state_d = ERROR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      S6_state: begin
        M_counter_d = M_counter_q + 1'h1;
        inputA = 1'h0;
        inputB = 1'h1;
        carryin = 1'h1;
        M_seg_values = 16'hfff6;
        if (io_led[0+0+0-:1] != 1'h0 && io_led[0+1+0-:1] == 1'h0 && M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = S7_state;
          M_counter_d = 1'h0;
        end else begin
          if ((io_led[0+0+0-:1] == 1'h0 || io_led[0+1+0-:1] != 1'h0) && M_counter_q[27+0-:1] == 1'h1) begin
            M_state_d = ERROR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      S7_state: begin
        M_counter_d = M_counter_q + 1'h1;
        inputA = 1'h1;
        inputB = 1'h1;
        carryin = 1'h1;
        M_seg_values = 16'hfff7;
        if (io_led[0+0+0-:1] != 1'h0 && io_led[0+1+0-:1] != 1'h0 && M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = IDLE_state;
          M_counter_d = 1'h0;
        end else begin
          if ((io_led[0+0+0-:1] == 1'h0 || io_led[0+1+0-:1] == 1'h0) && M_counter_q[27+0-:1] == 1'h1) begin
            M_state_d = ERROR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      ERROR_state: begin
        M_counter_d = M_counter_q + 1'h1;
        M_seg_values = 16'hfff8;
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_state_d = IDLE_state;
          M_counter_d = 1'h0;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule