module ENV_GEN(
    input   CLK,
    input   LOCKED,
    input   GATE,
    input   [15:0]ATTACK,
    input   [15:0]DECAY,
    input   [7:0]SUSTAIN,
    input   [15:0]RELEASE,
    output  reg [7:0]ENV = 8'h00
    );

reg [63:0]tmp_count;
reg [15:0]maxval;
reg [1:0]status;
reg lastgate;
wire    en;

//ENABLE
always @(posedge CLK)
begin
    if(LOCKED == 1'b1)
        if(en == 1'b1)
            tmp_count <= 16'h0000;
        else
            tmp_count <= tmp_count + 16'h0001;
end

assign en = (tmp_count >= (maxval<<4)) ? 1'b1 : 1'b0;


//ENVGEN
always @(posedge CLK)
begin
    if(LOCKED == 1'b1)
        if(en == 1'b1)
            begin
                case(status)
                    2'b00:ENV <= ENV + 8'h01;
                    2'b01:ENV <= ENV - 8'h01;
                    2'b10:ENV <= ENV;
                    2'b11:ENV <= ENV - 8'h01;
                endcase
            end
end


//STATE
always @(posedge CLK)
begin
    if(LOCKED == 1'b1)
        if(GATE == 1'b1 && lastgate == 1'b0) //posedge GATE
            begin
                lastgate <= 1'b1;
                status <= 2'b00;//ATTACK
                maxval <= ATTACK;
            end
        else if(GATE == 1'b1 && lastgate == 1'b1)
            begin
                if(ENV == 8'hfe)
                    begin
                        status <= 2'b01;//DECAY
                        maxval <= DECAY;
                    end
                else if(status == 2'b01 && ENV == SUSTAIN)
                    begin
                        status <= 2'b10;//SUSTEIN
                        maxval <= 16'h0000;
                    end
            end
        else if(GATE == 1'b0 && lastgate == 1'b1)//negedge GATE
            begin
                lastgate <= 1'b0;
                if(ENV == 8'h00)
                    begin
                        status <= 2'b10;//SUSTAIN
                        maxval <= 16'h0000; 
                    end
                else
                    begin
                        status <= 2'b11;//RELEASE
                        maxval <= RELEASE;  
                    end
            end
        else if(GATE == 1'b0 && lastgate == 1'b0)
            begin
                if(ENV == 8'h01)
                    begin
                        status <= 2'b10;//SUSTEIN
                        maxval <= 16'h0000;
                    end
            end
end

endmodule


