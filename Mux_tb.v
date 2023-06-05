`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2023 21:47:30
// Design Name: 
// Module Name: Muxs_tb
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


module Mux_tb(
    );
    reg [7:0] IN0;
    reg [7:0] IN1;
    reg [7:0] IN2;
    reg [7:0] IN3;
    reg [1:0] SEL;
//    wire [7:0] OUT1;
//    wire [7:0] OUT2;
    wire [7:0] OUT;
//    wire [7:0] OUT4;
    
//    Mux_2In1Out MuxA(IN0,IN1,SEL,OUT1); 
//    Mux_2In1Out MuxB(IN0,IN1,SEL,OUT2);
    Mux_3In1Out MuxC(IN0,IN1,IN2,SEL,OUT);
//    Mux_4In1Out MuxD(IN0,IN1,IN2,IN3,SEL,OUT4); 
    
  
    
    initial begin
        IN0 = 8'h11; 
        IN1 = 8'h22;
        IN2 = 8'h33;
        IN3 = 8'h44;
        
        SEL = 0;
        #100;
        
        SEL = 1;
        #100;
        
        SEL = 2;
        #100;
        
        SEL = 3;
    end
endmodule
