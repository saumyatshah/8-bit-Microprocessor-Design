`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2023 13:56:49
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input [2:0] AA,
    input [2:0] BA,
    input [2:0] DA,
    input [7:0] DataIn,
    input WR,
    input Clk,
    input Reset,
    output  [7:0] DataA,
    output  [7:0] DataB
    );
    
    reg [0:7] memory[0:7];
    integer addr;
    
    initial begin
        memory[`R1] = 8'h00;
        memory[`R2] = 8'h02;
        memory[`R3] = 8'h03;
        memory[`R5] = 8'h04;
      //  $monitor("[TEST] --> DataB [%d]",DataB);
 //       DataA = 8'h00; 
 //       DataB = 8'h00;
 
            for(addr = 1;addr < 8;addr = addr + 1) begin
                memory[addr] = 8'h00; 
            end 
    end
    
    always @(negedge Clk) begin
 //   $monitor("in always [TEST] --> DataB [%d]",DataB);
   /*     if(1 == Reset) begin
            for(addr = 1;addr < 8;addr = addr + 1) begin
                memory[addr] = 8'h00; 
            end        
         end*/
        if((1 == WR) && (0!= DA)) begin
           memory[DA] = DataIn;
        end
        else  begin
            
  //          if(0 != AA) begin
  //        assign DataA = memory[AA];
  //          end
   //         else if(0 != BA) begin
   //        assign DataB = memory[BA];
   //         end
      //      $monitor("in always [TEST] --> DataB [%d]",DataB);
     //       $monitor(" [TEST] --> DataA [%d]",DataA);
        end
    end
    
    assign DataA = memory[AA];
    assign DataB = memory[BA];
    
endmodule
