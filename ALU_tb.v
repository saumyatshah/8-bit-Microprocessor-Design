`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 16:01:52
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(
    );
        reg [7:0] OprdA;
        reg [7:0] OprdB;
        reg [7:0] InputPortData;
        reg [7:0] InputPortKeyBoard;
        reg [3:0] FS;
        reg [2:0] SH;
        wire [7:0] FOut;
        wire Z;
        wire C;
        wire V;
        wire N;
        wire D;
    
        ALU varALU(OprdA,OprdB,InputPortData,InputPortKeyBoard,FS,SH,FOut,Z,C,V,N,D);
       
        
        initial begin
        
            InputPortData = 8'h00;
            InputPortKeyBoard = 8'h00; 
            OprdA = 8'h7A;
            OprdB = 8'h52;
            SH = 4;
            
            for(integer opcode = 0; opcode < 14 ; opcode = opcode + 1) begin
                FS = opcode;
                #50;
            end
            FS = 0;
        end
endmodule
