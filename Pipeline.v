`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2021 22:28:26
// Design Name: 
// Module Name: Microprocessor_design
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

///////////////////////////////////////////////////////////

// Module Name: microcontroller_unit   MCU TOP MODULE WITH DATA & BRANCH HAZARD DETECTION


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module Pipeline(clock, reset);
input clock;
input reset;

////////////////////////////////////////// fetch cycle registers//////////////////////////////////////////////////////////////////////

reg [7:0]r_pc;
reg [7:0]r_pc_plus1;
reg [16:0]r_IR;

// decode cycle registers

reg [7:0]r_pc_min2;
reg [1:0]r_bs;
reg r_ps;
reg r_mw;
reg [3:0]r_fs;
reg [2:0]r_sh;
reg [7:0]r_busa;
reg [7:0]r_busb;
reg r_rw_dec;  
reg [2:0]r_da_dec;   
reg [1:0]r_md_dec;

// execute stage
reg r_rw_exe;  
reg [2:0]r_da_exe;   
reg [1:0]r_md_exe;  
reg [7:0]r_alu_out;
reg [7:0]r_data_out;




//////////////////////////////////////////////wires////////////////////////////////////////////////////////////////////////
//wires
// fetch cycle wires

wire [7:0]pc_wire;
wire [7:0]w_addr_line;
wire [7:0]w_pc_plus1;
wire [16:0]w_IR;

// decode cycle wire

wire [5:0]im_cs_in;
wire [7:0]cs_out;
wire [7:0]a_data_out;
wire [7:0]w_a_data_out;
wire [7:0]b_data_out;
wire [7:0]w_b_data_out;
wire [16:0]w_Inst_in;
wire w_MA;
wire w_MB;
wire w_CS;
wire w_OE;
wire [2:0]w_AA;
wire [2:0]w_BA;
wire [2:0]w_DA;
wire [7:0]w_pc_plus2;
wire [1:0]w_BS;
wire w_PS;
wire w_MW;
wire [3:0]w_FS;
wire [2:0]w_SH;
wire [7:0]BUSA;
wire [7:0]BUSB;
wire w_RW;
wire [7:0]w_pc1;
wire [1:0]w_MD;

// execute stage
wire w_rw_exe;  
wire [2:0]w_da_exe;   
wire [1:0]w_md_exe;  
wire [7:0]w_pc_min2;
wire [1:0]w_bs_exe;
wire w_ps_exe;
wire w_MW_exe;
wire [3:0]w_FS_exe;
wire [2:0]w_SH_exe;
wire [7:0]w_raa;
wire [7:0]in_b;
wire w_zero;
wire w_carry;
wire w_overflow;
wire w_neg;
wire [7:0]w_F;
wire [7:0]w_BrA;
wire [7:0]w_data_out;



// write back stage
wire w_rw_wb;  
wire [2:0]w_da_wb;   
wire [7:0]alu_out;
wire [7:0]data_out;
wire [1:0]w_md_wb;
wire [7:0]BUSD; 
wire [7:0]w_muxc;
wire [1:0]w_mux_c_sel;


// Data hazard handling
wire DHS_OUT;
wire DHS_BAR;
wire MA_BAR;
wire MB_BAR;
wire DA_OR;
wire AA_COMP_OUT;
wire BA_COMP_OUT;
wire HA;
wire HB;

wire w_RW_DH;
wire [2:0]w_DA_DH;
wire [1:0]w_BS_DH;
wire w_MW_DH;

wire BR_NOR;
wire [16:0]w_IR_BR;



/////////////////////////////////////////////////connection//////////////////////////////////////////////////////////////////////////////

// Instruction fetch cycle connection

//Prog_mem_MCU_DH UUT(.addr_line(w_addr_line),.instr_line(w_IR));
ProgramMemory UUT(w_addr_line,w_IR);
assign w_addr_line = r_pc;
assign pc_wire = r_pc;
assign w_pc_plus1 = pc_wire + 7'b1;  
        

// instruction decode cycle connection
assign w_pc_plus2 = r_pc_plus1;
assign im_cs_in = r_IR[5:0];           
assign w_SH = r_IR[2:0];
assign w_Inst_in = r_IR;
assign w_pc1 = r_pc_plus1;
assign w_rw_wb = r_rw_exe; 

 
assign DHS_BAR = ~ DHS_OUT;
assign w_MW_DH = DHS_BAR & w_MW & BR_NOR;
assign w_RW_DH = DHS_BAR & w_RW & BR_NOR;


assign w_DA_DH[2] = DHS_BAR & w_DA[2];
assign w_DA_DH[1] = DHS_BAR & w_DA[1];
assign w_DA_DH[0] = DHS_BAR & w_DA[0];

assign w_BS_DH[1] = DHS_BAR & w_BS[1];
assign w_BS_DH[0] = DHS_BAR & w_BS[0];


assign DA_OR = w_da_exe[2]|w_da_exe[1]|w_da_exe[0];
assign MA_BAR = ~ w_MA;
assign MB_BAR = ~ w_MB;

assign AA_COMP_OUT = (w_da_exe == w_AA)? 1'b1:1'b0 ;
assign BA_COMP_OUT = (w_da_exe == w_BA)? 1'b1:1'b0 ;

assign HB = BA_COMP_OUT & MB_BAR & w_rw_exe & DA_OR;
assign HA = AA_COMP_OUT & MA_BAR & w_rw_exe & DA_OR;

assign DHS_OUT = HA | HB ;


//Handling branch hazards

assign BR_NOR = ~(w_mux_c_sel[1] | w_mux_c_sel[0]);

assign w_IR_BR[0] = BR_NOR & w_IR[0];  
assign w_IR_BR[1] = BR_NOR & w_IR[1];  
assign w_IR_BR[2] = BR_NOR & w_IR[2];  
assign w_IR_BR[3] = BR_NOR & w_IR[3];  
assign w_IR_BR[4] = BR_NOR & w_IR[4];  
assign w_IR_BR[5] = BR_NOR & w_IR[5];  
assign w_IR_BR[6] = BR_NOR & w_IR[6];  
assign w_IR_BR[7] = BR_NOR & w_IR[7];  
assign w_IR_BR[8] = BR_NOR & w_IR[8];  
assign w_IR_BR[9] = BR_NOR & w_IR[9];  
assign w_IR_BR[10] = BR_NOR & w_IR[10];  
assign w_IR_BR[11] = BR_NOR & w_IR[11];  
assign w_IR_BR[12] = BR_NOR & w_IR[12];  
assign w_IR_BR[13] = BR_NOR & w_IR[13];  
assign w_IR_BR[14] = BR_NOR & w_IR[14];  
assign w_IR_BR[15] = BR_NOR & w_IR[15];  
assign w_IR_BR[16] = BR_NOR & w_IR[16];  
 

//const_unit UUT2(.im_cs_in(im_cs_in), .CS(w_CS), .cs_out(cs_out));

ConstantUnit UUT2(w_CS,im_cs_in,cs_out);

InstructionDecoder UUT5(w_Inst_in,w_DA,w_AA,w_BA,w_BS,w_PS,w_MW,w_RW,w_MA,w_MB,w_MD,w_FS,w_CS,w_OE);
    
register_file UUT1(.clk(clock), .a_addr(w_AA),.b_addr(w_BA), .RW(w_rw_wb), .d_addr(w_da_wb),.data_in(BUSD),
                                .a_data_out(w_a_data_out), .b_data_out(w_b_data_out));

//RegisterFile UUT1(w_AA,w_BA,w_da_wb,BUSD,w_rw_wb,clock,rst,w_a_data_out,w_b_data_out);

//mux_A_21 UUT3(.pc_plus1(w_pc1), .a_data_out(w_a_data_out), .MA(w_MA), .BUSA(BUSA));

//mux_B_21 UUT4( .cs_out(cs_out), .b_data_out(w_b_data_out), .MB(w_MB), .BUSB(BUSB));

MuxA_2In1Out UUT3(w_a_data_out,w_pc1,w_MA,BUSA);
MuxB_2In1Out UUT4(w_b_data_out,cs_out,w_MB,BUSB);

// execution cycle connection

assign w_pc_min2 = r_pc_min2;
assign w_rw_exe = r_rw_dec;
assign w_da_exe = r_da_dec;
assign w_md_exe = r_md_dec;
assign w_bs_exe = r_bs;
assign w_ps_exe = r_ps;
assign w_MW_exe = r_mw;
assign w_FS_exe = r_fs;
assign w_SH_exe = r_sh;
assign w_raa = r_busa;
assign in_b = r_busb;

adder_1 UUT6(.pc_plus2(w_pc_min2), .in_b(in_b), .BrA(w_BrA));
//assign w_BrA = w_pc_min2 + in_b;

ALU UUT7(w_raa,in_b,w_InputPortData,w_InputPortKeyBoard,w_FS_exe,w_SH_exe,w_F,w_zero,w_carry,w_overflow,w_neg,w_D);
//alu_unit UUT7(.A(w_raa),.B(in_b),.shift(w_SH_exe),.Fun_Sel(w_FS_exe),.F(w_F),.Z(w_zero), .N(w_neg), .C(w_carry), .V(w_overflow));
Data_Memory DM (w_raa,in_b,w_data_out,w_MW_exe);
//Data_mem_MCU UUT8(.clk(clock), .wr(w_MW_exe),.addr_line(w_raa),.data_in(in_b),.data_out(w_data_out));



// write back stage connection
//assign w_rw_wb = r_rw_exe;
assign w_da_wb = r_da_exe;
assign w_md_wb = r_md_exe;
assign alu_out = r_alu_out;
assign data_out = r_data_out;

assign w_mux_c_sel = (((w_ps_exe^w_zero) | w_bs_exe[1]) & w_bs_exe[0]);
//mux_sel_in UUT9(.BS0(w_bs_exe[0]),.BS1(w_bs_exe[1]),.mux_c_sel(w_mux_c_sel), .PS(w_ps_exe), .Z(w_zero));
//mux_C_41 UUT10(.pc_plus1(w_pc_plus1), .BrA(w_BrA), .RAA(w_raa), .mux_c_sel(w_mux_c_sel), .mux_c_out(w_muxc)); //.BrA(w_BrA),
//mux_D_41 UUT11(.alu_out(alu_out), .data_out(data_out), .MD(w_md_wb), .BUSD(BUSD));
wire [7:0]MuxC_in;
assign MuxC_in = {7'b0,w_D};
MuxC_4In1Out UUT10(w_pc_plus1,w_BrA,w_raa,w_BrA,w_mux_c_sel,w_muxc);
MuxD_3In1Out UUT11(alu_out,data_out,MuxC_in,w_md_wb,BUSD);

////////////////////////////////////////////////always///////////////////////////////////////////////////////////////////////////

// Inst Fetch cycle always statement
always @(posedge clock or negedge reset)
begin
	if(!reset)
		begin
			if(DHS_BAR == 0 | BR_NOR == 0)
				begin
					r_pc_plus1 <= r_pc_plus1;
					r_IR <= r_IR;
				end
	else 
		begin
			r_pc_plus1 <= w_pc_plus1;
			r_IR <= w_IR_BR;
		end
	end
	else
	begin
		r_pc_plus1 <= 8'b0;
		r_IR <= 17'b0;
	end
end

// inst decode cycle always
always @(posedge clock  or negedge reset)
begin
		if(!reset)
		begin
			if(DHS_BAR == 0)
				begin
				r_pc_min2 <= r_pc_min2;
				r_bs <= w_BS_DH;
				r_ps <= w_PS;
				r_mw <= w_MW_DH;
				r_fs <= w_FS;
				r_sh <= w_SH;
				r_busa <= BUSA;
				r_busb <= BUSB;
				r_rw_dec <= w_RW_DH;
				r_da_dec <= w_DA_DH;
				r_md_dec <= w_MD;
			end
			else
				begin
				r_pc_min2 <= w_pc_plus2;
				r_bs <= w_BS_DH;
				r_ps <= w_PS;
				r_mw <= w_MW_DH;
				r_fs <= w_FS;
				r_sh <= w_SH;
				r_busa <= BUSA;
				r_busb <= BUSB;
				r_rw_dec <= w_RW_DH;
				r_da_dec <= w_DA_DH;
				r_md_dec <= w_MD;
			end
		end
			else
				begin
					r_pc_min2 <= 8'b0;
					r_bs <= 2'b0;
					r_ps <= 1'b0;
					r_mw <= 1'b0;
					r_fs <= 4'b0;
					r_sh <= 3'b0;
					r_busa <= 8'b0;
					r_busb <= 8'b0;
					r_rw_dec <= 1'b0;
					r_da_dec <= 3'b0;
					r_md_dec <= 2'b0;
			end
end

// execute cycle always
always @(posedge clock  or negedge reset)
begin
    if(!reset)
    begin
        r_rw_exe <= w_rw_exe;
        r_da_exe <= w_da_exe;
        r_md_exe <= w_md_exe;
        r_alu_out <= w_F;
        r_data_out <= w_data_out;
    end
    else
    begin
        r_rw_exe <= 1'b0;
        r_da_exe <= 3'b0;
        r_md_exe <= 2'b0;
        r_alu_out <= 8'b0;
        r_data_out <= 8'b0;
    end
end

// write back stage 
always @(posedge clock  or negedge reset)
begin
    if(!reset)
        begin
            if(DHS_BAR == 0)
                begin
                    r_pc <= r_pc;
                end
            else
                begin
                    r_pc <= w_muxc;
                end
            end
        else
        begin
            r_pc <= 8'b0;
        end
    end
endmodule

