// EEM16 - Logic Design
// Design Assignment #1 - Problem #1.3
// dassign1_3.v
// Verilog template

// You may define any additional modules as necessary
// Do not change the module or port names of the given stubs

/* Arrays for convenience

  | abcdefghijklmnopqrstuvwxyz  <-- letter
__|___________________________
G | 11111111001001111111000111
F | 11001111001100011010101010
E | 11111101011111110100110001
D | 01111010011100100010111111
C | 11010011110011101011110010
B | 10010011110000011001101011
A | 10001110000010011010000101
^-- display segment
~~~

  | GFEDCBA <-- display segment
__|________
a | 1110111
b | 1111100
c | 1011000
d | 1011110
e | 1111001
f | 1110001
g | 1101111
h | 1110110
i | 0000110
j | 0011110
k | 1111000
l | 0111000
m | 0010101
n | 1010100
o | 1011100
p | 1110011
q | 1100111
r | 1010000
s | 1101101
t | 1000110
u | 0111110
v | 0011100
w | 0101010
x | 1001001
y | 1101110
z | 1011011
^-- letter
*/

// Display driver (procedural verilog)
// IMPORTANT: Do not change module or port names
module display_rom (letter, display);
    input   [4:0] letter;
    output  [6:0] display;
    reg [6:0] display;
  
  always@(letter,display)
    begin
  
  case(letter)
    5'b00000: assign display =7'b1110111;//a
    5'b00001: assign display =7'b1111100;//b
	5'b00010: assign display =7'b1011000;//c
	5'b00011: assign display =7'b1011110;//d
	5'b00100: assign display =7'b1111001;//e
	5'b00101: assign display =7'b1110001;//f
	5'b00110: assign display =7'b1101111;//g
	5'b00111: assign display =7'b1110110;//h
	5'b01000: assign display =7'b0000110;//i
	5'b01001: assign display =7'b0011110;//j
	5'b01010: assign display =7'b1111000;//k
	5'b01011: assign display =7'b0111000;//l
	5'b01100: assign display =7'b0010101;//m
	5'b01101: assign display =7'b1010100;//n
	5'b01110: assign display =7'b1011100;//o
	5'b01111: assign display =7'b1110011;//p
	5'b10000: assign display =7'b1100111;//q
	5'b10001: assign display =7'b1010000;//r
	5'b10010: assign display =7'b1101101;//s
	5'b10011: assign display =7'b1000110;//t
	5'b10100: assign display =7'b0111110;//u
	5'b10101: assign display =7'b0011100;//v
	5'b10110: assign display =7'b0101010;//w
	5'b10111: assign display =7'b1001001;//x
	5'b11000: assign display =7'b1101110;//y
	5'b11001: assign display =7'b1011011;//z

 default : assign display =7'b1000000;
    
	endcase
   end


endmodule

// Display driver (declarative verilog)
// IMPORTANT: Do not change module or port names
module display_mux (letter, g,f,e,d,c,b,a);
    input   [4:0] letter;
    output  g,f,e,d,c,b,a;
    // your code here
    // do not use any delays!
endmodule
