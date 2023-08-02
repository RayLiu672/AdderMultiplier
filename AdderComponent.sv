// Code your design here

// Full Adder Module that handles the values for sum and cout 
module FullAdder(a, b, cin, cout, sum);
  	// The inputs/outputs for this module
	input a, b, cin;
	output cout, sum;
	
  	// Truth table equations used to solve for sum and cout
	assign sum= a^b^cin;
	assign cout = (a&b)|(a&cin)|(b&cin);
	
endmodule

module Add4bits (a, b, cin, cout, sum);

  input [15:0] a, b; 
  input cin;
  output cout; 
  output [15:0] sum;
  wire [15:1] carries;
	
  //Cout is connected to carries at position 1 (internal wires) 
  //Instatation of FullAdder
  FullAdder fa1 (a[0], b[0], cin, carries[1], sum[0]);
  FullAdder fa2 (a[1], b[1], carries[1], carries[2], sum[1]);
  FullAdder fa3 (a[2], b[2], carries[2], carries[3], sum[2]);
  FullAdder fa4 (a[3], b[3], carries[3], carries[4], sum[3]);
  FullAdder fa5 (a[4], b[4], carries[4], carries[5], sum[4]);
  FullAdder fa6 (a[5], b[5], carries[5], carries[6], sum[5]);
  FullAdder fa7 (a[6], b[6], carries[6], carries[7], sum[6]);
  FullAdder fa8 (a[7], b[7], carries[7], carries[8], sum[7]);
  FullAdder fa9 (a[8], b[8], carries[8], carries[9], sum[8]); 
  FullAdder fa10 (a[9], b[9], carries[9], carries[10], sum[9]); 		
  FullAdder fa11 (a[10], b[10], carries[10], carries[11], sum[10]); 
  FullAdder fa12 (a[11], b[11], carries[11], carries[12], sum[11]);
  FullAdder fa13 (a[12], b[12], carries[12], carries[13], sum[12]);
  FullAdder fa14 (a[13], b[13], carries[13], carries[14], sum[13]);
  FullAdder fa15 (a[14], b[14], carries[14], carries[15], sum[14]);
  FullAdder fa16 (a[15], b[15], carries[15], cout, sum[15]);
endmodule
