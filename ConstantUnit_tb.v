`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2023 14:30:28
// Design Name: 
// Module Name: ConstantUnit_tb
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


module ConstantUnit_tb(

    );
    reg CS;
    reg [5:0] ImmediateData;
    wire [7:0] ExtensionOutPut;
    
    ConstantUnit CU(CS,ImmediateData,ExtensionOutPut);
    
    initial begin
        CS=1;
        ImmediateData = 6'b000111;
        
        #50;
        ImmediateData = 6'b100111;
        
        #50;
        CS=0;
        ImmediateData = 6'b000111;
        
        #50;
        ImmediateData = 6'b100111;
        
    end
endmodule
