/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     DIGITS = 2
     DIV = 16
*/
module multi_seven_seg_4 (
    input clk,
    input rst,
    input [7:0] values,
    output reg [6:0] seg,
    output reg [1:0] sel
  );
  
  localparam DIGITS = 2'h2;
  localparam DIV = 5'h10;
  
  
  localparam DIGIT_BITS = 1'h1;
  
  wire [1-1:0] M_ctr_value;
  counter_8 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  
  wire [8-1:0] M_seg_dec_segs;
  reg [4-1:0] M_seg_dec_char;
  sevenseg_9 seg_dec (
    .dot(1'h0),
    .char(M_seg_dec_char),
    .segs(M_seg_dec_segs)
  );
  
  wire [2-1:0] M_digit_dec_out;
  reg [1-1:0] M_digit_dec_in;
  decoder_10 digit_dec (
    .in(M_digit_dec_in),
    .out(M_digit_dec_out)
  );
  
  always @* begin
    M_seg_dec_char = values[(M_ctr_value)*4+3-:4];
    seg = M_seg_dec_segs;
    M_digit_dec_in = M_ctr_value;
    sel = M_digit_dec_out;
  end
endmodule
