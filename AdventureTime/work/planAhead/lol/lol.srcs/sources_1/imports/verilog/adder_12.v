/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_12 (
    input [5:0] alufn,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] totalSum,
    output reg z,
    output reg v,
    output reg n,
    output reg subtractionOverflow
  );
  
  
  
  reg [8:0] sum;
  
  reg [8:0] subtractionSum;
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        subtractionSum = a - b;
        sum = a + b;
      end
      2'h1: begin
        subtractionSum = a - b;
        sum = a - b;
      end
      default: begin
        subtractionSum = a - b;
        sum = a + b;
      end
    endcase
    totalSum = sum[0+7-:8];
    z = (~|subtractionSum);
    v = (a[7+0-:1] & b[7+0-:1] & (~sum[7+0-:1])) | ((~a[7+0-:1]) & (~b[7+0-:1]) & sum[7+0-:1]);
    n = subtractionSum[7+0-:1];
    subtractionOverflow = (a[7+0-:1] & ~b[7+0-:1] & (~subtractionSum[7+0-:1])) | ((~a[7+0-:1]) & (b[7+0-:1]) & subtractionSum[7+0-:1]);
  end
endmodule
