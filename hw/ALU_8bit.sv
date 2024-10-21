/*
 Author: Faith Nyambane
 Cite:
*/

module ALU_8bit
(input wire[7:0] a,input wire[7:0] b,input wire[2:0] op,output reg[7:0] out);
always @(*) begin
case(op)
3'b000: out = a + b;
  // add in your code to make the ALU works as shown
3'b001: {carry_out,out} = a-b; // sub
3'b010: out = a&b; // and
3'b011: out = a|b; // or
3'b100: out = a^b; // xor
3'b101: out = ~(a|b); // not
3'b110: out = (a<<b); // shl
3'b111: out = (a>>b); // shr
default: out = 0;
endcase
end
endmodule
