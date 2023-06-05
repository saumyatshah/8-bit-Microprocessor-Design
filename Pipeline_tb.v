`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2023 21:21:44
// Design Name: 
// Module Name: Pipeline_tb
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

module Pipeline_tb(
    );
    reg Clk;
    reg Reset;

    Pipeline dp(Clk,Reset);
    
    initial begin
        Clk = 0;
          forever #14 Clk = ~Clk;
    end
    
    initial begin
        Reset =0;
        #10;
        Reset =1;
        #10;
        Reset =0;
        #1250;
    end
    
endmodule


