`timescale 1ns/100ps																			//precision

module tb_rca_36b();																			//tb module declaration
    
    integer i;																					//Declare integer variables to automatically transfer values,
																									//through mathematical operations
    reg [35:0] A;																				//Each input must be declared as a register type,
    reg [35:0] B;																				//Only then can a certain value be output until the next signal is input
    reg Cin;																					//The output doesn't need to be stored, 
    wire [35:0] S;																			//so it doesn't matter whether it's a wire or a reg
    wire Cout;
        
    rca_36b m1(.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));					//rca_36b module is instanciated to be tested
        
    initial 																					//start of test bench
    begin																						//initializing each inputs
    A = 0;
    B = 0;
    Cin = 0;
    end
        
    initial
    $monitor("A(%b) + B(%b) = COUT S(%b %b)", A, B, Cout, S);					//monitor the values to console
        
    always @ (A or B)																		//the values will be changed all time 
        begin
        for(i = 0; i < 64 * 64; i = i + 1)											//Assign an i value to a 72-bit storage that combines A and B every 5 nanoseconds
            #5 {A, B} = i;
	#5
	begin A = 0; B = 0; end																	//End of first iteration statement, initialize variables
	for(i = 0; i < 64 * 64; i = i + 1)													//Assign i to A and i + 1 to B
		#5 begin A = i; B = i + 1; end
																									//Assing 36'b1xxx to A and B to check Carry out
	#5 begin A = 36'b100000000000000000000000000000000000;  B = 36'b100000000000000000000000000000000000; end
	#5 Cin = 1;
                
   #5 $stop();																					//end of test
   end 
    
endmodule
