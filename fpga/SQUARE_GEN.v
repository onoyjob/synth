module SQUARE_GEN(
    input   CLK,
    input   LOCKED,
    input   wire    [15:0]SAW,
    input   wire    [15:0]DUTY,
    output  reg [15:0] SQU = 16'h8000
    );
//SquareWave Generator
always @(posedge CLK)
begin
    if(LOCKED == 1'b1)
        SQU <= (SAW>=DUTY)?16'hffff:16'h0000;
end
endmodule