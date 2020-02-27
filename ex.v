////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : ex.v		                                                  //
// Description  : Exponential floating point 32bits                           //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Monday December 9,2019                                      //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module ex(S,A,number_exp);
output	[31:0]S;
input	[31:0]A;
input   [4:0]number_exp;

wire  [31:0]S_temp;
wire  [24:0]frac_before_normalize;
wire  [23:0]frac_temp,fracS;
wire  [7:0]exp_temp,expS;
wire  [4:0]sel;
wire  sign;

//giam1
adder5 sub_1(sel,number_exp,-5'd1);
//
element_n element(
	.out(S_temp),
	.in(A),
	.sel(sel)
	);
assign frac_before_normalize={2'b01,S_temp[22:0]};
assign exp_temp =S_temp[30:23];
assign sign =S_temp[31];

//Normalize the frac answer
normalize	normalize_ans(.exp_out(expS),.frac_out(fracS),
			      .exp_in(exp_temp),.frac_in(frac_before_normalize));

//resultS_ex
resultS_ex	resultS_ex(.S(S),.A(A),.ansS({sign,expS,fracS[22:0]}),.sel(number_exp));
endmodule
