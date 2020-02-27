////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : ex_tb.v		                                              //
// Description  : Test Exponential floating point 32bits                      //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Monday December 9,2019                                      //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module ex_tb;
reg [31:0] in;
reg  [4:0]sel;

wire [31:0]S;

ex ex_tb(S,in,sel);

initial begin
	in=32'hC08DC28F;
	sel=5'b01000;
#100
    in=32'h4144F5C3;
	sel=5'b00100;
#100
    in=32'hC08DC28F;
	sel=5'b00000;
#100
    in=32'hC08DC21F;
	sel=5'b01110;
#100
    in=32'h3DCCCCCD;
	sel=5'b00101;
#100
    in=32'h00000000;
	sel=5'b11101;
#100
    in=32'hff800000;
	sel=5'b11010;
#100
    in=32'hC381199A;
	sel=5'b11111;
#100
    in=32'hC08DC28F;
	sel=5'b00111;
end

endmodule
