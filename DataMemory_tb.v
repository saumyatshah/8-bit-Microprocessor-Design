`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2023 07:02:18 AM
// Design Name: 
// Module Name: DataMemory_tb
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


module DataMemory_tb(
    );
    reg [7:0] tbAddr_Bus;
    reg [7:0] tbDataIn;
    wire [16:0] tbDataOut;
    reg RW;
    
    Data_Memory DM (tbAddr_Bus,tbDataIn,tbDataOut,RW);
    
    integer addr,data;
    
    initial begin
        RW = 1;
        
        for(addr = 0,data = 0; addr < 8; addr = addr + 1,data=data+2) begin
                tbAddr_Bus = addr;
                tbDataIn = data;
                #10;
        end
        tbDataIn = 0;
        data = 0;
        RW = 0;
        for(addr = 0; addr < 8; addr = addr + 1) begin
            tbAddr_Bus = addr;
            #10;
        end;
      $finish;
    end
    
endmodule
