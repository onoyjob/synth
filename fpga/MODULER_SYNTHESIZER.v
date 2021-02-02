`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/12 16:00:41
// Design Name: 
// Module Name: MODULER_SYNTHESIZER
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MODULER_SYNTHESIZER(
    input   CLK,
    input   [7:0]DATA,
    input   [1:0]POS,
    input   PD,
    input   SENT,
    input   EN,
    input   GATE,
    output  wire [18:0]SIG,
    output  reg LOWPASS = 1'b0,
    output  reg HIGHPASS = 1'b0,
    output  wire [7:0]LPFMOD,
    output  wire [7:0]HPFMOD
    );

wire clk100, clk12, clkwiz_locked,locked;
//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG

  clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_out1(clk100),     // output clk_out1
    .clk_out2(clk12),     // output clk_out2
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(CLK));      // input clk_in1
// INST_TAG_END ------ End INSTANTIATION Template ---------
//wire    [7:0]env1;
//wire    [7:0]env2;
//reg b;
//wire [15:0]m;

//reg [31:0]raspi_wait = 0;

//always @(posedge clk12)
//    if(clkwiz_locked == 1'b1)
//        if(raspi_wait <= 32'h20752a00)
//            raspi_wait <= raspi_wait + 32'h00000001;

//assign locked = ( clkwiz_locked == 1'b1 && raspi_wait >= 32'h15752a00) ? 1'b1 : 1'b0;

reg [7:0]path;
reg [31:0]tmp;

//osc1 param
reg [1:0]osc1_form = 0;
reg [31:0]osc1_freq = 32'h02672a22;//440Hz
reg [15:0]osc1_duty = 16'h8000;
reg [1:0]osc1_voise = 0;
reg [7:0]osc1_spread = 0;
reg [31:0]osc1_glide = 0;
reg osc1_to_sigout = 1;
reg [5:0]osc1_fm_width = 6'b00000;
wire [15:0]osc1_out;

wire [31:0]osc5_to_osc1_freq;
wire [31:0]osc6_to_osc1_freq;
wire [31:0]osc7_to_osc1_freq;
wire [31:0]osc8_to_osc1_freq;
wire [31:0]sine1_to_osc1_freq;
wire [31:0]sine2_to_osc1_freq;



//osc2 param
reg [1:0]osc2_form = 0;
reg [31:0]osc2_freq = 32'h02672a22;//440Hz
reg [15:0]osc2_duty = 16'h8000;
reg [1:0]osc2_voise = 0;
reg [7:0]osc2_spread = 0;
reg [31:0]osc2_glide = 0;
reg osc2_to_sigout = 0;
reg [5:0]osc2_fm_width = 6'b00000;
wire [15:0]osc2_out;

wire [31:0]osc5_to_osc2_freq;
wire [31:0]osc6_to_osc2_freq;
wire [31:0]osc7_to_osc2_freq;
wire [31:0]osc8_to_osc2_freq;
wire [31:0]sine1_to_osc2_freq;
wire [31:0]sine2_to_osc2_freq;



//osc3 param
reg [1:0]osc3_form = 0;
reg [31:0]osc3_freq = 32'h02672a22;//440Hz
reg [15:0]osc3_duty = 16'h8000;
reg [1:0]osc3_voise = 0;
reg [7:0]osc3_spread = 0;
reg [31:0]osc3_glide = 0;
reg osc3_to_sigout = 0;
reg [5:0]osc3_fm_width = 6'b00000;
wire [15:0]osc3_out;

wire [31:0]osc5_to_osc3_freq;
wire [31:0]osc6_to_osc3_freq;
wire [31:0]osc7_to_osc3_freq;
wire [31:0]osc8_to_osc3_freq;
wire [31:0]sine1_to_osc3_freq;
wire [31:0]sine2_to_osc3_freq;



//osc4 param
reg [1:0]osc4_form = 0;
reg [31:0]osc4_freq = 32'h02672a22;//440Hz
reg [15:0]osc4_duty = 16'h8000;
reg [1:0]osc4_voise = 0;
reg [7:0]osc4_spread = 0;
reg [31:0]osc4_glide = 0;
reg osc4_to_sigout = 0;
reg [5:0]osc4_fm_width = 6'b00000;
wire [15:0]osc4_out;

wire [31:0]osc5_to_osc4_freq;
wire [31:0]osc6_to_osc4_freq;
wire [31:0]osc7_to_osc4_freq;
wire [31:0]osc8_to_osc4_freq;
wire [31:0]sine1_to_osc4_freq;
wire [31:0]sine2_to_osc4_freq;



//osc5 param
reg [1:0]osc5_form = 0;
reg [31:0]osc5_freq = 32'h02672a22;//440Hz
reg [15:0]osc5_duty = 16'h8000;
reg [1:0]osc5_voise = 0;
reg [7:0]osc5_spread = 0;
reg [31:0]osc5_glide = 0;
reg osc5_to_sigout = 0;
reg osc5_to_osc1_freq_flag = 1'b0;
reg osc5_to_osc2_freq_flag = 1'b0;
reg osc5_to_osc3_freq_flag = 1'b0;
reg osc5_to_osc4_freq_flag = 1'b0;
reg osc5_to_osc5_freq_flag = 1'b0;
reg osc5_to_osc6_freq_flag = 1'b0;
reg osc5_to_osc7_freq_flag = 1'b0;
reg osc5_to_osc8_freq_flag = 1'b0;
reg [5:0]osc5_fm_width = 6'b00000;
wire [15:0]osc5_out;

wire [31:0]osc1_to_osc5_freq;
wire [31:0]osc2_to_osc5_freq;
wire [31:0]osc3_to_osc5_freq;
wire [31:0]osc4_to_osc5_freq;
wire [31:0]osc5_to_osc5_freq;
wire [31:0]osc6_to_osc5_freq;
wire [31:0]osc7_to_osc5_freq;
wire [31:0]osc8_to_osc5_freq;
wire [31:0]sine1_to_osc5_freq;
wire [31:0]sine2_to_osc5_freq;



//osc6 param
reg [1:0]osc6_form = 0;
reg [31:0]osc6_freq = 32'h02672a22;//440Hz
reg [15:0]osc6_duty = 16'h8000;
reg [1:0]osc6_voise = 0;
reg [7:0]osc6_spread = 0;
reg [31:0]osc6_glide = 0;
reg osc6_to_sigout = 0;
reg osc6_to_osc1_freq_flag = 1'b0;
reg osc6_to_osc2_freq_flag = 1'b0;
reg osc6_to_osc3_freq_flag = 1'b0;
reg osc6_to_osc4_freq_flag = 1'b0;
reg osc6_to_osc5_freq_flag = 1'b0;
reg osc6_to_osc6_freq_flag = 1'b0;
reg osc6_to_osc7_freq_flag = 1'b0;
reg osc6_to_osc8_freq_flag = 1'b0;
reg [5:0]osc6_fm_width = 6'b00000;
wire [15:0]osc6_out;

wire [31:0]osc1_to_osc6_freq;
wire [31:0]osc2_to_osc6_freq;
wire [31:0]osc3_to_osc6_freq;
wire [31:0]osc4_to_osc6_freq;
wire [31:0]osc5_to_osc6_freq;
wire [31:0]osc6_to_osc6_freq;
wire [31:0]osc7_to_osc6_freq;
wire [31:0]osc8_to_osc6_freq;
wire [31:0]sine1_to_osc6_freq;
wire [31:0]sine2_to_osc6_freq;



//osc7 param
reg [1:0]osc7_form = 0;
reg [31:0]osc7_freq = 32'h02672a22;//440Hz
reg [15:0]osc7_duty = 16'h8000;
reg [1:0]osc7_voise = 0;
reg [7:0]osc7_spread = 0;
reg [31:0]osc7_glide = 0;
reg osc7_to_sigout = 0;
reg osc7_to_osc1_freq_flag = 1'b0;
reg osc7_to_osc2_freq_flag = 1'b0;
reg osc7_to_osc3_freq_flag = 1'b0;
reg osc7_to_osc4_freq_flag = 1'b0;
reg osc7_to_osc5_freq_flag = 1'b0;
reg osc7_to_osc6_freq_flag = 1'b0;
reg osc7_to_osc7_freq_flag = 1'b0;
reg osc7_to_osc8_freq_flag = 1'b0;
reg [5:0]osc7_fm_width = 6'b00000;
wire [15:0]osc7_out;

wire [31:0]osc1_to_osc7_freq;
wire [31:0]osc2_to_osc7_freq;
wire [31:0]osc3_to_osc7_freq;
wire [31:0]osc4_to_osc7_freq;
wire [31:0]osc5_to_osc7_freq;
wire [31:0]osc6_to_osc7_freq;
wire [31:0]osc7_to_osc7_freq;
wire [31:0]osc8_to_osc7_freq;
wire [31:0]sine1_to_osc7_freq;
wire [31:0]sine2_to_osc7_freq;



//osc8 param
reg [1:0]osc8_form = 0;
reg [31:0]osc8_freq = 32'h02672a22;//440Hz
reg [15:0]osc8_duty = 16'h8000;
reg [1:0]osc8_voise = 0;
reg [7:0]osc8_spread = 0;
reg [31:0]osc8_glide = 0;
reg osc8_to_sigout = 0;
reg osc8_to_osc1_freq_flag = 1'b0;
reg osc8_to_osc2_freq_flag = 1'b0;
reg osc8_to_osc3_freq_flag = 1'b0;
reg osc8_to_osc4_freq_flag = 1'b0;
reg osc8_to_osc5_freq_flag = 1'b0;
reg osc8_to_osc6_freq_flag = 1'b0;
reg osc8_to_osc7_freq_flag = 1'b0;
reg osc8_to_osc8_freq_flag = 1'b0;
reg [5:0]osc8_fm_width = 6'b00000;
wire [15:0]osc8_out;

wire [31:0]osc1_to_osc8_freq;
wire [31:0]osc2_to_osc8_freq;
wire [31:0]osc3_to_osc8_freq;
wire [31:0]osc4_to_osc8_freq;
wire [31:0]osc5_to_osc8_freq;
wire [31:0]osc6_to_osc8_freq;
wire [31:0]osc7_to_osc8_freq;
wire [31:0]osc8_to_osc8_freq;
wire [31:0]sine1_to_osc8_freq;
wire [31:0]sine2_to_osc8_freq;





reg [15:0]vca_env_attack = 0;
reg [15:0]vca_env_decay = 0;
reg [7:0]vca_env_sustain = 8'ha0;
reg [15:0]vca_env_release = 0;
reg vca_env_reverce = 0;
wire [7:0]vca_env_out;
wire [7:0]vca_env;

reg [15:0]lp_env_attack = 0;
reg [15:0]lp_env_decay = 0;
reg [7:0]lp_env_sustain = 8'ha0;
reg [15:0]lp_env_release = 0;
reg lp_env_reverce = 0;
wire [7:0]lp_env_out;
wire [7:0]lp_env;

reg [15:0]hp_env_attack = 0;
reg [15:0]hp_env_decay = 0;
reg [7:0]hp_env_sustain = 8'ha0;
reg [15:0]hp_env_release = 0;
reg hp_env_reverce = 0;
wire [7:0]hp_env_out;
wire [7:0]hp_env;

reg sine1_to_sigout = 0;
reg [31:0]sine1_freq = 32'h10000000;
reg sine1_to_osc1_freq_flag = 0;
reg sine1_to_osc2_freq_flag = 0;
reg sine1_to_osc3_freq_flag = 0;
reg sine1_to_osc4_freq_flag = 0;
reg sine1_to_osc5_freq_flag = 0;
reg sine1_to_osc6_freq_flag = 0;
reg sine1_to_osc7_freq_flag = 0;
reg sine1_to_osc8_freq_flag = 0;
wire [15:0]sine1;

reg sine2_to_sigout = 0;
reg [31:0]sine2_freq = 32'h10000000;
reg sine2_to_osc1_freq_flag = 0;
reg sine2_to_osc2_freq_flag = 0;
reg sine2_to_osc3_freq_flag = 0;
reg sine2_to_osc4_freq_flag = 0;
reg sine2_to_osc5_freq_flag = 0;
reg sine2_to_osc6_freq_flag = 0;
reg sine2_to_osc7_freq_flag = 0;
reg sine2_to_osc8_freq_flag = 0;
wire [15:0]sine2;


reg [1:0]vcasel = 1'b0;
reg [1:0]lp_sel = 1'b0;
reg [1:0]hp_sel = 1'b0;
reg [7:0]vcamod_fixed = 8'hff;
reg [7:0]lpmod_fixed = 8'hff;
reg [7:0]hpmod_fixed = 8'hff;
reg [7:0]vcamod_duty = 8'h80;
reg [7:0]lpmod_duty = 8'h80;
reg [7:0]hpmod_duty = 8'h80;

wire [7:0]vca_lfo;
wire [7:0]lp_lfo;
wire [7:0]hp_lfo;

reg [31:0]vca_sine_freq = 32'h00100000;
wire [15:0]vca_sine;
reg [31:0]lp_sine_freq = 32'h00100000;
wire [15:0]lp_sine;
reg [31:0]hp_sine_freq = 32'h00100000;
wire [15:0]hp_sine;
reg vca_lfo_sine = 1;
reg lp_lfo_sine = 1;
reg hp_lfo_sine = 1;

wire [7:0]vcamod;

assign osc5_to_osc1_freq = ( osc5_to_osc1_freq_flag == 1'b1 ) ? osc5_out : 16'h8000;
assign osc6_to_osc1_freq = ( osc6_to_osc1_freq_flag == 1'b1 ) ? osc6_out : 16'h8000;
assign osc7_to_osc1_freq = ( osc7_to_osc1_freq_flag == 1'b1 ) ? osc7_out : 16'h8000;
assign osc8_to_osc1_freq = ( osc8_to_osc1_freq_flag == 1'b1 ) ? osc8_out : 16'h8000;
assign sine1_to_osc1_freq = ( sine1_to_osc1_freq_flag == 1'b1 ) ? sine1 : 16'h8000;
assign sine2_to_osc1_freq = ( sine2_to_osc1_freq_flag == 1'b1 ) ? sine2 : 16'h8000;

assign osc5_to_osc2_freq = ( osc5_to_osc2_freq_flag == 1'b1 ) ? osc5_out : 16'h8000;
assign osc6_to_osc2_freq = ( osc6_to_osc2_freq_flag == 1'b1 ) ? osc6_out : 16'h8000;
assign osc7_to_osc2_freq = ( osc7_to_osc2_freq_flag == 1'b1 ) ? osc7_out : 16'h8000;
assign osc8_to_osc2_freq = ( osc8_to_osc2_freq_flag == 1'b1 ) ? osc8_out : 16'h8000;
assign sine1_to_osc2_freq = ( sine1_to_osc2_freq_flag == 1'b1 ) ? sine1 : 16'h8000;
assign sine2_to_osc2_freq = ( sine2_to_osc2_freq_flag == 1'b1 ) ? sine2 : 16'h8000;

assign osc5_to_osc3_freq = ( osc5_to_osc3_freq_flag == 1'b1 ) ? osc5_out : 16'h8000;
assign osc6_to_osc3_freq = ( osc6_to_osc3_freq_flag == 1'b1 ) ? osc6_out : 16'h8000;
assign osc7_to_osc3_freq = ( osc7_to_osc3_freq_flag == 1'b1 ) ? osc7_out : 16'h8000;
assign osc8_to_osc3_freq = ( osc8_to_osc3_freq_flag == 1'b1 ) ? osc8_out : 16'h8000;
assign sine1_to_osc3_freq = ( sine1_to_osc3_freq_flag == 1'b1 ) ? sine1 : 16'h8000;
assign sine2_to_osc3_freq = ( sine2_to_osc3_freq_flag == 1'b1 ) ? sine2 : 16'h8000;

assign osc5_to_osc4_freq = ( osc5_to_osc4_freq_flag == 1'b1 ) ? osc5_out : 16'h8000;
assign osc6_to_osc4_freq = ( osc6_to_osc4_freq_flag == 1'b1 ) ? osc6_out : 16'h8000;
assign osc7_to_osc4_freq = ( osc7_to_osc4_freq_flag == 1'b1 ) ? osc7_out : 16'h8000;
assign osc8_to_osc4_freq = ( osc8_to_osc4_freq_flag == 1'b1 ) ? osc8_out : 16'h8000;
assign sine1_to_osc4_freq = ( sine1_to_osc4_freq_flag == 1'b1 ) ? sine1 : 16'h8000;
assign sine2_to_osc4_freq = ( sine2_to_osc4_freq_flag == 1'b1 ) ? sine2 : 16'h8000;

assign osc5_to_osc5_freq = ( osc5_to_osc5_freq_flag == 1'b1 ) ? osc5_out : 16'h8000;
assign osc6_to_osc5_freq = ( osc6_to_osc5_freq_flag == 1'b1 ) ? osc6_out : 16'h8000;
assign osc7_to_osc5_freq = ( osc7_to_osc5_freq_flag == 1'b1 ) ? osc7_out : 16'h8000;
assign osc8_to_osc5_freq = ( osc8_to_osc5_freq_flag == 1'b1 ) ? osc8_out : 16'h8000;
assign sine1_to_osc5_freq = ( sine1_to_osc5_freq_flag == 1'b1 ) ? sine1 : 16'h8000;
assign sine2_to_osc5_freq = ( sine2_to_osc5_freq_flag == 1'b1 ) ? sine2 : 16'h8000;

assign osc5_to_osc6_freq = ( osc5_to_osc6_freq_flag == 1'b1 ) ? osc5_out : 16'h8000;
assign osc6_to_osc6_freq = ( osc6_to_osc6_freq_flag == 1'b1 ) ? osc6_out : 16'h8000;
assign osc7_to_osc6_freq = ( osc7_to_osc6_freq_flag == 1'b1 ) ? osc7_out : 16'h8000;
assign osc8_to_osc6_freq = ( osc8_to_osc6_freq_flag == 1'b1 ) ? osc8_out : 16'h8000;
assign sine1_to_osc6_freq = ( sine1_to_osc6_freq_flag == 1'b1 ) ? sine1 : 16'h8000;
assign sine2_to_osc6_freq = ( sine2_to_osc6_freq_flag == 1'b1 ) ? sine2 : 16'h8000;

assign osc5_to_osc7_freq = ( osc5_to_osc7_freq_flag == 1'b1 ) ? osc5_out : 16'h8000;
assign osc6_to_osc7_freq = ( osc6_to_osc7_freq_flag == 1'b1 ) ? osc6_out : 16'h8000;
assign osc7_to_osc7_freq = ( osc7_to_osc7_freq_flag == 1'b1 ) ? osc7_out : 16'h8000;
assign osc8_to_osc7_freq = ( osc8_to_osc7_freq_flag == 1'b1 ) ? osc8_out : 16'h8000;
assign sine1_to_osc7_freq = ( sine1_to_osc7_freq_flag == 1'b1 ) ? sine1 : 16'h8000;
assign sine2_to_osc7_freq = ( sine2_to_osc7_freq_flag == 1'b1 ) ? sine2 : 16'h8000;

assign osc5_to_osc8_freq = ( osc5_to_osc8_freq_flag == 1'b1 ) ? osc5_out : 16'h8000;
assign osc6_to_osc8_freq = ( osc6_to_osc8_freq_flag == 1'b1 ) ? osc6_out : 16'h8000;
assign osc7_to_osc8_freq = ( osc7_to_osc8_freq_flag == 1'b1 ) ? osc7_out : 16'h8000;
assign osc8_to_osc8_freq = ( osc8_to_osc8_freq_flag == 1'b1 ) ? osc8_out : 16'h8000;
assign sine1_to_osc8_freq = ( sine1_to_osc8_freq_flag == 1'b1 ) ? sine1 : 16'h8000;
assign sine2_to_osc8_freq = ( sine2_to_osc8_freq_flag == 1'b1 ) ? sine2 : 16'h8000;



LAYERED_OSC o1(
    .CLK(clk12),
    .LOCKED(locked),
    .FORM(osc1_form),
    .FREQUENCY(osc1_freq + 
        (({osc5_to_osc1_freq,16'h0000}>>(32-osc1_fm_width))-(32'h80000000>>(32-osc1_fm_width))) +
        (({osc6_to_osc1_freq,16'h0000}>>(32-osc1_fm_width))-(32'h80000000>>(32-osc1_fm_width))) +
        (({osc7_to_osc1_freq,16'h0000}>>(32-osc1_fm_width))-(32'h80000000>>(32-osc1_fm_width))) +
        (({osc8_to_osc1_freq,16'h0000}>>(32-osc1_fm_width))-(32'h80000000>>(32-osc1_fm_width))) +
        (({sine1_to_osc1_freq,16'h0000}>>(32-osc1_fm_width))-(32'h80000000>>(32-osc1_fm_width))) +
        (({sine2_to_osc1_freq,16'h0000}>>(32-osc1_fm_width))-(32'h80000000>>(32-osc1_fm_width)))
        ),
    .DUTY(osc1_duty),
    .VOICE(osc1_voise),
    .SPREAD(osc1_spread),
    .GLIDE(osc1_glide),
    .SIG(osc1_out)
    );

LAYERED_OSC o2(
    .CLK(clk12),
    .LOCKED(locked),
    .FORM(osc2_form),
    .FREQUENCY(osc2_freq + 
        (({osc5_to_osc2_freq,16'h0000}>>(32-osc2_fm_width))-(32'h80000000>>(32-osc2_fm_width))) +
        (({osc6_to_osc2_freq,16'h0000}>>(32-osc2_fm_width))-(32'h80000000>>(32-osc2_fm_width))) +
        (({osc7_to_osc2_freq,16'h0000}>>(32-osc2_fm_width))-(32'h80000000>>(32-osc2_fm_width))) +
        (({osc8_to_osc2_freq,16'h0000}>>(32-osc2_fm_width))-(32'h80000000>>(32-osc2_fm_width))) +
        (({sine1_to_osc2_freq,16'h0000}>>(32-osc2_fm_width))-(32'h80000000>>(32-osc2_fm_width))) +
        (({sine2_to_osc2_freq,16'h0000}>>(32-osc2_fm_width))-(32'h80000000>>(32-osc2_fm_width)))
        ),
    .DUTY(osc2_duty),
    .VOICE(osc2_voise),
    .SPREAD(osc2_spread),
    .GLIDE(osc2_glide),
    .SIG(osc2_out)
    );

LAYERED_OSC o3(
    .CLK(clk12),
    .LOCKED(locked),
    .FORM(osc3_form),
    .FREQUENCY(osc3_freq + 
        (({osc5_to_osc3_freq,16'h0000}>>(32-osc3_fm_width))-(32'h80000000>>(32-osc3_fm_width))) +
        (({osc6_to_osc3_freq,16'h0000}>>(32-osc3_fm_width))-(32'h80000000>>(32-osc3_fm_width))) +
        (({osc7_to_osc3_freq,16'h0000}>>(32-osc3_fm_width))-(32'h80000000>>(32-osc3_fm_width))) +
        (({osc8_to_osc3_freq,16'h0000}>>(32-osc3_fm_width))-(32'h80000000>>(32-osc3_fm_width))) +
        (({sine1_to_osc3_freq,16'h0000}>>(32-osc3_fm_width))-(32'h80000000>>(32-osc3_fm_width))) +
        (({sine2_to_osc3_freq,16'h0000}>>(32-osc3_fm_width))-(32'h80000000>>(32-osc3_fm_width)))
        ),
    .DUTY(osc3_duty),
    .VOICE(osc3_voise),
    .SPREAD(osc3_spread),
    .GLIDE(osc3_glide),
    .SIG(osc3_out)
    );

LAYERED_OSC o4(
    .CLK(clk12),
    .LOCKED(locked),
    .FORM(osc4_form),
    .FREQUENCY(osc4_freq + 
        (({osc5_to_osc4_freq,16'h0000}>>(32-osc4_fm_width))-(32'h80000000>>(32-osc4_fm_width))) +
        (({osc6_to_osc4_freq,16'h0000}>>(32-osc4_fm_width))-(32'h80000000>>(32-osc4_fm_width))) +
        (({osc7_to_osc4_freq,16'h0000}>>(32-osc4_fm_width))-(32'h80000000>>(32-osc4_fm_width))) +
        (({osc8_to_osc4_freq,16'h0000}>>(32-osc4_fm_width))-(32'h80000000>>(32-osc4_fm_width))) +
        (({sine1_to_osc4_freq,16'h0000}>>(32-osc4_fm_width))-(32'h80000000>>(32-osc4_fm_width))) +
        (({sine2_to_osc4_freq,16'h0000}>>(32-osc4_fm_width))-(32'h80000000>>(32-osc4_fm_width)))
        ),
    .DUTY(osc4_duty),
    .VOICE(osc4_voise),
    .SPREAD(osc4_spread),
    .GLIDE(osc4_glide),
    .SIG(osc4_out)
    );

LAYERED_OSC o5(
    .CLK(clk12),
    .LOCKED(locked),
    .FORM(osc5_form),
    .FREQUENCY(osc5_freq + 
        (({osc5_to_osc5_freq,16'h0000}>>(32-osc5_fm_width))-(32'h80000000>>(32-osc5_fm_width))) +
        (({osc6_to_osc5_freq,16'h0000}>>(32-osc5_fm_width))-(32'h80000000>>(32-osc5_fm_width))) +
        (({osc7_to_osc5_freq,16'h0000}>>(32-osc5_fm_width))-(32'h80000000>>(32-osc5_fm_width))) +
        (({osc8_to_osc5_freq,16'h0000}>>(32-osc5_fm_width))-(32'h80000000>>(32-osc5_fm_width))) +
        (({sine1_to_osc5_freq,16'h0000}>>(32-osc5_fm_width))-(32'h80000000>>(32-osc5_fm_width))) +
        (({sine2_to_osc5_freq,16'h0000}>>(32-osc5_fm_width))-(32'h80000000>>(32-osc5_fm_width)))
        ),
    .DUTY(osc5_duty),
    .VOICE(osc5_voise),
    .SPREAD(osc5_spread),
    .GLIDE(osc5_glide),
    .SIG(osc5_out)
    );

LAYERED_OSC o6(
    .CLK(clk12),
    .LOCKED(locked),
    .FORM(osc6_form),
    .FREQUENCY(osc6_freq + 
        (({osc5_to_osc6_freq,16'h0000}>>(32-osc6_fm_width))-(32'h80000000>>(32-osc6_fm_width))) +
        (({osc6_to_osc6_freq,16'h0000}>>(32-osc6_fm_width))-(32'h80000000>>(32-osc6_fm_width))) +
        (({osc7_to_osc6_freq,16'h0000}>>(32-osc6_fm_width))-(32'h80000000>>(32-osc6_fm_width))) +
        (({osc8_to_osc6_freq,16'h0000}>>(32-osc6_fm_width))-(32'h80000000>>(32-osc6_fm_width))) +
        (({sine1_to_osc6_freq,16'h0000}>>(32-osc6_fm_width))-(32'h80000000>>(32-osc6_fm_width))) +
        (({sine2_to_osc6_freq,16'h0000}>>(32-osc6_fm_width))-(32'h80000000>>(32-osc6_fm_width)))
        ),
    .DUTY(osc6_duty),
    .VOICE(osc6_voise),
    .SPREAD(osc6_spread),
    .GLIDE(osc6_glide),
    .SIG(osc6_out)
    );

LAYERED_OSC o7(
    .CLK(clk12),
    .LOCKED(locked),
    .FORM(osc7_form),
    .FREQUENCY(osc7_freq + 
        (({osc5_to_osc7_freq,16'h0000}>>(32-osc7_fm_width))-(32'h80000000>>(32-osc7_fm_width))) +
        (({osc6_to_osc7_freq,16'h0000}>>(32-osc7_fm_width))-(32'h80000000>>(32-osc7_fm_width))) +
        (({osc7_to_osc7_freq,16'h0000}>>(32-osc7_fm_width))-(32'h80000000>>(32-osc7_fm_width))) +
        (({osc8_to_osc7_freq,16'h0000}>>(32-osc7_fm_width))-(32'h80000000>>(32-osc7_fm_width))) +
        (({sine1_to_osc7_freq,16'h0000}>>(32-osc7_fm_width))-(32'h80000000>>(32-osc7_fm_width))) +
        (({sine2_to_osc7_freq,16'h0000}>>(32-osc7_fm_width))-(32'h80000000>>(32-osc7_fm_width)))
        ),
    .DUTY(osc7_duty),
    .VOICE(osc7_voise),
    .SPREAD(osc7_spread),
    .GLIDE(osc7_glide),
    .SIG(osc7_out)
    );

LAYERED_OSC o8(
    .CLK(clk12),
    .LOCKED(locked),
    .FORM(osc8_form),
    .FREQUENCY(osc8_freq + 
        (({osc5_to_osc8_freq,16'h0000}>>(32-osc8_fm_width))-(32'h80000000>>(32-osc8_fm_width))) +
        (({osc6_to_osc8_freq,16'h0000}>>(32-osc8_fm_width))-(32'h80000000>>(32-osc8_fm_width))) +
        (({osc7_to_osc8_freq,16'h0000}>>(32-osc8_fm_width))-(32'h80000000>>(32-osc8_fm_width))) +
        (({osc8_to_osc8_freq,16'h0000}>>(32-osc8_fm_width))-(32'h80000000>>(32-osc8_fm_width))) +
        (({sine1_to_osc8_freq,16'h0000}>>(32-osc8_fm_width))-(32'h80000000>>(32-osc8_fm_width))) +
        (({sine2_to_osc8_freq,16'h0000}>>(32-osc8_fm_width))-(32'h80000000>>(32-osc8_fm_width)))
        ),
    .DUTY(osc8_duty),
    .VOICE(osc8_voise),
    .SPREAD(osc8_spread),
    .GLIDE(osc8_glide),
    .SIG(osc8_out)
    );



ENV_GEN e1(
    .CLK(clk12),
    .LOCKED(locked),
    .GATE(GATE),
    .ATTACK(vca_env_attack),
    .DECAY(vca_env_decay),
    .SUSTAIN(vca_env_sustain),
    .RELEASE(vca_env_release),
    .ENV(vca_env_out)
    );
ENV_GEN e2(
    .CLK(clk12),
    .LOCKED(locked),
    .GATE(GATE),
    .ATTACK(lp_env_attack),
    .DECAY(lp_env_decay),
    .SUSTAIN(lp_env_sustain),
    .RELEASE(lp_env_release),
    .ENV(lp_env_out)
    );
ENV_GEN e3(
    .CLK(clk12),
    .LOCKED(locked),
    .GATE(GATE),
    .ATTACK(hp_env_attack),
    .DECAY(hp_env_decay),
    .SUSTAIN(hp_env_sustain),
    .RELEASE(hp_env_release),
    .ENV(hp_env_out)
    );

SINE_GEN s1(
    .CLK(clk12),
    .LOCKED(locked),
    .FREQUENCY(sine1_freq),
    .SINE(sine1)
    );
SINE_GEN s2(
    .CLK(clk12),
    .LOCKED(locked),
    .FREQUENCY(sine2_freq),
    .SINE(sine2)
    );
    
SINE_GEN s3(
    .CLK(clk12),
    .LOCKED(locked),
    .FREQUENCY(vca_sine_freq),
    .SINE(vca_sine)
    );
SINE_GEN s4(
    .CLK(clk12),
    .LOCKED(locked),
    .FREQUENCY(lp_sine_freq),
    .SINE(lp_sine)
    );
SINE_GEN s5(
    .CLK(clk12),
    .LOCKED(locked),
    .FREQUENCY(hp_sine_freq),
    .SINE(hp_sine)
    );
    
//set path
always @(posedge clk12)
begin
    if(locked == 1'b1)
        if(EN == 1'b1)
            if(PD == 1'b1)
                path <= DATA;
end

//stack data
always @(posedge clk12)
begin
    if(locked == 1'b1)
        if(EN == 1'b1)
            if(PD == 1'b0)
            begin
                case(POS)
                    2'b00:begin
                    tmp<={tmp[31:8],DATA};
                    end
                    2'b01:begin
                    tmp<={tmp[31:16],DATA,tmp[7:0]};
                    end
                    2'b10:begin
                    tmp<={tmp[31:24],DATA,tmp[15:0]};
                    end
                    2'b11:begin
                    tmp<={DATA,tmp[23:0]};
                    end
                endcase
            end
end

//set data to path
always @(posedge clk12)
begin
    if(locked == 1'b1)
        if(EN == 1'b1)
            if(SENT == 1'b1)
            begin
                case(path)
                    8'h00:osc1_to_sigout<=tmp;
                    8'h01:osc1_form<=tmp;
                    8'h02:osc1_freq<=tmp;
                    8'h03:osc1_duty<=tmp;
                    8'h04:osc1_voise<=tmp;
                    8'h05:osc1_spread<=tmp;
                    //8'h06:osc1_glide<=tmp;
                    8'h07:osc1_fm_width<=tmp;
                    
                    8'h08:osc2_to_sigout<=tmp;
                    8'h09:osc2_form<=tmp;
                    8'h0a:osc2_freq<=tmp;
                    8'h0b:osc2_duty<=tmp;
                    8'h0c:osc2_voise<=tmp;
                    8'h0d:osc2_spread<=tmp;
                    //8'h0e:osc2_glide<=tmp;
                    8'h0f:osc2_fm_width<=tmp;
                    
                    8'h10:osc3_to_sigout<=tmp;
                    8'h11:osc3_form<=tmp;
                    8'h12:osc3_freq<=tmp;
                    8'h13:osc3_duty<=tmp;
                    8'h14:osc3_voise<=tmp;
                    8'h15:osc3_spread<=tmp;
                    //8'h16:osc3_glide<=tmp;
                    8'h17:osc3_fm_width<=tmp;
                    
                    8'h18:osc4_to_sigout<=tmp;
                    8'h19:osc4_form<=tmp;
                    8'h1a:osc4_freq<=tmp;
                    8'h1b:osc4_duty<=tmp;
                    8'h1c:osc4_voise<=tmp;
                    8'h1d:osc4_spread<=tmp;
                    //8'h1e:osc4_glide<=tmp;
                    8'h1f:osc4_fm_width<=tmp;

                    8'h20:osc5_to_sigout<=tmp;
                    8'h21:osc5_form<=tmp;
                    8'h22:osc5_freq<=tmp;
                    8'h23:osc5_duty<=tmp;
                    8'h24:osc5_voise<=tmp;
                    8'h25:osc5_spread<=tmp;
                    //8'h26:osc5_glide<=tmp;
                    8'h27:osc5_fm_width<=tmp;
                    8'h28:osc5_to_osc1_freq_flag<=tmp;
                    8'h29:osc5_to_osc2_freq_flag<=tmp;
                    8'h2a:osc5_to_osc3_freq_flag<=tmp;
                    8'h2b:osc5_to_osc4_freq_flag<=tmp;
                    8'h2c:osc5_to_osc5_freq_flag<=tmp;
                    8'h2d:osc5_to_osc6_freq_flag<=tmp;
                    8'h2e:osc5_to_osc7_freq_flag<=tmp;
                    8'h2f:osc5_to_osc8_freq_flag<=tmp;
                    
                    8'h30:osc6_to_sigout<=tmp;
                    8'h31:osc6_form<=tmp;
                    8'h32:osc6_freq<=tmp;
                    8'h33:osc6_duty<=tmp;
                    8'h34:osc6_voise<=tmp;
                    8'h35:osc6_spread<=tmp;
                    //8'h36:osc6_glide<=tmp;
                    8'h37:osc6_fm_width<=tmp;
                    8'h38:osc6_to_osc1_freq_flag<=tmp;
                    8'h39:osc6_to_osc2_freq_flag<=tmp;
                    8'h3a:osc6_to_osc3_freq_flag<=tmp;
                    8'h3b:osc6_to_osc4_freq_flag<=tmp;
                    8'h3c:osc6_to_osc5_freq_flag<=tmp;
                    8'h3d:osc6_to_osc6_freq_flag<=tmp;
                    8'h3e:osc6_to_osc7_freq_flag<=tmp;
                    8'h3f:osc6_to_osc8_freq_flag<=tmp;
                    
                    8'h40:osc7_to_sigout<=tmp;
                    8'h41:osc7_form<=tmp;
                    8'h42:osc7_freq<=tmp;
                    8'h43:osc7_duty<=tmp;
                    8'h44:osc7_voise<=tmp;
                    8'h45:osc7_spread<=tmp;
                    //8'h46:osc7_glide<=tmp;
                    8'h47:osc7_fm_width<=tmp;
                    8'h48:osc7_to_osc1_freq_flag<=tmp;
                    8'h49:osc7_to_osc2_freq_flag<=tmp;
                    8'h4a:osc7_to_osc3_freq_flag<=tmp;
                    8'h4b:osc7_to_osc4_freq_flag<=tmp;
                    8'h4c:osc7_to_osc5_freq_flag<=tmp;
                    8'h4d:osc7_to_osc6_freq_flag<=tmp;
                    8'h4e:osc7_to_osc7_freq_flag<=tmp;
                    8'h4f:osc7_to_osc8_freq_flag<=tmp;
                    
                    8'h50:osc8_to_sigout<=tmp;
                    8'h51:osc8_form<=tmp;
                    8'h52:osc8_freq<=tmp;
                    8'h53:osc8_duty<=tmp;
                    8'h54:osc8_voise<=tmp;
                    8'h55:osc8_spread<=tmp;
                    //8'h56:osc8_glide<=tmp;
                    8'h57:osc8_fm_width<=tmp;
                    8'h58:osc8_to_osc1_freq_flag<=tmp;
                    8'h59:osc8_to_osc2_freq_flag<=tmp;
                    8'h5a:osc8_to_osc3_freq_flag<=tmp;
                    8'h5b:osc8_to_osc4_freq_flag<=tmp;
                    8'h5c:osc8_to_osc5_freq_flag<=tmp;
                    8'h5d:osc8_to_osc6_freq_flag<=tmp;
                    8'h5e:osc8_to_osc7_freq_flag<=tmp;
                    8'h5f:osc8_to_osc8_freq_flag<=tmp;
                    
                    8'h60:sine1_to_sigout<=tmp;
                    8'h61:sine1_freq<=tmp;
                    8'h62:sine1_to_osc1_freq_flag<=tmp;
                    8'h63:sine1_to_osc2_freq_flag<=tmp;
                    8'h64:sine1_to_osc3_freq_flag<=tmp;
                    8'h65:sine1_to_osc4_freq_flag<=tmp;
                    8'h66:sine1_to_osc5_freq_flag<=tmp;
                    8'h67:sine1_to_osc6_freq_flag<=tmp;
                    8'h68:sine1_to_osc7_freq_flag<=tmp;
                    8'h69:sine1_to_osc8_freq_flag<=tmp;
                    
                    
                    8'h70:sine2_to_sigout<=tmp;
                    8'h71:sine2_freq<=tmp;
                    8'h72:sine2_to_osc1_freq_flag<=tmp;
                    8'h73:sine2_to_osc2_freq_flag<=tmp;
                    8'h74:sine2_to_osc3_freq_flag<=tmp;
                    8'h75:sine2_to_osc4_freq_flag<=tmp;
                    8'h76:sine2_to_osc5_freq_flag<=tmp;
                    8'h77:sine2_to_osc6_freq_flag<=tmp;
                    8'h78:sine2_to_osc7_freq_flag<=tmp;
                    8'h79:sine2_to_osc8_freq_flag<=tmp;


                    8'h80:vcasel<=tmp;
                    8'h81:vcamod_fixed<=tmp;
                    8'h82:vcamod_duty<=tmp;
                    8'h83:vca_env_attack<=tmp;
                    8'h84:vca_env_decay<=tmp;
                    8'h85:vca_env_sustain<=tmp;
                    8'h86:vca_env_release<=tmp;
                    8'h87:vca_env_reverce<=tmp;
                    8'h88:vca_sine_freq<=tmp;
                    8'h89:vca_lfo_sine<=tmp;

                    8'h90:lp_sel<=tmp;
                    8'h91:lpmod_fixed<=tmp;
                    8'h92:lpmod_duty<=tmp;
                    8'h93:lp_env_attack<=tmp;
                    8'h94:lp_env_decay<=tmp;
                    8'h95:lp_env_sustain<=tmp;
                    8'h96:lp_env_release<=tmp;
                    8'h97:lp_env_reverce<=tmp;
                    8'h98:lp_sine_freq<=tmp;
                    8'h99:lp_lfo_sine<=tmp;

                    8'ha0:hp_sel<=tmp;
                    8'ha1:hpmod_fixed<=tmp;
                    8'ha2:hpmod_duty<=tmp;
                    8'ha3:hp_env_attack<=tmp;
                    8'ha4:hp_env_decay<=tmp;
                    8'ha5:hp_env_sustain<=tmp;
                    8'ha6:hp_env_release<=tmp;
                    8'ha7:hp_env_reverce<=tmp;
                    8'ha8:hp_sine_freq<=tmp;
                    8'ha9:hp_lfo_sine<=tmp;

                    8'hb0:{HIGHPASS,LOWPASS}<=tmp;

                endcase
            end
end


assign SIG = 
    (((((osc1_to_sigout == 1'b1) ? osc1_out : 16'h0000) + 
    ((osc2_to_sigout == 1'b1) ? osc2_out : 16'h0000) + 
    ((osc3_to_sigout == 1'b1) ? osc3_out : 16'h0000) + 
    ((osc4_to_sigout == 1'b1) ? osc4_out : 16'h0000) + 
    ((osc5_to_sigout == 1'b1) ? osc5_out : 16'h0000) + 
    ((osc6_to_sigout == 1'b1) ? osc6_out : 16'h0000) + 
    ((osc7_to_sigout == 1'b1) ? osc7_out : 16'h0000) + 
    ((osc8_to_sigout == 1'b1) ? osc8_out : 16'h0000) + 
    ((sine1_to_sigout == 1'b1) ? sine1 : 16'h0000) + 
    ((sine2_to_sigout == 1'b1) ? sine2 : 16'h0000)) 
   *  vcamod)  / 256
    );

assign vcamod = 
    (vcasel == 2'b00) ? vcamod_fixed:
    (vcasel == 2'b01) ? vca_env:
    (vcasel == 2'b10) ? vca_lfo:
    (vca_env <= 8'h01 && GATE == 1'b0) ? 8'h00: (vca_lfo * vcamod_duty >> 8 )+((vca_env * (256 - vcamod_duty)) >> 8);


assign LPFMOD = 
    (lp_sel == 2'b00) ? lpmod_fixed:
    (lp_sel == 2'b01) ? lp_env:
    (lp_sel == 2'b10) ? lp_lfo: 
    (lp_env <= 8'h01 && GATE == 1'b0) ? 8'h00: (lp_lfo * lpmod_duty >> 8 )+((lp_env * (256 - lpmod_duty)) >> 8);

assign HPFMOD = 
    (hp_sel == 2'b00) ? hpmod_fixed:
    (hp_sel == 2'b01) ? hp_env:
    (hp_sel == 2'b10) ? hp_lfo: 
    (hp_env <= 8'h01 && GATE == 1'b0) ? 8'h00: (hp_lfo * hpmod_duty >> 8 )+((hp_env * (256 - hpmod_duty)) >> 8);

assign vca_env = (vca_env_reverce == 1'b1) ? ~vca_env_out: vca_env_out;
assign lp_env = (lp_env_reverce == 1'b1) ? ~lp_env_out: lp_env_out;
assign hp_env = (hp_env_reverce == 1'b1) ? ~hp_env_out: hp_env_out;
assign vca_lfo = ( vca_lfo_sine == 1'b1) ? vca_sine[15:8] : osc6_out[15:8];
assign lp_lfo = ( lp_lfo_sine == 1'b1) ? lp_sine[15:8] : osc7_out[15:8];
assign hp_lfo = ( hp_lfo_sine == 1'b1) ? hp_sine[15:8] : osc8_out[15:8];

endmodule
