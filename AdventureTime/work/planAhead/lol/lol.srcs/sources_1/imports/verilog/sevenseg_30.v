/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module sevenseg_30 (
    input dot,
    input [3:0] char,
    output reg [7:0] segs
  );
  
  
  
  reg [6:0] sg;
  
  always @* begin
    
    case (char)
      4'h0: begin
        sg = 7'h3f;
      end
      4'h1: begin
        sg = 7'h06;
      end
      4'h2: begin
        sg = 7'h5b;
      end
      4'h3: begin
        sg = 7'h4f;
      end
      4'h4: begin
        sg = 7'h66;
      end
      4'h5: begin
        sg = 7'h6d;
      end
      4'h6: begin
        sg = 7'h7d;
      end
      4'h7: begin
        sg = 7'h07;
      end
      4'h8: begin
        sg = 7'h7f;
      end
      4'h9: begin
        sg = 7'h67;
      end
      4'ha: begin
        sg = 7'h77;
      end
      4'hb: begin
        sg = 7'h7c;
      end
      4'hc: begin
        sg = 7'h39;
      end
      4'hd: begin
        sg = 7'h5e;
      end
      4'he: begin
        sg = 7'h79;
      end
      4'hf: begin
        sg = 7'h71;
      end
      default: begin
        sg = 7'h00;
      end
    endcase
    segs = {dot, sg};
  end
endmodule
