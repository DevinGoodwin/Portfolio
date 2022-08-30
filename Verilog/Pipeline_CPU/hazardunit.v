module hazardunit(IDEX_Instruction, IDEX_Rd, MemDest,IDEX_Write, EXMemRead, IDEXMemRead, EXMEM_Write, IFIDWrite,PCWrite,HazardMux);

    input [31:0] IDEX_Instruction;
    //input [4:0] IFID_Rs, IFID_Rt,
    input [4:0] IDEX_Rd,MemDest; //register destinations and Rs and Rt
    input IDEX_Write,EXMEM_Write; //Write select
    input EXMemRead, IDEXMemRead; 
	output reg	IFIDWrite, PCWrite, HazardMux;
    
    
    
    wire [4:0] IFID_Rs, IFID_Rt;
    
    wire [5:0] opcode;
    
    wire zeroflag, Rtype;
    
    assign IFID_Rs = IDEX_Instruction[25:21];
    assign IFID_Rt = IDEX_Instruction[20:16];
    assign opcode = IDEX_Instruction[31:26];
    assign Rtype = (opcode == 0) ? 1 : 0;
    
    
    

    
    
    reg IDEX_zero,MemDest_zero,one,two,true1,true2;
    
    
    assign zeroflag = (IFID_Rs == 5'd0) ? 1 : (IFID_Rt == 5'd0) ? 1 : 0; //if the source or target is register 0 then dont need to stall 
	
always @(*)	
//always @(IFID_Rs or IFID_Rt or IDEX_Rd or MemDest or IDEX_Write or EXMEM_Write)
begin  


    true2 = (EXMEM_Write == 1) && ( (IFID_Rs == MemDest) || ((Rtype && (IFID_Rt == MemDest)) ) )&& !zeroflag && EXMemRead;
    true1= (IDEX_Write == 1) && ((IFID_Rs == IDEX_Rd) || (Rtype && (IFID_Rt == IDEX_Rd) )) && !zeroflag;
  
    //if( (EXMEM_Write == 1) && ( (IFID_Rs == MemDest) || ((Rtype && (IFID_Rt == MemDest)) ) )&& !zeroflag ) begin //this is for the two ahead, checks if any of the Rs or Rt equal with MemDest and if write is set to high
    if( true2 ) begin  
        two = 1;
        one = 0;
        IFIDWrite <=1'b0;
        PCWrite <= 1'b0;
        HazardMux <= 1'b1;
    end 
    
    else if( (IDEX_Write == 1) && ((IFID_Rs == IDEX_Rd) || (Rtype && (IFID_Rt == IDEX_Rd) )) && !zeroflag && IDEXMemRead) begin //this is for the one ahead checks with Rs or Rt is equal to the next stage's Rt or Rd values
        two = 0;
        one = 1;
        IFIDWrite <=1'b0;
        PCWrite <= 1'b0;
        HazardMux <= 1'b1;
    end
    
    else begin
        two = 0;
        one = 0;
        IFIDWrite <=1'b1;
        PCWrite <= 1'b1;
        HazardMux <= 1'b0;
    end
    
    

end


endmodule
