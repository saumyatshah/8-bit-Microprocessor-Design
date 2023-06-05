`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: register_file  

//////////////////////////////////////////////////////////////////////////////////


module register_file(	input clk,
    input RW, // enable write
    input [2:0] a_addr,
    input [2:0] b_addr,
    input [2:0] d_addr,
    input [7:0] data_in,
    output [7:0]a_data_out,
    output [7:0]b_data_out);
    reg [7:0]reg_arr[0:7];
    
    integer i;

    initial begin
        for ( i=0; i < 8; i=i+1)
            reg_arr[i] = 8'b00000000;    
        end
        
    always@(negedge clk)
    begin
       
 if ( RW == 1)    // WRITE
   begin
	if ( d_addr == 3'b000)
		begin
		reg_arr[000]= 8'b00000000;
		end
	 else
	    begin 
       	reg_arr[d_addr]= data_in;
	    end
     end
   end

 assign     a_data_out = reg_arr[a_addr];
 assign     b_data_out = reg_arr[b_addr];

endmodule

