module rca_36b (S, Cout, A, B, Cin);											//declaration of module

	input [35:0] A, B;
	input Cin;
	output [35:0] S;
	output Cout;
	
	wire co1, co2, co3, co4, co5, co6, co7, co8;								//inner wire for propagatin carry out signal from eaca rca_4b module
	
	rca_4b M1(A[3:0], B[3:0], Cin, S[3:0], co1);								//instanciation of 4-bit ripple carry adder module,
	rca_4b M2(A[7:4], B[7:4], co1, S[7:4], co2);								//9 of 4-bit adders connections in series for 36-bit calculations
	rca_4b M3(A[11:8], B[11:8], co2, S[11:8], co3);
	rca_4b M4(A[15:12], B[15:12], co3, S[15:12], co4);
	rca_4b M5(A[19:16], B[19:16], co4, S[19:16], co5);
	rca_4b M6(A[23:20], B[23:20], co5, S[23:20], co6);
	rca_4b M7(A[27:24], B[27:24], co6, S[27:24], co7);
	rca_4b M8(A[31:28], B[31:28], co7, S[31:28], co8);
	rca_4b M9(A[35:32], B[35:32], co8, S[35:32], Cout);
	
endmodule
