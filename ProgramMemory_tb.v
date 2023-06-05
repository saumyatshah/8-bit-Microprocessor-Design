`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2023 02:10:12 AM
// Design Name: 
// Module Name: ProgramMemory_tb
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
//`include "ProgramMemory.v"
//extern reg [7:0] memory [0:7];
 
module ProgramMemory_tb(
    );
    
    reg [7:0] tbAddr_Bus;
    wire [16:0] tbdata;
    
    ProgramMemory PM (tbAddr_Bus, tbdata);
    
    reg [7:0]addr;
    
    initial begin
    
          for(addr = 0; addr < 8; addr = addr + 1) begin
                tbAddr_Bus = addr;
                #5;
          end    
          $finish; 
    end
endmodule
