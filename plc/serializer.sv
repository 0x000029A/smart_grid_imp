`timescale 1ns/10ps
module serializer
#(
  parameter DATA_BITS = 8
)
(
  input  logic                 clk,
  input  logic [DATA_BITS-1:0] prl_in,
  output logic                 srl_out
);

logic [7:0] count = 8'b00000000;
logic [DATA_BITS-1:0] prl_in_reg;

initial prl_in_reg = {DATA_BITS{1'b0}};

always @(posedge clk)
begin
  if (count == DATA_BITS)
    count <= 0;
  else
    count <= count + 1;

  if (count == 0)
    prl_in_reg <= prl_in;
  else
    prl_in_reg <= prl_in_reg >> 1;
end

assign srl_out = prl_in_reg[0];
endmodule