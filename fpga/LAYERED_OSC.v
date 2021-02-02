module LAYERED_OSC(
    input   CLK,
    input   LOCKED,
    input   [1:0]FORM,
    input   [31:0]FREQUENCY,
    input   [15:0]DUTY,
    input   [1:0]VOICE,
    input   [7:0]SPREAD,
    input   [31:0]GLIDE,
    output  wire [15:0]SIG
    );
wire [15:0]osc0;
wire [15:0]osc1;
wire [15:0]osc2;
wire [15:0]osc3;
wire [15:0]osc4;
wire [15:0]osc5;
wire [15:0]osc6;
wire [15:0]osc7;
wire [15:0]osc8;
wire [31:0]glide_freq;
reg [15:0]mainsignal;

GLIDE_GEN i10(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FREQUENCY(FREQUENCY),
    .GLIDE(GLIDE),
    .GLIDE_FREQ(glide_freq)
    );          

parameter   spread_val = 32'h00001000;
OSC i0(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FORM(FORM),
    .FREQUENCY(glide_freq),
    .DUTY(DUTY),
    .SIG(osc0)
    );

OSC i1(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FORM(FORM),
    .FREQUENCY(glide_freq+(spread_val*SPREAD)),
    .DUTY(DUTY),
    .SIG(osc1)
    );

OSC i2(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FORM(FORM),
    .FREQUENCY(glide_freq-(spread_val*SPREAD)),
    .DUTY(DUTY),
    .SIG(osc2)
    );
OSC i3(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FORM(FORM),
    .FREQUENCY(glide_freq+(spread_val*(SPREAD*2))),
    .DUTY(DUTY),
    .SIG(osc3)
    );
OSC i4(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FORM(FORM),
    .FREQUENCY(glide_freq-(spread_val*(SPREAD*2))),
    .DUTY(DUTY),
    .SIG(osc4)
    );
OSC i5(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FORM(FORM),
    .FREQUENCY(glide_freq+(spread_val*(SPREAD*3))),
    .DUTY(DUTY),
    .SIG(osc5)
    );
OSC i6(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FORM(FORM),
    .FREQUENCY(glide_freq-(spread_val*(SPREAD*3))),
    .DUTY(DUTY),
    .SIG(osc6)
    );
OSC i7(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FORM(FORM),
    .FREQUENCY(glide_freq+(spread_val*(SPREAD*4))),
    .DUTY(DUTY),
    .SIG(osc7)
    );
OSC i8(
    .CLK(CLK),
    .LOCKED(LOCKED),
    .FORM(FORM),
    .FREQUENCY(glide_freq-(spread_val*(SPREAD*4))),
    .DUTY(DUTY),
    .SIG(osc8)
    );
assign SIG = mainsignal;
always @(posedge CLK)
begin
    if(LOCKED == 1'b1)
    case(VOICE)
        2'b00:mainsignal<=osc0;
        2'b01:mainsignal<=((osc1>>1)+(osc2>>1));
        2'b10:mainsignal<=((osc1>>2)+(osc2>>2)+(osc3>>2)+(osc4>>2));
        2'b11:mainsignal<=((osc1>>3)+(osc2>>3)+(osc3>>3)+(osc4>>3)+(osc5>>3)+(osc6>>3)+(osc7>>3)+(osc8>>3));
        default:mainsignal<=16'h8000;
    endcase
end


//assign SIG = ((osc1>>3)+(osc2>>3)+(osc3>>3)+(osc4>>3)+(osc5>>3)+(osc6>>3)+(osc7>>3)+(osc8>>3));
endmodule
