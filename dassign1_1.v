// EEM16 - Logic Design
// Design Assignment #1 - Problem #1.1
// dassign1_1.v
// Verilog template

// You may define any additional modules as necessary
// Do not delete or modify any of the modules provided
//
// The modules you will have to design are at the end of the file
// Do not change the module or port names of these stubs

// CMOS gates (declarative Verilog)
// Includes propagation delay t_PD = 1
module inverter(a,y);
    input a;
    output y;

    assign #1 y = ~a;
endmodule

module fa_gate_1(a,b,c,y);
    input a,b,c;
    output y;

    assign #1 y = ~((a&b) | (c&(b|a)));
endmodule

module fa_gate_2(a,b,c,m,y);
    input a,b,c,m;
    output y;

    assign #1 y = ~((a&b&c) | ((a|b|c)&m));
endmodule

// Full adder (structural Verilog)
module fa(a,b,ci,co,s);
    input a,b,ci;
    output s,co;

    wire nco, ns;

    fa_gate_1   fa_gate_1_1(a,b,ci, nco);
    fa_gate_2   fa_gate_2_1(a,b,ci,nco, ns);
    inverter    inverter_1(nco, co); 
    inverter    inverter_2(ns, s);
endmodule

// 5+2 input full adder (structural Verilog)
// IMPORTANT: Do not change module or port names
module fa5 (a,b,c,d,e,ci0,ci1, 
            co1,co0,s);

    input a,b,c,d,e,ci0,ci1;
    output co1, co0, s;
  	//cascading adder implementation
    /*Gates will be called, from top to bottom,
  	fa_1, fa_2, fa_3, and fa_4. Not to be confused with
    FA#. These are all FA2's, just different labels. Carry wires and sum wires will be extensions of these adder names like FA_1co and FA_2s.
  */
  	wire fa_1s, fa_1co, fa_2s, fa_2co, /*fa_3s=s*/ fa_3co; /*fa_4s, fa_4co*/
  //note: some of these wires are redundant with outputs of FA5. The redundant ones have been commented out
  
  
  //Implementation
  fa fa_1(a,b,ci0,fa_1co,fa_1s);
  fa fa_2(c,d,ci1,fa_2co,fa_2s);
  fa fa_3(e,fa_1s,fa_2s,fa_3co,s);
  fa fa_4(fa_1co,fa_2co,fa_3co,co1,co0);
  	
endmodule

// 5-input 4-bit ripple-carry adder (structural Verilog)
// IMPORTANT: Do not change module or port names
module adder5 (a,b,c,d,e, sum);
    input [3:0] a,b,c,d,e;
  	output [6:0] sum;
  	wire
    fa5_1co0, fa5_1co1, //fa5_1s=sum[0]
    fa5_2co0, fa5_2co1, //fa5_2s=sum[1]
    fa5_3co0, fa5_3co1, //fa5_1s=sum[2]
    fa5_4co0, fa5_4co1, //fa5_1s=sum[3]
  	fa_1co0; /*fa_1co1=sum[4]*/
  	/*fa_2co0=sum[5], /*fa_2co1=sum[6]*/
    
  fa5 fa5_1(a[0],b[0],c[0],d[0],e[0],/*ci0*/0,       /*ci1*/0, 
            /*co1*/fa5_1co1,/*co0*/fa5_1co0,sum[0]);
  
  fa5 fa5_2(a[1],b[1],c[1],d[1],e[1],/*ci0*/0,       /*ci1*/fa5_1co0, 
            /*co1*/fa5_2co1,/*co0*/fa5_2co0,sum[1]);
  
  fa5 fa5_3(a[2],b[2],c[2],d[2],e[2],/*ci0*/fa5_1co1,/*ci1*/fa5_2co0, 
            /*co1*/fa5_3co1,/*co0*/fa5_3co0,sum[2]);
  
  fa5 fa5_4(a[3],b[3],c[3],d[3],e[3],/*ci0*/fa5_2co1,/*ci1*/fa5_3co0, 
            /*co1*/fa5_4co1,/*co0*/fa5_4co0,sum[3]);
  
  fa fa_1(fa5_4co0,fa5_3co1,0,fa_1co0,sum[4]);
  
  fa fa_2(fa_1co0,fa5_4co1,0,sum[6],sum[5]);
  	
endmodule
