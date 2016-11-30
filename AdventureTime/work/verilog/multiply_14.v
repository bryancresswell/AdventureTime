/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module multiply_14 (
    input [7:0] a,
    input [7:0] b,
    input [5:0] alufn,
    output reg [7:0] mulFinal
  );
  
  
  
  always @* begin
    if (alufn[1+0-:1]) begin
      mulFinal[0+6-:7] = a[0+6-:7] * b[0+6-:7];
    end
    if (a[7+0-:1] == 1'h1 && b[7+0-:1] == 1'h1) begin
      mulFinal[7+0-:1] = 1'h0;
    end else begin
      if (a[7+0-:1] == 1'h1 || b[7+0-:1] == 1'h1) begin
        mulFinal[7+0-:1] = 1'h1;
      end else begin
        mulFinal[7+0-:1] = 1'h0;
      end
    end
  end
endmodule
