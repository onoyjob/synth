module RANDOM_GEN(
    input   CLK,
    input   LOCKED,
    input   wire [15:0]SAW,
    output  reg [15:0]RANDOM = 16'h8000
    );

reg flag = 1'b1;
reg [31:0]lfsr = 32'ha61be539;

always @(posedge CLK)
begin
    if(LOCKED == 1'b1)
        if(SAW >= 16'h8000 && flag == 1'b1)
            begin
                flag <= 1'b0;
                lfsr <= {lfsr[0],lfsr[31],(lfsr[30]^lfsr[0]),(lfsr[29]^lfsr[0]),lfsr[28],(lfsr[27]^lfsr[0]),lfsr[26:1]};
                RANDOM <= lfsr[31:16];
            end
        else if(SAW < 16'h8000 && flag == 1'b0)
            begin
                flag <= 1'b1;
                lfsr <= {lfsr[0],lfsr[31],(lfsr[30]^lfsr[0]),(lfsr[29]^lfsr[0]),lfsr[28],(lfsr[27]^lfsr[0]),lfsr[26:1]};
                RANDOM <= lfsr[31:16];
            end
end

endmodule