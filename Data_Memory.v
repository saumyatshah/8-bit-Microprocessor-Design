`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2023 06:54:01 AM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input [7:0] Addr_Bus,
    input [7:0] DataIn,
    output reg [16:0] DataOut,
    input RW
    );
    initial begin
        DataOut = 0;
    end
    reg [16:0] memory [7:0];
    
    always @(*) begin
        if (RW) begin
            memory[Addr_Bus] = DataIn;
        end
    end

    always @(*) begin
        if (RW == 0) begin
            DataOut = memory[Addr_Bus];
        end
    end
    
endmodule
