`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 15:12:15
// Design Name: 
// Module Name: ALU
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
`include "SSDP.vh"

module ALU(
    input [7:0] OprdA,
    input [7:0] OprdB,
    input [7:0] InputPortData,
    input [7:0] InputPortKeyBoard,
    input [3:0] FS,
    input [2:0] SH,
    output reg [7:0] FOut,
    output reg Z,
    output reg C,
    output reg V,
    output reg N,
    output reg D
    );

    reg [7:0]tempResult;
    wire [7:0]NegOprdA;
    
    assign NegOprdA = (~OprdA)+1;
    
    always @(*) begin
        case(FS)
            `ADD: FOut = OprdA + OprdB;
            `SUB: FOut = OprdA - OprdB;
            `AND: FOut = OprdA & OprdB;
            `OR: FOut = OprdA | OprdB;
            `XOR: FOut = OprdA ^ OprdB;
            `NOT: FOut = ~OprdA;
            `LEFT_SHIFT : FOut = OprdA << SH;
            `RIGHT_SHIFT : FOut = OprdA >> SH;
            `GREATER_THEN: FOut = OprdA > OprdB;
            `LESS_THEN: FOut = OprdA < OprdB;
            `EQUAL: FOut = (OprdA == OprdB);
            `NOT_EQUAL: FOut = (OprdA != OprdB);
            `NOR: FOut = ~(OprdA | OprdB);
            default: FOut = OprdA;
            
        endcase
        
        assign Z = (0 == FOut);
        assign N = FOut[7]; 
        assign V = ((OprdA[7] == OprdB[7]) & (OprdA[7] != FOut[7]));
        assign C = ((((~OprdA)+1) + OprdB)> ((~OprdA)+1)); 
        assign D =  V ^ N;
    end
endmodule