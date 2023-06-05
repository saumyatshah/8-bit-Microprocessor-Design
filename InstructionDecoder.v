`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2023 19:56:12
// Design Name: 
// Module Name: InstructionDecoder
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

module InstructionDecoder(
    input [16:0] Instruction_in,
    output reg [2:0] DA,
    output reg [2:0] AA,
    output reg [2:0] BA,
    output reg [1:0] BS,
    output reg PS,
    output reg MW,
    output reg RW,
    output reg MA,
    output reg MB,
    output reg [1:0] MD,
    output reg [3:0] FS,
//    output reg [2:0] SH,
    output reg CS,
    output reg OE
    );
    initial begin
                RW = 1'b1;
                DA = 3'b000;
                MD = 2'b00;
                BS = 2'b00; 
                PS = 1'b0;
                MW = 1'b0;
                FS = 4'b0000;
                MA = 1'b0;
                MB = 1'b0;
                AA = 3'b000;
                BA = 3'b000;
                CS = 1'b0;  
    end
    always @(*) begin
    
        case(Instruction_in[16:12])
        
            `ID_NO_OPERATION:  begin
                DA = Instruction_in[11:9];
                AA = 3'b000;
                BA = 3'b000;
                RW = 0;
                BS = 2'b00;
                FS = `FUTURE_USE3;
                MW = 0;
                MA = 0;
                OE = 0;
            end
            
            `ID_EXCLUSIVE_OR_IMMEDIATE: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                RW = 0;
                BS = 2'b00;
                MW = 0;
                MA = 0;
                OE = 0;
                FS = `XOR;
            end
            
            `ID_BRANCH_IF_ZERO: begin
                DA = Instruction_in[11:9];
                RW = 0;
                BS = 2'b01;
                MW = 0;
                MA = 0;
                PS = 0;
                OE = 0;
                MB = 1;
                CS = 1;
                AA = 3'b000;
                BA = 3'b000;
                FS = 4'b0000;
            end
            
            `ID_JUMP_REGISTER: begin
                DA = Instruction_in[11:9];
                RW = 1;
                BS = 2'b11;
                MW = 0;
                OE = 0;
                MB = 1;
                CS = 1;
                AA = 3'b000;
                BA = 3'b000;
                FS = 4'b0000;
            end
            
            `ID_ADD: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                RW = 1;
                BS = 2'b11;
                MW = 0;
                OE = 0;
                MB = 1;
                CS = 1;
                FS = `ADD;
            end
            
            `ID_AND: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                RW = 1;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                OE = 0;
                MB = 0;
                MA = 0;
                FS = `AND;
            end
            
            `ID_INPUT: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                RW = 1;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                OE = 0;
                MB = 0;
                MA = 0;
                FS = 4'b0000;
            end
            
            `ID_LOAD: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = 3'b000;
                RW = 1;
                BS = 2'b00;
                MD = 2'b01;
                MW = 0;
                OE = 0;
                MA = 0;
                FS = 4'b0000;
            end
            
            `ID_SUBTRACT: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                RW = 1;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                OE = 0;
                MA = 0;
                FS = `SUB;
            end
            
            `ID_COMPLIMENT: begin
                RW = 1;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                OE = 0;
                MA = 0;
                FS = `NOT;
            end
            
            `ID_JUMP_AND_LINK: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                RW = 1;
                BS = 2'b00;
                MD = 2'b11;
                MW = 0;
                OE = 0;
                MA = 1;
                MB = 1;
                CS = 1;
                FS = `ID_JUMP_AND_LINK;
            end
            
            `ID_ADD_IMMEDIATE_UNSIGNED: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = 3'b000;
                RW = 1;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                OE = 0;
                MA = 0;
                MB = 1;
                CS = 1;
                FS = `ADD;
            end
            
            `ID_OR_IMMEDIATE:begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                RW = 1;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                OE = 0;
                MA = 0;
                MB = 1;
                CS = 0;
                OE = 0;
                FS = `OR;
            end
            
            `ID_STORE: begin
                RW = 0;
                BS = 2'b00;
                MW = 1;
                OE = 0;
                MA = 0;
                MB = 0;
                FS = 4'b0000;
            end
            
            `ID_OUTPUT:begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                RW = 0;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                OE = 1;
                MA = 0;
                MB = 0;
                CS = 0;
                FS = 4'b0000;
            end
            
            `ID_SET_IF_LESS_THAN: begin 
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                RW = 1;
                BS = 2'b00;
                MD = 2'b10;
                MW = 0;
                OE = 0;
                MA = 0;
                MB = 0;
                FS = `LESS_THEN;
            end
            
            `ID_MOVE:begin 
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = 3'b000;;
                RW = 1;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                OE = 0;
                MA = 0;
                FS = 4'b0000;
            end
            
            `ID_ADD_IMMEDIATE:begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                RW = 1;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                OE = 0;
                MA = 0;
                MB = 1;
                CS = 1;
                FS = `ADD;
            end
            
            `ID_BRANCH_IF_NONZERO: begin
                DA = Instruction_in[11:9];
                AA = 3'b000 ;
                BA = 3'b000;
                RW = 0;
                BS = 2'b01;
                MW = 0;
                PS = 1;
                OE = 0;
                MA = 0;
                MB = 1;
                CS = 1;
                FS = 4'b0000;
            end
            
            `ID_LOGICAL_SHIFT_LEFT: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                RW = 1;
                BS = 2'b00;
                MD = 2'b00;
                MW = 0;
                PS = 1;
                OE = 0;
                MA = 0;
                FS = `LEFT_SHIFT;
            end
            
            `ID_JUMP: begin
                DA = Instruction_in[11:9];
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                RW = 0;
                BS = 2'b11;
                MW = 0;
                OE = 0;
                MB = 1;
                CS = 1;
                OE = 0;
                FS = 4'b0000;
            end
            default : 
            begin                            
                RW = 1'b1;
                DA = Instruction_in[11:9];
                MD = 2'b00;
                BS = 2'b00; 
                PS = 1'b0;
                MW = 1'b0;
                FS = 4'b0000;
                MA = 1'b0;
                MB = 1'b0;
                AA = Instruction_in[8:6];
                BA = Instruction_in[5:3];
                CS = 1'b0;  
            end    
        endcase
    end
endmodule
