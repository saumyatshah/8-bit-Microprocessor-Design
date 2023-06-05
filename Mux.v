`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2023 17:03:50
// Design Name: 
// Module Name: MuxA_2In1Out
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


module MuxA_2In1Out(
    input [7:0] IN0_A,
    input [7:0] IN1_A,
    input SEL_A,
    output reg [7:0] OUT_A
    );
    
    //  initial begin
    always @(*)begin
        if(1'b1 == SEL_A)
            OUT_A <= IN1_A;
        else
            OUT_A <= IN0_A;
    end
endmodule

module MuxB_2In1Out(
    input [7:0] IN0_B,
    input [7:0] IN1_B,
    input SEL_B,
    output reg [7:0] OUT_B
    );
    
    //  initial begin
    always @(*)begin
        if(1'b1 == SEL_B)
            OUT_B <= IN1_B;
        else
            OUT_B <= IN0_B;
    end
endmodule


module MuxD_3In1Out(
    input [7:0] IN0_D,
    input [7:0] IN1_D,
    input [7:0] IN2_D,
    input [1:0]SEL_D,
    output reg [7:0] OUT_D
    );
    
    always @(*)begin
        
        case (SEL_D)
            2'b00 : OUT_D <= IN0_D;
            2'b01 : OUT_D <= IN1_D;
            2'b10 : OUT_D <= 8'd0;
        endcase
   end
endmodule

module MuxC_4In1Out(
    input [7:0] IN0_C,
    input [7:0] IN1_C,
    input [7:0] IN2_C,
    input [7:0] IN3_C,
    input [1:0]SEL_C,
    output reg [7:0] OUT_C
    );
        always @(*)begin
             case (SEL_C)
                2'b00 : OUT_C <= IN0_C;
                2'b01 : OUT_C <= IN1_C;
                2'b10 : OUT_C <= IN2_C;
                2'b11 : OUT_C <= IN3_C;
            endcase
        end
        
endmodule

module adder_1(pc_plus2, in_b, BrA);
input wire [7:0]pc_plus2;
input wire [7:0]in_b;
output reg [7:0]BrA;
always@(pc_plus2 or in_b)
begin
BrA = pc_plus2 + in_b ;
end 

endmodule