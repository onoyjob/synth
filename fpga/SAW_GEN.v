module SAW_GEN(
    input   CLK,
    input   LOCKED,
    input   wire    [31:0] FREQUENCY,
    output  reg [15:0]SAW = 16'h8000
    );
    
wire    [15:0]base_val;
reg fraction = 1'b0;
reg [23:0]count = 24'h000000;
reg [23:0]flag = 24'hffffff;

integer i = 0;

assign  base_val = {8'h00,FREQUENCY[31:24]};

always @(posedge CLK)
begin
    if(LOCKED==1'b1)
        SAW <= SAW + base_val + fraction;
end

always @(posedge CLK)
begin
    if(LOCKED==1'b1)
        count <= count + 24'h000001;
end


always @(posedge CLK)
begin
    if(LOCKED==1'b1)
        fraction = 1'b0;
        begin
            for(i = 0 ; i < 24 ; i = i + 1 )
                if(FREQUENCY[23-i]==1'b1 && flag[23-i]==1'b1 && count[i]==1'b1)
                    begin
                        flag[23-i]<=1'b0;
                        fraction = 1'b1;
                    end
            for(i=0;i<24;i=i+1)
                begin
                    if(count[i]==1'b0)
                        flag[23-i]<=1'b1;
                end
        end
end



//always @(posedge CLK)
//begin
//    if(locked==1'b1)
//        if(EN==1'b1)
//            begin
//            if(FREQUENCY[23]==1'b1 && flag[23]==1'b1 && count[0]==1'b1)
//                begin
//                    flag[23]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[22]==1'b1 && flag[22]==1'b1 && count[1]==1'b1)
//                begin
//                    flag[22]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[21]==1'b1 && flag[21]==1'b1 && count[2]==1'b1)
//                begin
//                    flag[21]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[20]==1'b1 && flag[20]==1'b1 && count[3]==1'b1)
//                begin
//                    flag[20]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[19]==1'b1 && flag[19]==1'b1 && count[4]==1'b1)
//                begin
//                    flag[19]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[18]==1'b1 && flag[18]==1'b1 && count[5]==1'b1)
//                begin
//                    flag[18]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[17]==1'b1 && flag[17]==1'b1 && count[6]==1'b1)
//                begin
//                    flag[17]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[16]==1'b1 && flag[16]==1'b1 && count[7]==1'b1)
//                begin
//                    flag[16]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[15]==1'b1 && flag[15]==1'b1 && count[8]==1'b1)
//                begin
//                    flag[15]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[14]==1'b1 && flag[14]==1'b1 && count[9]==1'b1)
//                begin
//                    flag[14]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[13]==1'b1 && flag[13]==1'b1 && count[10]==1'b1)
//                begin
//                    flag[13]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[12]==1'b1 && flag[12]==1'b1 && count[11]==1'b1)
//                begin
//                    flag[12]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[11]==1'b1 && flag[11]==1'b1 && count[12]==1'b1)
//                begin
//                    flag[11]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[10]==1'b1 && flag[10]==1'b1 && count[13]==1'b1)
//                begin
//                    flag[10]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[9]==1'b1 && flag[9]==1'b1 && count[14]==1'b1)
//                begin
//                    flag[9]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[8]==1'b1 && flag[8]==1'b1 && count[15]==1'b1)
//                begin
//                    flag[8]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[7]==1'b1 && flag[7]==1'b1 && count[16]==1'b1)
//                begin
//                    flag[7]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[6]==1'b1 && flag[6]==1'b1 && count[17]==1'b1)
//                begin
//                    flag[6]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[5]==1'b1 && flag[5]==1'b1 && count[18]==1'b1)
//                begin
//                    flag[5]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[4]==1'b1 && flag[4]==1'b1 && count[19]==1'b1)
//                begin
//                    flag[4]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[3]==1'b1 && flag[3]==1'b1 && count[20]==1'b1)
//                begin
//                    flag[3]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[2]==1'b1 && flag[2]==1'b1 && count[21]==1'b1)
//                begin
//                    flag[2]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[1]==1'b1 && flag[1]==1'b1 && count[22]==1'b1)
//                begin
//                    flag[1]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else if(FREQUENCY[0]==1'b1 && flag[0]==1'b1 && count[23]==1'b1)
//                begin
//                    flag[0]<=1'b0;
//                    fraction <= 1'b1;
//                end
//            else 
//                fraction <= 1'b0;
//            for(i=0;i<24;i=i+1)
//                begin
//                    if(count[i]==1'b0)
//                        flag[23-i]<=1'b1;
//                end
//            end
//end

endmodule
