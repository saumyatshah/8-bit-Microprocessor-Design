`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2023 13:46:10
// Design Name: 
// Module Name: ConstantUnit
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


module ConstantUnit(
    input CS,
    input [5:0] ImmediateData,
    output reg [7:0] ExtensionOutPut
    );
    
    always @(*) begin
        if(1 == CS) begin
            if(1 == ImmediateData[5]) 
                 ExtensionOutPut = {2'b11,ImmediateData};                  
         end
         
         if(0 == CS || 0 == ImmediateData[5])
            ExtensionOutPut = {2'b00,ImmediateData};
          
    end
endmodule
