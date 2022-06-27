module half_adder(						//declaration of module
	input A,
	input B,
	output S,
	output Cout
	);
	
	xor G1 (S, A, B);						//the sum of half adder is 1 if When there are odd numbers of 1(true)
	and G2 (Cout, A, B);					//the carry out of half adder is 1 if When there are odd numbers of 1(true)
	
endmodule									//module declaration is complete
