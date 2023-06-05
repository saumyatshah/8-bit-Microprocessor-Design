`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2023 01:50:03 AM
// Design Name: 
// Module Name: ProgramMemory
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

module ProgramMemory(
    input [7:0] Addr_Bus,
    output reg [16:0] DataOut_Bus
    );
    
    reg [16:0] memory [255:0];
    
initial begin
    //    memory[0] = {`ID_ADD,`R1,`R2,{`R3,`R5}};
     //   memory[1] = {`ID_NO_OPERATION,`R1,`R2,{`R3,`R5}};
   //     memory[2] = {`ID_LOGICAL_SHIFT_LEFT,`R1,`R2,{`R3,`R5}};
        
memory[Addr_Bus] = 17'b0;
memory[0] = {5'b01011, 3'b010, 3'b001, 6'b000001};         // R1 + 1 -> R2            // Add Immediate
memory[1] = {5'b01011, 3'b011, 3'b001, 6'b000100};         // R1 + 4 -> R3          // Add Immediate
memory[2] = {5'b00001, 3'b100, 3'b001, 6'b010110};         // R1 (+)I d'22 -> R4    // xor Immediate 
memory[3] = {5'b00101, 3'b101, 3'b001, 3'b011, 3'b000};    // R1 & R3 -> R5         // AND operation
memory[4] = {5'b01000, 3'b110, 3'b100, 3'b000, 3'b011};    // R4 LSL (3) -> R6      // SH  = IR 2:0 // Shift operation
memory[5] = {5'b01111, 3'b001, 3'b101, 3'b011, 3'b000};    // R5<R3 -> R1           // SLT  // Set if less than
memory[6] = {5'b01000, 3'b010, 3'b101, 3'b011, 3'b000};    //R5 - R3 -> R2          // subtraction (2's compliment)
memory[7] = {5'b10000, 3'b111, 3'b011, 3'b000, 3'b000};    // R3 -> R7  		     // Move operation
memory[8] = {5'b01001, 3'b110, 3'b111, 3'b000, 3'b000};    //(~R7) -> R6            // Compliment
memory[9] = {5'b01101, 3'b000, 3'b010, 3'b110, 3'b000};    //R6 -> mem[R2]          // Memory Store
memory[10] = {5'b00111, 3'b001, 3'b010, 3'b000, 3'b000};   //mem [R2] -> R1         // Memory Load
        
  /*      memory[Addr_Bus] = 17'b0;
//memory[0] = {5'b10111, 3'b001, 3'b000, 6'b000001};         // R0 + 1 -> R1          // Add Immediate
memory[1] = {5'b10111, 3'b010, 3'b000, 6'b000100};         // R0 + 4 -> R2          // Add Immediate
memory[2] = {5'b01010, 3'b011, 3'b001, 6'b010110};         // R1 (+)I d'22 -> R3    // xor Immediate 
memory[3] = {5'b11001, 3'b100, 3'b001, 3'b011, 3'b000};    // R1 & R3 -> R4         // AND operation
memory[4] = {5'b01000, 3'b101, 3'b100, 3'b000, 3'b011};    // R4 LSL (3) -> R5      // SH  = IR 2:0 // Shift operation
memory[5] = {5'b11110, 3'b001, 3'b101, 3'b011, 3'b000};    // R5<R3 -> R1           // SLT  // Set if less than
memory[6] = {5'b01100, 3'b010, 3'b101, 3'b011, 3'b000};    //R5 - R3 -> R2          // subtraction (2's compliment)
memory[7] = {5'b11010, 3'b111, 3'b011, 3'b000, 3'b000};    // R3 -> R7  		     // Move operation
memory[8] = {5'b11000, 3'b110, 3'b111, 3'b000, 3'b000};    //(~R7) -> R6            // Compliment
memory[9] = {5'b00100, 3'b000, 3'b010, 3'b110, 3'b000};    //R6 -> mem[R2]          // Memory Store
memory[10] = {5'b11011, 3'b001, 3'b010, 3'b000, 3'b000};   //mem [R2] -> R1         // Memory Load
*/
//         for(integer addr = 0;addr<8;addr=addr+1) begin
//           memory[addr] = addr+2;
//            memory[1] = 8'h02;
//            memory[2] = 8'h03;
//            memory[3] = 8'h04;
//            memory[4] = 8'h05;
//            memory[5] = 8'h06;
//            memory[6] = 8'h07;
//            memory[7] = 8'h09;
//         end
    end
    
    always @(Addr_Bus) begin
         DataOut_Bus <= memory[Addr_Bus];
     end
     
endmodule
