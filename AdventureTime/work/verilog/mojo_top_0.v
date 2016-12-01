/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    output reg [7:0] a_seg,
    output reg [3:0] a_sel,
    output reg [7:0] b_seg,
    output reg [3:0] b_sel,
    input [4:0] io_button
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [16-1:0] M_digitsa_digits;
  reg [14-1:0] M_digitsa_value;
  bin_to_dec_2 digitsa (
    .clk(clk),
    .value(M_digitsa_value),
    .digits(M_digitsa_digits)
  );
  wire [16-1:0] M_digitsb_digits;
  reg [14-1:0] M_digitsb_value;
  bin_to_dec_2 digitsb (
    .clk(clk),
    .value(M_digitsb_value),
    .digits(M_digitsb_digits)
  );
  localparam START_states = 1'd0;
  localparam IDLE_states = 1'd1;
  
  reg M_states_d, M_states_q = START_states;
  wire [32-1:0] M_rngesus_num;
  reg [1-1:0] M_rngesus_next;
  reg [32-1:0] M_rngesus_seed;
  pn_gen_4 rngesus (
    .clk(clk),
    .rst(rst),
    .next(M_rngesus_next),
    .seed(M_rngesus_seed),
    .num(M_rngesus_num)
  );
  wire [8-1:0] M_msega_seg;
  wire [4-1:0] M_msega_sel;
  reg [16-1:0] M_msega_values;
  multi_seven_seg_5 msega (
    .clk(clk),
    .rst(rst),
    .values(M_msega_values),
    .seg(M_msega_seg),
    .sel(M_msega_sel)
  );
  wire [8-1:0] M_msegb_seg;
  wire [4-1:0] M_msegb_sel;
  reg [16-1:0] M_msegb_values;
  multi_seven_seg_5 msegb (
    .clk(clk),
    .rst(rst),
    .values(M_msegb_values),
    .seg(M_msegb_seg),
    .sel(M_msegb_sel)
  );
  wire [4-1:0] M_timingCounter_value;
  reg [1-1:0] M_timingCounter_rst;
  counter_7 timingCounter (
    .clk(clk),
    .rst(M_timingCounter_rst),
    .value(M_timingCounter_value)
  );
  
  wire [8-1:0] M_seg_segs;
  reg [4-1:0] M_seg_char;
  sevenseg_8 seg (
    .dot(1'h0),
    .char(M_seg_char),
    .segs(M_seg_segs)
  );
  
  reg [5:0] alufn;
  
  reg [7:0] a;
  
  reg [7:0] b;
  
  reg [7:0] alu;
  
  wire [8-1:0] M_alu1_alu;
  wire [1-1:0] M_alu1_z;
  wire [1-1:0] M_alu1_v;
  wire [1-1:0] M_alu1_n;
  wire [1-1:0] M_alu1_subtractionOverFLow;
  reg [6-1:0] M_alu1_alufn;
  reg [8-1:0] M_alu1_a;
  reg [8-1:0] M_alu1_b;
  main_9 alu1 (
    .alufn(M_alu1_alufn),
    .a(M_alu1_a),
    .b(M_alu1_b),
    .alu(M_alu1_alu),
    .z(M_alu1_z),
    .v(M_alu1_v),
    .n(M_alu1_n),
    .subtractionOverFLow(M_alu1_subtractionOverFLow)
  );
  
  always @* begin
    M_states_d = M_states_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_rngesus_seed = 1'h0;
    M_rngesus_next = 1'h0;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    a_seg = 8'hff;
    a_sel = 4'hf;
    b_seg = 8'hff;
    b_sel = 4'hf;
    M_alu1_alufn = 1'h0;
    M_alu1_a = 1'h0;
    M_alu1_b = 1'h0;
    alu = M_alu1_alu;
    M_timingCounter_rst = 1'h1;
    M_seg_char = 1'h0;
    io_seg = ~M_seg_segs;
    io_sel = 4'he;
    M_digitsa_value = M_rngesus_num[0+7-:8];
    M_msega_values = M_digitsa_digits;
    a_seg = M_msega_seg;
    a_sel = ~M_msega_sel;
    M_digitsb_value = M_rngesus_num[8+7-:8];
    M_msegb_values = M_digitsb_digits;
    b_seg = M_msegb_seg;
    b_sel = ~M_msegb_sel;
    if (M_states_q == START_states) begin
      led = M_rngesus_num[16+5-:6];
      if (M_rngesus_num[16+5-:6] == 6'h02) begin
        M_timingCounter_rst = 1'h0;
        M_seg_char = 4'h9 - M_timingCounter_value;
        M_alu1_alufn = 6'h02;
        M_alu1_a = M_rngesus_num[0+3-:4];
        M_alu1_b = M_rngesus_num[8+3-:4];
        alu = M_alu1_alu;
        io_led[0+7-:8] = M_rngesus_num[0+3-:4];
        io_led[8+7-:8] = 6'h02;
        io_led[16+7-:8] = M_rngesus_num[4+3-:4];
        if (M_timingCounter_value < 4'h9) begin
          M_states_d = IDLE_states;
          led[0+0-:1] = 1'h1;
        end else begin
          if (M_timingCounter_value == 4'h9) begin
            M_states_d = IDLE_states;
          end
        end
      end else begin
        if (M_rngesus_num[16+5-:6] == 6'h00) begin
          M_timingCounter_rst = 1'h0;
          M_seg_char = 4'h9 - M_timingCounter_value;
          M_alu1_alufn = M_rngesus_num[16+5-:6];
          M_alu1_a = M_rngesus_num[0+7-:8];
          M_alu1_b = M_rngesus_num[8+7-:8];
          alu = M_alu1_alu;
          io_led[0+7-:8] = M_rngesus_num[0+7-:8];
          io_led[8+7-:8] = M_rngesus_num[16+5-:6];
          io_led[16+7-:8] = M_rngesus_num[8+7-:8];
          if (M_timingCounter_value < 4'h9) begin
            M_states_d = IDLE_states;
            led[0+0-:1] = 1'h1;
          end else begin
            if (M_timingCounter_value == 4'h9) begin
              M_states_d = IDLE_states;
            end
          end
        end else begin
          if (M_rngesus_num[16+5-:6] == 6'h01) begin
            if (M_rngesus_num[0+7-:8] < M_rngesus_num[8+7-:8]) begin
              M_timingCounter_rst = 1'h0;
              M_seg_char = 4'h9 - M_timingCounter_value;
              M_alu1_alufn = M_rngesus_num[16+5-:6];
              M_alu1_a = M_rngesus_num[8+7-:8];
              M_alu1_b = M_rngesus_num[0+7-:8];
              alu = M_alu1_alu;
              io_led[16+7-:8] = M_rngesus_num[0+7-:8];
              io_led[8+7-:8] = M_rngesus_num[16+5-:6];
              io_led[0+7-:8] = M_rngesus_num[8+7-:8];
              if (M_timingCounter_value < 4'h9) begin
                M_states_d = IDLE_states;
                led[0+0-:1] = 1'h1;
              end else begin
                if (M_timingCounter_value == 4'h9) begin
                  M_states_d = IDLE_states;
                end
              end
            end else begin
              M_timingCounter_rst = 1'h0;
              M_seg_char = 4'h9 - M_timingCounter_value;
              M_alu1_alufn = M_rngesus_num[16+5-:6];
              M_alu1_a = M_rngesus_num[8+7-:8];
              M_alu1_b = M_rngesus_num[0+7-:8];
              alu = M_alu1_alu;
              io_led[0+7-:8] = M_rngesus_num[0+7-:8];
              io_led[8+7-:8] = M_rngesus_num[16+5-:6];
              io_led[16+7-:8] = M_rngesus_num[8+7-:8];
              if (M_timingCounter_value < 4'h9) begin
                M_states_d = IDLE_states;
                led[0+0-:1] = 1'h1;
              end else begin
                if (M_timingCounter_value == 4'h9) begin
                  M_states_d = IDLE_states;
                end
              end
            end
          end else begin
            M_rngesus_next = 1'h1;
          end
        end
      end
    end else begin
      if (M_states_q == IDLE_states) begin
        if (io_button[1+0-:1]) begin
          M_states_d = START_states;
          M_rngesus_next = 1'h1;
        end
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_states_q <= 1'h0;
    end else begin
      M_states_q <= M_states_d;
    end
  end
  
endmodule
