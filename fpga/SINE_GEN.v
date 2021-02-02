module SINE_GEN(
    input   CLK,
    input   LOCKED,
    input   [31:0]FREQUENCY,
    output  reg [15:0]SINE
    );

parameter   SIZE = 16'hffff;
reg [15:0]rom_memory [SIZE-1:0];
wire    [15:0]SAW;

initial
begin
    $readmemh("SINE_TABLE.mem",rom_memory);
end

SAW_GEN i0(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FREQUENCY(FREQUENCY),
    .SAW(SAW)
    );

always @(posedge CLK)
begin
    if(LOCKED == 1'b1)
        SINE <= rom_memory[{SAW[15:8],8'h00}];
end

endmodule