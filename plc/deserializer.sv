`timescale 1ns/10ps
module deserializer
#(
  parameter DATA_BITS = 8
)
(
  input  logic                 clk,
  input  logic                 srl_in,
  output logic [DATA_BITS-1:0] prl_out
);

logic [7:0] count = 8'b00000000;

initial logic [DATA_BITS-1:0] prl_out_reg = {DATA_BITS{1'b0}};

always @(posedge clk)
  prl_out_reg <= {srl_in, prl_out_reg[7:1]};

assign prl_out = prl_out_reg;
endmodule