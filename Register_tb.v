`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2023 14:34:42
// Design Name: 
// Module Name: Register_tb
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


module Register_tb(
    );
    
    reg [2:0] AA;
    reg [4:0] BA;
    reg [2:0] DA;
    reg [7:0] DataIn;
    reg WR;
    reg Clk;
    reg Reset;
    wire [7:0] DataA;
    wire [7:0] DataB;
    
    RegisterFile RF(AA,BA,DA,DataIn,WR,Clk,Reset,DataA,DataB);
    integer addr;
    reg [7:0]data;
    
    initial begin
        Clk = 0;
         forever 
            #5
            Clk = !Clk;
     end
    
    initial begin
        WR = 1;
        AA = 0;
        BA = 0;
        Reset = 0;
        
        for(addr = 1,data = 8'h11;addr < 8;addr = addr + 1,data = data +1) begin
            DataIn = data;
            DA = addr;
            #40;
        end
        data=0;
        
        WR = 0;
        BA = 0;
        DA = 0;
        for(addr = 1;addr < 8;addr = addr + 1) begin
            AA = addr;
            #40;
        end
        
        WR = 0;
        AA = 0;
        DA = 0;
        for(addr = 1;addr < 8;addr = addr + 1) begin
            BA = addr;
            #40;
        end
        
        Reset = 1;
        #40;
        Reset = 0;
        
        
         WR = 0;
        BA = 0;
        DA = 0;
        for(addr = 1;addr < 8;addr = addr + 1) begin
            AA = addr;
            #40;
        end
        
    end
    
    
    
endmodule
