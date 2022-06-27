module full_adder(											//module declaration
	input A,
	input B,
	input Cin,
	output S,
	output Cout
	);
	
	wire w1, w2, w3;											//inner cicuit wire declaration, w1 and w2 connect 2 half adder, w3 was used to calculate carry out
		
	half_adder M1(A, B, w1, w2);							//instanciation of half adder module 1
	half_adder M0(w1, Cin, S, w3);						//instanciation of half adder module 0
	
	or(Cout, w2, w3);											//logic for making carry out
	
endmodule														//module declaratino end
