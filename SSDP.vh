
`define R0 3'b000
`define R1 3'b001
`define R2 3'b010
`define R3 3'b011
`define R4 3'b100
`define R5 3'b101
`define R6 3'b110
`define R7 3'b111

`define ID_NO_OPERATION             5'b00000
`define ID_EXCLUSIVE_OR_IMMEDIATE   5'b00001
`define ID_BRANCH_IF_ZERO           5'b00010
`define ID_JUMP_REGISTER            5'b00011
`define ID_ADD                      5'b00100
`define ID_AND                      5'b00101
`define ID_INPUT                    5'b00110
`define ID_LOAD                     5'b00111
`define ID_SUBTRACT                 5'b01000
`define ID_COMPLIMENT               5'b01001
`define ID_JUMP_AND_LINK            5'b01010
`define ID_ADD_IMMEDIATE_UNSIGNED   5'b01011
`define ID_OR_IMMEDIATE             5'b01100
`define ID_STORE                    5'b01101
`define ID_OUTPUT                   5'b01110
`define ID_SET_IF_LESS_THAN         5'b01111
`define ID_MOVE                     5'b10000
`define ID_ADD_IMMEDIATE            5'b10001
`define ID_BRANCH_IF_NONZERO        5'b10010
`define ID_LOGICAL_SHIFT_LEFT       5'b10011
`define ID_JUMP                     5'b10100
 

`define NOP            4'b0000  	
`define SUB            4'b0001  	
`define AND            4'b0010 	
`define OR             4'b0011 	
`define XOR            4'b0100 	
`define NOT            4'b0101 	
`define LEFT_SHIFT     4'b0110 	
`define RIGHT_SHIFT    4'b0111 	
`define GREATER_THEN   4'b1000 	
`define LESS_THEN      4'b1001 	
`define EQUAL          4'b1010 	
`define NOT_EQUAL      4'b1011 	
`define NOR            4'b1100
`define ADD            4'b1101
`define FUTURE_USE2    4'b1110
`define FUTURE_USE3    4'b1111


`define IDX_OE         0
`define IDX_SH_0       1
`define IDX_SH_1       2
`define IDX_SH_2       3

`define IDX_FS_0       4
`define IDX_FS_1       5
`define IDX_FS_2       6
`define IDX_FS_3       7

`define IDX_MW         8
`define IDX_PS         9
`define IDX_BS_0       10
`define IDX_BS_1       11

`define IDX_MD_0       12
`define IDX_MD_1       13

`define IDX_DA_0       14
`define IDX_DA_1       15
`define IDX_DA_2       16 

`define IDX_RW         17