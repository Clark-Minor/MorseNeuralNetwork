// EEM16 - Logic Design
// Design Assignment #1 - Problem #1.2
// dassign1_2.v
// Verilog template

//Thinking about defining a constant E for my fcmp functions
//`define E=1

// You may define any additional modules as necessary
// Do not change the module or port names of these stubs

//FCMP2.(declarative  verilog) Takes two 2-bit arguments, and 1 E as inputs
/*INPUT: -two 2-bit numbers (A=A1A0 B=B1B0)
		 -1 E
  OUTPUT: - A>B =>0
  		- B>A =>1
        - B==A => E*/

module fcmp2(a,b,Ei,Eo);
  input [1:0] a, b;
  input Ei;
  
  output Eo;
  
  //Implementation
  
  //Minimal Boolean Expression. Sum of Products
  assign Eo = ((b[1] && !a[1]) ||
               (Ei && b[1] && b[0])  ||
               (b[1] && b[0] && !a[0])  ||
               (Ei && b[0] && !a[1]) ||
               (Ei && !a[0] && !a[1]) ||
               (Ei && b[1] && !a[0]) ||
               (b[0] && !a[1] && !a[0]) 
              );
              
endmodule


//FCMP8 (declarative verilog) Takes two 8-bit arguments and 1 E as inputs and outputs a>b => 0, a<b => 1, a==b => E
module fcmp8(a,b,Eo);
  input [7:0] a,b;
  output Eo;
  
  wire fcmp2_1e,
  fcmp2_2e,
  fcmp2_3e;
  //fcmp2_4e=Eo
  
  //How would I implement this??
  //E==1
  
  fcmp2 fcmp2_1(a[1:0],b[1:0],1,fcmp2_1e);
  fcmp2 fcmp2_2(a[3:2],b[3:2],fcmp2_1e,fcmp2_2e);
  fcmp2 fcmp2_3(a[5:4],b[5:4],fcmp2_2e,fcmp2_3e);
  fcmp2 fcmp2_4(a[7:6],b[7:6],fcmp2_3e,Eo);
  
endmodule

//labelMUX
//1 bit selects one of 2 different 5-bit labels to output
module labelMUX(in1_label,in2_label,sel, out_label);
  input [4:0] in1_label, in2_label;
  input sel;
  output [4:0] out_label;
  
  assign out_label = (sel==1)?in2_label:in1_label;
  
endmodule

//probMUX
//1 bit selects one of 2 different 8-bit probability values
module probMUX(in1_value,in2_value,sel, out_value);
  input [7:0]in1_value,in2_value;
  input sel;
  output [7:0] out_value;
  
  assign out_value = (sel==1)?in2_value:in1_value;
  
endmodule

// Max/argmax (declarative verilog)
// IMPORTANT: Do not change module or port names
module mam(in1_value, in1_label, in2_value, in2_label, out_value, out_label);
    input   [7:0] in1_value, in2_value;
    input   [4:0] in1_label, in2_label;
    output  [7:0] out_value;
    output  [4:0] out_label;
  	wire result;
  
  	fcmp8 f8(in1_value, in2_value, result);
  	labelMUX lM(in1_label,in2_label,result, out_label);
  	probMUX pM(in1_value,in2_value,result, out_value);
  
  //First, I need to implement a MUX
  
  
    // your code here
    // do not use any delays!
  	
  	/*How do I implement this? Do I need to write out the code for the FCMP2? What built-in functions in Verilog can I rely on in order to implement this? Do they have a compare function? If so, can I compare two binary----- what If there is a compare operator I can just .... fuck do I need to implement FCMP2????????????????? frick me all over
    
    TODO: 1) Do I need to implement FCMP2? Then, do I need to implement FCMP8?
    		Yes, I do. Both Yes. Yes for you and yes for you. Everyone gets a yessssss!*/
endmodule

// Maximum index (structural verilog)
// IMPORTANT: Do not change module or port names
module maxindex(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,out);
    input [7:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    output [4:0] out;
  	
  //Value Wires. Right to left level ordering
  wire [7:0]
  v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11,v_12,v_13,
  v_14,v_15,v_16,v_17,v_18,v_19,v_20,v_21,v_22,v_23,v_24,v_25;
  //Label Wires. Right to left level ordering
  wire [4:0]
  l_1,l_2,l_3,l_4,l_5,l_6,l_7,l_8,l_9,l_10,l_11,l_12,l_13,
  l_14,l_15,l_16,l_17,l_18,l_19,l_20,l_21,l_22,l_23,l_24;
  
  
  //mams
  mam ab(a ,5'b00000, b, 5'b00001, v_1, l_1);
  mam cd(c, 5'b00010, d, 5'b00011, v_2,l_2);
  mam ef(e, 5'b00100, f, 5'b00101, v_3,l_3);
  mam gh(g, 5'b00110, h, 5'b00111, v_4,l_4);
  mam ij(i, 5'b01000, j, 5'b01001, v_5,l_5);
  mam kl(k, 5'b01010, l, 5'b01011, v_6,l_6);
  mam mn(m, 5'b01100, n, 5'b01101, v_7,l_7);
  mam op(o, 5'b01110, p, 5'b01111, v_8,l_8);
  mam qr(q, 5'b10000, r, 5'b10001, v_9,l_9);
  mam st(s, 5'b10010, t, 5'b10011, v_10,l_10);
  mam uv(u, 5'b10100, v, 5'b10101, v_11,l_11);
  mam wx(w, 5'b10110, x, 5'b10111, v_12,l_12);
  mam yz(y, 5'b11000, z, 5'b11001, v_13,l_13);
  //end base row
  mam ad(v_1, l_1,v_2,l_2, v_14,l_14);
   mam eh(v_3,l_3, v_4,l_4, v_15,l_15);
   mam il(v_5,l_5, v_6,l_6, v_16,l_16);
   mam mp(v_7,l_7, v_8,l_8, v_17,l_17);
   mam qt(v_9,l_9, v_10,l_10, v_18,l_18);
   mam ux(v_11,l_11, v_12,l_12, v_19,l_19);
  //end 2nd row
  mam ah(v_14,l_14, v_15,l_15, v_20,l_20);
   mam ip(v_16,l_16, v_17,l_17, v_21,l_21);
   mam qx(v_18,l_18, v_19,l_19, v_22,l_22);
  //end 3rd row 
  mam qz(v_22,l_22,v_13,l_13, v_23,l_23);
  //end 4th row
  mam iz(v_21,l_21,v_23,l_23, v_24,l_24);
  //end 5th row
  mam az(v_20,l_20, v_24,l_24, v_25, out);
  //end mam tree
  
  /*
  
   /*
   
A	5'b00000 
B	5'b00001
C	5'b00010
D	5'b00011
E	5'b00100
F	5'b00101
G	5'b00110
H	5'b00111
I	5'b01000
J	5'b01001
K	5'b01010
L	5'b01011
M	5'b01100
N	5'b01101
O	5'b01110
P	5'b01111
Q	5'b10000
R	5'b10001
S	5'b10010
T	5'b10011
U	5'b10100
V	5'b10101
W	5'b10110
X	5'b10111
Y	5'b11000
Z	5'b11001
  */
  
  	
    // your code here
    // do not use any delays!
endmodule
