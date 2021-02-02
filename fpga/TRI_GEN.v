module TRI_GEN(
    input   CLK,
    input   LOCKED,
    input   wire    [15:0]SAW,
    output  reg [15:0] TRI = 16'h8000
);

always @(posedge CLK)
begin
    if(LOCKED == 1'b1)
        if(SAW >= 16'hc000)
            if(SAW == 16'hc000)
                TRI <= 16'hffff;
            else
                TRI <= {1'b1,~(SAW[13:0]-1'b1),1'b0};
        else if(SAW >= 16'h8000)
            TRI <= {1'b1,SAW[13:0],1'b0};
        else if(SAW >= 16'h4000)
            TRI <= {1'b0,SAW[13:0],1'b0};
        else
            if(SAW==16'h0000)
                TRI <= 16'h8000;
            else
                TRI <= {1'b0,~(SAW[13:0]-1'b1),1'b0};
end

endmodule
