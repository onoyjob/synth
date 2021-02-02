module OSC(
    input   CLK,
    input   LOCKED,
    input   [1:0]FORM,
    input   [31:0]FREQUENCY,
    input   [15:0]DUTY,
    output  reg    [15:0]SIG=16'h8000
    );

reg [23:0]tmp_count;

wire [15:0]sawtooth;
wire [15:0]square;
wire [15:0]triangle;
wire [15:0]random;


SAW_GEN i0(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FREQUENCY(FREQUENCY),
    .SAW(sawtooth));

SQUARE_GEN i1(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .SAW(sawtooth),
    .DUTY(DUTY),
    .SQU(square));

TRI_GEN i2(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .SAW(sawtooth),
    .TRI(triangle));

RANDOM_GEN i3(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .SAW(sawtooth),
    .RANDOM(random));


//WaveformForm Selector
always @(posedge CLK)
begin
    if(LOCKED == 1'b1)
    case(FORM)
        2'b00:SIG<=sawtooth;
        2'b01:SIG<=square;
        2'b10:SIG<=triangle;
        2'b11:SIG<=random;
    endcase

end
        

endmodule
