////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : element_n.v		                                          //
// Description  : Element of Exponential floating point 32bits                //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Monday December 9,2019                                      //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module element_n(out,in,sel);

output	[31:0]out;
input   [31:0]in;
input   [4:0]sel;

wire    [31:0]s0,s1,s2,s3;

element16       stage4(s0,in,in,sel[4]);
element8       	stage3(s1,s0,in,sel[3]);
element4       	stage2(s2,s1,in,sel[2]);
element2       	stage1(s3,s2,in,sel[1]);
element1       	stage0(out,s3,in,sel[0]);

endmodule

/*********************************************************************************/
module element1(out,in_temp,in,sel);
output	[31:0]out;
input   [31:0]in,in_temp;
input   sel;

wire  [31:0]s0;

//multplier
multiplier mult1(s0,in_temp,in);
//result
assign out = sel?s0:in_temp;

endmodule

/*********************************************************************************/

module element2(out,in_temp,in,sel);
output	[31:0]out;
input   [31:0]in,in_temp;
input   sel;

wire  [31:0]s0,s1;

//multplier
multiplier mult1(s0,in_temp,in);
multiplier mult2(s1,s0,in);
//result
assign out = sel?s1:in_temp;

endmodule


/*********************************************************************************/

module element4(out,in_temp,in,sel);
output	[31:0]out;
input   [31:0]in,in_temp;
input   sel;

wire  [31:0]s0,s1,s2,s3;

//multplier
multiplier mult1(s0,in_temp,in);
multiplier mult2(s1,s0,in);
multiplier mult3(s2,s1,in);
multiplier mult4(s3,s2,in);
//result
assign out = sel?s3:in_temp;

endmodule

/*********************************************************************************/

module element8(out,in_temp,in,sel);
output	[31:0]out;
input   [31:0]in,in_temp;
input   sel;

wire  [31:0]s0,s1,s2,s3,s4,s5,s6,s7;

//multplier
multiplier mult1(s0,in_temp,in);
multiplier mult2(s1,s0,in);
multiplier mult3(s2,s1,in);
multiplier mult4(s3,s2,in);
multiplier mult5(s4,s3,in);
multiplier mult6(s5,s4,in);
multiplier mult7(s6,s5,in);
multiplier mult8(s7,s6,in);
//result
assign out = sel?s7:in_temp;

endmodule

/*********************************************************************************/

module element16(out,in_temp,in,sel);
output	[31:0]out;
input   [31:0]in,in_temp;
input   sel;

wire  [31:0]s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15;

//multplier
multiplier mult1(s0,in_temp,in);
multiplier mult2(s1,s0,in);
multiplier mult3(s2,s1,in);
multiplier mult4(s3,s2,in);
multiplier mult5(s4,s3,in);
multiplier mult6(s5,s4,in);
multiplier mult7(s6,s5,in);
multiplier mult8(s7,s6,in);
multiplier mult9(s8,s7,in);
multiplier mult10(s9,s8,in);
multiplier mult11(s10,s9,in);
multiplier mult12(s11,s10,in);
multiplier mult13(s12,s11,in);
multiplier mult14(s13,s12,in);
multiplier mult15(s14,s13,in);
multiplier mult16(s15,s14,in);
//result
assign out = sel?s15:in_temp;

endmodule
