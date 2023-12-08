`timescale 1ns/10ps
module scrambler
#(
  parameter REG_BITS = 10
)
(
  input  logic clk,
               data_in,
  output logic data_out
);

logic [REG_BITS-1:0] lfsr;
initial lfsr = {REG_BITS{1'b1}};

always @(posedge clk)
begin
  lfsr <= {lfsr[REG_BITS-2:0], lfsr[9] ^ lfsr[2]};
end
assign data_out = data_in ^ lfsr[9] ^ lfsr[2];
endmodule