// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:06 06/26/2020 
// Design Name: 
// Module Name:    vedic8x8 
// Project Name: 
// Target Devices: 
// Tool versions: \
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Vedic8x8(a, b, result);
  input  [7:0] a,b;
  output [15:0] result;
  wire [15:0] result;

  wire [7:0] temp1;
  wire [7:0] temp2;
  wire [7:0] temp3;
  wire [9:0] temp4;
  wire [9:0] temp5;
  wire [7:0] temp6;
  wire [7:0] temp7;

  vedic4x4 M1(a[3:0], b[3:0], temp1);
  assign result[3:0] = temp1[3:0];

  vedic4x4 M2(a[7:4], b[3:0], temp2);
  vedic4x4 M3(a[3:0], b[7:4], temp3);

  adder10 A1({2'b00, temp2}, {2'b00,temp3}, temp4);
  adder10 A2(temp4, {6'b000000, temp1[7:4]}, temp5);
  assign result[7:4] = temp5[3:0];

  vedic4x4 M4(a[7:4], b[7:4], temp6);
  adder8 A3(temp6, {2'b00,temp5[9:4]}, temp7);

  assign result[15:8] = temp7;

endmodule

module vedic4x4(a, b, result);
  input  [3:0] a,b;
  output [7:0] result;
  wire [7:0] result;

  wire [3:0] temp1;
  wire [3:0] temp2;
  wire [3:0] temp3;
  wire [5:0] temp4;
  wire [5:0] temp5;
  wire [3:0] temp6;
  wire [3:0] temp7;
  wire [5:0] w1;

  vedic_2x2 V1(a[1:0], b[1:0], temp1);
  assign result[1:0] = temp1[1:0];

  vedic_2x2 V2(a[3:2], b[1:0], temp2);
  vedic_2x2 V3(a[1:0], b[3:2], temp3);

  assign w1 = {4'b0000, temp1[3:2]};

  adder6 A1({2'b00, temp3}, {2'b00, temp2}, temp4);
  adder6 A2(temp4, w1, temp5);

  assign result[3:2] = temp5[1:0];

  vedic_2x2 V4(a[3:2], b[3:2], temp6);

  adder4 A3(temp6, temp5[5:2], temp7);
  assign result[7:4] = temp7;

endmodule

module vedic_2x2 (a, b, result);
  input [1:0] a,b;
  output [3:0] result;

  wire [3:0] w;

  assign result[0]= a[0]&b[0];
  assign w[0]     = a[1]&b[0];
  assign w[1]     = a[0]&b[1];
  assign w[2]     = a[1]&b[1];

  halfAdder H0(w[0], w[1], result[1], w[3]);
  halfAdder H1(w[2], w[3], result[2], result[3]);    
    
endmodule

module halfAdder(a,b,sum,carry);
  input a,b;
  output sum, carry;

  assign sum   = a ^ b;
  assign carry = a & b;

endmodule

module adder4(a,b,sum);
  input [3:0] a,b;
  output [3:0] sum;
  
  wire [3:0] sum;

  assign sum = a + b;

endmodule

module adder6(a,b,sum); 
  input [5:0] a,b;
  output [5:0] sum;
  wire [5:0] sum;

  assign sum = a + b;

endmodule

module adder8(a,b,sum);
  input [7:0] a,b;
  output [7:0] sum;
  wire [7:0] sum;

  assign sum = a + b;

endmodule

module adder10(a,b,sum);

  input [9:0] a,b;
  output [9:0] sum;
  wire [9:0] sum;
  
  assign sum = a + b;

endmodule

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