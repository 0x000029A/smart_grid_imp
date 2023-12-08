`timescale 1ns/10ps
module scrambler_tb();

localparam T_tb = 10,
           REG_BITS_tb = 10,
           DATA_BITS_tb = 8;

logic clk_tb,
      data_out_tb,
      srl_out_tb;
logic [DATA_BITS_tb-1:0] prl_in_tb, prl_out_tb;

serializer #(
  .DATA_BITS(DATA_BITS_tb)
)
serializer_unit
(
  .clk(clk_tb),
  .prl_in(prl_in_tb),
  .srl_out(srl_out_tb)
);

scrambler #(
    .REG_BITS(REG_BITS_tb)
  )
  scrambler_unit
  (
    .clk(clk_tb),
    .data_in(srl_out_tb),
    .data_out(data_out_tb)
  );

deserializer #(
  .DATA_BITS(DATA_BITS_tb)
)
deserializer_unit
(
  .clk(clk_tb),
  .srl_in(data_out_tb),
  .prl_out(prl_out_tb)
);

always
begin
  clk_tb = 1'b1; #(T_tb/2);
  clk_tb = 1'b0; #(T_tb/2);
end

initial
begin
  prl_in_tb = 8'b10110100;
  @(negedge clk_tb);
  prl_in_tb = 8'b00000000;
  repeat(20) @(negedge clk_tb);
  $stop;
end

endmodule