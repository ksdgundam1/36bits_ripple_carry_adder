module rca_4b(																//declaration of module
	input [3:0] A,
	input [3:0] B,
	input Cin,
	output [3:0] S,
	output Cout
	);
	
	wire co1, co2, co3;													//inner wire for prapagating Cout signal from each FA module
	
	full_adder M0(A[0], B[0], Cin, S[0], co1);					//instanciation of full adder module, 
	full_adder M1(A[1], B[1], co1, S[1], co2);					//The ripple adder requires a transfer adder as many bits as it can
	full_adder M2(A[2], B[2], co2, S[2], co3);
	full_adder M3(A[3], B[3], co3, S[3], Cout);
	
endmodule
