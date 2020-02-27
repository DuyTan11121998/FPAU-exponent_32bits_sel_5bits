////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : resultS_ex.v		                                          //
// Description  : Exponential floating point 32bits                           //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Monday December 9,2019                                      //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module resultS_ex(S,A,ansS,sel);
output	[31:0]S;
input   [31:0]A,ansS;
input   [4:0] sel;
reg	[31:0]S;

wire	flagNaNA,flagInfA,flag0A,sign;
assign sign = A[31];

checkspecial	checkA(.flagInf(flagInfA),.flagNaN(flagNaNA),.flagZero(flag0A),.in(A));


	
always@(A or ansS)
begin
	case ({flagInfA,flagNaNA,flag0A})
	3'b100:	
		if(sel[0]) S={sign,31'h7f800000};	
		else  S={1'b0,31'h7f800000};
	3'b010:	S=32'h7FFFFFFF;
	3'b001:
		if ((~sel[4])&(~sel[3])&(~sel[2])&(~sel[1])&(~sel[0])) S=32'h7FFFFFFF;
		else  S=32'h00000000;						
	default: 
		if ((~sel[4])&(~sel[3])&(~sel[2])&(~sel[1])&(~sel[0])) S=32'h3F800000;
		else S=ansS;
	endcase
end

endmodule

module resultS_mult(S,A,B,ansS);
output	[31:0]S;
input   [31:0]A,B,ansS;
reg	[31:0]S;

wire	flagNaNA,flagInfA,flag0A,flagNaNB,flagInfB,flag0B;

checkspecial	checkA(.flagInf(flagInfA),.flagNaN(flagNaNA),.flagZero(flag0A),.in(A));
checkspecial	checkB(.flagInf(flagInfB),.flagNaN(flagNaNB),.flagZero(flag0B),.in(B));

	
always@(A or B or ansS)
begin
	case ({flagInfA,flagInfB,flagNaNA,flagNaNB,flag0A,flag0B})
	6'b10_00_00, 6'b01_00_00:	S={ansS[31],31'h7f800000};	//A=Inf or B=Inf => S=Inf
	6'b00_00_10, 6'b00_00_01, 6'b00_00_11:	S=32'h00000000;		//B=0 or A=0     => S=0
	6'b00_10_00, 6'b00_01_00, 6'b00_11_00:	S=32'h7FFFFFFF; 	//A or B NaN    => S=NaN 
	6'b10_00_01, 6'b01_00_10:  	        S=32'h7FFFFFFF;		//A=0 and B=Inf => S=NaN							
	default: S=ansS;
	endcase
end

endmodule