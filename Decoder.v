//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	Branch_type_o,
	MemRead_o,
	MemWrite_o,
	MemtoReg_o,
	jump_o,
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output [1:0] Branch_type_o;
output	       MemRead_o;
output	       MemWrite_o;
output	       MemtoReg_o;
output	       jump_o;
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg [1:0] Branch_type_o;
reg	       MemRead_o;
reg	       MemWrite_o;
reg	       MemtoReg_o;
reg	       jump_o;
//Parameter
parameter R_type = 6'b000000;
parameter beq = 6'b000100;
parameter bne = 6'b000101;
parameter addi = 6'b001000;
parameter sll = 6'b000000;
parameter sllv = 6'b000000;
parameter lui = 6'b001111;
parameter ori = 6'b001101;
parameter lw = 6'b100011;
parameter sw = 6'b101011;

//Main function
always@(*) begin
	if(instr_op_i == R_type) begin
		Branch_o = 1'b0;
		ALUSrc_o = 1'b0;
		ALU_op_o = 3'b010;
		RegDst_o = 1'b1;
		RegWrite_o = 1'b1;
		//Branch_type_o = 2'b00;
		MemRead_o = 1'b0;
	        MemWrite_o = 1'b0;
	        MemtoReg_o = 1'b0;
	        jump_o = 1'b0;	
	end 
	else if(instr_op_i == beq) begin
		Branch_o = 1'b1;
		ALUSrc_o = 1'b0;
		ALU_op_o = 3'b011;
		RegDst_o = 1'b0;
		RegWrite_o = 1'b0;
		Branch_type_o = 2'b00;
		MemRead_o = 1'b0;
	        MemWrite_o = 1'b0;
	        MemtoReg_o = 1'b0;
	        jump_o = 1'b0;	
	end	
	else if(instr_op_i == bne) begin
		Branch_o = 1'b1;
		ALUSrc_o = 1'b0;
		ALU_op_o = 3'b001;
		RegDst_o = 1'b0;
		RegWrite_o = 1'b0;
		Branch_type_o = 2'b11;
		MemRead_o = 1'b0;
	        MemWrite_o = 1'b0;
	        MemtoReg_o = 1'b0;
	        jump_o = 1'b0;
	end
	else if(instr_op_i == addi) begin
		Branch_o = 1'b0;
		ALUSrc_o = 1'b1;
		ALU_op_o = 3'b000;
		RegDst_o = 1'b0;
		RegWrite_o = 1'b1;	
		Branch_type_o = 2'b00;
		MemRead_o = 1'b0;
	        MemWrite_o = 1'b0;
	        MemtoReg_o = 1'b0;
	        jump_o = 1'b0;
	end
	else if(instr_op_i == lui) begin
		Branch_o = 1'b0;
		ALUSrc_o = 1'b1;
		ALU_op_o = 3'b111; 
		RegDst_o = 1'b0;
		RegWrite_o = 1'b1;
		Branch_type_o = 2'b00;
		MemRead_o = 1'b0;
	        MemWrite_o = 1'b0;
	        MemtoReg_o = 1'b0;
	        jump_o = 1'b0;
	end
	else if(instr_op_i == ori) begin
		Branch_o = 1'b0;
		ALUSrc_o = 1'b1;
		ALU_op_o = 3'b110; 
		RegDst_o = 1'b0;
		RegWrite_o = 1'b1;
		Branch_type_o = 2'b00;
		MemRead_o = 1'b0;
	        MemWrite_o = 1'b0;
	        MemtoReg_o = 1'b0;
	        jump_o = 1'b0;
	end
	else if(instr_op_i == lw) begin
			
	end
	else begin
		Branch_o = Branch_o;
		ALUSrc_o = ALUSrc_o;
		ALU_op_o = ALU_op_o;
		RegDst_o = RegDst_o;
		RegWrite_o = RegWrite_o;	
	end
	end
endmodule





                    
                    
