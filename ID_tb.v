`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2023 11:50:04
// Design Name: 
// Module Name: ID_tb
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

module ID_tb(
    
    );
    reg [16:0] Instruction_in;
    wire [2:0] DA;
    wire [2:0] AA;
    wire [2:0] BA;
    wire [1:0] BS;
    wire PS;
    wire MW;
    wire RW;
    wire MA;
    wire MB;
    wire [1:0] MD;
    wire [3:0] FS;
    wire [2:0] SH;
    wire CS;
    wire OE;
    
    InstructionDecoder ID(Instruction_in,DA,AA,BA,BS,PS,MW,RW,MA,MB,MD,FS,SH,CS,OE);
    
    
    initial begin
            for(integer Opcode = 0; Opcode < 21;Opcode = Opcode+1) begin
                Instruction_in = {Opcode,3'b101,3'b111,3'b001,3'b000};
             //   Instruction_in[16:12]= Opcode;
             //   Instruction_in[11:9] = 3'b101;
             //   Instruction_in[5:3] = 3'b111;
             #45;
             end
    end
    
endmodule
